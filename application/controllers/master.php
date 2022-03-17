<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class Master extends CI_Controller{
	public $user_level;
	public $user_group;
	public $user_area;
	public $nama;
	function __construct(){
        parent::__construct();
        $this->load->library('user_agent');
        $cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
		$data1['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
		$this->user_level=$data1['user']->user_level;
		$this->user_group=$data1['user']->user_group;
		$this->user_area=$data1['user']->user_area;
		$this->nama=$data1['user']->nama;
		$this->username=$data1['user']->username;
		$this->shop=$data1['user']->shop;
		$this->shift=$data1['user']->shift;
		// if($this->user_group!='Admin'){	
		// 	redirect('action/logout');
		// }
    }


    //==================== load view =====================
	function data(){	
			$link1=$this->input->post('table');
			$link=explode('-',$link1);
			$table=$link[0];
			$add_level=$link[1];
			$edit_level=$link[2];
			$delete_level=$link[3];
			$url=$this->input->post('url');
			$nav=$this->input->post('nav');
			
			$data_field=$this->db->field_data($table);
			$data=array(
			 'nav'=>$nav,
			 'table'=>$table,
			 'link'=>$link1,
			 'url'=>$url,
			 'add_level'=>$add_level,
			 'edit_level'=>$edit_level,
			 'delete_level'=>$delete_level,
			 'otorisasi'=>$this->input->post('otorisasi'),
			 'data_field'=>$data_field,
			 'data_user_level'=>$this->user_level,
			 'shop'=>$this->shop,
			);
			$this->load->view('content/master',$data);
	}
	function transaction(){	
			$link1=$this->input->post('table');
			$link=explode('-',$link1);
			$table=$link[0];
			$add_level=$link[1];	
			$edit_level=$link[2];
			$delete_level=$link[3];
			$url=$this->input->post('url');
			$nav=$this->input->post('nav');
			
			$data_field=$this->db->field_data($table);
			$data=array(
			 'nav'=>$nav,
			 'table'=>$table,
			 'link'=>$link1,
			 'url'=>$url,
			 'add_level'=>$add_level,
			 'edit_level'=>$edit_level,
			 'delete_level'=>$delete_level,
			 'otorisasi'=>$this->input->post('otorisasi'),
			 'data_field'=>$data_field,
			 'data_user_level'=>$this->user_level,
			 'shop'=>$this->shop,
			);
		
			$this->load->view('content/transaction',$data);
	}
	function dataexcel(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$table=$this->input->post('table1');
		$query=$this->db->field_data($table);
	    foreach($query as $row){ 
	    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
	    		$field[] = $row->name; 
	    	}
	    	$column_order[] = $row->name; 
	    }
		$count = count($field)-1;
		foreach($query as $row){ 
			    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						{
							$this->db->where($row->name, $this->input->post($row->name));
						}
					}
				}
				$this->db->order_by('id','desc');
				$this->db->limit(300000);
		$query1=$this->db->get($table);
		$data=array(
		'table'=>$table,
		'data_table'=>$query1->result_array(),
		'data_field'=>$this->db->field_data($table),
		'shop'=>$this->shop,
		);
		$this->load->view('content/dataexcel',$data);
	}
	function otorisasi(){	
			$link1=$this->input->post('table');
			$link=explode('-',$link1);
			$table=$link[0];
			$add_level=$link[1];
			$edit_level=$link[2];
			$delete_level=$link[3];
			$url=$this->input->post('url');
			$nav=$this->input->post('nav');
			$data=array(
			 'nav'=>$nav,
			 'table'=>$table,
			 'link'=>$link1,
			 'url'=>$url,
			 'add_level'=>$add_level,
			 'edit_level'=>$edit_level,
			 'delete_level'=>$delete_level,
			 'jumlah_level'=>$this->db->get_where('tbl_level',array('user_group'=>'Admin'))->num_rows(),
			 'otorisasi'=>$this->input->post('otorisasi'),
			 'data_user_level'=>$this->user_level,
			 'data_level'=>$this->db->query("select * from tbl_level where user_group='Admin' order by user_level asc")->result(),
			 'data_menu'=>$this->db->query('select a.id,a.menuid,a.parent,a.tabel,a.nav,b.user_level,b.view_level,b.add_level,b.edit_level,
			 b.delete_level from tbl_menu a INNER JOIN tbl_menu_user b on(a.menuid=b.menuid) order by a.orders,a.mother asc')->result(),
			 'shop'=>$this->shop,
			);	
			$this->load->view('content/otorisasi',$data);
	}
    //==================== get data =====================
	function get_data(){
			ini_set('memory_limit','1024M');
			set_time_limit(12000);
			$table=$this->input->post('table');
			$edit_level=$this->input->post('edit_level');
			$delete_level=$this->input->post('delete_level');
			$query=$this->db->field_data($table);
		    foreach($query as $row){ 
		    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
		    		$field[] = $row->name; 
		    	}
		    	$column_order[] = $row->name; 
		    }
			$count = count($field)-1;

			/*Menagkap semua data yang dikirimkan oleh client*/

			/*Sebagai token yang yang dikrimkan oleh client, dan nantinya akan
			server kirimkan balik. Gunanya untuk memastikan bahwa user mengklik paging
			sesuai dengan urutan yang sebenarnya */
			$draw=$_POST['draw'];
			/*Jumlah baris yang akan ditampilkan pada setiap page*/
			$length=$_POST['length'];

			/*Offset yang akan digunakan untuk memberitahu database
			dari baris mana data yang harus ditampilkan untuk masing masing page
			*/
			$start=$_POST['start'];

			/*Keyword yang diketikan oleh user pada field pencarian*/
			$search=trim($_POST['search']["value"]);
			$searchByName = trim($_POST['searchByName']["value"]);
			if($table=="tbl_input_general" or $table=="tbl_input_ppc" and $this->user_level!='Administrator'){
				$this->db->where('create_by',$this->nama);
				$this->db->order_by('create_date','DESC');
			}

			/*Menghitung total row didalam database*/
			$total=$this->db->count_all_results($table);
			if($this->input->post('filter')){
			 	//$total=$this->db->get_where($table,array('supplier'=>'TATO'))->num_rows();
			 	foreach($query as $row){ 
		    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						 {
							$this->db->where($row->name,$this->input->post($row->name));
						 }
						}
					}
					$total=$this->db->get($table)->num_rows();
			} 
			/*Mempersiapkan array tempat kita akan menampung semua data
			yang nantinya akan server kirimkan ke client*/
			$output=array();

			/*Token yang dikrimkan client, akan dikirim balik ke client*/
			$output['draw']=$draw;

			/*
			$output['recordsTotal'] adalah total data sebelum difilter
			$output['recordsFiltered'] adalah total data ketika difilter
			Biasanya kedua duanya bernilai sama, maka kita assignment 
			keduaduanya dengan nilai dari $total
			*/
			$output['recordsTotal']=$output['recordsFiltered']=$total;

			/*disini nantinya akan memuat data yang akan kita tampilkan 
			pada table client*/
			$output['data']=array();


			/*Jika $search mengandung nilai, berarti user sedang telah 
			memasukan keyword didalam filed pencarian*/
			if($this->input->post('filter')){
				foreach($query as $row){ 
			    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						{
							$this->db->where($row->name, $this->input->post($row->name));
						}
					}
				}

			}
			if($search!=""){				
				$this->db->like($field[0],$search);
				for($i=1; $i<=$count; $i++) {
					 $this->db->or_like($field[$i], $search);
					}
			  

			}
			if($table=="tbl_input_general" or $table=="tbl_input_ppc" and $this->user_level!='Administrator'){
				$this->db->where('create_by',$this->nama);
				$this->db->order_by('create_date','DESC');
			}
			if($table=="tbl_user" and $this->user_level!='Administrator'){
				$this->db->where('user_area',$this->user_area);
			}		
			
			/*Lanjutkan pencarian ke database*/
			$this->db->limit($length,$start);
			/*Urutkan dari alphabet paling terkahir*/
			if(isset($_POST['order'])) // here order processing
			{
				$this->db->order_by($column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
			} 
			elseif(isset($this->order))
			{
				$order = $this->order;
				$this->db->order_by(key($order), $order[key($order)]);
			}
			//$this->db->order_by('id','ASC');
			if($this->input->post('filter')){
				foreach($query as $row){ 
			    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						{
							$this->db->where($row->name, $this->input->post($row->name));
						}
					}
				}
			}
			$query1=$this->db->get($table);

			/*Ketika dalam mode pencarian, berarti kita harus
			'recordsTotal' dan 'recordsFiltered' sesuai dengan jumlah baris
			yang mengandung keyword tertentu
			*/
			if($search!=""){
				$this->db->like($field[0],$search);
				for($i=1; $i<=$count; $i++) {
					 $this->db->or_like($field[$i], $search);
					}

				 
			$jum=$this->db->get($table);
			$output['recordsTotal']=$output['recordsFiltered']=$jum->num_rows();
			}


			$nomor_urut=$start+1;
			$table1="'$table'";
			$y=1;
			foreach ($query1->result_array() as $desa) {
				$id=$desa['id'];
				$delete='<label onclick="return delete_json('.$id.','.$table1.')" title="delete" class="badge bg-red"><i class="fa fa-trash"></i></label>';
				
					$view='<label onclick="return view_json('.$id.','.$table1.')" title="view" class="badge bg-teal"><i class="fa fa-eye open"></i></label>';
				if($delete_level=="no"){
					$delete='';
				}
				$edit='<label onclick="return edit('.$id.','.$table1.')" title="edit" class="badge bg-yellow"><i class="fa fa-edit"></i></label>';
				if($edit_level=="no"){
					$edit='';
				}
				
				$link=$view.' '.$edit.' '.$delete;
				if($table=='tbl_user'){
					$username=$desa['username'];
					$username="'$username'";
					$password=$desa['password'];
					$password="'$password'"; 
					$print='<label onclick="return print_idcard('.$id.')" title="print idcard" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$kill='<label onclick="return clear_json('.$password.')" title="clear session" class="badge bg-red"><i class="fa  fa-user-times"></i></label>';
					$reset='<label onclick="return reset_json('.$id.','.$username.')" title="reset password" class="badge bg-green"><i class="fa fa-unlock"></i></label>';
					$link=$print.' '.$kill.' '.$reset.' '.$link;
				}
				
				if($table=='tbl_master_pallet'){
					$print='<label onclick="return print_pallet('.$id.','.$table1.')" title="print label" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
				}
				if($table=='tbl_master_kanban'){
					$print='<label onclick="return print_kanban('.$id.','.$table1.')" title="print kanban" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
				}
				if($table=='tbl_master_rak'){
					$print='<label onclick="return print_rak_in('.$id.','.$table1.')" title="print rack in" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
					$print='<label onclick="return print_rak_out('.$id.','.$table1.')" title="print rack out" class="badge bg-red"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
				}
				if($delete_level=="yes" or $edit_level=="yes"){
				$a=array($link);
				}else{
				$a=array($link);
				}
				for($i=0; $i<=$count; $i++) {
					//if($field[$i]=="takt_time"){$desa[$field[$i]]=round($desa[$field[$i]]/60,1);}
					//if($field[$i]=="allowance_time"){$desa[$field[$i]]=round($desa[$field[$i]]/60,1);}
				$b[$i]=array($desa[$field[$i]]);
				}
					if($delete_level=="yes" or $edit_level=="yes"){
					$output['data'][]=array_merge($a,$b);
					}else{
					$output['data'][]=array_merge($a,$b);	
					}
				
				$nomor_urut++;
				$y++;
			}
			echo json_encode($output);

	}
	function get_data_transaction(){
			ini_set('memory_limit','1024M');
			set_time_limit(12000);
			$table=$this->input->post('table');
			$edit_level=$this->input->post('edit_level');
			$delete_level=$this->input->post('delete_level');
			$query=$this->db->field_data($table);
		    foreach($query as $row){ 
		    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
		    		$field[] = $row->name; 
		    	}
		    	$column_order[] = $row->name; 
		    }
			$count = count($field)-1;

			/*Menagkap semua data yang dikirimkan oleh client*/

			/*Sebagai token yang yang dikrimkan oleh client, dan nantinya akan
			server kirimkan balik. Gunanya untuk memastikan bahwa user mengklik paging
			sesuai dengan urutan yang sebenarnya */
			$draw=$_POST['draw'];
			/*Jumlah baris yang akan ditampilkan pada setiap page*/
			$length=$_POST['length'];

			/*Offset yang akan digunakan untuk memberitahu database
			dari baris mana data yang harus ditampilkan untuk masing masing page
			*/
			$start=$_POST['start'];

			/*Keyword yang diketikan oleh user pada field pencarian*/
			$search=trim($_POST['search']["value"]);
			$searchByName = trim($_POST['searchByName']["value"]);

			/*Menghitung total row didalam database*/
			$total=$this->db->count_all_results($table);
			if($this->input->post('filter')){
			 	//$total=$this->db->get_where($table,array('supplier'=>'TATO'))->num_rows();
			 	foreach($query as $row){ 
		    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						 {
							$this->db->where($row->name,$this->input->post($row->name));
						 }
						}
					}
					$total=$this->db->get($table)->num_rows();
			} 
			/*Mempersiapkan array tempat kita akan menampung semua data
			yang nantinya akan server kirimkan ke client*/
			$output=array();
			
			/*Token yang dikrimkan client, akan dikirim balik ke client*/
			$output['draw']=$draw;
			
			/*
			$output['recordsTotal'] adalah total data sebelum difilter
			$output['recordsFiltered'] adalah total data ketika difilter
			Biasanya kedua duanya bernilai sama, maka kita assignment 
			keduaduanya dengan nilai dari $total
			*/
			$output['recordsTotal']=$output['recordsFiltered']=$total;

			/*disini nantinya akan memuat data yang akan kita tampilkan 
			pada table client*/
			$output['data']=array();

			/*Jika $search mengandung nilai, berarti user sedang telah 
			memasukan keyword didalam filed pencarian*/
			if($this->input->post('filter')){
				foreach($query as $row){ 
			    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						{
							$this->db->where($row->name, $this->input->post($row->name));
						}
					}
				}

			}
			if($search!=""){				
				$this->db->like($field[0],$search);
				for($i=1; $i<=$count; $i++) {
					 $this->db->or_like($field[$i], $search);
					}
			  

			}
			if($table=="tbl_user" and $this->user_level!='Administrator'){
				$this->db->where('user_area',$this->user_area);
			}
			
			/*Lanjutkan pencarian ke database*/
			$this->db->limit($length,$start);
			/*Urutkan dari alphabet paling terkahir*/
			if(isset($_POST['order'])) // here order processing
			{
				$this->db->order_by($column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
			} 
			elseif(isset($this->order))
			{
				$order = $this->order;
				$this->db->order_by(key($order), $order[key($order)]);
			}
			//$this->db->order_by('id','ASC');
			if($this->input->post('filter')){
				foreach($query as $row){ 
			    	if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
					if($this->input->post($row->name))
						{
							$this->db->where($row->name, $this->input->post($row->name));
						}
					}
				}
			}
			$query1=$this->db->get($table);

			/*Ketika dalam mode pencarian, berarti kita harus
			'recordsTotal' dan 'recordsFiltered' sesuai dengan jumlah baris
			yang mengandung keyword tertentu
			*/
			if($search!=""){
				$this->db->like($field[0],$search);
				for($i=1; $i<=$count; $i++) {
					 $this->db->or_like($field[$i], $search);
					}

				 
			$jum=$this->db->get($table);
			$output['recordsTotal']=$output['recordsFiltered']=$jum->num_rows();
			}


			$nomor_urut=$start+1;
			$table1="'$table'";
			$y=1;
			foreach ($query1->result_array() as $desa) {
				$id=$desa['id'];
				$delete='<label onclick="return delete_json('.$id.','.$table1.')" title="delete" class="badge bg-red"><i class="fa fa-trash"></i></label>';
				if($delete_level=="no"){
					$delete='';
				}
				$view='<label onclick="return view_json('.$id.','.$table1.')" title="view" class="badge bg-teal"><i class="fa fa-eye open"></i></label>';
				$edit='<label onclick="return edit('.$id.','.$table1.')" title="edit" class="badge bg-yellow"><i class="fa fa-edit"></i></label>';
				if($edit_level=="no"){
					$edit='';
				}
				
				$link=$view.' '.$edit.' '.$delete;
				
				if($table=='tbl_history_vanning'){
					$print='<label onclick="return print_case('.$id.','.$table1.')" title="print label case" class="badge bg-orange"><i class="fa fa-print"></i></label>';
					$print1='<label onclick="return print_group('.$id.','.$table1.')" title="print label box" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$print2='<label onclick="return print_part1('.$id.','.$table1.')" title="print label part" class="badge bg-green"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$print1.' '.$print2.' '.$link;
				}
				if($table=='tbl_history_receiving'){
					$print='<label onclick="return print_part('.$id.','.$table1.')" title="print label part" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
				}
				if($table=='tbl_history_material'){
					$print='<label onclick="return print_material('.$id.','.$table1.')" title="print label material" class="badge bg-blue"><i class="fa fa-print"></i></label>';
					$link=$print.' '.$link;
				}
				if($table=='tbl_planning'){
					$generatelot='<label onclick="return generatelot('.$id.')" title="Generate Lot" class="badge bg-green">G</label>';
					$link=$generatelot.' '.$link;
				}
				
				
				$a=array($link);
				for($i=0; $i<=$count; $i++) {
					//if($field[$i]=="takt_time"){$desa[$field[$i]]=round($desa[$field[$i]]/60,1);}
					//if($field[$i]=="allowance_time"){$desa[$field[$i]]=round($desa[$field[$i]]/60,1);}
				$b[$i]=array($desa[$field[$i]]);
				}
					if($delete_level=="yes" or $edit_level=="yes"){
					$output['data'][]=array_merge($a,$b);
					}else{
					$output['data'][]=array_merge($a,$b);	
					}
				
				$nomor_urut++;
				$y++;
			}
			echo json_encode($output);

	}

