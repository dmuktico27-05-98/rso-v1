<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!');
class Home extends CI_Controller{
function __construct(){
        parent::__construct();
		$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
		$data1['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
		$this->user_level=$data1['user']->user_level;
		$this->user_group=$data1['user']->user_group;
		$this->user_area=$data1['user']->user_area;
		$this->nama=$data1['user']->nama;
		$this->shop=$data1['user']->shop;
		$this->username=$data1['user']->username;
        $time=$this->session->userdata('timeout');
		if(time()<$time){
			$this->session->unset_userdata('timeout');
			$this->session->set_userdata('timeout',time()+3600);
		}else{
			$this->session->sess_destroy();
			redirect();
		}
}
function index(){
			$this->load->library('user_agent');
        	$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
			$data['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
			$userfile=$data['user']->typefile;
			if($userfile==''){ $userfile="default.jpg";}
			$data['title']= $this->db->get('tbl_title')->row();
			$menu_mother=$this->db->query("select a.mother,a.parent,a.icon,a.nav,a.url,a.tabel,b.user_level,b.add_level,b.edit_level,b.delete_level from tbl_menu a inner join tbl_menu_user b on(a.menuid=b.menuid) where a.parent='-' and b.user_level='".$data['user']->user_level."' and b.view_level='yes' order by a.orders asc")->result();
			$menu_parent=$this->db->query("select a.mother,a.parent,a.icon,a.nav,a.url,a.tabel,b.user_level,b.add_level,b.edit_level,b.delete_level from tbl_menu a inner join tbl_menu_user b on(a.menuid=b.menuid) where a.parent!='-' and b.user_level='".$data['user']->user_level."' and b.view_level='yes' order by a.orders asc")->result();	
			$ppc = $this->db->query("select create_date from tbl_input_ppc order by create_date desc limit 1")->row();
			$general = $this->db->query("select create_date from tbl_input_general order by create_date desc limit 1")->row();
			$ppl = $this->db->query("select create_date from tbl_input_ppl order by create_date desc limit 1")->row();
				if($data['user']->user_group=="Admin"){
					$data1=array(
					'url'=>'home',
					'nav'=>'home',
					'user_file'=>$userfile,
					'registrasi'=>$data['user']->registrasi,
					'user_level'=>$data['user']->user_level,
					'title'=>$data['title']->title,	
					'detail'=>$data['title']->detail,
					'owner'=>$data['title']->owner,	
					'version'=>$data['title']->version,	
					'logo'=>$data['title']->logo,
					'menu_mother'=>$menu_mother,
					'menu_parent'=>$menu_parent,
					'shop'=>$this->shop,
					'nama'=>$this->nama,
					'user'=>$this->username,
					'ppc_grap_update'=>$ppc->create_date,
					'general_grap_update'=>$general->create_date,
					'ppl_grap_update'=>$ppl->create_date,
					'ppc_table'=>$this->db->query("select * from tbl_input_ppc where create_date='".$ppc->create_date."' order by ss_p1+ss_p4+ss_kap+ss_ppl+ss_process asc limit 10")->result(),
					'general_table'=>$this->db->query("select * from tbl_input_general where create_date='".$general->create_date."' order by ss_p1+ss_p4+ss_kap+ss_ppl+ss_process asc limit 10")->result(),
					'ppl_table'=>$this->db->query("select * from tbl_input_ppl where create_date='".$ppl->create_date."' order by ss_ppl asc limit 10")->result(),
					'count_ppc'=>$this->db->query("select job_no from tbl_input_ppc")->num_rows(),
					'count_gen'=>$this->db->query("select job_no from tbl_input_general")->num_rows(),
					'count_ppl'=>$this->db->query("select job_no from tbl_input_ppl")->num_rows(),
				);
				
					$this->load->view('element/header',$data1);
					$this->load->view('element/home');
					$this->load->view('element/footer');

		     	}else{
					
					$level=$data['user']->user_level;
					redirect(strtolower($level));
											
		      	}
	       
}

}
