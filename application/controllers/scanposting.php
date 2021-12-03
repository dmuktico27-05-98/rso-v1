<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class Scanposting extends CI_Controller{
	public $nama;
	public $user_level;
    function __construct(){
        parent::__construct();
        $this->load->library('user_agent');
        $ip=$this->input->ip_address();
		$query['ip']=$this->db->get_where('tbl_ip_address',array('ip_address' =>$ip))->row();
		$this->user_level=$query['ip']->user_level;
		if($this->user_level!='MobileScan'){	
			redirect('action/logout');
		}
		$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$ip))->row();        
		$data['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
		$this->nama=$data['user']->nama;
        
    }
function index(){
  		$query['title']= $this->db->get('tbl_title')->row();
		$data=array(
			'shift'=>$this->shift,
			'title'=>$query['title']->title,
	     	'detail'=>$query['title']->detail,
	     	'owner'=>$query['title']->owner,
	     	'version'=>$query['title']->version,
	     	'logo'=>$query['title']->logo,
	     	'remark'=>'PLEASE SCAN KANBAN',
	     
		);	
		
		$this->load->view('content/mobile/postingscan',$data);	
	}
function start(){
  		$query['title']= $this->db->get('tbl_title')->row();
  		$ip=$this->input->ip_address();
  		$query['temp']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' limit 1")->row();
  		$query['temp1']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' and qrrack is not null limit 1 ")->row();
  		$query['kbn'] = $this->db->query("select * from tbl_master_kanban where qrkbn='".$query['temp']->qrkbn."'")->row();
  		$query['ars']= $this->db->query("select group_concat(address) as hole from tbl_master_rak where job_no='".$query['temp']->job_no."'")->row();
  		if(empty($query['temp'])){
  			$remark="PLEASE SCAN KANBAN";
  		}elseif(!empty($query['temp1'])){
  			$remark="PLEASE SCAN KANBAN SELANJUTNYA";
  		}else{
  			$remark="PLEASE SCAN RAK";
  		}
		$data=array(
			'shift'=>$this->shift,
			'title'=>$query['title']->title,
	     	'detail'=>$query['title']->detail,
	     	'owner'=>$query['title']->owner,
	     	'version'=>$query['title']->version,
	     	'logo'=>$query['title']->logo,
	     	'job_no'=>$query['kbn']->job_no,
	     	'qrrack'=>$query['kbn']->qrrack,
	     	'qty_box' =>$query['kbn']->qty_box,
	     	'hole'=>$query['ars']->hole,
	     	'nama'=>$this->nama,
	     	'part_no'=>$query['kbn']->part_no,
	     	'part_name'=>$query['kbn']->part_name,
	     	'remark'=>$remark,
	     	);
		
		$this->load->view('content/mobile/postingscan',$data);	
	}

	function change_kbn(){
  		$ip=$this->input->ip_address();
  		$this->db->query("DELETE FROM tbl_temp_posting WHERE ip_address='".$ip."' ");
  		redirect('postingscan');
	}

