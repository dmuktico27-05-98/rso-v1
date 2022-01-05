<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!');
class Action extends CI_Controller{
	public $ip;
function __construct(){
	parent::__construct();
	$this->load->library('user_agent');
	$this->ip=$this->input->ip_address();
	$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
	$data1['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
	$this->user_level=$data1['user']->user_level;
	$this->username=$data1['user']->username;
}
function index(){
	if($this->session->userdata('isLogin')==true){
		redirect('home');
	}else{
		$this->db->query("delete from ci_sessions WHERE ip_address='".$this->ip."'");
		$query['ip']=$this->db->get_where('tbl_ip_address',array('ip_address' =>$this->ip))->row();
		$this->db->query("delete from tbl_user_active WHERE ip_address='".$this->ip."'");	
		if(empty($query['ip'])){			
			$query['title']= $this->db->get('tbl_title')->row();			
			 $data=array(
	         	'title'=>$query['title']->title,
	         	'detail'=>$query['title']->detail,
	         	'owner'=>$query['title']->owner,
	         	'version'=>$query['title']->version,
	         	'logo'=>$query['title']->logo,
	         	'year'=>$query['title']->year,
	        );	
		  
			$this->load->view('content/login/rso_login',$data);
		}else{
			if($query['ip']->login_methode=='-'){
				redirect($query['ip']->url."?=".$this->encrypt->sha1(rand(1000,10000000)));
			}else{
				redirect('action/'.strtolower($query['ip']->login_methode));
			}
			
		}
	}
}

function admin(){	
	$query['title']= $this->db->get('tbl_title')->row();			
	$data=array(
     	'title'=>$query['title']->title,
     	'detail'=>$query['title']->detail,
     	'owner'=>$query['title']->owner,
     	'version'=>$query['title']->version,
     	'logo'=>$query['title']->logo,
     	'year'=>$query['title']->year,
    );	

function login(){
	$data = array ('success' => false, 'messages' => array());
	$username = $this->input->post('username');
	$password = $this->input->post('password');
	$password = $this->encrypt->sha1($password);
	$password = strrev($password);$password=substr($password,5);
	$this->form_validation->set_rules('username', 'Username', 'required|trim|xss_clean');
	$this->form_validation->set_rules('password', 'Password', 'required|trim|xss_clean|callback_login_check');
	$this->form_validation->set_error_delimiters('<span class="label label-warning"><strong>Warning!</strong> ', '</span>');
	if($this->form_validation->run()){
		$this->session->set_userdata('isLogin', true);
		$this->session->set_userdata('timeout',time()+300);
		$data2['user']= $this->db->get_where('tbl_user',array('username'=>$username,'password'=>$password))->row();
		$id=$data2['user']->id;
			$data1=array(
				'log_in'=>gmdate('Y-m-d H:i:s',time()+60*60*7),
			);
		$this->db->update("tbl_user",$data1,array('id' =>$id));
		$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->ip))->row();
		if(empty($cek['ip'])){
			$data3=array(
				'ip_address'=>$this->ip,
				'idcard'=>$data2['user']->idcard,
			);
			$this->db->insert('tbl_user_active', $data3);
		}
		 	$data['success'] = true;				
	}else{
		foreach ($_POST as $key => $value) {
			$data['messages'][$key] = form_error($key);
		}
	}
	echo json_encode($data);
}
function login_check(){
	$username = $this->input->post('username');
	$password = $this->input->post('password');
	$password = $this->encrypt->sha1($password);
	$password = strrev($password);$password=substr($password,5);
	$ip_address=$this->input->ip_address();

   	$cek['user']=$this->db->get_where('tbl_user',array('username'=>$username,'password'=>$password))->row();
	   if(empty($cek['user'])){		
	         $this->form_validation->set_message('login_check', 'username & password failed!');
	         return false;
	   }else{
	         return true;
	   }

 }
 function loginscan(){
	$data = array ('success' => false, 'messages' => array());
	$idcard=$this->input->post('idcard');
	$this->form_validation->set_rules('idcard', 'Id Card', 'required|trim||callback_idcard_check');
	$this->form_validation->set_error_delimiters('<span class="label label-warning"><strong>Warning!</strong> ', '</span>');
	if($this->form_validation->run()){
		$this->session->set_userdata('isLogin', true);
		$this->session->set_userdata('timeout',time()+300);
		$data2['user']=$this->db->get_where('tbl_user',array('idcard'=>$idcard))->row();
		$id=$data2['user']->id;
		$log_date=gmdate('Y-m-d H:i:s',time()+60*60*7);
			 $data1=array(
				'log_in'=>$log_date,
			);
			$this->db->update("tbl_user",$data1,array('id' =>$id));
			$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->ip))->row();
			if(empty($cek['ip'])){
				$data3=array(
					'ip_address'=>$this->ip,
					'idcard'=>$data2['user']->idcard,
				);
				$this->db->insert('tbl_user_active', $data3);
			}
		 	$data['success'] = true;				
	}else{
		 foreach ($_POST as $key => $value) {
			 	$data['messages'][$key] = form_error($key);
			}
	}
	echo json_encode($data);
}
public function idcard_check($str){
   $cek=$this->db->get_where('tbl_user',array('idcard'=>$str))->result();
   foreach ($cek as $key) {
   	$username=$key->username;
   	$password=$key->password;
   }
  $this->db->query("DELETE FROM ci_sessions WHERE user_data LIKE '%".$password."%'");
   
   if(empty($cek)){		
         $this->form_validation->set_message('idcard_check', 'Access denied!');
         return false;
    }else{
         return true;
   }
 }