//==================== OTORISASI=====================
function viewcheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');

		$this->db->query("UPDATE tbl_menu_user SET view_level='yes' WHERE menuid='".$menuid."' and user_level='".$user_level."'");
		echo '<i class="fa fa-check-square text-green"></i>';

    } 
function viewuncheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');
    	$this->db->query("UPDATE tbl_menu_user SET view_level='no' WHERE menuid='".$menuid."' and user_level='".$user_level."'");  	
		echo '<i class="fa fa-close text-red"></i>';
    }
function addcheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');

		$this->db->query("UPDATE tbl_menu_user SET add_level='yes' WHERE menuid='".$menuid."' and user_level='".$user_level."'");
		echo '<i class="fa fa-check-square text-green"></i>';

    } 
 function adduncheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');
    	$this->db->query("UPDATE tbl_menu_user SET add_level='no' WHERE menuid='".$menuid."' and user_level='".$user_level."'");  	
		echo '<i class="fa fa-close text-red"></i>';
    }
function editcheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');

		$this->db->query("UPDATE tbl_menu_user SET edit_level='yes' WHERE menuid='".$menuid."' and user_level='".$user_level."'");
		echo '<i class="fa fa-check-square text-green"></i>';

    } 
 function edituncheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');
    	$this->db->query("UPDATE tbl_menu_user SET edit_level='no' WHERE menuid='".$menuid."' and user_level='".$user_level."'");  	
		echo '<i class="fa fa-close text-red"></i>';
    }
function deletecheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');

		$this->db->query("UPDATE tbl_menu_user SET delete_level='yes' WHERE menuid='".$menuid."' and user_level='".$user_level."'");
		echo '<i class="fa fa-check-square text-green"></i>';

    } 
 function deleteuncheck(){
    	$menuid = $this->input->post('menuid');
    	$user_level = $this->input->post('user_level');
    	$this->db->query("UPDATE tbl_menu_user SET delete_level='no' WHERE menuid='".$menuid."' and user_level='".$user_level."'");  	
		echo '<i class="fa fa-close text-red"></i>';
    }  	
//==================== RESET PWD to USERNAME=====================	
function reset(){
    	$id = $this->input->post('id');
    	$username = $this->input->post('username');
		$password = $this->encrypt->sha1($username);
		$password = strrev($password);$password=substr($password,5);

    	$this->db->query("UPDATE tbl_user SET password='".$password."' WHERE id='".$id."'");
    }
 function clear(){
    	$password = $this->input->post('password');

    	$this->db->query("DELETE from ci_sessions WHERE user_data LIKE '%".$password."%'");
    }
	// ======================== upload =======================
	function checkupload(){
			$table= $this->input->post('table');
			$this->db->query("DELETE FROM tbl_upload WHERE  tbl_name='".$table."'");
			$data=array(
			'table'=>$table,
			'total_before'=>$this->db->get($table)->num_rows(),
			);		
	  $this->load->view('content/upload/upload',$data);
	}
	function statusupload(){
			$table= $this->input->post('table');
			$query = $this->db->get_where('tbl_upload',array('tbl_name' => $table))->result();
			foreach ($query as $key) {
					$total=$key->total;
					$progress=$key->progress;
					$success=$key->success;
				}
			$failed=$total-$success;		
			$persen=round($progress/$total,2) * 100;
			echo json_encode(array('persen'=>$persen,'total'=>$total,'success'=>$success,'failed'=>$failed));
	}

	public function generate_patan()
	{		
							date_default_timezone_set('Asia/Jakarta');
							// $nowtime = date('Y-m-d H:i:s');	
							// echo $nowtime;	
		$nowtime = date('Y-m-d H:i:s');		
		$start = date('Y-m-d').' 07:15:00';
		$end = date('Y-m-d').' 20:30:00';		

		$now = date('Y-m-d');
		$past = date('Y-m-d',strtotime($now . "-1 days"));
		$query = "";

		if($start <= $nowtime && $nowtime <= $end) {
			$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
		}else{
			$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$past' AND `shift` = 'N'";							
		}
		echo $this->db->query("$query")->row()->patan;
	}
