<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class Mastercrud extends CI_Controller{
	public $user_level;
	public $user_group;
	public $user_area;
	function __construct(){
        parent::__construct();
		$this->load->library('PHPExcel');
		$this->load->library('user_agent');
		$cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
		$data1['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
		$this->user_level=$data1['user']->user_level;
		$this->user_group=$data1['user']->user_group;
		$this->user_area=$data1['user']->user_area;
		$this->nama=$data1['user']->nama;
		$this->shop=$data1['user']->shop;
		$this->shift=$data1['user']->shift;
		$this->username=$data1['user']->username;
		if($this->user_group!='Admin'){	
			redirect('action/logout');
		}
    }
    function createlot(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		'data_model'=>$this->db->query("SELECT country,model,model_type,destinasi FROM tbl_master_vanning group by country,model,model_type order by model_type asc")->result(),
		);		
	  $this->load->view('content/planning/createlot',$data);
	}
	function formprintcase(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		'data_lot'=>$this->db->query("SELECT * FROM tbl_history_vanning where finish_date is null group by country,model,lot_no order by id asc ")->result(),
		);		
	  $this->load->view('content/planning/formprintcase',$data);
	}
	function formlayout(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		'data_lot'=>$this->db->query("SELECT country,model,model_type,GROUP_CONCAT(DISTINCT(lot_no)) as lot_no,cont_no,shipment_no FROM tbl_history_vanning where cont_no is not null group by country,model,cont_no order by shipment_no,temp_cont asc")->result(),
		);		
	  $this->load->view('content/planning/formprintlayout',$data);
	}
	function formprintgroup(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		'data_lot'=>$this->db->query("SELECT * FROM tbl_history_vanning where finish_date is null group by country,model,lot_no order by id asc ")->result(),
		);		
	  $this->load->view('content/planning/formprintgroup',$data);
	}
	function formcontainer(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		'data_lot'=>$this->db->query("SELECT * FROM tbl_history_vanning where finish_date is null group by country,model,shipment_no,temp_cont order by temp_cont asc")->result(),
		);		
	  $this->load->view('content/planning/inputcontainer',$data);
	}
    function filter(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		);		
	  $this->load->view('content/download/download',$data);
	}
    function view_detail(){
		$id= $this->input->post('id');
		$table= $this->input->post('table');
		$data_field=$this->db->field_data($table);
		$query="select * from ".$table." where id='".$id."' ";
			$data=array(
			'table'=>$table,
			'data_field'=>$this->db->field_data($table),
			'data_table'=>$this->db->query($query)->result_array(),
			);		
	  $this->load->view('content/view/view',$data);
	}
	function datapos(){
		$user_level=$this->input->post('user_level');
		if($user_level=='PackingBox'){
			$querypos= $this->db->query('SELECT category,category as pos_name,lane_no FROM tbl_master_lane')->result();	
		}elseif($user_level=='PackingCase'){
			$querypos= $this->db->query('SELECT category,category as pos_name,lane_no FROM tbl_master_lane')->result();	
		}
	
 		$data=array(
		 	'data_table'=>$querypos,
		);	
		$this->load->view('content/view/datapos',$data);
	}
