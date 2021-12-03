<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class Setting extends CI_Controller{
	public $nama;
	public $user_level;
	public $ip;
     function __construct(){
        parent::__construct();
        $this->load->library('user_agent');
        $this->ip=$this->input->ip_address();
		$query['ip']=$this->db->get_where('tbl_ip_address',array('ip_address' =>$this->ip))->row();
		$this->user_level=$query['ip']->user_level;
		
		$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->ip))->row();        
		$data['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
		$this->nama=$data['user']->nama;
        
    }
function index(){
  		$query['title']= $this->db->get('tbl_title')->row();
  		//$this->db->query("DELETE FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' ");
		$data=array(
			'title'=>$query['title']->title,
	     	'detail'=>$query['title']->detail,
	     	'owner'=>$query['title']->owner,
	     	'version'=>$query['title']->version,
	     	'logo'=>$query['title']->logo,
	     	'year'=>$query['title']->year,
		);	
		
		$this->load->view('content/setting/pilih',$data);	
	}
function start(){
  		$query['title']= $this->db->get('tbl_title')->row();
  		$query['temp']=$this->db->query("SELECT * FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' and label_customer is not null limit 1")->row();

  		$query['temp1']=$this->db->query("SELECT * FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' and label_internal is not null limit 1")->row();

  		$query['dn'] = $this->db->query("SELECT * FROM tbl_history_settingadm WHERE label_customer='".$query['temp']->label_customer."'")->row();
  		$query['id']=$this->db->query("SELECT count(id) as total_kbn,count(if(label_internal is not null,1,null)) as total_scan  FROM tbl_history_settingadm WHERE order_no='".$query['temp']->order_no."'")->row();

  		$query['kbn'] = $this->db->query("SELECT * FROM tbl_master_kanban WHERE job_no='".$query['dn']->job_no."' limit 1")->row();
  		if(empty($query['temp'])){
  			$status="PLEASE SCAN LABEL CUSTOMER !";
  		}else{
  			if(!empty($query['temp1'])){
  				$status=$query['temp1']->status;
  			}else{
  				$status="PLEASE SCAN LABEL INTERNAL !";
  			}
  		}
  		$query['kbn1']= $this->db->query("SELECT job_no FROM tbl_master_kanban where qrkbn='".$query['temp']->label_internal."' limit 1")->row();
		$data=array(
			'title'=>$query['title']->title,
	     	'detail'=>$query['title']->detail,
	     	'owner'=>$query['title']->owner,
	     	'version'=>$query['title']->version,
	     	'logo'=>$query['title']->logo,
	     	'year'=>$query['title']->year,
	     	'job_no' =>  $query['kbn']->id_kbn.' '.$query['dn']->job_no,
	     	'part_no' => $query['dn']->part_no,
	     	'part_name' => $query['dn']->part_name,
	     	'customer_code' => $query['dn']->customer_code,
	     	'customer_shop' => $query['dn']->customer_shop,
	     	'order_no' => $query['dn']->order_no,
	     	'label_customer' => $query['temp']->label_customer,
	     	'label_internal' => $query['temp']->label_internal.' '.$query['kbn1']->job_no,
	     	'qty_kbn' => $query['dn']->qty_kbn,
	     	'total_kbn' => $query['id']->total_kbn,
	     	'total_scan' => $query['id']->total_scan,
	     	'sequence' => $query['dn']->sequence,
	     	'status' => $status,
	     	'nama'=>$this->nama,
	     	'item_list'=>$this->db->query("SELECT job_no,part_no,part_name,qty_kbn,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm WHERE order_no='".$query['temp']->order_no."' group by part_no order by id asc")->result(),
		);
		$this->load->view('content/setting/setting',$data);	
	}
	