function scan(){
    $data = array ('status' => false,"remark"=>'');
	$qrcode = strtoupper(trim($this->input->post('qrcode')));
	$post_date = date('Y-m-d',time()+60*60*7);
	$ip=$this->input->ip_address();

	   
	  $querykanban['id']=$this->db->query("SELECT * FROM tbl_master_kanban WHERE qrkbn='".$qrcode."' limit 1")->row();
	  $querypost = $this->db->query("SELECT * FROM tbl_history_posting WHERE qrkbn='".$qrcode."' AND location='POSTING' and post_date like '%".$post_date."%' ")->result();

	  $query['temp']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' limit 1")->row();
	  $queryrak=$this->db->query("SELECT * FROM tbl_master_rak WHERE qrrack='".$qrcode."' ")->result();
	  $queryrak1=$this->db->query("SELECT * FROM tbl_master_rak WHERE qrrack='".$qrcode."' and job_no='".$query['temp']->job_no."'")->result();
	  $query['kbn']=$this->db->query("SELECT * FROM tbl_master_kanban where qrkbn='".$qrcode."' limit 1")->row();
	   
	  $querylog=$this->db->get_where('tbl_user',array('idcard'=>$qrcode,'user_level'=>$this->user_level))->result();

	if(!empty($querykanban['id'])){
		if(empty($query['temp'])){
			$data1 = array( 
  			"qrkbn" => $qrcode,
  			"job_no" => $querykanban['id']->job_no,
  			"ip_address"=>$ip,
    	);
    	 $this->db->query("DELETE FROM tbl_temp_posting WHERE ip_address='".$ip."' ");
    	 $this->db->insert('tbl_temp_posting',$data1);
       	 $data['status'] = 'SUCCESS';
       }elseif(!empty($query['temp']) AND $query['temp']->job_no==$query['kbn']->job_no) {
	   		if(!empty($querypost)){
	   			$data['status'] ='SCAN KANBAN DOUBLE';
	   		}else{
   			 $query['temp']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' limit 1")->row();
    		 $query['kbn']=$this->db->query("SELECT * FROM tbl_master_kanban WHERE qrkbn='".$qrcode."' limit 1")->row();
   		 	 $query['rak']=$this->db->query("SELECT * FROM tbl_master_rak WHERE qrrack='".$query['temp']->qrrack."' limit 1")->row();	 
       		 $data2 = array(
	        		"job_no" => $query['kbn']->job_no,
		  	  		"part_no" => $query['kbn']->part_no,
		  	  		"id_kbn" => $query['kbn']->id_kbn,
		  	  		"part_name" =>$query['kbn']->part_name,
		  	  		"qty_box" =>$query['kbn']->qty_box,
		  	  		"qrkbn" => $qrcode,
		  	  		"qrrack" => $query['rak']->qrrack,
		  	  		"min_box"=> $query['rak']->min_box,
		  	  		"max_box"=> $query['rak']->max_box,
		  	  		"location" => 'POSTING',
		  	  		"post_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
					"post_by"=> $this->nama,
        		 );
	       		$data1 = array('qrkbn' => $qrcode,);
	       		$this->db->update('tbl_temp_posting',$data1,array('ip_address' => $ip));
	       		$this->db->insert('tbl_history_posting',$data2);		       		
	       		$data['status'] = 'SUCCESS';	
       		}
		}else{
			$data['status'] = 'KLIK FINISH TO CHANGE KANBAN';
		}
					
	}elseif(!empty($queryrak)){
	       	if(empty($query['temp'])){
	       		 $data['status'] ='BELUM SCAN KANBAN';  
	       	}else{
	       		 $query['kbn']=$this->db->query("SELECT * FROM tbl_master_kanban WHERE qrkbn='".$query['temp']->qrkbn."' limit 1")->row();
	       		 $query['rak']=$this->db->query("SELECT * FROM tbl_master_rak WHERE qrrack='".$qrcode."' limit 1")->row();
	       		 $queryrak['temp']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' AND qrrack='".$qrcode."' limit 1")->row();
	       		if(!empty($queryrak1)){
	       				if(!empty($queryrak['temp'])){
				       		 $data['status'] ='SCAN RAK DOUBLE';  
				       	}else{
				       		$data2 = array(
				        		"job_no" => $query['kbn']->job_no,
					  	  		"part_no" => $query['kbn']->part_no,
					  	  		"id_kbn" => $query['kbn']->id_kbn,
					  	  		"part_name" =>$query['kbn']->part_name,
					  	  		"qty_box" =>$query['kbn']->qty_box,
					  	  		"qrkbn" => $query['kbn']->qrkbn,
					  	  		"qrrack" => $qrcode,
					  	  		"min_box"=> $query['rak']->min_box,
					  	  		"max_box"=> $query['rak']->max_box,
					  	  		"location" => 'POSTING',
					  	  		"post_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
								"post_by"=> $this->nama,
			        		 );
				       		$data1 = array('qrrack' => $qrcode,);
				       		$this->db->update('tbl_temp_posting',$data1,array('ip_address' => $ip));
				       		$this->db->insert('tbl_history_posting',$data2);
				       		
				       		$data['status'] = 'SUCCESS';
				       	}
	       		}else{
	       			$cek=$this->db->query("SELECT * FROM tbl_mis_posting WHERE qrkbn='".$query['temp']->qrkbn."' and qrrack='".$qrcode."' limit 1")->result();
	       			if(empty($cek)){
	       				$data2 = array(
		        		"job_no" => $query['kbn']->job_no,
			  	  		"part_no" => $query['kbn']->part_no,
			  	  		"id_kbn" => $query['kbn']->id_kbn,
			  	  		"part_name" =>$query['kbn']->part_name,
			  	  		"qty_box" =>$query['kbn']->qty_box,
			  	  		"qrkbn" => $query['kbn']->qrkbn,
			  	  		"qrrack" => $qrcode,
			  	  		"post_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
						"post_by"=> $this->nama,
		        		 );
			       		$this->db->insert('tbl_mis_posting',$data2);
	       			} 
	       			$data['scan']=$query['kbn']->qrkbn.' Mis Posting';      			
		       		$data['status'] = 'MIS POSTING';
	       		}
	       }
	  }elseif(!empty($querylog)){
	    $data['status'] = 'LOGOUT'; 
	  }elseif(!empty($query['temp'])){
	    $data['status'] = 'ERROR, PLEASE SCAN RAK!!!';  
	  }else{
	     $data['status'] ='ERROR, PLEASE SCAN KANBAN!!!';  
	  }	 
	  echo json_encode($data);
 }

 function misposting(){
	$data = array ('status' => false,'problem'=>'');
	$ip=$this->input->ip_address();
 	$link1=$this->uri->segment(3);
	$link=explode('_',$link1);
	$password=$link[0];
	$problem=$link[1];
	$password = $this->encrypt->sha1($password);
	$password = strrev($password);$password=substr($password,5);
	$query['temp']=$this->db->query("SELECT * FROM tbl_temp_posting where ip_address='".$ip."' limit 1")->row();
	$qrkbn=$query['temp']->qrkbn;
 	$cek['id']=$this->db->query("SELECT * FROM tbl_user WHERE password='".$password."' and user_level='Leader' limit 1 ")->row();
 	if(!empty($cek['id'])){		
	      $this->db->query("UPDATE tbl_mis_posting set problem='".$problem."', leader_date=now(),leader_by='".$cek['id']->nama."' WHERE qrkbn='".$qrkbn."' and leader_date is null");

	      $data['status']=true;
 	}
 	$data['problem']=$problem;
 	 echo json_encode($data);

 }

}