//==================== INSERT =====================
function save(){
	$table = $this->input->post('table');
	$date = gmdate('Y-m-d H:i:s',time()+60*60*7);
	$data = array ('success' => false, 'messages' => array());   
	// save result npk scan inhouse     
	if($table=="tbl_temp_panel_dashmix"){
	$cek=$this->db->query("SELECT * from ".$table." WHERE id!='' ")->result();
	if(!empty($cek)){	
	$sql = "INSERT INTO tbl_panel_dashmix (prod_date,wos_date,jdt,lhd,no_wos,code,variant,job_no,job_var,vin) SELECT prod_date,wos_date,jdt,lhd,no_wos,code,variant,job_no,job_var,vin FROM ".$table." ";
	$this->db->query($sql);
	$this->db->truncate($table);
		$data['success'] = true;
		}else{
		$data['success'] = false;
			}
		}elseif ($table=="tbl_temp_panel_side_d14n") {
			$cek['temp']=$this->db->query("SELECT * from ".$table." WHERE id!='' ")->result();
				$cek1=$this->db->query("SELECT * from tbl_panel_side_d14n")->num_rows();
				$cek2['seq']=$this->db->query("select * from tbl_panel_side_d14n order by seq_no desc limit 1")->row();
			if(!empty($cek['temp'])){	
			if($cek1==0){
				$seq_no = 0;
			}else{
				$seq_no = $cek2['seq']->seq_no;
			}
				foreach ($cek['temp'] as $key) {
					$seq_no = $seq_no + 1;
					$insert_looping = array(
						'seq_no' => $seq_no,
						'prod_date' => $key->prod_date,
						'wos_date'=>$key->wos_date,
						'jdt'=>$key->jdt,
						'lhd'=>$key->lhd,
						'no_wos'=>$key->no_wos,
						'no_mix'=>$key->no_mix,
						'code' => $key->code,
						'variant' => $key->variant,
						'panel_side_rh'=>$key->panel_side_rh,
						'job_var_rh'=>$key->job_var_rh,
						'panel_side_lh'=>$key->panel_side_lh,
						'job_var_lh'=>$key->job_var_lh,
						'vin' => $key->vin,
					);
					$this->db->insert('tbl_panel_side_d14n', $insert_looping); 
				}
			$this->db->truncate($table);
				$data['success'] = true;
				}else{
				$data['success'] = false;
					}
		}
	echo json_encode($data);	
	}
	
	function add_detail(){
		$table= $this->input->post('table');
		$date=gmdate('dmy',time()+60*60*7);
          $tgl='%'.gmdate('Y-m',time()+60*60*7).'%';
		$query="select * from ".$table."";
		if($this->user_level=='Administrator'){
			$query_level="select * from tbl_level order by user_level asc";
		}else{
			$query_level="select * from tbl_level where user_area='".$this->user_area."' order by user_level asc";
		}
			$data=array(
			'table'=>$table,
			'data_table'=>$this->db->query($query)->result(),
			'data_group'=>$this->db->get('tbl_group')->result(),
			'data_level'=>$this->db->query($query_level)->result(),
			'data_area'=>$this->db->get('tbl_area')->result(),
			'data_day'=>$this->db->get('tbl_day')->result(),
			'data_shop'=>$this->db->get('tbl_master_shop')->result(),
			'data_field'=>$this->db->field_data($table),
			'master_part'=>$this->db->query("select * from tbl_master_part where maks_shift!=0 order by id asc")->result(),
			'shop_name'=>$this->shop,
			'shift'=>$this->shift,
			);	
			
	  $this->load->view('content/add/add_'.$table,$data);
	}
	public function add_json() {
		$table=$this->input->post('table');
		$data = array ('success' => false, 'messages' => array());
		$tgl=gmdate('Y-m-d',time()+60*60*7);
		$datetime=gmdate('Y-m-d H:i:s',time()+60*60*7);
		if($table=="tbl_user"){
			$this->form_validation->set_rules('nik', 'Nik', 'trim|required|numeric|min_length[3]');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[3]');	
			$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[3]|is_unique[tbl_user.username]');				
			$this->form_validation->set_rules('nama', 'Nama', 'trim|required');	
			$this->form_validation->set_rules('level', 'Level', 'trim|required');
			$this->form_validation->set_rules('shop', 'Shop', 'trim|required');
			$this->form_validation->set_rules('jabatan', 'Jabatan', 'trim|required');
			$data2=explode('-',$this->input->post('level'));		
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$password = $this->input->post('password');
					$password = $this->encrypt->sha1($password);
					$password = strrev($password);$password=substr($password,5);
					$idcard = $this->encrypt->sha1($password.'a6ygf501'.$this->input->post('username'));
					$data1 = array (
						  	'nama'=>$this->input->post('nama'),	
							'nik'=>$this->input->post('nik'),			
						 	'username'=>$this->input->post('username'),
							'password'=>$password,
							'registrasi'=>$datetime,
							'user_group'=>$data2[0],
							'user_level'=>$data2[1],
							'user_area'=>$data2[2],
							'shift'=>$this->input->post('shift'),
							'shop'=>$this->input->post('shop'),
							'jabatan'=>$this->input->post('jabatan'),
							'idcard'=>$idcard, 
						);
					
						$this->db->insert($table,$data1);					
						$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_title"){
			$nmfile='logo';
			$this->form_validation->set_rules('title', 'Title', 'trim|required|is_unique[tbl_title.title]');
			$this->form_validation->set_rules('detail', 'Detail', 'trim|required');
			$this->form_validation->set_rules('owner', 'Owner', 'trim|required');
			$this->form_validation->set_rules('version', 'Version', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$config['upload_path']='./assets/img';
			$config['allowed_types']='jpg|png|jpeg';
			$config['max_size']='4000';
			$config['max_width']='2000';
			$config['max_height']='2000';
			$config['file_name']=$nmfile;
			$config['overwrite']= TRUE;
			$this->load->library('upload',$config);
			$this->upload->initialize($config);
			if(!$this->upload->do_upload('file')){
				$msg=strip_tags($this->upload->display_errors());
			}else{				
				$msg='';
				$cek='ok';
				$gbr=$this->upload->data('file');					
			}
			if($this->form_validation->run()) {	
				if($cek=="ok"){
					$data1=array(
					'title'=>$this->input->post('title'),
					'detail'=>$this->input->post('detail'),
					'owner'=>$this->input->post('owner'),
					'version'=>$this->input->post('version'),
					'logo'=>$gbr['file_name'],
					);
				}else{
					$data1=array(
					'title'=>$this->input->post('title'),
					'detail'=>$this->input->post('detail'),
					'owner'=>$this->input->post('owner'),
					'version'=>$this->input->post('version'),
					'logo'=>'logodefault.jpg',
					);
				}
					
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_pesan_andon"){
			$this->form_validation->set_rules('area', 'Area', 'trim|required|is_unique[tbl_pesan_andon.area]');
			$this->form_validation->set_rules('pesan', 'Pesan', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'area'=>$this->input->post('area'),
					'pesan'=>$this->input->post('pesan'),
					);
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_group"){
			$this->form_validation->set_rules('user_group', 'Group', 'trim|required|is_unique[tbl_group.user_group]');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'user_group'=>$this->input->post('user_group'),
				);
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_level"){
			$user_level=$this->input->post('user_level');
			$user_group=$this->input->post('user_group');
			$this->form_validation->set_rules('user_level', 'Level', 'trim|required|is_unique[tbl_level.user_level]');
			$this->form_validation->set_rules('user_group', 'Group', 'trim|required');
			$this->form_validation->set_rules('user_area', 'Area', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'user_level'=>$this->input->post('user_level'),
					'user_group'=>$this->input->post('user_group'),
					'user_area'=>$this->input->post('user_area'),
					);
					$this->db->insert($table,$data1);				
					$data['success'] = true;
					if($user_group=="Admin"){
						$query=$this->db->get('tbl_menu')->result();
						foreach ($query as $key) {
							$data2=array(
							'menuid'=>$key->menuid,
							'user_level'=>$user_level,
							'view_level'=>'no',
							'add_level'=>'no',
							'edit_level'=>'no',
							'delete_level'=>'no',
							);
						$this->db->insert('tbl_menu_user',$data2);	
						}
					}


			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_menu"){
			$menuid=$this->input->post('mother').$this->input->post('parent');
			$this->form_validation->set_rules('mother', 'Mother', 'trim|required|max_length[20]');
			$this->form_validation->set_rules('parent', 'Parent', 'trim|required||max_length[20]');	
			$this->form_validation->set_rules('icon', 'Icon', 'trim|required');				
			$this->form_validation->set_rules('nav', 'Nav', 'trim|required|callback_tbl_menu');
			$this->form_validation->set_rules('url', 'Url', 'trim|required');
			$this->form_validation->set_rules('tabel', 'Table', 'trim|required');						
			$this->form_validation->set_rules('orders', 'Orders', 'trim|required|numeric');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'menuid'=>$this->input->post('mother').$this->input->post('parent'),
					'mother'=>$this->input->post('mother'),
					'parent'=>$this->input->post('parent'),
					'icon'=>$this->input->post('icon'),
					'nav'=>$this->input->post('nav'),
					'tabel'=>$this->input->post('tabel'),
					'url'=>$this->input->post('url'),
					'orders'=>$this->input->post('orders'),
				);
					$this->db->insert($table,$data1);				
					$data['success'] = true;
					$query=$this->db->get_where('tbl_level',array('user_group'=>'Admin'))->result();
					if(!empty($query)){
						foreach ($query as $key) {
							$data2=array(
							'menuid'=>$menuid,
							'user_level'=>$key->user_level,
							'view_level'=>'no',
							'add_level'=>'no',
							'edit_level'=>'no',
							'delete_level'=>'no',
							);
						$this->db->insert('tbl_menu_user',$data2);
						}
					}

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_area"){
			$this->form_validation->set_rules('area', 'Area', 'trim|required|is_unique[tbl_area.area]');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'area'=>$this->input->post('area'),
				);
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_ip_address"){
			$this->form_validation->set_rules('ip_address', 'Ip Address', 'trim|required|valid_ip|is_unique[tbl_ip_address.ip_address]');
			$this->form_validation->set_rules('login_methode', 'Login Methode', 'trim|required');
			$this->form_validation->set_rules('user_level', 'User Level', 'trim|required');
			$this->form_validation->set_rules('user_pos', 'User Pos', 'trim|required');
			$this->form_validation->set_rules('url', 'Url', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'ip_address'=>$this->input->post('ip_address'),
					'user_level'=>$this->input->post('user_level'),
					'user_lane'=>$this->input->post('user_pos'),
					'login_methode'=>$this->input->post('login_methode'),
					'url'=>$this->input->post('url'),
				);
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_master_shop"){
			$this->form_validation->set_rules('shop_name', 'Shop_name', 'trim|required');
			$this->form_validation->set_rules('cost_center', 'Cost_center', 'trim|required');
			$this->form_validation->set_rules('gr_code', 'Gr_code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'shop_name'=>$this->input->post('shop_name'),
					'cost_center'=>$this->input->post('cost_center'),
					'gr_code'=>$this->input->post('gr_code'),
				);
					$this->db->insert($table,$data1);					
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_input_ppc" || $table=="tbl_input_general"){
			$master['id'] = $this->db->query("select * from tbl_master_part where job_no='".$this->input->post('job_no')."' limit 1 ")->row();
			$t_t = 465/$master['id']->maks_shift;
			$t_t = round($t_t,2);
			$this->form_validation->set_rules('job_no', 'job_no', 'trim|required');
			$this->form_validation->set_rules('sto_p1', 'Sto_p1');
			$this->form_validation->set_rules('sto_p4', 'Sto_p4');
			$this->form_validation->set_rules('sto_kap', 'Sto_kap');
			$this->form_validation->set_rules('sto_ppl', 'Sto_ppl');
			$this->form_validation->set_rules('sto_process', 'Sto_Process');
			$this->form_validation->set_rules('shift', 'Shift', 'trim|required');
			$this->form_validation->set_rules('shop_name', 'Shop_name', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'shift'=>$this->input->post('shift'),
					'shop_name'=>$this->input->post('shop_name'),
					'job_no'=>$master['id']->job_no,
					'part_no'=>$master['id']->part_no,
					'part_name'=>$master['id']->part_name,
					'patan'=>$master['id']->patan,
					'maks_shift'=>$master['id']->maks_shift,
					't_t'=>$t_t,
					'sto_p1'=>$this->input->post('sto_p1'),
					'sto_p4'=>$this->input->post('sto_p4'),
					'sto_kap'=>$this->input->post('sto_kap'),
					'sto_ppl'=>$this->input->post('sto_ppl'),
					'sto_process'=>$this->input->post('sto_process'),
					'ss_p1'=>round((($t_t*$this->input->post('sto_p1'))/465)*8,2),
					'ss_p4'=>round((($t_t*$this->input->post('sto_p4'))/465)*8,2),
					'ss_kap'=>round((($t_t*$this->input->post('sto_kap'))/465)*8,2),
					'ss_ppl'=>round((($t_t*$this->input->post('sto_ppl'))/465)*8,2),
					'ss_process'=>round((($t_t*$this->input->post('sto_process'))/465)*8,2),
					"area"=>$master['id']->area,
					"proses"=>$master['id']->proses,
					"model"=>$master['id']->model,
					"create_by"=>$this->nama,
					"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
				);
			
				$this->db->insert($table,$data1);					
				$data['success'] = true;
		} else {
			foreach ($_POST as $key => $value) {
				 $data['messages'][$key] = form_error($key);
				}			
			}
		}
		echo json_encode($data);
	}

	public function job_no_check($job_no){

		$check =$this->db->query("select * from tbl_master_part where job_no='".$job_no."'")->result();

			if (empty($check))
			{
					$this->form_validation->set_message('job_no_check', 'The Job_no not valid');
					return FALSE;
			}
			else
			{
					return TRUE;
			}
	}

	public function jumlah_hrp($job_no,$hrp_id){

		$check =$this->db->query("select * from tbl_hrp where hrp_id='".$hrp_id."'")->num_rows();


			if ($check>=15)
			{
					$this->form_validation->set_message('jumlah_hrp', 'The Input hrp over 15 items');
					return FALSE;
			}
			else
			{
					return TRUE;
			}
	}

	public function job_no_hrp($str,$cek){
        $data = explode(' ',$cek);
        $hrp_id=$data[0];
        $job_no=$data[1];
			   $check =$this->db->query("select * from tbl_hrp where hrp_id='".$hrp_id."' and job_no='".$job_no."' and category='".$str."'")->result();


                if (empty($check))
                {
                     return TRUE;    
                }
                else
                { 
                     $this->form_validation->set_message('job_no_hrp', 'The Data double input');
                      return FALSE;
                }
        }

	
    public function tbl_menu(){

    		$nav=$this->input->post('nav');
    		$mother=$this->input->post('mother');
			$check =$this->db->query("select * from tbl_menu where nav='".$nav."' and mother='".$mother."'")->result();


                if(!empty($check))
                {
                        $this->form_validation->set_message('tbl_menu', 'The {'.$nav.'} in '.$mother.' already exists');
                        return FALSE;
                }
                else
                {
                        return TRUE;
                }
        }
   