function scan(){
    $data = array ('status' => false,"remark"=>'');
    $post_date = gmdate('Y-m-d',time()+60*60*7);
	$qrcode =str_replace('-R', '',trim($this->input->post('qrcode')));

  	$query['temp']=$this->db->query("SELECT * FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' and label_customer is not null limit 1")->row();

  	$query['temp1']=$this->db->query("SELECT * FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' and label_internal is not null limit 1")->row();

  	$order_no=$query['temp']->order_no;

 	$ceklb['id']=$this->db->query("SELECT * FROM tbl_history_settingadm WHERE label_customer='".$qrcode."' limit 1")->row();

 	$ceklb1=$this->db->query("SELECT id FROM tbl_history_settingadm WHERE label_customer='".$qrcode."' and label_internal is not null")->result();
	 
	$cekdn=$this->db->query("SELECT id FROM tbl_history_settingadm WHERE order_no='".$ceklb['id']->order_no."' and status='OPEN'")->result();

	$cekkbn['id'] = $this->db->query("SELECT * FROM tbl_master_kanban WHERE qrkbn='".$qrcode."' limit 1")->row();
    $cekkbndouble=$this->db->query("SELECT id FROM tbl_history_settingadm WHERE order_no='".$order_no."' and label_internal='".$qrcode."'")->result();
    $query['cust'] = $this->db->query("SELECT * FROM tbl_master_customer WHERE customer_shop='".$ceklb['id']->customer_shop."' limit 1")->row();
	$querylog=$this->db->get_where('tbl_user',array('idcard'=>$qrcode,'user_level'=>$this->user_level))->result();

	if(!empty($ceklb['id'])){
		if(empty($ceklb1)){
			if(!empty($cekdn)){
				$data1 = array( 
						"ip_address"=>$this->ip,
						"order_no" => $ceklb['id']->order_no,
						"label_customer"=>$qrcode,
						"key_label"=>$query['cust']->key_label,
						"customer" => $ceklb['id']->customer_code.' - '.$ceklb['id']->customer_shop,
						"job_no" => $ceklb['id']->job_no,
						"part_no" => $ceklb['id']->part_no,
						"part_name" => $ceklb['id']->part_name,
						"qty_kbn" => $ceklb['id']->qty_kbn,
				);
				$this->db->query("DELETE FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' ");
				$this->db->insert('tbl_temp_settingadm',$data1);
				$this->db->query("UPDATE tbl_history_settingadm set status='PARTIAL' WHERE order_no='".$ceklb['id']->order_no."'");
				$data['status'] = 'SUCCESS SCAN LABEL CUSTOMER';
			}else{
				$data1 = array( 
						"ip_address"=>$this->ip,
						"order_no" => $ceklb['id']->order_no,
						"label_customer"=>$qrcode,
						"key_label"=>$query['cust']->key_label,
						"customer" => $ceklb['id']->customer_code.' - '.$ceklb['id']->customer_shop,
						"job_no" => $ceklb['id']->job_no,
						"part_no" => $ceklb['id']->part_no,
						"part_name" => $ceklb['id']->part_name,
						"qty_kbn" => $ceklb['id']->qty_kbn,
				);
				$this->db->query("DELETE FROM tbl_temp_settingadm WHERE ip_address='".$this->ip."' ");
				$this->db->insert('tbl_temp_settingadm',$data1);
				$data['status'] = 'SUCCESS SCAN LABEL CUSTOMER';
			}
		}else{
			$data['status'] = 'SCAN DOUBLE, LABEL SUDAH CLOSE!';
		}
		
	}elseif(!empty($cekkbn['id'])){

	       	if(empty($query['temp'])){
	       		 $data['status'] ='BELUM SCAN LABEL CUSTOMER';  
	       	}else{

	       		$label_customer=$query['temp']->label_customer;
	       		$key_label=$query['temp']->key_label;

	       		$cek=$this->db->query("SELECT * FROM tbl_master_kanban WHERE qrkbn='".$qrcode."' limit 1")->row_array();

	       		$label_internal=$cek[$key_label];

	       		$cek2=$this->db->query("SELECT id FROM tbl_history_settingadm WHERE label_customer='".$label_customer."' and label_internal is not null")->result();

				if(preg_match("/{$label_internal}/i",$label_customer)){
					if(!empty($cekkbndouble)){
						$data['status'] = 'LABEL INTERNAL OK SETTING';
					}elseif(!empty($cek2)){
						$data['status'] = 'LABEL CUSTOMER OK SETTING!';
					}else{
						$data2 = array(
			    		'label_internal'=>$qrcode,
			    		'status' => 'CLOSE',
			    		"setting_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
						"setting_by"=> $this->nama,
			    	);

					$this->db->update('tbl_history_settingadm',$data2,array('label_customer' => $label_customer));
					
					$this->db->query("UPDATE tbl_temp_settingadm set status='OK SETTING',label_internal='".$qrcode."' WHERE ip_address='".$this->ip."'");

			    	$this->db->query("UPDATE tbl_history_posting set location='SETTING', setting_by='".$this->nama."',setting_date=now() WHERE qrkbn='".$qrcode."' and location='POSTING' ");
			    	$data['status'] = 'OK SETTING';
					}
			    	
	       		}else{
	       			$queryset['mis'] = $this->db->query("SELECT * FROM tbl_history_settingadm WHERE label_customer='".$query['temp']->label_customer."' limit 1")->row();
	       			$cek=$this->db->query("SELECT * FROM tbl_mis_setting WHERE label_customer='".$query['temp']->label_customer."' and label_internal='".$qrcode."' ")->result();
	       			if(empty($cek)){
	       				$data = array(
	       				'customer_code' => $queryset['mis']->customer_code,
	       				'customer_shop' => $queryset['mis']->customer_shop,
	       				'job_no' => $queryset['mis']->job_no,
	       				'part_no' => $queryset['mis']->part_no,
	       				'part_name' => $queryset['mis']->part_name,
	       				'label_customer' => $query['temp']->label_customer,
	       				'label_internal' => $qrcode,
	       				'qty_kbn' => $queryset['mis']->qty_kbn,
	       				"setting_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
						"setting_by"=> $this->nama,
	       				 );
	       			$this->db->insert('tbl_mis_setting',$data);
	       			}
	       			$data['scan']=$query['temp']->label_customer.' TIDAK COCOK DENGAN KBN '.$qrcode;
	       			$this->db->query("UPDATE tbl_temp_settingadm set status='MIS SETTING',label_internal='".$qrcode."' WHERE ip_address='".$this->ip."'");
	       			$data['status'] = 'MIS SETTING';	       		
	       	}

	       		
	       }
	  }elseif(!empty($querylog)){
	    $data['status'] = 'LOGOUT';
	  }elseif(empty($query['temp'])){
	    $data['status'] = 'PLEASE SCAN LABEL CUSTOMER !'; 
	  }elseif(empty($query['temp1'])){
	    $data['status'] = 'PLEASE SCAN LABEL INTERNAL !'; 
	  }else{
	     $data['status'] ='ERROR, CODE TIDAK DITEMUKAN !';  
	  }	 
	  echo json_encode($data);
 }
 function finishscan(){
 	$data = array ('id' => false,'sj'=>true);
 	$bulan=gmdate('m',time()+60*60*7);
 	$tahun=gmdate('Y',time()+60*60*7);
 	$lp=$this->uri->segment(3);
 	$query['temp']=$this->db->query("SELECT * FROM tbl_temp_sj where ip_address='".$this->ip."' limit 1")->row();	
 	$customer_shop=$query['temp']->customer_shop;
 	$customer_code=$query['temp']->customer_code;
 	$query['cust']=$this->db->query("SELECT * FROM tbl_master_customer where customer_shop='".$customer_shop."' limit 1")->row();
 	$cek=$this->db->query("SELECT * FROM tbl_history_settingadm WHERE customer_shop='".$customer_shop."' and status='CLOSE' and sj_no is null ")->result();
 	if(!empty($cek)){
 		if($query['cust']->sj=='yes'){
	 		$sj_no=$this->db->query("SELECT * FROM tbl_history_settingadm WHERE  sj_no is not null and customer_shop='".$customer_shop."' group by sj_no ")->num_rows();

	 		 $sj_no=$sj_no+1;
		      
		      $romawi = $this->getRomawi(intval($bulan));
		      $sj_no=$sj_no."/YPI/".$lp."/".$customer_code."-".$customer_shop."/".$romawi."/".$tahun;
		      $this->db->query("UPDATE tbl_history_settingadm  set  lp='".$lp."', sj_no='".$sj_no."',sj_date=now() WHERE customer_shop='".$customer_shop."' and status='CLOSE' and sj_no is null ");
		      $query['id']=$this->db->query("SELECT id FROM tbl_history_settingadm WHERE  sj_no='".$sj_no."' limit 1")->row();
		      $data['id']=$query['id']->id;
		  }else{
		  	  $this->db->query("UPDATE tbl_history_settingadm  set  lp='".$lp."', sj_no='no',sj_date=now() WHERE customer_shop='".$customer_shop."' and status='CLOSE' and sj_no is null ");
		  	  $data['sj']='no';
		  	  $data['id']='1';

		  }
	     
 	}

 	 echo json_encode($data);

 }

 function printsj(){
       $id=$this->uri->segment(3);
       $query['sj']=$this->db->query("SELECT * FROM tbl_history_settingadm WHERE id='".$id."'")->row();     
       $query['temp']=$this->db->query("SELECT * FROM tbl_master_customer where customer_shop='".$query['sj']->customer_shop."' limit 1")->row();
       $datax=array( 
          	'address'=>$query['temp']->address,
          	'customer_name'=>$query['temp']->customer_name,
	     	'customer_plant'=>$query['sj']->customer_plant,
	     	'customer_shop'=>$query['sj']->customer_shop,
	     	'del_date'=>$query['sj']->del_date,
	     	'del_time'=>$query['sj']->del_time,
	     	'trip_no'=>$query['sj']->trip_no,
	     	'order_no'=>$query['sj']->order_no,
	     	'po_no'=>$query['sj']->po_no,
	     	'sj_no'=>$query['sj']->sj_no,
	     	'lp'=>$query['lp']->lp_name,
            'data_sj'=>$this->db->query("SELECT job_no,part_no,part_name,qty_kbn,sum(qty_kbn) as total_pcs,count(qty_kbn) as total_kbn FROM tbl_history_settingadm WHERE sj_no='".$query['sj']->sj_no."' group by part_no order by part_no asc")->result(),
          ); 
      $this->load->view('content/print/suratjalan',$datax);
}
function datasj(){
	$data_sj=$this->db->query("SELECT id,sj_no FROM tbl_history_settingadm where sj_no!='no' and  sj_no is not null and sj_date>=DATE_ADD(now(),INTERVAL -30 DAY) group by sj_no order by id desc")->result();

    $posts = array();
		foreach ($data_sj as $key) {
			$posts[]=array(
	     	"'".$key->id."'" =>$key->sj_no,
	     	);
	     }
    echo json_encode($data_sj,JSON_PRETTY_PRINT);
}

