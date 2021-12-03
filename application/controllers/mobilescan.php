<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class MobileScan extends CI_Controller{
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
	     	'nama'=>$this->nama,
		);
		
		$this->load->view('content/mobile/home',$data);	
	}

}


