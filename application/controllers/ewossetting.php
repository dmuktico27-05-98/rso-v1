<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!');
class Ewossetting extends CI_Controller{
  public $nama;
  function __construct(){
        parent::__construct();
        $this->load->library('user_agent');
        $cek['ip']= $this->db->get_where('tbl_user_active',array('ip_address'=>$this->input->ip_address()))->row();       
    $data1['user']= $this->db->get_where('tbl_user',array('idcard'=>$cek['ip']->idcard))->row();
    $this->nama=$data1['user']->nama;
    $this->post=$data1['user']->post;
    // if($this->user_group!='Admin'){ 
    //   redirect('action/logout');
    // }
    }

    function index(){
      if($this->post=='ps12rh'){
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
              $one_page=1;
              $current_page=1;
                if(isset($_GET['page'])){
                $current_page=$_GET['page'];
                $current_page=($current_page > 1) ? $current_page : 1;
                }
                  $total_data = $this->db->query("select * from tbl_panel_side_d12l")->num_rows();
                  $total_closerh = $this->db->query("select * from tbl_panel_side_d12l where remarks_rh='close'")->num_rows();
                  $total_data_setting = $this->db->query("select remarks_rh from tbl_panel_side_d12l where remarks_rh!='null' order by seq_no asc")->num_rows();
                  $total_page = ceil($total_data/$per_page);
                  $hasil_bagi_per_page = ($total_data_setting) / $per_page;    
                  $awal = ($current_page - 1) * $per_page;
                    //menu_exp master settingan jundate
                    $cek_wos['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' ")->row();
                    if($cek_wos['id']->cek==''){
                      $ps12rh=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE ok_wos_rh is null ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                    }else{
                      $batas_cek = $per_page*3;
                      $this->db->truncate('tbl_temp_cek_ps12rh');
                      $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where cek_wos_rh is not null order by seq_no desc limit 1")->row();
                        $no = $total_cek['seq_no']->seq_no;
                        $no = $no + 1;
                      for ($i=1; $i <=$batas_cek; $i++) {
                        $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps12rh where cek_number!='' order by id desc limit 1 ")->row();
                        if($temp_cek['id']!=NULL){
                          $no = $temp_cek['id']->cek_number;
                        }
                        $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no<".$no." order by seq_no desc limit 1")->row();
                        $seq_no = $cek_seq_no['no']->seq_no;
                        $data1 = array('cek_number' => $seq_no,);
                        $this->db->insert('tbl_temp_cek_ps12rh',$data1);
                      }
                      $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps12rh where cek_number!='' order by id desc limit 1 ")->row();
                      $ps12rh=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE seq_no>=".$temp_cek['id']->cek_number." ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                    }
                    $lastset_ps12rh['seq']=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh is not null ORDER BY seq_no DESC LIMIT 1")->row();
                    // //menu pallet
                    $palletno_ps12rh['id'] = $this->db->query("SELECT * FROM tbl_temp_pallet_ps12rh WHERE pallet_number is not null ORDER BY id DESC LIMIT 1")->row();
                    $job_variant = $this->db->query("SELECT * FROM tbl_master_job_variant WHERE job_variant is not null ORDER BY id ASC")->result();
                     //code untuk proses compare antara before n after setting
                $x = $per_page * 2;
                $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
                $seq = $wos_pallet['id']->seq_no - $x;
                      $data=array(
                            'nama'=>$this->nama,
                            'ps12rh'=>$ps12rh,
                            'cek_wos'=>$cek_wos['id']->cek,
                            'set_cek'=>$cek_wos['id']->set_all,
                            'job_variant'=>$job_variant,
                            'main_pallet'=>$main_pallet['id']->pallet,
                            'total_pallet'=>$main_pallet['id']->total_pallet,
                            'palletno_ps12rh'=>$palletno_ps12rh['id']->id,
                            'code'=>$lastset_ps12rh['seq']->code,
                            'no_wos'=>$lastset_ps12rh['seq']->no_wos,
                            'remarks_rh'=>$lastset_ps12rh['seq']->remarks_rh,
                            'variant'=>$lastset_ps12rh['seq']->variant,
                            'job_var_rh'=>$lastset_ps12rh['seq']->job_var_rh,
                            'panel_side_rh'=>$lastset_ps12rh['seq']->panel_side_rh,
                            'wos_date'=>$lastset_ps12rh['seq']->wos_date,
                            'ewosps12rh'=>'ewossetting',
                            'post'=>$this->post,
                            'total_seq_wos_pallet_ps12rh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_rh is not null and seq_no>'".$seq."'")->num_rows(),
                            'total_seq_ps12rh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh is not null and seq_no>'".$seq."'")->num_rows(),
                            'total_seq_ok_wos_rh_ps12rh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE ok_wos_rh is not null and seq_no>'".$seq."'")->num_rows(),
                        );
              $this->load->view('content/ewossetting/header',$data);
              $this->load->view('content/ewossetting/ps12rh');
              $this->load->view('content/ewossetting/footer');
   }elseif ($this->post=='ps12lh') {
              $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
                $per_page=$main_pallet['id']->pallet;
                  $one_page=1;
                  $current_page=1;
                    if(isset($_GET['page'])){
                    $current_page=$_GET['page'];
                    $current_page=($current_page > 1) ? $current_page : 1;
                    }
              $total_data = $this->db->query("select * from tbl_panel_side_d12l")->num_rows();
              $total_closelh = $this->db->query("select * from tbl_panel_side_d12l where remarks_lh='close'")->num_rows();
              $total_data_setting = $this->db->query("select remarks_lh from tbl_panel_side_d12l where remarks_lh!='null' order by seq_no asc")->num_rows();
              $total_page = ceil($total_data/$per_page);
              $hasil_bagi_per_page = ($total_data_setting) / $per_page;    
              $awal = ($current_page - 1) * $per_page;
                // menu_exp master settingan jundate
                $cek_wos['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' ")->row();
                if($cek_wos['id']->cek==''){
                  $ps12lh=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE ok_wos_lh is null ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }else{
                  $batas_cek = $per_page*3;
                  $this->db->truncate('tbl_temp_cek_ps12lh');
                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where cek_wos_lh is not null order by seq_no desc limit 1")->row();
                    $no = $total_cek['seq_no']->seq_no;
                    $no = $no + 1;
                  for ($i=1; $i <=$batas_cek; $i++) {
                    $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps12lh where cek_number!='' order by id desc limit 1 ")->row();
                    if($temp_cek['id']!=NULL){
                      $no = $temp_cek['id']->cek_number;
                    }
                    $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no<".$no." order by seq_no desc limit 1")->row();
                    $seq_no = $cek_seq_no['no']->seq_no;
                    $data1 = array('cek_number' => $seq_no,);
                    $this->db->insert('tbl_temp_cek_ps12lh',$data1);
                  }
                  $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps12lh where cek_number!='' order by id desc limit 1 ")->row();
                  $ps12lh=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE seq_no>=".$temp_cek['id']->cek_number." ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }
                $lastset_ps12lh['seq']=$this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_lh is not null ORDER BY seq_no DESC LIMIT 1")->row();
                // menu pallet
                $palletno_ps12lh['id'] = $this->db->query("SELECT * FROM tbl_temp_pallet_ps12lh WHERE pallet_number is not null ORDER BY id DESC LIMIT 1")->row();
                $job_variant = $this->db->query("SELECT * FROM tbl_master_job_variant WHERE job_variant is not null ORDER BY id ASC")->result();
                //code untuk proses compare antara before n after setting
                $x = $per_page * 2;
                $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
                $seq = $wos_pallet['id']->seq_no - $x;
                  $data=array(
                        'nama'=>$this->nama,
                        'ps12lh'=>$ps12lh,
                        'cek_wos'=>$cek_wos['id']->cek,
                        'set_cek'=>$cek_wos['id']->set_all,
                        'job_variant'=>$job_variant,
                        'main_pallet'=>$main_pallet['id']->pallet,
                        'total_pallet'=>$main_pallet['id']->total_pallet,
                        'palletno_ps12lh'=>$palletno_ps12lh['id']->id,
                        'code'=>$lastset_ps12lh['seq']->code,
                        'no_wos'=>$lastset_ps12lh['seq']->no_wos,
                        'remarks_lh'=>$lastset_ps12lh['seq']->remarks_lh,
                        'variant'=>$lastset_ps12lh['seq']->variant,
                        'job_var_lh'=>$lastset_ps12lh['seq']->job_var_lh,
                        'panel_side_lh'=>$lastset_ps12lh['seq']->panel_side_lh,
                        'wos_date'=>$lastset_ps12lh['seq']->wos_date,
                        'ewosps12lh'=>'ewossetting',
                        'post'=>$this->post,
                        'total_seq_wos_pallet_ps12lh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows(),
                        'total_seq_ps12lh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_lh is not null and seq_no>'".$seq."'")->num_rows(),
                        'total_seq_ok_wos_lh_ps12lh' => $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE ok_wos_lh is not null and seq_no>'".$seq."'")->num_rows(),
                    );
          $this->load->view('content/ewossetting/header',$data);
          $this->load->view('content/ewossetting/ps12lh');
          $this->load->view('content/ewossetting/footer');
        }elseif ($this->post=='ps14rh') {
          $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
          $per_page=$main_pallet['id']->pallet;
          $one_page=1;
          $current_page=1;
            if(isset($_GET['page'])){
            $current_page=$_GET['page'];
            $current_page=($current_page > 1) ? $current_page : 1;
            }
              $total_data = $this->db->query("select * from tbl_panel_side_d14n")->num_rows();
              $total_closerh = $this->db->query("select * from tbl_panel_side_d14n where remarks_rh='close'")->num_rows();
              $total_data_setting = $this->db->query("select remarks_rh from tbl_panel_side_d14n where remarks_rh!='null' order by seq_no asc")->num_rows();
              $total_page = ceil($total_data/$per_page);
              $hasil_bagi_per_page = ($total_data_setting) / $per_page;    
              $awal = ($current_page - 1) * $per_page;
                //menu_exp master settingan jundate
                $cek_wos['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' ")->row();
                if($cek_wos['id']->cek==''){
                  $ps14rh=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE ok_wos_rh is null ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }else{
                  $batas_cek = $per_page*3;
                  $this->db->truncate('tbl_temp_cek_ps14rh');
                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where cek_wos_rh is not null order by seq_no desc limit 1")->row();
                    $no = $total_cek['seq_no']->seq_no;
                    $no = $no + 1;
                  for ($i=1; $i <=$batas_cek; $i++) {
                    $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps14rh where cek_number!='' order by id desc limit 1 ")->row();
                    if($temp_cek['id']!=NULL){
                      $no = $temp_cek['id']->cek_number;
                    }
                    $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no<".$no." order by seq_no desc limit 1")->row();
                    $seq_no = $cek_seq_no['no']->seq_no;
                    $data1 = array('cek_number' => $seq_no,);
                    $this->db->insert('tbl_temp_cek_ps14rh',$data1);
                  }
                  $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps14rh where cek_number!='' order by id desc limit 1 ")->row();
                  $ps14rh=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE seq_no>=".$temp_cek['id']->cek_number." ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }
                $lastset_ps14rh['seq']=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_rh is not null ORDER BY seq_no DESC LIMIT 1")->row();
                // //menu pallet
                $palletno_ps14rh['id'] = $this->db->query("SELECT * FROM tbl_temp_pallet_ps14rh WHERE pallet_number is not null ORDER BY id DESC LIMIT 1")->row();
                $job_variant = $this->db->query("SELECT * FROM tbl_master_job_variant WHERE job_variant is not null ORDER BY id ASC")->result();
                //code untuk proses compare antara before n after setting
                $x = $per_page * 2;
                $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
                $seq = $wos_pallet['id']->seq_no - $x;
                
                  $data=array(
                        'nama'=>$this->nama,
                        'ps14rh'=>$ps14rh,
                        'cek_wos'=>$cek_wos['id']->cek,
                        'set_cek'=>$cek_wos['id']->set_all,
                        'job_variant'=>$job_variant,
                        'main_pallet'=>$main_pallet['id']->pallet,
                        'total_pallet'=>$main_pallet['id']->total_pallet,
                        'palletno_ps14rh'=>$palletno_ps14rh['id']->id,
                        'code'=>$lastset_ps14rh['seq']->code,
                        'no_wos'=>$lastset_ps14rh['seq']->no_wos,
                        'remarks_rh'=>$lastset_ps14rh['seq']->remarks_rh,
                        'variant'=>$lastset_ps14rh['seq']->variant,
                        'job_var_rh'=>$lastset_ps14rh['seq']->job_var_rh,
                        'panel_side_rh'=>$lastset_ps14rh['seq']->panel_side_rh,
                        'wos_date'=>$lastset_ps14rh['seq']->wos_date,
                        'ewosps14rh'=>'ewossetting',
                        'post'=>$this->post,
                        'total_seq_wos_pallet_ps14rh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_rh is not null and seq_no>'".$seq."' ")->num_rows(),
                        'total_seq_ps14rh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_rh is not null and seq_no>'".$seq."' ")->num_rows(),
                        'total_seq_ok_wos_rh_ps14rh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE ok_wos_rh is not null and seq_no>'".$seq."' ")->num_rows(),
                    );
                    // print_r($data);
                    // die();
          $this->load->view('content/ewossetting/header',$data);
          $this->load->view('content/ewossetting/ps14rh');
          $this->load->view('content/ewossetting/footer');
        }elseif ($this->post=='ps14lh') {
          $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
          $per_page=$main_pallet['id']->pallet;
          $one_page=1;
          $current_page=1;
            if(isset($_GET['page'])){
            $current_page=$_GET['page'];
            $current_page=($current_page > 1) ? $current_page : 1;
            }
              $total_data = $this->db->query("select * from tbl_panel_side_d14n")->num_rows();
              $total_closelh = $this->db->query("select * from tbl_panel_side_d14n where remarks_lh='close'")->num_rows();
              $total_data_setting = $this->db->query("select remarks_lh from tbl_panel_side_d14n where remarks_lh!='null' order by seq_no asc")->num_rows();
              $total_page = ceil($total_data/$per_page);
              $hasil_bagi_per_page = ($total_data_setting) / $per_page;    
              $awal = ($current_page - 1) * $per_page;
                // menu_exp master settingan jundate
                $cek_wos['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' ")->row();
                if($cek_wos['id']->cek==''){
                  $ps14lh=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE ok_wos_lh is null ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }else{
                  $batas_cek = $per_page*3;
                  $this->db->truncate('tbl_temp_cek_ps14lh');
                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where cek_wos_lh is not null order by seq_no desc limit 1")->row();
                    $no = $total_cek['seq_no']->seq_no;
                    $no = $no + 1;
                  for ($i=1; $i <=$batas_cek; $i++) {
                    $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps14lh where cek_number!='' order by id desc limit 1 ")->row();
                    if($temp_cek['id']!=NULL){
                      $no = $temp_cek['id']->cek_number;
                    }
                    $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no<".$no." order by seq_no desc limit 1")->row();
                    $seq_no = $cek_seq_no['no']->seq_no;
                    $data1 = array('cek_number' => $seq_no,);
                    $this->db->insert('tbl_temp_cek_ps14lh',$data1);
                  }
                  $temp_cek['id'] = $this->db->query("select * from tbl_temp_cek_ps14lh where cek_number!='' order by id desc limit 1 ")->row();
                  $ps14lh=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE seq_no>=".$temp_cek['id']->cek_number." ORDER BY seq_no ASC LIMIT ".$per_page." offset $awal")->result();
                }
                $lastset_ps14lh['seq']=$this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_lh is not null ORDER BY seq_no DESC LIMIT 1")->row();
                // menu pallet
                $palletno_ps14lh['id'] = $this->db->query("SELECT * FROM tbl_temp_pallet_ps14lh WHERE pallet_number is not null ORDER BY id DESC LIMIT 1")->row();
                $job_variant = $this->db->query("SELECT * FROM tbl_master_job_variant WHERE job_variant is not null ORDER BY id ASC")->result();
                 //code untuk proses compare antara before n after setting
                 $x = $per_page * 2;
                 $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
                 $seq = $wos_pallet['id']->seq_no - $x;
                  $data=array(
                        'nama'=>$this->nama,
                        'ps14lh'=>$ps14lh,
                        'cek_wos'=>$cek_wos['id']->cek,
                        'set_cek'=>$cek_wos['id']->set_all,
                        'job_variant'=>$job_variant,
                        'main_pallet'=>$main_pallet['id']->pallet,
                        'total_pallet'=>$main_pallet['id']->total_pallet,
                        'palletno_ps14lh'=>$palletno_ps14lh['id']->id,
                        'code'=>$lastset_ps14lh['seq']->code,
                        'no_wos'=>$lastset_ps14lh['seq']->no_wos,
                        'remarks_lh'=>$lastset_ps14lh['seq']->remarks_lh,
                        'variant'=>$lastset_ps14lh['seq']->variant,
                        'job_var_lh'=>$lastset_ps14lh['seq']->job_var_lh,
                        'panel_side_lh'=>$lastset_ps14lh['seq']->panel_side_lh,
                        'wos_date'=>$lastset_ps14lh['seq']->wos_date,
                        'ewosps14lh'=>'ewossetting',
                        'post'=>$this->post,
                        'total_seq_wos_pallet_ps14lh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows(),
                        'total_seq_ps14lh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_lh is not null and seq_no>'".$seq."'")->num_rows(),
                        'total_seq_ok_wos_lh_ps14lh' => $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE ok_wos_lh is not null and seq_no>'".$seq."'")->num_rows(),
                    );
          $this->load->view('content/ewossetting/header',$data);
          $this->load->view('content/ewossetting/ps14lh');
          $this->load->view('content/ewossetting/footer');
        }
    }

function pallet_number(){
  // =================================setting panel side d12l rh==============================
    if($this->post=='ps12rh'){
        $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' and cek!='' limit 1")->row();
          if(!empty($check['id'])){   
            $data = array('cek' => '');
                $this->db->update('tbl_master_cek_wos',$data,array('post' => $this->post));
                  $log_date=isset($date) ? $date : gmdate('Y-m-d H:i:s',time()+60*60*7);
                  $data=array('log_out'=>$log_date,);
              $this->db->update($data,"tbl_user",array('post' => $this->post));
            $this->session->sess_destroy();
          }
          $pallet_no_ps12rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12rh where pallet_number is not null order by id desc limit 1")->row(); //code untuk pallet
          $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
          $per_page=$main_pallet['id']->pallet;
          $x = $per_page * 2;
        $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
        $seq = $wos_pallet['id']->seq_no - $x;
        $total_seq_wos_pallet_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_rh is not null and seq_no>'".$seq."' ")->num_rows();
        $total_seq_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh is not null and seq_no>'".$seq."' ")->num_rows();
          if($total_seq_ps12rh==$total_seq_wos_pallet_ps12rh){ 
                if($pallet_no_ps12rh['id']->id>=$main_pallet['id']->total_pallet){
                  $data = array('status' => 'gagal');
                    $data1 = array('pallet_number' => 'ok',);
                        $this->db->truncate('tbl_temp_pallet_ps12rh');
                              $this->db->insert('tbl_temp_pallet_ps12rh',$data1);
                              $pallet_no_ps12rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12rh where pallet_number is not null order by id desc limit 1")->row();

                              for ($i=1; $i <=$per_page ; $i++) { 
                                $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where wos_pallet_rh is not null order by seq_no desc limit 1")->row();
                                $no = $total_cek['seq_no']->seq_no;
                                if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                $seq_no = $cek_seq_no['no']->seq_no; 
                                $this->db->query("UPDATE tbl_panel_side_d12l SET wos_pallet_rh=".$pallet_no_ps12rh['id']->id." WHERE seq_no='".$seq_no."' ");
                                $this->db->query("UPDATE tbl_panel_side_d12l SET cek_wos_rh='cek' WHERE seq_no='".$seq_no."' ");
                            }
                        $data['status'] = 'oke' ;
                  }else{
                      $data = array('status' => 'gagal');
                        $data1 = array('pallet_number' => 'ok',);
                          $this->db->insert('tbl_temp_pallet_ps12rh',$data1);
                          $pallet_no_ps12rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12rh where pallet_number is not null order by id desc limit 1")->row();

                          for ($i=1; $i <=$per_page ; $i++) { 
                              $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where wos_pallet_rh is not null order by seq_no desc limit 1")->row();
                              $no = $total_cek['seq_no']->seq_no;
                              if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                              $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                              $seq_no = $cek_seq_no['no']->seq_no; 
                              $this->db->query("UPDATE tbl_panel_side_d12l SET wos_pallet_rh=".$pallet_no_ps12rh['id']->id." WHERE seq_no='".$seq_no."' ");
                              $this->db->query("UPDATE tbl_panel_side_d12l SET cek_wos_rh='cek' WHERE seq_no='".$seq_no."' ");
                          }
                            $data['status'] = 'oke' ;
                    }
                }else{
              $data['status'] = 'gagal' ;
          }
            echo json_encode($data);
      // ------------------------------------------------setting panel side d12l lh
    }elseif ($this->post=='ps12lh') {
                        $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' and cek!='' limit 1")->row();
                          if(!empty($check['id'])){   
                              $data = array('cek' => '');
                                  $this->db->update('tbl_master_cek_wos',$data,array('post' => $this->post));
                                    $log_date=isset($date) ? $date : gmdate('Y-m-d H:i:s',time()+60*60*7);
                                        $data=array(
                                        'log_out'=>$log_date,
                                      );
                                  $this->db->update($data,"tbl_user",array('post' => $this->post));
                              $this->session->sess_destroy();
                            }
                            $pallet_no_ps12lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12lh where pallet_number is not null order by id desc limit 1")->row();
                            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
                            $per_page=$main_pallet['id']->pallet;
                            $x = $per_page * 2;
                          $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
                          $seq = $wos_pallet['id']->seq_no - $x;
                          $total_seq_wos_pallet_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows();
                          $total_seq_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_lh is not null and seq_no>'".$seq."' ")->num_rows();                
                  if($total_seq_ps12lh==$total_seq_wos_pallet_ps12lh){ 
                      if($pallet_no_ps12lh['id']->id>=$main_pallet['id']->total_pallet){
                          $data = array('status' => 'gagal');
                              $data1 = array('pallet_number' => 'ok',);
                                  $this->db->truncate('tbl_temp_pallet_ps12lh');
                                      $this->db->insert('tbl_temp_pallet_ps12lh',$data1); 
                                      $pallet_no_ps12lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12lh where pallet_number is not null order by id desc limit 1")->row();

                                      for ($i=1; $i <=$per_page ; $i++) { 
                                        $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where wos_pallet_lh is not null order by seq_no desc limit 1")->row();
                                        $no = $total_cek['seq_no']->seq_no;
                                        if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                        $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                        $seq_no = $cek_seq_no['no']->seq_no; 
                                        $this->db->query("UPDATE tbl_panel_side_d12l SET wos_pallet_lh=".$pallet_no_ps12lh['id']->id." WHERE seq_no='".$seq_no."' ");
                                        $this->db->query("UPDATE tbl_panel_side_d12l SET cek_wos_lh='cek' WHERE seq_no='".$seq_no."' ");
                                    }
                                $data['status'] = 'oke' ;
                        }else{
                              $data = array('status' => 'gagal');
                                  $data1 = array('pallet_number' => 'ok',);
                                        $this->db->insert('tbl_temp_pallet_ps12lh',$data1);
                                        $pallet_no_ps12lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps12lh where pallet_number is not null order by id desc limit 1")->row();

                                        for ($i=1; $i <=$per_page ; $i++) { 
                                          $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where wos_pallet_lh is not null order by seq_no desc limit 1")->row();
                                          $no = $total_cek['seq_no']->seq_no;
                                          if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                          $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                          $seq_no = $cek_seq_no['no']->seq_no; 
                                          $this->db->query("UPDATE tbl_panel_side_d12l SET wos_pallet_lh=".$pallet_no_ps12lh['id']->id." WHERE seq_no='".$seq_no."' ");
                                          $this->db->query("UPDATE tbl_panel_side_d12l SET cek_wos_lh='cek' WHERE seq_no='".$seq_no."' ");
                                      }
                                            $data['status'] = 'oke' ;
                          }
                    }else{
                      $data['status'] = 'gagal' ;
                    }
                      echo json_encode($data);
        }elseif($this->post=='ps14rh'){
          $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' and cek!='' limit 1")->row();
            if(!empty($check['id'])){   
              $data = array('cek' => '');
                  $this->db->update('tbl_master_cek_wos',$data,array('post' => $this->post));
                    $log_date=isset($date) ? $date : gmdate('Y-m-d H:i:s',time()+60*60*7);
                    $data=array('log_out'=>$log_date,);
                $this->db->update($data,"tbl_user",array('post' => $this->post));
              $this->session->sess_destroy();
            }
            $pallet_no_ps14rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14rh where pallet_number is not null order by id desc limit 1")->row();
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
            $x = $per_page * 2;
          $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
          $seq = $wos_pallet['id']->seq_no - $x;
          $total_seq_wos_pallet_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_rh is not null and seq_no>'".$seq."' ")->num_rows();
          $total_seq_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_rh is not null and seq_no>'".$seq."' ")->num_rows();
              if($total_seq_ps14rh==$total_seq_wos_pallet_ps14rh){ 
                  if($pallet_no_ps14rh['id']->id>=$main_pallet['id']->total_pallet){
                    $data = array('status' => 'gagal');
                      $data1 = array('pallet_number' => 'ok',);
                          $this->db->truncate('tbl_temp_pallet_ps14rh');
                                $this->db->insert('tbl_temp_pallet_ps14rh',$data1);
                                $pallet_no_ps14rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14rh where pallet_number is not null order by id desc limit 1")->row();

                                for ($i=1; $i <=$per_page ; $i++) { 
                                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where wos_pallet_rh is not null order by seq_no desc limit 1")->row();
                                  $no = $total_cek['seq_no']->seq_no;
                                  if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                  $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                  $seq_no = $cek_seq_no['no']->seq_no; 
                                  $this->db->query("UPDATE tbl_panel_side_d14n SET wos_pallet_rh=".$pallet_no_ps14rh['id']->id." WHERE seq_no='".$seq_no."' ");
                                  $this->db->query("UPDATE tbl_panel_side_d14n SET cek_wos_rh='cek' WHERE seq_no='".$seq_no."' ");
                              }
                          $data['status'] = 'oke' ;
                    }else{
                        $data = array('status' => 'gagal');
                          $data1 = array('pallet_number' => 'ok',);
                            $this->db->insert('tbl_temp_pallet_ps14rh',$data1);
                            $pallet_no_ps14rh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14rh where pallet_number is not null order by id desc limit 1")->row();

                            for ($i=1; $i <=$per_page ; $i++) { 
                              $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where wos_pallet_rh is not null order by seq_no desc limit 1")->row();
                              $no = $total_cek['seq_no']->seq_no;
                              if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                              $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                              $seq_no = $cek_seq_no['no']->seq_no; 
                              $this->db->query("UPDATE tbl_panel_side_d14n SET wos_pallet_rh=".$pallet_no_ps14rh['id']->id." WHERE seq_no='".$seq_no."' ");
                              $this->db->query("UPDATE tbl_panel_side_d14n SET cek_wos_rh='cek' WHERE seq_no='".$seq_no."' ");
                          }
                                      $data['status'] = 'oke' ;
                      }
                  }else{
                $data['status'] = 'gagal' ;
            }
              echo json_encode($data);
            // ------------------------------------------------setting panel side d14n lh
      }elseif ($this->post=='ps14lh') {
                          $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' and cek!='' limit 1")->row();
                            if(!empty($check['id'])){   
                                $data = array('cek' => '');
                                    $this->db->update('tbl_master_cek_wos',$data,array('post' => $this->post));
                                      $log_date=isset($date) ? $date : gmdate('Y-m-d H:i:s',time()+60*60*7);
                                          $data=array(
                                          'log_out'=>$log_date,
                                        );
                                    $this->db->update($data,"tbl_user",array('post' => $this->post));
                                $this->session->sess_destroy();
                              }
                        $pallet_no_ps14lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14lh where pallet_number is not null order by id desc limit 1")->row();
                        $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
                        $per_page=$main_pallet['id']->pallet;
                        $x = $per_page * 2;
                        $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
                        $seq = $wos_pallet['id']->seq_no - $x;
                        $total_seq_wos_pallet_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows();
                        $total_seq_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_lh is not null and seq_no>'".$seq."' ")->num_rows();
                    if($total_seq_ps14lh==$total_seq_wos_pallet_ps14lh){ 
                        if($pallet_no_ps14lh['id']->id>=$main_pallet['id']->total_pallet){
                            $data = array('status' => 'gagal');
                                $data1 = array('pallet_number' => 'ok',);
                                    $this->db->truncate('tbl_temp_pallet_ps14lh');
                                        $this->db->insert('tbl_temp_pallet_ps14lh',$data1); 
                                        $pallet_no_ps14lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14lh where pallet_number is not null order by id desc limit 1")->row();
                                        
                                        for ($i=1; $i <=$per_page ; $i++) { 
                                          $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where wos_pallet_lh is not null order by seq_no desc limit 1")->row();
                                          $no = $total_cek['seq_no']->seq_no;
                                          if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                          $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                          $seq_no = $cek_seq_no['no']->seq_no; 
                                          $this->db->query("UPDATE tbl_panel_side_d14n SET wos_pallet_lh=".$pallet_no_ps14lh['id']->id." WHERE seq_no='".$seq_no."' ");
                                          $this->db->query("UPDATE tbl_panel_side_d14n SET cek_wos_lh='cek' WHERE seq_no='".$seq_no."' ");
                                      }
                                 $data['status'] = 'oke' ;
                          }else{
                                $data = array('status' => 'gagal');
                                    $data1 = array('pallet_number' => 'ok',);
                                          $this->db->insert('tbl_temp_pallet_ps14lh',$data1);
                                          $pallet_no_ps14lh['id'] = $this->db->query("select * from tbl_temp_pallet_ps14lh where pallet_number is not null order by id desc limit 1")->row();

                                          for ($i=1; $i <=$per_page ; $i++) { 
                                            $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where wos_pallet_lh is not null order by seq_no desc limit 1")->row();
                                            $no = $total_cek['seq_no']->seq_no;
                                            if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                                            $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                                            $seq_no = $cek_seq_no['no']->seq_no; 
                                            $this->db->query("UPDATE tbl_panel_side_d14n SET wos_pallet_lh=".$pallet_no_ps14lh['id']->id." WHERE seq_no='".$seq_no."' ");
                                            $this->db->query("UPDATE tbl_panel_side_d14n SET cek_wos_lh='cek' WHERE seq_no='".$seq_no."' ");
                                        }
                                              $data['status'] = 'oke' ;
                            }
                      }else{
                        $data['status'] = 'gagal' ;
                      }
                        echo json_encode($data);
          }
}

function set_all(){
  if($this->post=='ps12rh'){
              $data = array('status' => 'gagal');
              $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
              $per_page=$main_pallet['id']->pallet;
                      for ($i=1; $i <=$per_page ; $i++) { 
                        $total_set['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where remarks_rh is not null order by seq_no desc limit 1")->row();
                        $no = $total_set['seq_no']->seq_no;
                        if($no==NULL){ $no = 0; }else{ $no = $total_set['seq_no']->seq_no; }
                        $set_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                        $seq_no = $set_seq_no['no']->seq_no; 
                        $this->db->query("UPDATE tbl_panel_side_d12l SET remarks_rh='close' WHERE seq_no='".$seq_no."' ");
                        $this->db->query("UPDATE tbl_panel_side_d12l SET time_set_rh='".gmdate('Y-m-d H:i:s',time()+60*60*7)."' WHERE seq_no='".$seq_no."' ");
                    }
                    $data['status'] = 'oke' ;
              echo json_encode($data);
            }elseif($this->post=='ps12lh'){
              $data = array('status' => 'gagal');
              $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
              $per_page=$main_pallet['id']->pallet;
                      for ($i=1; $i <=$per_page ; $i++) { 
                        $total_set['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where remarks_lh is not null order by seq_no desc limit 1")->row();
                        $no = $total_set['seq_no']->seq_no;
                        if($no==NULL){ $no = 0; }else{ $no = $total_set['seq_no']->seq_no; }
                        $set_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                        $seq_no = $set_seq_no['no']->seq_no; 
                        $this->db->query("UPDATE tbl_panel_side_d12l SET remarks_lh='close' WHERE seq_no='".$seq_no."' ");
                        $this->db->query("UPDATE tbl_panel_side_d12l SET time_set_lh='".gmdate('Y-m-d H:i:s',time()+60*60*7)."' WHERE seq_no='".$seq_no."' ");
                    }
                    $data['status'] = 'oke' ;
          echo json_encode($data);
          }elseif($this->post=='ps14rh'){
            $data = array('status' => 'gagal');
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
                    for ($i=1; $i <=$per_page ; $i++) { 
                      $total_set['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where remarks_rh is not null order by seq_no desc limit 1")->row();
                      $no = $total_set['seq_no']->seq_no;
                      if($no==NULL){ $no = 0; }else{ $no = $total_set['seq_no']->seq_no; }
                      $set_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                      $seq_no = $set_seq_no['no']->seq_no; 
                      $this->db->query("UPDATE tbl_panel_side_d14n SET remarks_rh='close' WHERE seq_no='".$seq_no."' ");
                      $this->db->query("UPDATE tbl_panel_side_d14n SET time_set_rh='".gmdate('Y-m-d H:i:s',time()+60*60*7)."' WHERE seq_no='".$seq_no."' ");
                  }
                  $data['status'] = 'oke' ;
          echo json_encode($data);
          }elseif($this->post=='ps14lh'){
            $data = array('status' => 'gagal');
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
                    for ($i=1; $i <=$per_page ; $i++) { 
                      $total_set['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where remarks_lh is not null order by seq_no desc limit 1")->row();
                      $no = $total_set['seq_no']->seq_no;
                      if($no==NULL){ $no = 0; }else{ $no = $total_set['seq_no']->seq_no; }
                      $set_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                      $seq_no = $set_seq_no['no']->seq_no; 
                      $this->db->query("UPDATE tbl_panel_side_d14n SET remarks_lh='close' WHERE seq_no='".$seq_no."' ");
                      $this->db->query("UPDATE tbl_panel_side_d14n SET time_set_lh='".gmdate('Y-m-d H:i:s',time()+60*60*7)."' WHERE seq_no='".$seq_no."' ");
                  }
                  $data['status'] = 'oke' ;
        echo json_encode($data);
        }
}

// ====================================frame code compare wos pallet=====================================
function compare_wos_pallet(){
  $data = array('status' => 'gagal');
      if($this->post=='ps12rh'){
            $data = array('status' => 'gagal');
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
            $x = $per_page * 2;
            $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
            $seq = $wos_pallet['id']->seq_no - $x;
            $total_seq_wos_pallet_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_rh is not null and seq_no>'".$seq."' ")->num_rows();
            $total_seq_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh is not null and seq_no>'".$seq."' ")->num_rows();
                if($total_seq_wos_pallet_ps12rh==$total_seq_ps12rh){
                  for ($i=1; $i <=$per_page ; $i++) { 
                    $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where ok_wos_rh is not null order by seq_no desc limit 1")->row();
                    $no = $total_cek['seq_no']->seq_no;
                    if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                    $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                    $seq_no = $cek_seq_no['no']->seq_no; 
                    $this->db->query("UPDATE tbl_panel_side_d12l SET ok_wos_rh='ok' WHERE seq_no='".$seq_no."' ");
                }
                  $data['status'] = 'oke';
                }
                  echo json_encode($data);
        }elseif ($this->post=='ps12lh') {
              $data = array('status' => 'gagal');
              $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
              $per_page=$main_pallet['id']->pallet;
              $x = $per_page * 2;
              $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d12l where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
              $seq = $wos_pallet['id']->seq_no - $x;
              $total_seq_wos_pallet_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows();
              $total_seq_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_lh is not null and seq_no>'".$seq."' ")->num_rows();                
              if($total_seq_wos_pallet_ps12lh==$total_seq_ps12lh){
                for ($i=1; $i <=$per_page ; $i++) { 
                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d12l where ok_wos_lh is not null order by seq_no desc limit 1")->row();
                  $no = $total_cek['seq_no']->seq_no;
                  if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                  $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                  $seq_no = $cek_seq_no['no']->seq_no; 
                  $this->db->query("UPDATE tbl_panel_side_d12l SET ok_wos_lh='ok' WHERE seq_no='".$seq_no."' ");
              }
                    $data['status'] = 'oke';
                }
                    echo json_encode($data);
          } elseif($this->post=='ps14rh'){
            $data = array('status' => 'gagal');
            $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
            $per_page=$main_pallet['id']->pallet;
            $x = $per_page * 2;
            $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_rh is not null order by seq_no desc limit 1 ")->row();
            $seq = $wos_pallet['id']->seq_no - $x;
            $total_seq_wos_pallet_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_rh is not null and seq_no>'".$seq."' ")->num_rows();
            $total_seq_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_rh is not null and seq_no>'".$seq."' ")->num_rows();  
                if($total_seq_wos_pallet_ps14rh==$total_seq_ps14rh){
                  for ($i=1; $i <=$per_page ; $i++) { 
                    $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where ok_wos_rh is not null order by seq_no desc limit 1")->row();
                    $no = $total_cek['seq_no']->seq_no;
                    if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                    $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                    $seq_no = $cek_seq_no['no']->seq_no; 
                    $this->db->query("UPDATE tbl_panel_side_d14n SET ok_wos_rh='ok' WHERE seq_no='".$seq_no."' ");
                }
                  $data['status'] = 'oke';
                }
                  echo json_encode($data);
        }elseif ($this->post=='ps14lh') {
              $data = array('status' => 'gagal');
              $main_pallet['id'] = $this->db->query("SELECT * FROM tbl_master_main_pallet WHERE post='".$this->post."' limit 1")->row();
              $per_page=$main_pallet['id']->pallet;
              $x = $per_page * 2;
              $wos_pallet['id'] = $this->db->query("SELECT * FROM tbl_panel_side_d14n where wos_pallet_lh is not null order by seq_no desc limit 1 ")->row();
              $seq = $wos_pallet['id']->seq_no - $x;
              $total_seq_wos_pallet_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_lh is not null and seq_no>'".$seq."' ")->num_rows();
              $total_seq_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_lh is not null and seq_no>'".$seq."' ")->num_rows();
              if($total_seq_wos_pallet_ps14lh==$total_seq_ps14lh){
                for ($i=1; $i <=$per_page ; $i++) { 
                  $total_cek['seq_no'] = $this->db->query("select * from tbl_panel_side_d14n where ok_wos_lh is not null order by seq_no desc limit 1")->row();
                  $no = $total_cek['seq_no']->seq_no;
                  if($no==NULL){ $no = 0; }else{ $no = $total_cek['seq_no']->seq_no; }
                  $cek_seq_no['no'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no>'".$no."' order by seq_no asc limit 1")->row();
                  $seq_no = $cek_seq_no['no']->seq_no; 
                  $this->db->query("UPDATE tbl_panel_side_d14n SET ok_wos_lh='ok' WHERE seq_no='".$seq_no."' ");
              }
                    $data['status'] = 'oke';
                }
                    echo json_encode($data);
          }
  }

// ==================================frame code proses cek wos already setting====================================
function cek(){
  $data = array('status' => 'gagal');
      $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' limit 1")->row();
          if($check['id']->cek==''){   
                $data2 = array('cek' => 'cek');
                   $this->db->update('tbl_master_cek_wos',$data2,array('post' => $this->post ));
            }else{
                $data2 = array('cek' => '');
                    $this->db->update('tbl_master_cek_wos',$data2,array('post' => $this->post ));
              }
      $data['status'] = 'oke';
  echo json_encode($data);
}

function set_cek(){
  $data = array('status' => 'gagal');
      $check['id'] = $this->db->query("SELECT * FROM tbl_master_cek_wos WHERE post='".$this->post."' limit 1")->row();
          if($check['id']->set_all=='off'){   
                $data2 = array('set_all' => 'on');
                   $this->db->update('tbl_master_cek_wos',$data2,array('post' => $this->post ));
            }else{
                $data2 = array('set_all' => 'off');
                    $this->db->update('tbl_master_cek_wos',$data2,array('post' => $this->post ));
              }
      $data['status'] = 'oke';
  echo json_encode($data);
}

// ===================================frame code proses setting button by button each variant==================================
function setting_json_ps12rh(){
    $data = array('status' => 'gagal');
        $seq_no = $this->input->post('seq_no');
       $cek['no_prev'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no<'".$seq_no."' order by id desc limit 1")->row();
            $check['seq'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no='".$seq_no."' limit 1")->row();
            $atu=$cek['no_prev']->seq_no;
                $check['atu'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no='".$atu."' limit 1")->row();
                if($atu==0){
                  $data2 = array('remarks_rh' => 'close','time_set_rh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                  $this->db->update('tbl_panel_side_d12l',$data2,array('seq_no' => $seq_no ));
                  $data['status'] = 'ok' ;  
                }elseif(!empty($check['seq'] && $check['seq']->wos_pallet_rh!='' && $check['atu']->remarks_rh!='')){
                          $data2 = array('remarks_rh' => 'close','time_set_rh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                          $this->db->update('tbl_panel_side_d12l',$data2,array('seq_no' => $seq_no ));
                          $data['status'] = 'ok' ;
                      }
              echo json_encode($data);
  }
//------------------------------------------------------------------------------------------------------------------------------
function setting_json_ps12lh(){
    $data = array('status' => 'gagal');
        $seq_no = $this->input->post('seq_no');
        $cek['no_prev'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no<'".$seq_no."' order by id desc limit 1")->row();
        $check['seq'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no='".$seq_no."' limit 1")->row();
        $atu=$cek['no_prev']->seq_no;
          $check['atu'] = $this->db->query("select * from tbl_panel_side_d12l where seq_no='".$atu."' limit 1")->row();
          if($atu==0){
            $data2 = array('remarks_lh' => 'close','time_set_lh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
            $this->db->update('tbl_panel_side_d12l',$data2,array('seq_no' => $seq_no ));
            $data['status'] = 'ok' ;
          }elseif(!empty($check['seq'] && $check['seq']->wos_pallet_lh!='' && $check['atu']->remarks_lh!='')){
                $data2 = array('remarks_lh' => 'close','time_set_lh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                    $this->db->update('tbl_panel_side_d12l',$data2,array('seq_no' => $seq_no ));
                    $data['status'] = 'ok' ;
              }
      echo json_encode($data);
  }

  function setting_json_ps14rh(){
    $data = array('status' => 'gagal');
        $seq_no = $this->input->post('seq_no');
        $cek['no_prev'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no<'".$seq_no."' order by id desc limit 1")->row();
        $check['seq'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no='".$seq_no."' limit 1")->row();
        $atu=$cek['no_prev']->seq_no;
                $check['atu'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no='".$atu."' limit 1")->row();
                if($atu==0){
                  $data2 = array('remarks_rh' => 'close','time_set_rh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                  $this->db->update('tbl_panel_side_d14n',$data2,array('seq_no' => $seq_no ));
                  $data['status'] = 'ok' ;
                }elseif(!empty($check['seq'] && $check['seq']->wos_pallet_rh!='' && $check['atu']->remarks_rh!='')){
                          $data2 = array('remarks_rh' => 'close','time_set_rh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                          $this->db->update('tbl_panel_side_d14n',$data2,array('seq_no' => $seq_no ));
                          $data['status'] = 'ok' ;
                      }
              echo json_encode($data);
  }
//------------------------------------------------------------------------------------------------------------------------------
function setting_json_ps14lh(){
  $data = array('status' => 'gagal');
      $seq_no = $this->input->post('seq_no');
      $cek['no_prev'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no<'".$seq_no."' order by id desc limit 1")->row();
      $check['seq'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no='".$seq_no."' limit 1")->row();
      $atu=$cek['no_prev']->seq_no;
        $check['atu'] = $this->db->query("select * from tbl_panel_side_d14n where seq_no='".$atu."' limit 1")->row();
          if($atu==0){
            $data2 = array('remarks_lh' => 'close','time_set_lh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
            $this->db->update('tbl_panel_side_d14n',$data2,array('seq_no' => $seq_no ));
            $data['status'] = 'ok' ;
          }elseif(!empty($check['seq'] && $check['seq']->wos_pallet_lh!='' && $check['atu']->remarks_lh!='')){
              $data2 = array('remarks_lh' => 'close','time_set_lh' => gmdate('Y-m-d H:i:s',time()+60*60*7),);
                  $this->db->update('tbl_panel_side_d14n',$data2,array('seq_no' => $seq_no ));
                  $data['status'] = 'ok' ;
            }
    echo json_encode($data);
}
// ============================================ frame code matching settingan pcs setting all variant================================
function warning_main_pallet(){
      $data = array('status' => 'gagal');
        if($this->post=='ps12rh'){
            $data = array('status' => 'gagal');
                $total_seq_wos_pallet_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_rh is not null")->num_rows();
                $total_seq_ps12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh is not null")->num_rows();
                   if($total_seq_wos_pallet_ps12rh==$total_seq_ps12rh){ 
                      $data['status'] = 'oke';
                    }
                      echo json_encode($data);
         }elseif ($this->post=='ps12lh') {
              $data = array('status' => 'gagal');
                  $total_seq_wos_pallet_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_lh is not null")->num_rows();
                  $total_seq_ps12lh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_lh is not null")->num_rows();
                    if($total_seq_wos_pallet_ps12lh==$total_seq_ps12lh){ 
                        $data['status'] = 'oke';
                      }
                          echo json_encode($data);
            }elseif($this->post=='ps14rh'){
              $data = array('status' => 'gagal');
                  $total_seq_wos_pallet_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_rh is not null")->num_rows();
                  $total_seq_ps14rh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_rh is not null")->num_rows();
                     if($total_seq_wos_pallet_ps14rh==$total_seq_ps14rh){ 
                        $data['status'] = 'oke';
                      }
                        echo json_encode($data);
           }elseif ($this->post=='ps14lh') {
                $data = array('status' => 'gagal');
                    $total_seq_wos_pallet_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE wos_pallet_lh is not null")->num_rows();
                    $total_seq_ps14lh = $this->db->query("SELECT * FROM tbl_panel_side_d14n WHERE remarks_lh is not null")->num_rows();
                      if($total_seq_wos_pallet_ps14lh==$total_seq_ps14lh){ 
                          $data['status'] = 'oke';
                        }
                            echo json_encode($data);
              } 
  }  

// =========================================frame code update pallet per variant nya==================================
  function update_pallet(){
      $data = array('status' => 'gagal');
        $data2 = array(
            'pallet' => $this->input->post('pallet') 
        );
            $this->db->update('tbl_master_main_pallet',$data2,array('post' => $this->post));
        redirect('');
    echo json_encode($data);
  }


}