//    ========================== UPLOAD =======================
    function upload(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$this->load->library('PHPExcel');
		$table = $this->input->post('table');
		$fileName = $table.time() . $_FILES['fileimport']['name'];                     
		$config['upload_path'] = './fileExcel/';                               
		$config['file_name'] = $fileName;
		$config['allowed_types'] = 'xls|xlsx|csv';
		$config['max_size'] = 10000;

		$this->upload->initialize($config);
		// $namafile=explode('.',$_FILES['fileimport']['name']);
		// $namafile1=explode('-',$namafile[0]);
		// $namafile2=$namafile1[0];
		if (!$this->upload->do_upload('fileimport')){
			$this->db->query("DELETE FROM tbl_upload WHERE  tbl_name='".$table."'");
			$status = "error";
			$msg = strip_tags($this->upload->display_errors());
			if($msg==''){
				$msg='Error file name, Plase change name file to '.$namafile2.' !';
			}
			echo json_encode(array('status'=>$status,'msg'=>$msg));
		}else{
		$media = $this->upload->data('fileimport');
		$inputFileName = './fileExcel/' . $media['file_name'];

		try {
			$inputFileType = PHPExcel_IOFactory::identify($inputFileName);
			$objReader = PHPExcel_IOFactory::createReader($inputFileType);
			$objPHPExcel = $objReader->load($inputFileName);
		} catch (Exception $e) {
			die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
		}

		$sheet = $objPHPExcel->getSheet(0);
		$highestRow = $sheet->getHighestRow();
		$highestColumn = $sheet->getHighestColumn();
		$baris = $objPHPExcel->setACTIVESheetIndex(0)->getHighestRow()-1;
		$this->db->query("DELETE FROM tbl_upload WHERE  tbl_name='".$table."'");
		$datainsert=array(
					'tbl_name'=>$table,
					'total'=>$baris,
					'progress'=>0,
					'success'=>0,
				);
		$this->db->insert('tbl_upload',$datainsert);		
		
				if($table=='tbl_user'){
					$i=1;
					for ($row = 2; $row <= $highestRow; $row++) {
					// Read a row of data into an array                 
						$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
						$password = $rowData[0][3];
						$password = $this->encrypt->sha1($password);
						$password = strrev($password);$password=substr($password,5);
						$data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
							"nama" => $rowData[0][1],
							"username" => $rowData[0][2],
							"password" => $password,
							"level" => $rowData[0][4],
						);
						$cek=$this->db->query("select * from tbl_user where username='".$rowData[0][2]."' and password='".$password."'")->result();
						if(empty($cek)){
						$insert = $this->db->insert($table, $data1);                   // Sesuaikan nama dengan nama tabel untuk melakukan insert data
												// menghapus semua file .xls yang diupload
						$no=$no+1;
						$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
						}
						$i=$i+1;
						delete_files($media['file_path']);   
					}
				}elseif($table=='tbl_menu'){
					$i=1;
					for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
						$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
					$data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
							"menuid"=>$rowData[0][1],
							"mother"=>$rowData[0][2],
							"parent"=>$rowData[0][3],
							"icon"=>$rowData[0][4],
							"nav"=>$rowData[0][5],
							"url"=>$rowData[0][6],
							"tabel" =>$rowData[0][7],
							"orders"=>$rowData[0][8],
						);
					$this->db->query("DELETE from tbl_menu where menuid='".$rowData[0][1]."'");
					// Sesuaikan nama dengan nama tabel untuk melakukan insert data
					$this->db->insert($table, $data1);                   

							$no=$no+1;
							$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
							$i=$i+1;
							delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
					}
				
				}elseif($table=='tbl_master_shop'){
						$i=1;
						for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
						$data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
							"shop_name"=>$rowData[0][1],
							"cost_center"=>$rowData[0][2],
							"gr_code"=>$rowData[0][3],
							);
							$this->db->insert($table, $data1);                    
								$no=$no+1;
								$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
								$i=$i+1;
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
						}
					}elseif($table=='tbl_input_ppc' || $table=='tbl_input_general'){
							date_default_timezone_set('Asia/Jakarta');
							$nowtime = date('Y-m-d H:i:s');	
																
							$start = date('Y-m-d').' 07:15:00';
							$end = date('Y-m-d').' 20:30:00';		
					
							$now = date('Y-m-d');
							$past = date('Y-m-d',strtotime($now . "-1 days"));
							$query = "";
					
							if($start <= $nowtime && $nowtime <= $end) {
								$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
							}else{
								if ($now.' 00:00:01' <= $nowtime && $nowtime <= $now.' 07:14:59') {
									$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$past' AND `shift` = 'N'";
								}else{
									$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";
								}
							}
							$patan =  $this->db->query("$query")->row()->patan;
							$i=1;
							$no=0;
						for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
							$master['id'] = $this->db->query("select * from tbl_master_part where job_no='".$rowData[0][1]."' limit 1")->row();
							if($master['id'] && (trim($rowData[0][2]) != ""||trim($rowData[0][3])!= ""||trim($rowData[0][4])!= ""||trim($rowData[0][5])!= "")){							
								$t_t = 465/$master['id']->maks_shift;
								$t_t = round($t_t,2);
								
								$data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
								"job_no"=>$rowData[0][1],
								"job_master"=>$master['id']->job_master,
								"part_no"=>$master['id']->part_no,
								"part_name"=>$master['id']->part_name,
								"maks_shift"=>$master['id']->maks_shift,
								"ps"=>$master['id']->patan,
								"patan"=>$patan,
								"t_t"=>$t_t,
								"shift"=>$this->shift,
								"shop_name"=>$this->shop,
								"sto_p1"=>$rowData[0][2],
								"sto_p4"=>$rowData[0][3],
								"sto_kap"=>$rowData[0][4],
								"sto_ppl"=>$rowData[0][5],
								"sto_process"=>$rowData[0][6],
								"ss_p1"=>number_format((($t_t*$rowData[0][2])/465)*8,1),
								"ss_p4"=>number_format((($t_t*$rowData[0][3])/465)*8,1),
								"ss_kap"=>number_format((($t_t*$rowData[0][4])/465)*8,1),
								"ss_ppl"=>number_format((($t_t*$rowData[0][5])/465)*8,1),
								"ss_process"=>number_format((($t_t*$rowData[0][6])/465)*8,1),
								"area"=>$master['id']->area,
								"proses"=>$master['id']->proses,
								"model"=>$master['id']->model,
								"machine"=>$master['id']->machine,
								"create_by"=>$this->nama,
								"create_date"=>$nowtime,
								);
								
									$found = $this->db->query("select * from $table where job_no='".$data1['job_no']."' AND patan = '".$data1['patan']."' AND DATE(`create_date`) = '$now'")->row();
									if($found && $table=="tbl_input_general"){	
										$ss = array(
										"sto_p1"=>$rowData[0][2],
										"sto_p4"=>$rowData[0][3],
										"sto_kap"=>$rowData[0][4],
										"sto_ppl"=>$rowData[0][5],
										"sto_process"=>$rowData[0][6],
										"ss_p1"=>number_format((($t_t*$rowData[0][2])/465)*8,1),
										"ss_p4"=>number_format((($t_t*$rowData[0][3])/465)*8,1),
										"ss_kap"=>number_format((($t_t*$rowData[0][4])/465)*8,1),
										"ss_ppl"=>number_format((($t_t*$rowData[0][5])/465)*8,1),
										"ss_process"=>number_format((($t_t*$rowData[0][6])/465)*8,1));
										$this->db->update($table,$ss,array('job_no' => $data1['job_no'], 'patan' => $data1['patan'], 'DATE(`create_date`)' => $now));																				
									}else{
										$this->db->insert($table,$data1); 
									}									
									$no=$no+1;																		
									delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
							}
							$this->db->update('tbl_upload',array('progress' => $i,'success' => $no),array('tbl_name' => $table));
							$i=$i+1;  																	
						}
					}elseif($table=='tbl_input_ppl'){
						$this->db->truncate('tbl_input_ppl_temp');
						date_default_timezone_set('Asia/Jakarta');
						$nowtime = date('Y-m-d H:i:s');	
															
						$start = date('Y-m-d').' 07:15:00';
						$end = date('Y-m-d').' 20:30:00';		
				
						$now = date('Y-m-d');
						$past = date('Y-m-d',strtotime($now . "-1 days"));
						$query = "";
				
						if($start <= $nowtime && $nowtime <= $end) {
							$query = "Select `shift`,`dates` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
						}else{
							if ($now.' 00:00:01' <= $nowtime && $nowtime <= $now.' 07:14:59') {
								$query = "Select `shift`,`dates` from `tbl_master_patan` Where `dates` = '$past' AND `shift` = 'N'";
							}else{
								$query = "Select `shift`,`dates` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";
							}
						}
						$shift =  $this->db->query("$query")->row()->shift;
						$dates = $this->db->query("$query")->row()->dates;
						
						$i=1;
						$no=0;
					for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
						$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
						$master['id'] = $this->db->query("select * from tbl_master_part_ppl where job_no='".$rowData[0][1]."' limit 1")->row();
						if($master['id'] && (trim($rowData[0][2]) != "")){							
							$plan_jam = $master['id']->prod_shift/8;
							$plan_jam = round($plan_jam,2);
							$ss = $rowData[0][2] + $rowData[0][3] + $rowData[0][4];
							// $ss = (($plan_jam*$ss)/465)*8;
							$ss = $ss/$plan_jam;
							if($shift=="D"){
								$t = date('H:i', strtotime('07:25')+(60*$ss*60));
								$x = "Day";
							}else{
								$t = date('H:i', strtotime('20:30')+(60*$ss*60));
								$x = "Night";
							}

							$data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
							"job_no"=>$rowData[0][1],
							"job_master"=>$master['id']->job_master,
							"part_no"=>$master['id']->part_no,
							"part_name"=>$master['id']->part_name,
							"part_category"=>$master['id']->part_category,
							"shop_name"=>$this->shop,
							"shift"=> $shift,
							"prod_shift"=>$master['id']->prod_shift,
							"plan_jam"=>$plan_jam,
							"sto_ppl"=>$rowData[0][2],
							"receive"=>$rowData[0][3],
							"otw"=>$rowData[0][4],
							"ss_ppl"=>number_format($rowData[0][2]/$plan_jam,1),
							"ss_r"=>number_format($rowData[0][3]/$plan_jam,1),
							"ss_otw"=>number_format($rowData[0][4]/$plan_jam,1),
							// "ss_otw"=>(($plan_jam*$rowData[0][4])/465)*8,
							"ss"=>number_format($ss,1),
							"area"=>$master['id']->area,
							"model"=>$master['id']->model,
							"vendor"=>$master['id']->vendor,
							"routing"=>$master['id']->routing,
							"jam"=>$t,
							"create_by"=>$this->nama,
							"create_date"=>$nowtime,
							);
									$this->db->insert('tbl_input_ppl_temp',$data1);
									$this->db->insert($table,$data1); 
																	
								$no=$no+1;																		
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
						}
						$this->db->update('tbl_upload',array('progress' => $i,'success' => $no),array('tbl_name' => $table));
						$i=$i+1;  																	
					}
				}elseif($table=='tbl_master_part'){
						$this->db->truncate($table);
						$i=1;
							$no=1;
							for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							   $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
							   
							   $data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
								"job_no"=>$rowData[0][1],
								"job_master"=>$rowData[0][2],
								"part_no"=>$rowData[0][3],
								"part_name"=>$rowData[0][4],
								"area"=>$rowData[0][5],
								"proses"=>$rowData[0][6],
								"pcs_month"=>$rowData[0][7],
								"maks_shift"=>$rowData[0][8],
								"machine"=>$rowData[0][9],
								"model"=>$rowData[0][10],
								"patan"=>$rowData[0][11],
								"routing"=>$rowData[0][12],
								"create_by"=>$this->nama,
								"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
			
								);
								$insert = $this->db->insert($table, $data1);                   // Sesuaikan nama dengan nama tabel untuk melakukan insert data
								$no=$no+1;
								$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
								$i=$i+1;
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
			
						}
					}elseif($table=='tbl_master_patan'){
						$this->db->truncate($table);
						
						$i=1;
							$no=1;
							for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							   $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
							     $dates=gmdate('Y-m-d',PHPExcel_Shared_Date::ExcelToPHP($rowData[0][1]));
							  
							   $data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
								"dates"=>$dates,
								"patan"=>$rowData[0][2],
								"shift"=>$rowData[0][3],
								);
							
								$insert = $this->db->insert($table, $data1);                   // Sesuaikan nama dengan nama tabel untuk melakukan insert data
								$no=$no+1;
								$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
								$i=$i+1;
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
			
						}
					}elseif($table=='tbl_master_qr'){
						$this->db->truncate($table);
						
						$i=1;
							$no=1;
							for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							   $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
							     $dates=gmdate('Y-m-d',PHPExcel_Shared_Date::ExcelToPHP($rowData[0][1]));
							  if($rowData[0][2]>0){
								$total = $rowData[0][2];
								for ($x=1; $x <= $total ; $x++) { 
									if($x<10){
										$x='00'.$x;
									  }elseif ($x>=10 and $x<100) {
										  $x='0'.$x;
									  }else{
										  $x=$x;
									  }
									  $data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
										"qr_code"=>$rowData[0][1].'-'.$x,
										);
								  $insert = $this->db->insert($table, $data1);
									}
									
								}
								                   // Sesuaikan nama dengan nama tabel untuk melakukan insert data
								$no=$no+1;
								$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
								$i=$i+1;
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
			
						}
					}elseif($table=='tbl_master_part_ppl'){
						$this->db->truncate($table);
						$i=1;
							$no=1;
							for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
							   $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
							   
							   $data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
								"job_no"=>$rowData[0][1],
								"job_master"=>$rowData[0][2],
								"part_no"=>$rowData[0][3],
								"part_name"=>$rowData[0][4],
								"area"=>$rowData[0][5],
								"proses"=>$rowData[0][6],
								"pcs_month"=>$rowData[0][7],
								"prod_shift"=>$rowData[0][8],
								"vendor"=>$rowData[0][9],
								"model"=>$rowData[0][10],
								"part_category"=>$rowData[0][11],
								"routing"=>$rowData[0][12],
								"create_by"=>$this->nama,
								"create_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
			
								);
								$insert = $this->db->insert($table, $data1);                   // Sesuaikan nama dengan nama tabel untuk melakukan insert data
								$no=$no+1;
								$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
								$i=$i+1;
								delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
			
						}
					}
		
			}
			
		}
     function uploadplanning(){
    	ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$no=0;
    	$this->load->library('PHPExcel');
		$table = $this->input->post('table');
        $fileName = $table.time() . $_FILES['fileimport']['name'];                     
        $config['upload_path'] = './fileExcel/';                               
        $config['file_name'] = $fileName;
        $config['allowed_types'] = 'xls|xlsx|csv';
        $config['max_size'] = 10000;

        $this->upload->initialize($config);
        $namafile=explode('.',$_FILES['fileimport']['name']);
        $namafile1=explode('_',$namafile[0]);
        $namafile2=$namafile1[0];
        if (!$this->upload->do_upload('fileimport') OR $namafile2!='order'){
        	$this->db->query("DELETE FROM tbl_upload WHERE  tbl_name='".$table."'");
        	$status = "error";
            $msg = strip_tags($this->upload->display_errors());
            if($msg==''){
            	$msg='Error file name, Plase change name file to '.$namafile2.' !';
            }
            echo json_encode(array('status'=>$status,'msg'=>$msg));
        }else{
        $media = $this->upload->data('fileimport');
        $inputFileName = './fileExcel/' . $media['file_name'];

        try {
            $inputFileType = PHPExcel_IOFactory::identify($inputFileName);
            $objReader = PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFileName);
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
        }

        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
		$baris = $objPHPExcel->setACTIVESheetIndex(0)->getHighestRow()-1;
		$this->db->query("DELETE FROM tbl_upload WHERE  tbl_name='".$table."'");
        $datainsert=array(
					'tbl_name'=>$table,
					'total'=>$baris,
					'progress'=>0,
					'success'=>0,
				);
			$this->db->insert('tbl_upload',$datainsert);		
       		
			//$this->db->truncate('tbl_history_setting');
			$i=1;
			for ($row = 2; $row <= $highestRow; $row++) {                           // Read a row of data into an array
	            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
	             $del_date=gmdate('Y-m-d',PHPExcel_Shared_Date::ExcelToPHP($rowData[0][6]));
	             $del_time=gmdate('H:i:s',PHPExcel_Shared_Date::ExcelToPHP($rowData[0][7]));
	           $total_kbn = $rowData[0][15];
	            for ($x=1; $x <= $total_kbn ; $x++) { 
	           	  if($x<10){
		            $label_seq='00'.$x;
		          }elseif ($x>=10 and $x<100) {
		            $label_seq='0'.$x;
		          }else{
		            $label_seq=$x;
		          }
	           $qrcode=$rowData[0][10].str_replace('-R', '',$rowData[0][11]).$label_seq;
	           $data1 = array(                                                      // Sesuaikan sama nama kolom tabel di database
	             	"customer_code"=>$rowData[0][1],
					"customer_plant"=>$rowData[0][2],
					"customer_shop"=>$rowData[0][3],
					"lp"=>$rowData[0][4],
					"trip_no"=>$rowData[0][5],
					"del_date"=>$del_date,
					"del_time"=>$del_time,
					"del_cycle"=>$rowData[0][8],
					"po_no"=>$rowData[0][9],
					"order_no"=>$rowData[0][10],
					"job_no"=>$rowData[0][11],
					"part_no"=>$rowData[0][12],
					"part_name"=>$rowData[0][13],
					"qty_kbn"=>$rowData[0][14],
					"total_kbn"=>$rowData[0][15],
					"andon_date"=>gmdate('Y-m-d',PHPExcel_Shared_Date::ExcelToPHP($rowData[0][16])),
					"sequence"=>$x,
					"label_customer"=>$qrcode,
					"status"=>'OPEN',				
					"upload_by"=>$this->nama,
					"upload_date"=>gmdate('Y-m-d H:i:s',time()+60*60*7),
	            );
	           $this->db->query("DELETE from ".$table." where qrcode='".$qrcode."'");
	           // Sesuaikan nama dengan nama tabel untuk melakukan insert data
		       $this->db->insert($table, $data1);  
		       }                 

					$no=$no+1;
					$this->db->query("UPDATE tbl_upload SET progress='".$i."',success='".$no."' WHERE  tbl_name='".$table."'"); 
	    			$i=$i+1;
	    			delete_files($media['file_path']);                           // menghapus semua file .xls yang diupload
	        }
		
		}
		
    }
    function checkdownload(){
    	$table = $this->input->post('table');
    	$select=$this->db->get($table);
    	if(!empty($select)){
    		$status = "success";
            $msg = "Download data success!";
    	}else{
			$status = "error";
            $msg = "Download error data not found!";
		}
		echo json_encode(array('status'=>$status,'msg'=>$msg));	
    }
		function download() {
		$this->load->library('PHPExcel');
		$link = $this->uri->segment(3);
		$datalink=explode('--',$link);
        $table=$datalink[0];

		$time = gmdate('Y-m-d H:i:s',time()+60*60*7);
        $objPHPExcel    = new PHPExcel();
        $objPHPExcel->getACTIVESheet()->getColumnDimension('A')->setWidth(5);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('B')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('C')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getACTIVESheet()->getColumnDimension('E')->setAutoSize(true);
        
        $objPHPExcel->getACTIVESheet()->getStyle(1)->getFont()->setBold(true);
        
        $header = array(
            'alignment' => array(
                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            ),
            'font' => array(
                'bold' => true,
                'color' => array('rgb' => '222222'),
                'name' => 'Verdana'
            )
        );

        $objPHPExcel->getACTIVESheet()->getStyle("A1")
                ->applyFromArray($header)
                ->getFont()->setSize(16);
        $counter = 2;
        $data_field=$this->db->field_data($table);	
        foreach($data_field as $row){ $field1[]=$row->name; }
        $count = count($field1)-1;
        $field=join(',',$field1);
        $abjad = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I','J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ','BA', 'BB', 'BC', 'BD', 'BE', 'BF'];
        $i=0;
        
	
		$select = $this->db->get($table);
        $ee = $objPHPExcel->setACTIVESheetIndex(0);
        $judul=explode('_',$table);
        // $ee->setCellValue('A1', 'EXPORT DATA '.strtoupper($judul[1]).' '.strtoupper($judul[2]).' '.$time.'');
        $ef = $objPHPExcel->setACTIVESheetIndex(0);
        $ef->setCellValue($abjad[0].'1','no');
        $i=1;
            foreach ($data_field as $value) {
            	if($value->name!='id_check'){ if($value->name!='id'){
	            	$ef->setCellValue($abjad[$i].'1', $value->name);
	            	$i=$i+1;
           		 }
           		}
            }
        
        $ex = $objPHPExcel->setACTIVESheetIndex(0);
        $no = 1;
        $counter = 2;
        foreach ($select->result_array() as $row){
        	$ex->setCellValue($abjad[0].$counter, $no);
        	$i=1;
        	$ex->setCellValue($abjad[$i].$counter, $i);
			foreach ($data_field as $low){	
				if($low->name!='id_check'){ if($low->name!='id'){
			  		 $ex->setCellValue($abjad[$i].$counter, $row[$low->name]);
	            	$i=$i+1;
            	}}
		  	 }
		  	 $counter = $counter+1;
		  	 $no = $no+1;
		}
        
		$ey = $objPHPExcel->setACTIVESheetIndex(0);
		$counter = $counter+1;
		$datatitle['title']=$this->db->get('tbl_title')->row();
		$title=$datatitle['title']->title;
			// $ey->setCellValue('A'.$counter,'EXPORT DATA FROM '.$title.' SYSTEM COPYRIGHT © 2020');
			
        $objPHPExcel->getProperties()->setCreator("Dmuktico")
            ->setLastModifiedBy("Dmuktico")
            ->setTitle("Export PHPExcel Test Document")
            ->setSubject("Export PHPExcel Test Document")
            ->setDescription("Test doc for Office 2007 XLSX, generated by PHPExcel.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("PHPExcel");
        $objPHPExcel->getACTIVESheet()->setTitle('Data '.$table);
		
        $objWriter  = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Last-Modified:'. gmdate("D, d M Y H:i:s").'GMT');
        header('Chace-Control: no-store, no-cache, must-revalation');
        header('Chace-Control: post-check=0, pre-check=0', FALSE);
        header('Pragma: no-cache');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.strtoupper($table).'_'.$time.'.xlsx"');
        ob_end_clean();
        $objWriter->save('php://output');
    	
    }

	function download_format() {
		$this->load->library('PHPExcel');
		$link = $this->uri->segment(3);
		$datalink=explode('--',$link);
        $table=$datalink[0];

		if($this->shop=='WH Docking'){						
			$select = $this->db->where('area', 'WH Docking');
			$select = $this->db->get("tbl_master_part");						
		}elseif($this->shop=='WH Door Assy'){
			$select = $this->db->where('area', 'WH Door Assy');
			$select = $this->db->get("tbl_master_part");						
		}elseif($this->shop=='PPL'){
			$select = $this->db->get("tbl_master_part_ppl");						
		}else{			
			$select = $this->db->get("tbl_master_part");						
		}	
							

		$time = gmdate('Y-m-d H:i:s',time()+60*60*7);
        $objPHPExcel    = new PHPExcel();
        $objPHPExcel->getACTIVESheet()->getColumnDimension('A')->setWidth(5);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('B')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('C')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getACTIVESheet()->getColumnDimension('E')->setAutoSize(true);
        
        $objPHPExcel->getACTIVESheet()->getStyle(1)->getFont()->setBold(true);
        
        $header = array(
            'alignment' => array(
                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            ),
            'font' => array(
                'bold' => true,
                'color' => array('rgb' => '222222'),
                'name' => 'Verdana'
            )
        );

        $objPHPExcel->getACTIVESheet()->getStyle("A1")
                ->applyFromArray($header)
                ->getFont()->setSize(16);
        $counter = 2;
        $data_field=$this->db->field_data($table);

        foreach($data_field as $row){ $field1[]=$row->name; }
        $count = count($field1)-1;
        $field=join(',',$field1);
        $abjad = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I','J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ','BA', 'BB', 'BC', 'BD', 'BE', 'BF'];
        $i=0;
        
	
		//$select = $this->db->get($table);
        $ee = $objPHPExcel->setACTIVESheetIndex(0);
        $judul=explode('_',$table);
        // $ee->setCellValue('A1', 'EXPORT DATA '.strtoupper($judul[1]).' '.strtoupper($judul[2]).' '.$time.'');
        $ef = $objPHPExcel->setACTIVESheetIndex(0);
        $ef->setCellValue($abjad[0].'1','no');
        $i=1;
		if($this->shop!='PPL'){	
            foreach ($data_field as $value) {
            	if($value->name!='id'){ if($value->name!='part_no'){if($value->name!='part_name'){
				if($value->name!='maks_shift'){if($value->name!='patan'){if($value->name!='t_t'){if($value->name!='shift'){if($value->name!='shop_name'){if($value->name!='ss_p1'){
					if($value->name!='ss_p4'){if($value->name!='ss_kap'){if($value->name!='ss_ppl'){if($value->name!='ss_process'){if($value->name!='create_by'){if($value->name!='create_date'){
						if($value->name!='machine'){if($value->name!='ps'){if($value->name!='area'){if($value->name!='model'){if($value->name!='proses'){if($value->name!='job_master'){
	            	$ef->setCellValue($abjad[$i].'1', $value->name);
	            	$i=$i+1;
           		 }}}}}}}}}}}}}}}}}}}}
           		}
            }
		}else{
			foreach ($data_field as $value) {
            	 if($value->name!='id'){ if($value->name!='part_no'){if($value->name!='part_name'){if($value->name!='job_master'){if($value->name!='ss_r'){if($value->name!='ss_otw'){if($value->name!='ss'){
				if($value->name!='part_category'){if($value->name!='shop_name'){if($value->name!='shift'){if($value->name!='prod_shift'){if($value->name!='plan_jam'){if($value->name!='ss_ppl'){
					if($value->name!='area'){if($value->name!='model'){if($value->name!='vendor'){if($value->name!='routing'){if($value->name!='jam'){if($value->name!='create_by'){
						if($value->name!='create_date'){
	            	$ef->setCellValue($abjad[$i].'1', $value->name);
	            	$i=$i+1;
           		 }}}}}}}}}}}}}}}}}}}
           		}
            }
		}
        
        $ex = $objPHPExcel->setACTIVESheetIndex(0);
        $no = 1;
        $counter = 2;
        foreach ($select->result_array() as $row){
        	$ex->setCellValue($abjad[0].$counter, $no);
        	$i=1;
        	$ex->setCellValue($abjad[$i].$counter, $i);
			if($this->shop!='PPL'){	
			foreach ($data_field as $low){	
				 if($low->name!='id'){ if($low->name!='part_no'){if($low->name!='part_name'){
					if($low->name!='maks_shift'){if($low->name!='patan'){if($low->name!='t_t'){if($low->name!='shift'){if($low->name!='shop_name'){if($low->name!='ss_p1'){
						if($low->name!='ss_p4'){if($low->name!='ss_kap'){if($low->name!='ss_ppl'){if($low->name!='ss_process'){if($low->name!='create_by'){if($low->name!='create_date'){
							if($low->name!='machine'){if($low->name!='ps'){if($low->name!='area'){if($low->name!='model'){if($low->name!='proses'){if($low->name!='job_master'){
			  		 $ex->setCellValue($abjad[$i].$counter, $row[$low->name]);
	            	$i=$i+1;
            	}}}}}}}}}}}}}}}}}}}}}
		  	 }
			}else{
				foreach ($data_field as $low){	
					if($low->name!='id'){ if($low->name!='part_no'){if($low->name!='part_name'){if($low->name!='job_master'){if($low->name!='ss_r'){if($low->name!='ss_otw'){if($low->name!='ss'){
						if($low->name!='part_category'){if($low->name!='shop_name'){if($low->name!='shift'){if($low->name!='prod_shift'){if($low->name!='plan_jam'){if($low->name!='ss_ppl'){
							if($low->name!='area'){if($low->name!='model'){if($low->name!='vendor'){if($low->name!='routing'){if($low->name!='jam'){if($low->name!='create_by'){
								if($low->name!='create_date'){
						  $ex->setCellValue($abjad[$i].$counter, $row[$low->name]);
					   $i=$i+1;
				   }}}}}}}}}}}}}}}}}}}}
				  }
			}
		  	 $counter = $counter+1;
		  	 $no = $no+1;
		}
	
        
		$ey = $objPHPExcel->setACTIVESheetIndex(0);
		$counter = $counter+1;
		$datatitle['title']=$this->db->get('tbl_title')->row();
		$title=$datatitle['title']->title;
			// $ey->setCellValue('A'.$counter,'EXPORT DATA FROM '.$title.' SYSTEM COPYRIGHT © 2020');
			
        $objPHPExcel->getProperties()->setCreator("Dmuktico")
            ->setLastModifiedBy("Dmuktico")
            ->setTitle("Export PHPExcel Test Document")
            ->setSubject("Export PHPExcel Test Document")
            ->setDescription("Test doc for Office 2007 XLSX, generated by PHPExcel.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("PHPExcel");
        $objPHPExcel->getACTIVESheet()->setTitle('Data '.$table);
		
        $objWriter  = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Last-Modified:'. gmdate("D, d M Y H:i:s").'GMT');
        header('Chace-Control: no-store, no-cache, must-revalation');
        header('Chace-Control: post-check=0, pre-check=0', FALSE);
        header('Pragma: no-cache');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.strtoupper($table).'_'.$time.'.xlsx"');
        ob_end_clean();
        $objWriter->save('php://output');
    	
    }

    function exportexcel() {
    	ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$this->load->library('PHPExcel');
		$table = $this->input->post('table');
		$start = $this->input->post('start');
		$finish = $this->input->post('finish');
		
		$time = gmdate('Y-m-d H:i:s',time()+60*60*7);
        $objPHPExcel    = new PHPExcel();
        $objPHPExcel->getACTIVESheet()->getColumnDimension('A')->setWidth(5);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('B')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('C')->setAutoSize(true);
        $objPHPExcel->getACTIVESheet()->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getACTIVESheet()->getColumnDimension('E')->setAutoSize(true);
        
        $objPHPExcel->getACTIVESheet()->getStyle(1)->getFont()->setBold(true);
        $objPHPExcel->getACTIVESheet()->getStyle(2)->getFont()->setBold(true);
        $objPHPExcel->getACTIVESheet()->getStyle(3)->getFont()->setBold(true);
        
        $header = array(
            'alignment' => array(
                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            ),
            'font' => array(
                'bold' => true,
                'color' => array('rgb' => '222222'),
                'name' => 'Verdana'
            )
        );

        $objPHPExcel->getACTIVESheet()->getStyle("A1")
                ->applyFromArray($header)
                ->getFont()->setSize(16);
        $counter = 2;
        $data_field=$this->db->field_data($table);
        foreach($data_field as $row){ $field1[]=$row->name; }
        $count = count($field1)-1;
        $field=join(',',$field1);
        $abjad = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I','J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ','BA', 'BB', 'BC', 'BD', 'BE', 'BF','BG','BH','BI','BJ','BK','BL','BM','BN','BO','BP','BQ','BR','BS','BT'];
        $i=0;
        	
		
        $this->db->select('*');
        	$this->db->where('wos_date >',$start);
			$this->db->where('wos_date <',$finish);
        
		
		$this->db->order_by('id','asc');
		$select = $this->db->get($table);
        $ee = $objPHPExcel->setACTIVESheetIndex(0);
        $judul=explode('_',$table);
        // $ee->setCellValue('A1', 'EXPORT DATA '.strtoupper($judul[1]).' '.strtoupper($judul[2]).' '.$time.'');
        $ef = $objPHPExcel->setACTIVESheetIndex(0);
        $ef->setCellValue($abjad[0].'1','no');
        $i=1;
            foreach ($data_field as $value) {
            	if($value->name!='id_check'){ if($value->name!='id'){
	            	$ef->setCellValue($abjad[$i].'1', $value->name);
	            	$i=$i+1;
           		 }
           		}
            }
        
        $ex = $objPHPExcel->setACTIVESheetIndex(0);
        $no = 1;
        $counter = 2;
        foreach ($select->result_array() as $row){
        	$ex->setCellValue($abjad[0].$counter, $no);
        	$i=1;
        	$ex->setCellValue($abjad[$i].$counter, $i);
			foreach ($data_field as $low){
				if($low->name!='id_check'){ if($low->name!='id'){
			  		 $ex->setCellValue($abjad[$i].$counter, $row[$low->name]);
	            	$i=$i+1;
            	}}
		  	 }
		  	 $counter = $counter+1;
		  	 $no = $no+1;
		}
        
		$ey = $objPHPExcel->setACTIVESheetIndex(0);
		$counter = $counter+1;
		$datatitle['title']=$this->db->get('tbl_title')->row();
		$title=$datatitle['title']->title;
			$ey->setCellValue('A'.$counter,'EXPORT DATA FROM '.$title.' SYSTEM COPYRIGHT © 2019');
			
        $objPHPExcel->getProperties()->setCreator("Imam Faozi")
            ->setLastModifiedBy("Imam Faozi")
            ->setTitle("Export PHPExcel Test Document")
            ->setSubject("Export PHPExcel Test Document")
            ->setDescription("Test doc for Office 2007 XLSX, generated by PHPExcel.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("PHPExcel");
        $objPHPExcel->getACTIVESheet()->setTitle('Data '.$table);
		
        $objWriter  = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Last-Modified:'. gmdate("D, d M Y H:i:s").'GMT');
        header('Chace-Control: no-store, no-cache, must-revalation');
        header('Chace-Control: post-check=0, pre-check=0', FALSE);
        header('Pragma: no-cache');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="EXPORT_DATA_'.strtoupper($table).'_'.$time.'.xlsx"');
        ob_end_clean();
        $objWriter->save('php://output');
    	
    }
   
	function printidcard(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$query="select * from tbl_user order by nik asc";	 
		if($this->user_level!='Administrator'){
			$query ="select * from tbl_user where user_level='".$this->user_level."'";
		}   
		if($id!=''){
			$query="select * from tbl_user where id='".$id."'";
		}
		$select = $this->db->query($query)->result(); 
		$jumlah = $this->db->query($query)->num_rows();
		if($jumlah==1){
			$jumlah=100/3;
		}else{
			$jumlah="100%";
		}  
        //load content html
        $dataquery['title']= $this->db->get('tbl_title')->row();
        $data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$jumlah,
						);	
        $this->load->view('content/print/print_idcard',$data);
	}

	function data_job(){
	$data_job=$this->db->query("SELECT id,job_no FROM tbl_master_kanban group by job_no order by id asc")->result();

    $posts = array();
		foreach ($data_job as $key) {
			$posts[]=array(
	     	"'".$key->id."'" =>$key->job_no,
	     	);
	     }
    echo json_encode($data_job,JSON_PRETTY_PRINT);
}