//    ======================== EDIT =======================
	function edit_detail(){
		$id= $this->input->post('id');
		$table= $this->input->post('table');
		$query="select * from ".$table." where id='".$id."' ";
		if($this->user_level=='Administrator'){
			$query_level="select * from tbl_level order by user_level asc";
		}else{
			$query_level="select * from tbl_level where user_area='".$this->user_area."' order by user_level asc";
		}
			$data=array(
			'table'=>$table,
			'data_table'=>$this->db->query($query)->result(),
			'data_group'=>$this->db->get('tbl_group')->result(),
			'data_level'=>$this->db->query($query_level)->result(),
			'data_area'=>$this->db->get('tbl_area')->result(),
			'data_shop'=>$this->db->get('tbl_master_shop')->result(),
			'data_field'=>$this->db->field_data($table),
			'master_part'=>$this->db->query("select * from tbl_master_part where maks_shift!=0 order by id asc")->result(),
			'shop_name'=>$this->shop,
			'shift'=>$this->shift,
			);		
	  $this->load->view('content/edit/edit_'.$table,$data);
	}
	public function edit_json() {
		$id = $this->input->post('id');
		$table = $this->input->post('table');
		$data = array ('success' => false, 'messages' => array());
		if($table=="tbl_user") {
			$this->form_validation->set_rules('nik', 'Nik', 'trim|required|numeric|min_length[3]');
			$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[3]|callback_tbl_user');				
			$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
			$this->form_validation->set_rules('level', 'Level', 'trim|required');
			$this->form_validation->set_rules('shop', 'Shop', 'trim|required');
			$this->form_validation->set_rules('jabatan', 'Jabatan', 'trim|required');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[3]');		
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$data2=explode('-',$this->input->post('level'));
			if($this->form_validation->run()){
					$password = $this->input->post('password');
					$password = $this->encrypt->sha1($password);
					$password = strrev($password);$password=substr($password,5);	

					$data1=array(
							'nama'=>$this->input->post('nama'),	
							'nik'=>$this->input->post('nik'),		
							'username'=>$this->input->post('username'),
							'user_group'=>$data2[0],
							'user_level'=>$data2[1],
							'user_area'=>$data2[2],
							'shift'=>$this->input->post('shift'),
							'password'=>$password,
							'shop'=>$this->input->post('shop'),	
							'jabatan'=>$this->input->post('jabatan'),						
							);
				
					$this->db->update($table,$data1,array('id' => $id));
					$data['success'] = true;
			
			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_title"){
			$nmfile='logo';
			$this->form_validation->set_rules('title', 'Title', 'trim|required');
			$this->form_validation->set_rules('detail', 'Detail', 'trim|required');
			$this->form_validation->set_rules('owner', 'Owner', 'trim|required');
			$this->form_validation->set_rules('version', 'Version', 'trim|required');
			$this->form_validation->set_rules('year', 'Year', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$config['upload_path']='./assets/img';
			$config['allowed_types']='jpg|png|jpeg';
			$config['max_size']='4000';
			$config['max_width']='2000';
			$config['max_height']='2000';
			$config['file_name']=$nmfile;
			$config['overwrite']= TRUE;
			$this->load->library('upload',$config);
			$this->upload->initialize($config);
			if(!$this->upload->do_upload('file')){
				$msg=strip_tags($this->upload->display_errors());
			}else{				
				$msg='';
				$cek='ok';
				$gbr=$this->upload->data('file');					
			}
			if($this->form_validation->run()) {	
				if($cek=="ok"){
					$data1=array(
					'title'=>$this->input->post('title'),
					'detail'=>$this->input->post('detail'),
					'owner'=>$this->input->post('owner'),
					'version'=>$this->input->post('version'),
					'logo'=>$gbr['file_name'],
					'year'=>$this->input->post('year'),
					);
				}else{
					$data1=array(
					'title'=>$this->input->post('title'),
					'detail'=>$this->input->post('detail'),
					'owner'=>$this->input->post('owner'),
					'version'=>$this->input->post('version'),
					'year'=>$this->input->post('year'),
					);
				}
					
				$this->db->update($table,$data1,array('id'=>$id));					
				$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_group"){
			$this->form_validation->set_rules('user_group', 'Group', 'trim|required|callback_tbl_group_edit');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$query_cek['group']=$this->db->query("select user_group from tbl_group where id='".$id."'")->row();
			$user_group=$query_cek['group']->user_group;
			if($this->form_validation->run()) {	
					$data1=array(
					'user_group'=>$this->input->post('user_group'),
				);
					$this->db->update($table,$data1,array('id'=>$id));				
					$this->db->query("UPDATE tbl_level SET user_group='".$this->input->post('user_group')."' WHERE user_group='".$user_group."'");
					$this->db->query("UPDATE tbl_user SET user_group='".$this->input->post('user_group')."' WHERE user_group='".$user_group."'");
					$data['success'] = true;

			}else{
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_level"){
			$this->form_validation->set_rules('user_level', 'Level', 'trim|required|callback_tbl_level_edit');
			$this->form_validation->set_rules('user_group', 'Group', 'trim|required');
			$this->form_validation->set_rules('user_area', 'Area', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$query_cek['level']=$this->db->query("select user_level from tbl_level where id='".$id."'")->row();
			$user_level=$query_cek['level']->user_level;
			if($this->form_validation->run()) {	
					$data1=array(
					'user_level'=>$this->input->post('user_level'),
					'user_group'=>$this->input->post('user_group'),
					'user_area'=>$this->input->post('user_area'),
				);
					$this->db->update($table,$data1,array('id'=>$id));					
					$this->db->query("UPDATE tbl_user SET user_level='".$this->input->post('user_level')."',user_area='".$this->input->post('user_area')."',user_group='".$this->input->post('user_group')."' WHERE user_level='".$user_level."'");
					$this->db->query("UPDATE tbl_menu_user SET user_level='".$this->input->post('user_level')."' WHERE user_level='".$user_level."'");
					$this->db->query("UPDATE tbl_ip_address SET user_level='".$this->input->post('user_level')."' WHERE user_level='".$user_level."'");
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_menu") {
			$this->form_validation->set_rules('mother', 'Mother', 'trim|required');
			$this->form_validation->set_rules('parent', 'Parent', 'trim|required');	
			$this->form_validation->set_rules('icon', 'Icon', 'trim|required');				
			$this->form_validation->set_rules('nav', 'Nav', 'trim|required|callback_tbl_menu_edit');
			$this->form_validation->set_rules('url', 'Url', 'trim|required');		
			$this->form_validation->set_rules('tabel', 'Table', 'trim|required');				
			$this->form_validation->set_rules('orders', 'Orders', 'trim|required|numeric');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$query_cek['menu']=$this->db->query("select menuid from tbl_menu where id='".$id."'")->row();
			$menuid=$query_cek['menu']->menuid;
			if($this->form_validation->run()) {	
					$data1=array(
						'menuid'=>$this->input->post('mother').$this->input->post('parent'),
						'mother'=>$this->input->post('mother'),
						'parent'=>$this->input->post('parent'),
						'icon'=>$this->input->post('icon'),
						'nav'=>$this->input->post('nav'),
						'url'=>$this->input->post('url'),
						'tabel'=>$this->input->post('tabel'),
						'orders'=>$this->input->post('orders'),
					);
				
					$this->db->update($table,$data1,array('id'=>$id));
					$data['success'] = true;
					$this->db->query("UPDATE tbl_menu_user SET menuid='".$this->input->post('mother').$this->input->post('parent')."' WHERE menuid='".$menuid."'");

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}	
		}elseif($table=="tbl_area"){
			$this->form_validation->set_rules('area', 'Area', 'trim|required|callback_tbl_area');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			$query_cek['area']=$this->db->query("select area from tbl_area where id='".$id."'")->row();
			$area=$query_cek['area']->area;
			if($this->form_validation->run()) {	
					$data1=array(
					'area'=>$this->input->post('area'),
				);
					$this->db->update($table,$data1,array('id'=>$id));
					$this->db->query("UPDATE tbl_level SET user_area='".$this->input->post('area')."' WHERE user_area='".$area."'");
					$this->db->query("UPDATE tbl_user SET user_area='".$this->input->post('area')."' WHERE user_area='".$area."'");
					$data['success'] = true;

			}else{
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_ip_address"){
			$this->form_validation->set_rules('ip_address', 'Ip Address', 'trim|required|valid_ip|callback_tbl_ip_address');
			$this->form_validation->set_rules('login_methode', 'Login Methode', 'trim|required');
			$this->form_validation->set_rules('user_level', 'User Level', 'trim|required');
			$this->form_validation->set_rules('user_pos', 'User Pos', 'trim|required');
			$this->form_validation->set_rules('url', 'Url', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'ip_address'=>$this->input->post('ip_address'),
					'user_level'=>$this->input->post('user_level'),
					'user_lane'=>$this->input->post('user_pos'),
					'login_methode'=>$this->input->post('login_methode'),
					'url'=>$this->input->post('url'),
				);
					$this->db->update($table,$data1,array('id'=>$id));				
					$data['success'] = true;

			} else {
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_pesan_andon"){
			$this->form_validation->set_rules('pesan', 'Pesan', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'pesan'=>$this->input->post('pesan'),
					);
					$this->db->update($table,$data1,array('id'=>$id));				
					$data['success'] = true;
				}else{
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_master_shop"){
			$this->form_validation->set_rules('shop_name', 'Shop_name', 'trim|required');
			$this->form_validation->set_rules('cost_center', 'Cost_center', 'trim|required');
			$this->form_validation->set_rules('gr_code', 'Gr_code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(
					'shop_name'=>$this->input->post('shop_name'),
					'cost_center'=>$this->input->post('cost_center'),
					'gr_code'=>$this->input->post('gr_code'),
					);
					$this->db->update($table,$data1,array('id'=>$id));				
					$data['success'] = true;
				}else{
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}elseif($table=="tbl_input_ppc" || $table=="tbl_input_general"){
			$master['id'] = $this->db->query("select * from tbl_master_part where job_no='".$this->input->post('job_no')."' limit 1 ")->row();
			$t_t = 465/$master['id']->maks_shift;
			$t_t = round($t_t,2);
			$p1 =$this->input->post('sto_p1');
			$p4 =$this->input->post('sto_p4');
			$kap =$this->input->post('sto_kap');
			$ppl =$this->input->post('sto_ppl');
			$process =$this->input->post('sto_process');
			$this->form_validation->set_rules('job_no', 'job_no', 'trim|required');
			$this->form_validation->set_rules('sto_p1', 'Sto_p1');
			$this->form_validation->set_rules('sto_p4', 'Sto_p4');
			$this->form_validation->set_rules('sto_kap', 'Sto_kap');
			$this->form_validation->set_rules('sto_ppl', 'Sto_ppl');
			$this->form_validation->set_rules('sto_process', 'Sto_Process');
			$this->form_validation->set_rules('shift', 'Shift', 'trim|required');
			$this->form_validation->set_rules('shop_name', 'Shop_name', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
			if($this->form_validation->run()) {	
					$data1=array(					
					'sto_p1'=>$p1==""?null:$p1,
					'sto_p4'=>$p4==""?null:$p4,
					'sto_kap'=>$kap==""?null:$kap,
					'sto_ppl'=>$ppl==""?null:$ppl,
					'sto_process'=>$process==""?null:$process,
					'ss_p1'=>$p1==""?null:round((($t_t*$p1)/465)*8,2),
					'ss_p4'=>$p4==""?null:round((($t_t*$p4)/465)*8,2),
					'ss_kap'=>$kap==""?null:round((($t_t*$kap)/465)*8,2),
					'ss_ppl'=>$ppl==""?null:round((($t_t*$ppl)/465)*8,2),
					'ss_process'=>$process==""?null:round((($t_t*$process)/465)*8,2),					
					"create_by"=>$this->nama,
					"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
				);
					$this->db->update($table,$data1,array('id'=>$id));				
					$data['success'] = true;
				}else{
				foreach ($_POST as $key => $value) {
				 	$data['messages'][$key] = form_error($key);
				}			

			}
		}

		echo json_encode($data);

	}
public function tbl_title(){
		$id=$this->input->post('id');
		$title=$this->input->post('title');
		$check =$this->db->query("select * from tbl_title where title='".$title."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_title', 'The {'.$title.'} already exists');
                    return FALSE;
            }
    }
public function tbl_user(){
		$id=$this->input->post('id');
		$username=$this->input->post('username');
		$check =$this->db->query("select * from tbl_user where username='".$username."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_user', 'The {'.$username.'} already exists');
                    return FALSE;
            }
    }
public function tbl_area(){
		$id=$this->input->post('id');
		$str=$this->input->post('area');
		$check =$this->db->query("select * from tbl_area where area='".$str."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_area', 'The {'.$str.'} already exists');
                    return FALSE;
            }
    }
public function tbl_ip_address(){
		$id=$this->input->post('id');
		$str=$this->input->post('ip_address');
		$check =$this->db->query("select * from tbl_ip_address where ip_address='".$str."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_ip_address', 'The {'.$str.'} already exists');
                    return FALSE;
            }
    }
public function tbl_shift(){
		$id=$this->input->post('id');
		$str=$this->input->post('shift');
		$check =$this->db->query("select * from tbl_shift where shift='".$str."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_shift', 'The {'.$str.'} already exists');
                    return FALSE;
            }
    }

public function tbl_group_edit(){
		$id=$this->input->post('id');
		$user_group=$this->input->post('user_group1');
		$check =$this->db->query("select * from tbl_group where user_group='".$user_group."' and  id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_group_edit', 'The {'.$user_group.'} already exists');
                    return FALSE;
            }
    }
public function tbl_menu_edit(){
		$id=$this->input->post('id');
		$nav=$this->input->post('nav1');
		$mother=$this->input->post('mother1');
		$check =$this->db->query("select * from tbl_menu where nav='".$nav."' and mother ='".$mother."' and id!='".$id."'")->result();

            if(empty($check)){
                    return true;
            }else{
                    $this->form_validation->set_message('tbl_menu_edit', 'The {'.$nav.'} already exists');
                    return FALSE;
            }
    }

public function tbl_customer_edit(){
		$id=$this->input->post('id');
		$customer_alias=$this->input->post('customer_alias');
		$check =$this->db->query("select * from tbl_customer where customer_alias='".$customer_alias."' and id!='".$id."'")->result();
        if(empty($check)){
                return true;
        }else{
                $this->form_validation->set_message('tbl_customer_edit', 'The {'.$customer_alias.'} already exists');
                return FALSE;
        }
    }
public function tbl_working_time_edit(){
		$id=$this->input->post('id');
    	$day=$this->input->post('day');
    	$shift=$this->input->post('shift');
		$check =$this->db->query("select * from tbl_working_time where day='".$day."' and shift='".$shift."' and id!='".$id."'")->result();

        if(empty($check)){
                return true;
        }else{
                $this->form_validation->set_message('tbl_working_time_edit', 'The {'.$day.' '.$shift.'} already exists');
                return FALSE;
        }
    }
public function tbl_planning(){
		$model=$this->input->post('model');
    	$lot_no=$this->input->post('lot_no');
    	$shipment_no=$this->input->post('shipment_no1');
		$check =$this->db->query("select id from tbl_history_vanning where model='".$model."' and lot_no='".$lot_no."' and shipment_no='".$shipment_no."' and packingbox_date is not null")->result();

        if(empty($check)){
                return true;
        }else{
                $this->form_validation->set_message('tbl_planning', 'Lot {'.$lot_no.'} sudah proses vanning');
                return FALSE;
        }
    }

    //delete 
    function delete_detail(){
		$table= $this->input->post('table');
		$data=array(
		'table'=>$table,
		);		
	  $this->load->view('content/delete/delete_'.$table,$data);
	}
	function delete_json(){		
			$id = $this->input->post('id');
			$table = $this->input->post('table'); 
			$data = array ('status' => false, 'msg' => 'Data Kosong'); 
			if($table=="tbl_level"){
				$query=$this->db->query("select * from tbl_level where id='".$id."'")->result();
					foreach ($query as $key) {
						$user_level=$key->user_level;
						$this->db->query("DELETE from tbl_menu_user WHERE user_level = '".$user_level."'");	
					} 

			}
			if($table=="tbl_menu"){
				$query=$this->db->query("select * from tbl_menu where id='".$id."'")->result();
					foreach ($query as $key) {
						$menuid=$key->menuid;
						$this->db->query("DELETE from tbl_menu_user WHERE menuid = '".$menuid."'");	
					} 

			}
			if($table=="tbl_planning"){
				$query['id']=$this->db->query("select * from tbl_planning where id='".$id."'")->row();
				$check =$this->db->query("select id from tbl_history_vanning where model='".$query['id']->model."' and lot_no='".$query['id']->lot_no."' and shipment_no='".$query['id']->shipment_no."' and rec_status!='OPEN'")->result();
				$check1 =$this->db->query("select id from tbl_planning where model='".$query['id']->model."' and shipment_no='".$query['id']->shipment_no."' and lot_no>'".$query['id']->lot_no."'")->result();
				

				if(empty($check)){
				  if(empty($check1)){
						$this->delete->delete($table,array('id' =>$id));
						$this->db->query("DELETE from tbl_history_vanning WHERE model='".$query['id']->model."' and lot_no='".$query['id']->lot_no."' and shipment_no='".$query['id']->shipment_no."'");

						$pattern['lot']=$this->db->query("SELECT temp_lot from tbl_master_patterncontainer WHERE model = '".$query['id']->model."' and  country = '".$query['id']->country."' and status='OPEN' group by model,country,temp_lot order by temp_lot desc limit 1")->row();
						$pattern['lot1']=$this->db->query("SELECT temp_lot from tbl_master_patterncontainer WHERE model = '".$query['id']->model."' and  country = '".$query['id']->country."' group by model,country,temp_lot order by temp_lot desc limit 1")->row();
						if(empty($pattern['lot'])){
							$temp_lot=$pattern['lot1']->temp_lot;
						}else{
							$temp_lot=$pattern['lot']->temp_lot;
						}
						$this->db->query("UPDATE tbl_master_patterncontainer set status='OPEN' WHERE model = '".$query['id']->model."' and  country = '".$query['id']->country."' and temp_lot='".$temp_lot."'");	
						$data['status']=true;
					}else{
						$data['msg']="Please, Delete Lot mulai dari belakang!";
					}
				}else{
					$data['msg']="Lot ".$query['id']->lot_no." Sudah Proses Receiving";
				}

			}else{
				$this->db->delete($table,array('id'=>$id));
				$data['status']=true;
			}
  			echo json_encode($data);	
      }
	  function delete_hrp(){		
		$id = $this->input->post('id');
		$table = $this->input->post('table');
	
		$data = array ('status' => false, 'msg' => 'Data Kosong'); 
			$this->db->delete($table,array('id'=>$id));
			$data['status']=true;
		  echo json_encode($data);	
  }

  function approve_hrp(){		
	$hrp_id = $this->input->post('hrp_id');
	$table = $this->input->post('table');

	$data = array ('status' => false, 'msg' => 'Data Kosong');
	$hrp['id']=$this->db->query("select * from tbl_hrp where hrp_id='".$hrp_id."' limit 1")->row();
	if($hrp['id']->spa=='ok' && $hrp['id']->ssa=='nok'){
		$data1 = array('ssa' => 'ok','ssa_date'=>gmdate('Y-m-d H:i:s',time()+60*60*7),);
	}elseif ($hrp['id']->ssa=='ok' && $hrp['id']->sma=='nok') {
		$data1 = array('sma' => 'ok','sma_date'=>gmdate('Y-m-d H:i:s',time()+60*60*7),);
	}elseif ($hrp['id']->sma=='ok' && $hrp['id']->sd=='nok') {
		$data1 = array('sd' => 'ok','sd_date'=>gmdate('Y-m-d H:i:s',time()+60*60*7),);
	}elseif ($hrp['id']->sd=='ok' && $hrp['id']->smm=='nok') {
		$data1 = array('smm' => 'ok','smm_date'=>gmdate('Y-m-d H:i:s',time()+60*60*7),);
	}elseif ($hrp['id']->smm=='ok' && $hrp['id']->smg=='nok') {
		$data1 = array('smg' => 'ok','smg_date'=>gmdate('Y-m-d H:i:s',time()+60*60*7),);
	}

		$this->db->update($table,$data1,array('hrp_id'=>$hrp_id));
		$data['status']=true;
	  echo json_encode($data);	
}
//    ========================== DELETE =======================
function delete_sebagian(){
	$table = $this->input->post('table');
	$data = array ('success' => false, 'messages' => array());         
	if($table=="tbl_temp_vanning"){
		$temp['model']=$this->db->query("SELECT model,country from tbl_temp_vanning order by id asc limit 1")->row();
		$model=$temp['model']->model;
		$country=$temp['model']->country;
		$pattern['lot']=$this->db->query("SELECT temp_lot from tbl_master_patterncontainer WHERE model = '".$model."' and  country = '".$country."' and status='ACTIVE' group by model,country,temp_lot order by temp_lot desc limit 1")->row();
		$this->db->query("UPDATE tbl_master_patterncontainer set status='OPEN' WHERE model = '".$model."' and  country = '".$country."' and temp_lot= '".$pattern['lot']->temp_lot."'");
		$this->db->truncate($table);
	}elseif($table=="tbl_history_settingadm"){
		$this->form_validation->set_rules('upload_date', 'Upload Date', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
		if($this->form_validation->run()){
			$cek=$this->db->query("SELECT * from ".$table." WHERE upload_date like '%".$this->input->post('upload_date')."%'")->result();
			if(!empty($cek)){	
				$this->db->query("DELETE FROM ".$table." WHERE upload_date like '%".$this->input->post('upload_date')."%'");
				$data['success'] = true;
			}else{
				$data['success'] = false;
			}

		} else {
			foreach ($_POST as $key => $value) {
				 $data['messages'][$key] = form_error($key);
			}			
		}
	}elseif($table=="tbl_input_ppc" || $table=="tbl_input_subassy" || $table=="tbl_input_docking"){
		$this->form_validation->set_rules('create_date', 'Create_date', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
		if($this->form_validation->run()){
			$cek=$this->db->query("SELECT * from ".$table." WHERE create_date like '%".$this->input->post('create_date')."%'")->result();
			if(!empty($cek)){	
				$this->db->query("DELETE FROM ".$table." WHERE create_date like '%".$this->input->post('create_date')."%'");
				$data['success'] = true;
			}else{
				$data['success'] = false;
			}
		} else {
			foreach ($_POST as $key => $value) {
				 $data['messages'][$key] = form_error($key);
			}			
		}
	}
	echo json_encode($data);	
}

	function delete_all(){
        $table = $this->input->post('table');
        $data = array ('success' => false, 'messages' => array());         
			$this->db->truncate($table);
			$data['success'] = true;
		echo json_encode($data);	
    }
    function printcase(){
		$modelarray=$this->input->post('lot_no'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $country=$datam[1];
        $lot_no=$datam[2];
		$data=array(
		'data_lot'=>$this->db->query("SELECT *,sum(weight_part_std * qty_vn) as total_weight_box FROM tbl_history_vanning where  model = '".$model."' and  country = '".$country."' and lot_no='".$lot_no."' group by case_no order by id asc")->result(),
		);		
	  $this->load->view('content/print/printcase',$data);
	}
	function printgroup(){
		$modelarray=$this->input->post('lot_no'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $country=$datam[1];
        $lot_no=$datam[2];
		$data=array(
		'data_lot'=>$this->db->query("SELECT *,count(part_no) as jumlah FROM tbl_history_vanning where category!='ENGINE' and  model = '".$model."' and  country = '".$country."' and lot_no='".$lot_no."' group by case_no,box_no,box_seq order by case_no,box_no,box_seq asc")->result(),
		'data_part'=>$this->db->query("SELECT qrbox,part_no,part_name,qty_vn FROM tbl_history_vanning where category!='ENGINE' and  model = '".$model."' and  country = '".$country."' and lot_no='".$lot_no."' order by case_no,box_no,box_seq asc")->result(),
		);	
	  $this->load->view('content/print/printbox',$data);
	}
	function printlayout(){
		$modelarray=$this->input->post('lot_no'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $country=$datam[1];
        $shipment_no=$datam[2];
        $cont_no=$datam[3];
        $query['part']=$this->db->query("SELECT * FROM tbl_history_vanning where model = '".$model."' and  country = '".$country."' and  shipment_no = '".$shipment_no."' and cont_no='".$cont_no."' limit 1")->row();
        $query['mdl']=$this->db->query("SELECT * FROM tbl_master_model where  model='".$model."' and country='".$country."' limit 1")->row();
        $query['cont']=$this->db->query("SELECT max(temp_cont) as temp_cont FROM tbl_master_patterncontainer where  model='".$model."' and country='".$country."' limit 1")->row();
		$data=array(
		"model"=>$query['part']->model,
		"country"=>$query['part']->country,
		"customer"=>$query['part']->customer,
		"cont_size"=>$query['part']->cont_size,
		"vanning_day"=>$query['part']->vanning_date,
		"pc_no"=>$query['part']->pc_no,
		"cont_no"=>$query['part']->cont_no,
		"seal_no"=>$query['part']->seal_no,
		"temp_cont"=>$query['part']->temp_cont,
		"steel_case"=>"20 Case(1-20)",
		"quantity"=>$query['mdl']->total_unit." Set",
		"qrvanning"=>$query['part']->qrvanning,
		"total_cont"=>$query['cont']->temp_cont,
		'data_part'=>$this->db->query("SELECT * FROM tbl_history_vanning where  model = '".$model."' and  country = '".$country."' and cont_no='".$cont_no."' and  shipment_no = '".$shipment_no."' group by lot_no,case_no order by vanning_order asc")->result(),

		);	
	  $this->load->view('content/print/print_layout',$data);
	}
	function print_case(){
		$id= $this->uri->segment(3);
		$query['id']=$this->db->query("SELECT qrcase from tbl_history_vanning WHERE id = '".$id."' limit 1")->row();
		$data=array(
		'data_lot'=>$this->db->query("SELECT *,sum(weight_part_std * qty_vn) as total_weight_box FROM tbl_history_vanning where qrcase='".$query['id']->qrcase."'")->result(),
		);		
	  $this->load->view('content/print/print_case',$data);
	}
	function print_part(){
		$id= $this->uri->segment(3);
		$data=array(
		'data_part'=>$this->db->query("SELECT * FROM tbl_history_receiving where id='".$id."'")->result(),
		);		
	  $this->load->view('content/print/print_part',$data);
	}
	function print_part1(){
		$id= $this->uri->segment(3);
		$data=array(
		'data_part'=>$this->db->query("SELECT * FROM tbl_history_vanning where id='".$id."'")->result(),
		);		
	  $this->load->view('content/print/printpart_group',$data);
	}
	function print_group(){
		$id= $this->uri->segment(3);
		$query['id']=$this->db->query("SELECT * from tbl_history_vanning WHERE id = '".$id."' limit 1")->row();
		$id= $this->uri->segment(3);
		$query['id']=$this->db->query("SELECT * from tbl_history_vanning WHERE id = '".$id."' limit 1")->row();
		$model=$query['id']->model;
		$country=$query['id']->country;
		$lot_no=$query['id']->lot_no;
		$case_no=$query['id']->case_no;
		$box_no=$query['id']->box_no;
		$box_seq=$query['id']->box_seq;
		$qrbox=$query['id']->qrbox;	
		
	  if($query['id']->category=="ENGINE"){
	  	$query_part=$this->db->query("SELECT a.qrbox,a.part_no,a.part_name,b.qty as qty_vn,b.qrrec FROM tbl_history_vanning a inner join tbl_history_packing b on(a.qrbox=b.qrbox) where  a.qrbox='".$qrbox."' order by part_no asc")->result();
		if(empty($query_part)){
			$query_part=$this->db->query("SELECT qrbox,part_no,part_name,qty_vn FROM tbl_history_vanning where  qrbox = '".$qrbox."' order by id asc")->result();
		}
	  	$data=array(
			'data_lot'=>$this->db->query("SELECT * FROM tbl_history_vanning where id='".$id."'")->result(),
			'jumlah'=>$this->db->query("SELECT id FROM tbl_history_vanning where  model = '".$model."' and  country = '".$country."' and lot_no='".$lot_no."' and case_no='".$case_no."'  and box_no='".$box_no."' and box_seq='".$box_seq."' order by part_no asc")->num_rows(),
			'data_part'=>$query_part,
		);
	  	$this->load->view('content/print/print_boxengine',$data);
	  }else{
	  	$query_part=$this->db->query("SELECT qrbox,part_no,part_name,qty_vn FROM tbl_history_vanning where  qrbox = '".$qrbox."' order by id asc")->result();
	  	$data=array(
			'data_lot'=>$this->db->query("SELECT * FROM tbl_history_vanning where id='".$id."'")->result(),
			'jumlah'=>$this->db->query("SELECT id FROM tbl_history_vanning where  model = '".$model."' and  country = '".$country."' and lot_no='".$lot_no."' and case_no='".$case_no."'  and box_no='".$box_no."' and box_seq='".$box_seq."' order by part_no asc")->num_rows(),
			'data_part'=>$query_part,
		);
	  	$this->load->view('content/print/print_box',$data);
	  }		
	  
	}
	function printpallet(){
		$data=array(
		'data_pallet'=>$this->db->query("SELECT * FROM tbl_master_pallet order by id asc")->result(),
		);		
	  $this->load->view('content/print/printpallet',$data);
	}
	function print_pallet(){
		$id= $this->uri->segment(3);
		$data=array(
		'data_pallet'=>$this->db->query("SELECT * FROM tbl_master_pallet WHERE id = '".$id."'  order by id asc")->result(),
		);		
	  $this->load->view('content/print/print_pallet',$data);
	}
	function generatelot(){
    	$id = $this->input->post('id');
        $data = array ('status' => false, 'msg' => 'Data Kosong'); 
        $query['plan']=$this->db->query("SELECT * FROM tbl_planning WHERE id='".$id."' limit 1")->row();
        $query['plan1']=$this->db->query("SELECT * FROM tbl_planning WHERE shipment_no='".$query['plan']->shipment_no."' and lot_no<'".$query['plan']->lot_no."' and generate_date is null order by lot_no asc limit 1")->row();

        $cekvan=$this->db->query("SELECT id FROM tbl_history_vanning WHERE shipment_no='".$query['plan']->shipment_no."' and lot_no='".$query['plan']->lot_no."' limit 1")->result();
        if(!empty($query['plan'])){
        	if(!empty( $query['plan1'])){
        		$data['msg'] = "Lot ".$query['plan1']->lot_no." Belum Generate";
        	}else{
        		if(empty($cekvan)){
					$queryvan=$this->db->query("SELECT * from tbl_master_vanning WHERE model = '".$query['plan']->model."' and model_type = '".$query['plan']->model_type."' and  country = '".$query['plan']->country."'")->result();
					$pattern['lot']=$this->db->query("SELECT temp_lot from tbl_master_patterncontainer WHERE model = '".$query['plan']->model."' and  country = '".$query['plan']->country."' and status='OPEN' group by model,country,temp_lot order by temp_lot asc limit 1")->row();
					if(!empty($pattern['lot'])){
						$temp_lot=$pattern['lot']->temp_lot;
						$this->db->query("UPDATE tbl_master_patterncontainer set status='ACTIVE' WHERE model = '".$query['plan']->model."' and  country = '".$query['plan']->country."' and temp_lot='".$temp_lot."'");
					}else{
						$temp_lot=1;
						$this->db->query("UPDATE tbl_master_patterncontainer set status='OPEN' WHERE model = '".$query['plan']->model."' and  country = '".$query['plan']->country."' and temp_lot>'".$temp_lot."'");
					}
					foreach ($queryvan as $key) {
						for($i=1;$i<=$key->total_box;$i++){
							$qrcase=$key->model."|".$query['plan']->lot_no."|".$key->case_no."|".gmdate('dmy',time()+60*60*7);
							$qrbox=$key->model."|".$query['plan']->lot_no."|".$key->case_no."|".$key->box_no."|".$i."|".gmdate('dmy',time()+60*60*7);
							$qrpart=$key->model."|".$query['plan']->lot_no."|".$key->case_no."|".$key->box_no."|".$i."|".$key->part_no."|".gmdate('dmy',time()+60*60*7);
							$pattern['cont']=$this->db->query("SELECT * from tbl_master_patterncontainer WHERE model = '".$query['plan']->model."' and  country = '".$query['plan']->country."' and temp_lot= '".$temp_lot."' and  case_no= '".$key->case_no."' limit 1")->row();
							 $data1 = array( 
							 	"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),           
				                'country'=>$key->country,
								'customer'=>$key->customer,
								'destinasi'=>$key->destinasi,
								'model'=>$key->model,
								'model_type'=>$key->model_type,
								'case_no'=>$key->case_no,
								'layer_no'=>$key->layer_no,
								'case_type'=>$key->case_type,
								'case_cat'=>$key->case_cat,
								'lane_no'=>$key->lane_no,
								'category'=>$key->category,
								'part_no'=>$key->part_no,
								'part_name'=>$key->part_name,
								'qty_vn'=>$key->qty_vn,
								'box_no'=>$key->box_no,
								'box_seq'=>$i,
								'total_box'=>$key->total_box,
								'material_cons'=>$key->material_cons,
								'weight_part_min'=>$key->weight_part_min,
								'weight_part_std'=>$key->weight_part_std,
								'weight_part_max'=>$key->weight_part_max,
								'weight_box_min'=>$key->weight_box_min,
								'weight_box_std'=>$key->weight_box_std,
								'weight_box_max'=>$key->weight_box_max,
								'weight_case'=>$key->weight_case,
								'temp_cont'=>$pattern['cont']->temp_cont,
								'baris'=>$pattern['cont']->baris,
								'stacking'=>$pattern['cont']->stacking,
								'vanning_order'=>$pattern['cont']->vanning_order,
								'lot_no'=>$query['plan']->lot_no,
								'shipment_no'=>$query['plan']->shipment_no,
								'carrier'=>$query['plan']->carrier,
								'pc_no'=>$query['plan']->pc_no,
								'model_name'=>$query['plan']->model_name,
								'prod_month'=>$query['plan']->prod_month,
								'stuffing_date'=>$query['plan']->stuffing_date,
								'etd'=>$query['plan']->etd,
								'eta'=>$query['plan']->eta,
								"qrcase"=>$qrcase,
								"qrbox"=>$qrbox,
								"qrpart"=>$qrpart,
								"rec_status"=>"OPEN",
				            );
					       $this->db->insert('tbl_history_vanning', $data1);   
					       $data['status'] = true;
				       } 
					}
					$this->db->query("UPDATE tbl_planning set generate_date=now() WHERE id='".$id."'");
		        	
		    		
			        }else{
			        	$data['msg'] = "Lot ".$query['plan']->lot_no." Sudah Generate";
			        }
        	}
         
    	}
		echo json_encode($data);
    }
	function createlotvanning(){
        $table = $this->input->post('table');
        $data = array ('success' => false, 'messages' => array()); 
        $modelarray=$this->input->post('model'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $model_type=$datam[1];
        $country=$datam[2];
		$this->form_validation->set_rules('model', 'Model', 'trim|required');
		$this->form_validation->set_rules('shipment_no', 'Shipment No', 'trim|required');
		$this->form_validation->set_rules('pc_no', 'PC No', 'trim|required');
		$this->form_validation->set_rules('lot_no', 'Lot No', 'trim|required|is_natural_no_zero|callback_ceklot');
		$this->form_validation->set_rules('model_name', 'Model Name', 'trim|required');
		$this->form_validation->set_rules('carrier', 'Carrier', 'trim|required');
		$this->form_validation->set_rules('prod_month', 'Prod Month', 'trim|required');
		$this->form_validation->set_rules('stuffing_date', 'Stuffing Date', 'trim|required');
		$this->form_validation->set_rules('etd', 'ETD', 'trim|required');
		$this->form_validation->set_rules('eta', 'ETA', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

		if($this->form_validation->run()){
			$this->db->truncate($table);
			$lot_no=$this->input->post('lot_no');
			$shipment_no=$this->input->post('shipment_no');
			$query=$this->db->query("SELECT * from tbl_master_vanning WHERE model = '".$model."' and model_type = '".$model_type."' and country = '".$country."'")->result();
			$pattern['lot']=$this->db->query("SELECT temp_lot from tbl_master_patterncontainer WHERE model = '".$model."' and  country = '".$country."' and status='OPEN' group by model,country,temp_lot order by temp_lot asc limit 1")->row();
			if(!empty($pattern['lot'])){
				$temp_lot=$pattern['lot']->temp_lot;
				$this->db->query("UPDATE tbl_master_patterncontainer set status='ACTIVE' WHERE model = '".$model."' and  country = '".$country."' and temp_lot= '".$temp_lot."'");
			}else{
				$temp_lot=1;
				$this->db->query("UPDATE tbl_master_patterncontainer set status='OPEN' WHERE model = '".$model."' and  country = '".$country."' and temp_lot> '".$temp_lot."'");
			}
			foreach ($query as $key) {
				for($i=1;$i<=$key->total_box;$i++){
					$qrcase=$key->model."|".$lot_no."|".$key->case_no."|".gmdate('dmy',time()+60*60*7);
					$qrbox=$key->model."|".$lot_no."|".$key->case_no."|".$key->box_no."|".$i."|".gmdate('dmy',time()+60*60*7);
					$qrpart=$key->model."|".$lot_no."|".$key->case_no."|".$key->box_no."|".$i."|".$key->part_no."|".gmdate('dmy',time()+60*60*7);
					$pattern['cont']=$this->db->query("SELECT * from tbl_master_patterncontainer WHERE model = '".$model."' and  country = '".$country."' and temp_lot= '".$temp_lot."' and  case_no= '".$key->case_no."' limit 1")->row();
					 $data1 = array( 
					 	"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),           
		                'country'=>$key->country,
						'customer'=>$key->customer,
						'destinasi'=>$key->destinasi,
						'model'=>$key->model,
						'model_type'=>$key->model_type,
						'case_no'=>$key->case_no,
						'layer_no'=>$key->layer_no,
						'case_type'=>$key->case_type,
						'case_cat'=>$key->case_cat,
						'lane_no'=>$key->lane_no,
						'category'=>$key->category,
						'part_no'=>$key->part_no,
						'part_name'=>$key->part_name,
						'qty_vn'=>$key->qty_vn,
						'box_no'=>$key->box_no,
						'box_seq'=>$i,
						'total_box'=>$key->total_box,
						'material_cons'=>$key->material_cons,
						'weight_part_min'=>$key->weight_part_min,
						'weight_part_std'=>$key->weight_part_std,
						'weight_part_max'=>$key->weight_part_max,
						'weight_box_min'=>$key->weight_box_min,
						'weight_box_std'=>$key->weight_box_std,
						'weight_box_max'=>$key->weight_box_max,
						'weight_case'=>$key->weight_case,
						'temp_cont'=>$pattern['cont']->temp_cont,
						'baris'=>$pattern['cont']->baris,
						'stacking'=>$pattern['cont']->stacking,
						'vanning_order'=>$pattern['cont']->vanning_order,
						'lot_no'=>$lot_no,
						'shipment_no'=>$this->input->post('shipment_no'),
						'carrier'=>$this->input->post('carrier'),
						'pc_no'=>$this->input->post('pc_no'),
						'model_name'=>$this->input->post('model_name'),
						'prod_month'=>$this->input->post('prod_month'),
						'stuffing_date'=>$this->input->post('stuffing_date'),
						'etd'=>$this->input->post('etd'),
						'eta'=>$this->input->post('eta'),
						"qrcase"=>$qrcase,
						"qrbox"=>$qrbox,
						"qrpart"=>$qrpart,
						"rec_status"=>"OPEN",
		            );
			       $this->db->insert($table, $data1);   
		       } 
			}
			
			$data['success'] = true;
		} else {
			foreach ($_POST as $key => $value) {
			 	$data['messages'][$key] = form_error($key);
			}			

		}
		echo json_encode($data);	
    }
     public function ceklot(){
     	$modelarray=$this->input->post('model'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $model_type=$datam[1];
        $country=$datam[2];
     	$lot_no=$this->input->post('lot_no');
    	$query=$this->db->query("SELECT lot_no from tbl_history_vanning WHERE model = '".$model."' AND country = '".$country."' AND lot_no = '".$lot_no."' limit 1")->result();
    	$query1['lot']=$this->db->query("SELECT lot_no from tbl_history_vanning WHERE model = '".$model."' AND country = '".$country."' order by lot_no desc limit 1")->row();

        if(empty($query)){
        	if(empty($query1['lot'])){
        		return TRUE;
        	}else{
        		$lot_no1=intval($query1['lot']->lot_no)+1;
        		$lot_no2=intval($lot_no);
        		if($lot_no2!=$lot_no1){
        			$this->form_validation->set_message('ceklot', 'No Lot Salah!');
            		return FALSE;
        		}else{
        			return TRUE;
        		}
        	}
        	
        }else{
        	$this->form_validation->set_message('ceklot', 'No Lot Sudah di Pakai!');
            return FALSE;
        } 
    }
    function viewlot(){
    	$data = array ('lot_no' => false,);  
    	$modelarray=$this->input->post('model'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $model_type=$datam[1];
        $country=$datam[2];
    	$query1['lot']=$this->db->query("SELECT lot_no from tbl_history_vanning WHERE model = '".$model."' AND country = '".$country."' order by lot_no desc limit 1")->row();
    	if(!empty($query1['lot'])){
    		$lot_no=$query1['lot']->lot_no+1;
    	}else{
    		$lot_no=1;
    	}
    	$data['lot_no'] = $lot_no;
    	echo json_encode($data);
    }
    function fixvanning(){
        $data = array ('success' => false); 
        $cek=$this->db->get('tbl_temp_vanning')->result();
        if(!empty($cek)){
        	$this->db->query("INSERT INTO tbl_history_vanning(create_date,country,customer,destinasi,model,model_type,case_no,layer_no,case_type,case_cat,lane_no,category,part_no,part_name,qty_vn,box_no,box_seq,total_box,material_cons,weight_part_min,weight_part_std,weight_part_max,weight_box_min,weight_box_std,weight_box_max,weight_case,temp_cont,baris,stacking,vanning_order,lot_no,shipment_no,carrier,pc_no,model_name,prod_month,stuffing_date,etd,eta,qrcase,qrbox,qrpart,rec_status) SELECT create_date,country,customer,destinasi,model,model_type,case_no,layer_no,case_type,case_cat,lane_no,category,part_no,part_name,qty_vn,box_no,box_seq,total_box,material_cons,weight_part_min,weight_part_std,weight_part_max,weight_box_min,weight_box_std,weight_box_max,weight_case,temp_cont,baris,stacking,vanning_order,lot_no,shipment_no,carrier,pc_no,model_name,prod_month,stuffing_date,etd,eta,qrcase,qrbox,qrpart,rec_status FROM tbl_temp_vanning");
			$this->db->truncate("tbl_temp_vanning");
			$data['success'] = true;
        }					

		echo json_encode($data);	
    }
    function inputcontainer(){
        $table = $this->input->post('table');
        $data = array ('success' => false, 'messages' => array());  
        $this->form_validation->set_rules('lot_no', 'Lot No', 'trim|required');               
		$this->form_validation->set_rules('cont_size', 'Cont Size', 'trim|required');
		$this->form_validation->set_rules('cont_no', 'Cont No', 'trim|required');
		$this->form_validation->set_rules('seal_no', 'Seal No', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');
		$modelarray=$this->input->post('lot_no'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $model_type=$datam[1];
        $country=$datam[2];
        $shipment_no=$datam[3];
        $temp_cont=$datam[4];
		if($this->form_validation->run()){			
			 $data1 = array(          
				"cont_size"=>$this->input->post('cont_size'),
				"cont_no"=>$this->input->post('cont_no'),
				"seal_no"=>$this->input->post('seal_no'),
				"cont_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),  
              );
	       $this->db->update($table, $data1,array('model'=>$model,'country'=>$country,'shipment_no'=>$shipment_no,'temp_cont'=>$temp_cont));   
		     
			$data['success'] = true;
		} else {
			foreach ($_POST as $key => $value) {
			 	$data['messages'][$key] = form_error($key);
			}			

		}
		echo json_encode($data);	
    }
    public function cekcont(){
     	$modelarray=$this->input->post('lot_no'); 
        $datam=explode('|', $modelarray); 
        $model=$datam[0];
        $model_type=$datam[1];
        $country=$datam[2];
        $lot_no=$datam[3];
     	$cont_no=$this->input->post('cont_no');
    	$query=$this->db->query("SELECT lot_no from tbl_history_vanning WHERE model = '".$model."' AND country = '".$country."'  and lot_no = '".$lot_no."' and cont_no = '".$cont_no."'")->result();
    	$query1=$this->db->query("SELECT lot_no from tbl_history_vanning WHERE cont_no = '".$cont_no."' and finish_date is null")->result();
        if(!empty($query)){      	
        	return TRUE;
        }elseif(empty($query1)){
        	return TRUE;
        }else{
        	$this->form_validation->set_message('cekcont', 'Container '.$cont_no.' Sedang di Pakai!');
            return FALSE;
        } 
    }
    
}