function datalp(){
	$data_lp=$this->db->query("SELECT id,lp_name FROM tbl_master_lp WHERE lp_name is not null group by lp_name order by id desc")->result();

    $posts = array();
		foreach ($data_lp as $key) {
			$posts[]=array(
	     	"'".$key->id."'" =>$key->lp_name,
	     	);
	     }
    echo json_encode($data_lp,JSON_PRETTY_PRINT);
}

function missetting(){
	$data = array ('status' => false,'problem'=>'');
 	$link1=$this->uri->segment(3);
	$link=explode('_',$link1);
	$password=$link[0];
	$problem=$link[1];
	$password = $this->encrypt->sha1($password);
	$password = strrev($password);$password=substr($password,5);
	$query['temp']=$this->db->query("SELECT * FROM tbl_temp_settingadm where ip_address='".$this->ip."' limit 1")->row();
	$label_customer=$query['temp']->label_customer;
 	$cek['id']=$this->db->query("SELECT * FROM tbl_user WHERE password='".$password."' and user_level='Leader' limit 1 ")->row();
 	if(!empty($cek['id'])){		
	      $this->db->query("UPDATE tbl_mis_setting set problem='".$problem."', leader_date=now(),leader_by='".$cek['id']->nama."' WHERE label_customer='".$label_customer."' and leader_date is null");

	      $data['status']=true;
 	}
 	$data['problem']=$problem;
 	 echo json_encode($data);

 }
 function getRomawi($bln){
      switch ($bln){
          case 1: 
              return "I";
              break;
          case 2:
              return "II";
              break;
          case 3:
              return "III";
              break;
          case 4:
              return "IV";
              break;
          case 5:
              return "V";
              break;
          case 6:
              return "VI";
              break;
          case 7:
              return "VII";
              break;
          case 8:
              return "VIII";
              break;
          case 9:
              return "IX";
              break;
          case 10:
              return "X";
              break;
          case 11:
              return "XI";
              break;
          case 12:
              return "XII";
              break;
      }
}
}