function printkanban1(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$job_no['id'] = $this->db->query("select * from tbl_master_kanban where id='".$id."' limit 1")->row();

				$query="select b.qrrack,b.rack_no,b.hole,b.job_no,b.min_pcs,b.max_pcs,b.min_box,b.max_box,b.address,a.total_post,
concat('1 ',a.shearing,',2 ',a.stamping,',3 ',a.spot_welding,',4 ',a.welding,',5 ',a.painting,',6 ',a.plating,',7 ',a.ifp) as proses,
a.sequence,a.jumlah_kbn,a.box_type,a.job_internal,a.part_no,a.part_name,a.id_kbn,a.qty_box,a.qrkbn,a.routing,a.box_kbn,a.ars from tbl_master_kanban a LEFT JOIN tbl_master_rak b on(b.id_kbn=a.id_kbn) where a.job_no='".$job_no['id']->job_no."' group by a.qrkbn order by a.qrkbn asc";
	
		$select = $this->db->query($query)->result(); 
	
        //load content html
        $dataquery['title']= $this->db->get('tbl_title')->row();
        $data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$this->db->query($query)->num_rows(),
						);	

        $this->load->view('content/print/print_kanban',$data);
	}

	function printkanban(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$query="select b.qrrack,b.rack_no,b.hole,b.job_no,b.min_pcs,b.max_pcs,b.min_box,b.max_box,b.address,a.total_post,concat('1 ',a.shearing,',2 ',a.stamping,',3 ',a.spot_welding,',4 ',a.welding,',5 ',a.painting,',6 ',a.plating,',7 ',a.ifp) as proses,
a.sequence,a.jumlah_kbn,a.box_type,a.job_internal,a.part_no,a.part_name,a.id_kbn,a.qty_box,a.qrkbn,a.routing,a.box_kbn,a.ars from tbl_master_kanban a LEFT JOIN tbl_master_rak b on(b.id_kbn=a.id_kbn) group by a.qrkbn order by a.id asc";	

		if($id!=''){
				$query="select b.qrrack,b.rack_no,b.hole,b.job_no,b.min_pcs,b.max_pcs,b.min_box,b.max_box,b.address,a.total_post,
concat('1 ',a.shearing,',2 ',a.stamping,',3 ',a.spot_welding,',4 ',a.welding,',5 ',a.painting,',6 ',a.plating,',7 ',a.ifp) as proses,
a.sequence,a.jumlah_kbn,a.box_type,a.job_internal,a.part_no,a.part_name,a.id_kbn,a.qty_box,a.qrkbn,a.routing,a.box_kbn,a.ars from tbl_master_kanban a LEFT JOIN tbl_master_rak b on(b.id_kbn=a.id_kbn) where a.id='".$id."' group by a.qrkbn order by a.id asc";
		}	

		$select = $this->db->query($query)->result(); 
        //load content html
        $dataquery['title']= $this->db->get('tbl_title')->row();
        $data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$this->db->query($query)->num_rows(),
						);	

        $this->load->view('content/print/print_kanban',$data);
	}
	
		function printrakin(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$job_no['id']=$this->db->query("select * from tbl_master_rak where id='".$id."' limit 1")->row();
		$routing = $this->db->query("select * from tbl_master_kanban where job_no='".$job_no['id']->job_no."' limit 1")->result();

		$query="select a.qrrack,a.rack_no,a.hole,a.job_no,a.min_pcs,a.max_pcs,a.min_box,a.max_box,b.box_type,b.part_no,b.part_name,b.id_kbn,b.qty_box from tbl_master_rak a inner join tbl_master_kanban b on(a.job_no=b.job_no) group by a.qrrack,a.job_no order by a.id asc"; 

		if($id!=''){
			$query="select a.qrrack,a.rack_no,a.hole,a.job_no,a.min_pcs,a.max_pcs,a.min_box,a.max_box,b.box_type,b.part_no,b.part_name,b.id_kbn,b.qty_box from tbl_master_rak a inner join tbl_master_kanban b on(a.job_no=b.job_no) where  a.id='".$id."' group by a.qrrack,a.job_no";
		}
		$select = $this->db->query($query)->result(); 
        //load content html
        $dataquery['title']= $this->db->get('tbl_title')->row();
        $data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$this->db->query($query)->num_rows(),
						'routing'=>$routing,
						);	

        $this->load->view('content/print/print_rak_in',$data);
	}

		function printrakout(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$job_no['id']=$this->db->query("select * from tbl_master_rak where id='".$id."' limit 1")->row();
		$routing = $this->db->query("select * from tbl_master_kanban where job_no='".$job_no['id']->job_no."' limit 1")->result();
		$query="select a.qrrack,a.rack_no,a.hole,a.job_no,a.min_pcs,a.max_pcs,a.min_box,a.max_box,b.box_type,b.part_no,b.part_name,b.id_kbn,b.qty_box from tbl_master_rak a inner join tbl_master_kanban b on(a.job_no=b.job_no) group by a.qrrack,a.job_no order by a.id asc"; 

		if($id!=''){
			$query="select a.qrrack,a.rack_no,a.hole,a.job_no,a.min_pcs,a.max_pcs,a.min_box,a.max_box,b.box_type,b.part_no,b.part_name,b.id_kbn,b.qty_box from tbl_master_rak a inner join tbl_master_kanban b on(a.job_no=b.job_no) where  a.id='".$id."' group by a.qrrack,a.job_no";
		}
		$select = $this->db->query($query)->result(); 
        //load content html
        $dataquery['title']= $this->db->get('tbl_title')->row();
        $data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$this->db->query($query)->num_rows(),
						'routing'=>$routing,
						);	

        $this->load->view('content/print/print_rak_out',$data);
	}

	function print_qr(){
		ini_set('memory_limit','1024M');
		set_time_limit(12000);
		$id=$this->uri->segment(3);
		$query="select * from tbl_master_qr order by id asc";	  
		if($id!=''){
			$query="select * from tbl_master_qr where id='".$id."'";
		}
		$select = $this->db->query($query)->result(); 
		$jumlah = $this->db->query($query)->num_rows();
		
	
		//load content html
		$dataquery['title']= $this->db->get('tbl_title')->row();
		$data=array(	
						'data_table'=>$select,
						'logo'=>$dataquery['title']->logo,
						'owner'=>$dataquery['title']->owner,
						'detail'=>$dataquery['title']->detail,
						'jumlah'=>$jumlah,
						);	
		$this->load->view('content/print/print_qr',$data);
	}

}