function logout(){
	$query['ip']=$this->db->get_where('tbl_ip_address',array('ip_address' =>$this->ip))->row();
	$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->ip))->row();       
	$data['id']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
	$id=$data['id']->id;
	 	$data1=array(
			'log_out'=>gmdate('Y-m-d H:i:s',time()+60*60*7),
		);

	$this->db->update("tbl_user",$data1,array('id' =>$id));
	$this->db->query("delete from tbl_user_active WHERE ip_address='".$this->ip."'");
	$this->session->sess_destroy();
	if(empty($query['ip'])){	
		redirect();
	}else{
		redirect('action/'.strtolower($query['ip']->login_methode));
	}
}	
function password(){
        $data=array(
         	'nav'=>'Security',
         	'username'=>$this->username,
         	'id'=>$data1['user']->id,
			'url'=>'action/password',
        );	
		if($this->session->userdata('isLogin') == true){
    		$this->load->view('content/changepwd',$data);
		}else{
			redirect();
    	}
	}
	function change(){									
				$username = $this->username;
				$table = "tbl_user";
				$data = array ('success' => false, 'messages' => array());
				$this->form_validation->set_rules('currentpwd', 'Current Password','required|trim|xss_clean|callback_cekpwd');
				$this->form_validation->set_rules('pwd', 'New Password','required|min_length[4]|max_length[20]|trim|xss_clean');
				$this->form_validation->set_rules('pwdconf', 'New Password Conf.','required|min_length[4]|max_length[20]|matches[pwd]|trim|xss_clean');
				$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
				if($this->form_validation->run()){
									$password = $this->input->post('pwdconf');
									$password = $this->encrypt->sha1($password);
									$password = strrev($password);$password=substr($password,5);	
									$data1=array(
										'password'=>$password,
									);
									$this->db->update($table,$data1,array('username' => $username));
									$data['success'] = true;
							
							} else {
								foreach ($_POST as $key => $value) {
									 $data['messages'][$key] = form_error($key);
								}			
				
							}
					echo json_encode($data);	
	
	}
 function cekpwd($str){
   $username = $this->username;
   $cek['user']=$this->db->get_where('tbl_user',array('username'=>$username))->row();
   $pwd=$cek['user']->password;
	$str=$this->encrypt->sha1($str);
	$str= strrev($str);$str=substr($str,5);
	   if($str!=$pwd){		
	         $this->form_validation->set_message('cekpwd', 'Password not valid, pelase contact administrator!');
	         return false;
	   }else{
	         return true;
	   }
 }
}
