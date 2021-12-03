<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
class Andon extends CI_Controller{
	public $tanggal;
    public $andon_date;
    function __construct(){
        parent::__construct();
		$hour= intval(gmdate('H',time()+60*60*7));
		$menit= intval(gmdate('i',time()+60*60*7));
		$cek=($hour*60)+$menit;
        $tanggal=gmdate('Y-m-d',time()+60*60*7);
		if($cek<=405){ 
                $this->andon_date=date('Y-m-d',strtotime('-1 days',strtotime($tgl)));
		}else{
                $this->andon_date=gmdate('Y-m-d',time()+60*60*7);
		}  	
		$this->tanggal=gmdate('Y-m-d',time()+60*60*7);
    }
    
 function setting(){
 	$query['title']= $this->db->get('tbl_title')->row();
 	$query['pesan']= $this->db->get_where('tbl_pesan_andon',array('area'=>'setting'))->row();
    $query['temp']= $this->db->query("SELECT * FROM tbl_temp_settingadm limit 1")->row();
    $status=$query['temp']->status;
    if($status=='OK SETTING'){
        $status='OK';
    }elseif($status=='MIS SETTING'){
        $status='NOK';
    }else{
        $status='';
    }
    if($query['temp']->label_internal!=''){
        $query['kbn']= $this->db->query("SELECT job_no FROM tbl_master_kanban where qrkbn='".$query['temp']->label_internal."' limit 1")->row();
        $label_internal=$query['temp']->label_internal.' '.$query['kbn']->job_no;
    }else{
        $label_internal='';
    }
    $summary_chart=$this->db->query("SELECT customer_code,customer_shop,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm where andon_date='".$this->andon_date."' group by customer_code,customer_shop order by id asc ");
 	$data=array(
         	'title'=>$query['title']->title,
         	'detail'=>$query['title']->detail,
         	'owner'=>$query['title']->owner,
         	'version'=>$query['title']->version,
         	'logo'=>$query['title']->logo,
         	'pesan_andon'=>$query['pesan']->pesan,
            'label_customer'=>$query['temp']->label_customer,
            'label_internal'=>$label_internal,
            'status'=>$status,
            'andon_date'=>$this->andon_date,
         	'current_scan'=>$this->db->query("SELECT a.customer_shop,a.customer_code,a.order_no,count(a.id) as total_kbn,count(if(a.status='CLOSE',a.qty_kbn,null)) as total_scan,count(if(a.status='PARTIAL',a.qty_kbn,null)) as remain,count(if(b.id is not null,b.id,null)) as mistake FROM tbl_history_settingadm a LEFT JOIN tbl_mis_setting b ON(a.label_customer=b.label_customer) where a.order_no='".$query['temp']->order_no."' GROUP BY a.order_no")->result(),

         	'total_minus'=>$this->db->query("SELECT id FROM tbl_history_settingadm WHERE status='PARTIAL' and setting_date <'".$this->tanggal."'")->num_rows(),
         	'item_list'=>$this->db->query("SELECT job_no,part_no,part_name,qty_kbn,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm WHERE order_no='".$query['temp']->order_no."' group by part_no order by id asc")->result(),
            'list_mistake'=>$this->db->query("SELECT customer_shop,customer_code,job_no,part_no,part_name,qty_kbn FROM tbl_mis_setting order by id desc limit 5")->result(),
            'summary_chart'=>$summary_chart->result(),
            'status_scan'=>$query['temp']->label_customer.$query['temp']->status.$summary_chart->num_rows(),
			);	
 	$this->load->view('content/andon/setting',$data);
 }
 
 function stock(){
 	$query['title']= $this->db->get('tbl_title')->row();
 	$query['pesan']= $this->db->get_where('tbl_pesan_andon',array('area'=>'posting'))->row();
 	$data=array(
         	'title'=>$query['title']->title,
         	'detail'=>$query['title']->detail,
         	'owner'=>$query['title']->owner,
         	'version'=>$query['title']->version,
         	'logo'=>$query['title']->logo,
          'pesan_andon'=>$query['pesan']->pesan,
         	'history_posting'=>$this->db->query("select id_kbn,job_no,part_no,part_name,min_box,max_box,count(id_kbn) as total,if(count(id_kbn)<min_box,'CRITICAL',if(count(id_kbn)>max_box,'OVER','SAVE')) as status from tbl_history_posting where location='POSTING' group by id_kbn order by total asc")->result(),
         	'total'=>$this->db->query("select id_kbn from tbl_master_kanban group by id_kbn ")->num_rows(),
         	'empty'=>$this->db->query("select a.id_kbn from tbl_history_posting a inner join tbl_master_kanban b on(a.id_kbn=b.id_kbn) where a.location='POSTING' group by a.id_kbn ")->num_rows(),
         	'data_stock'=>$this->db->query("SELECT if(count(id_kbn)<min_box,count(DISTINCT(id_kbn)),0) as critical,if(count(id_kbn)>=min_box and count(id_kbn)<=max_box ,count(DISTINCT(id_kbn)),0) as save,if(count(id_kbn)>max_box,count(DISTINCT(id_kbn)),0) as over FROM tbl_history_posting WHERE location='POSTING' group by id_kbn")->result(),
         	'data_empty'=>$this->db->query("SELECT a.id_kbn,a.job_no,a.part_no,a.part_name,c.min_box,c.max_box FROM tbl_master_kanban a LEFT JOIN tbl_history_posting b ON(a.id_kbn=b.id_kbn and b.location='POSTING') LEFT JOIN tbl_master_rak c ON(a.id_kbn=c.id_kbn) WHERE b.id_kbn IS NULL group by a.id_kbn")->result(),
         	'mis_posting'=>$this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%".$this->tanggal."%'")->num_rows(),
         	'jumlahx'=>$this->db->query("SELECT id FROM tbl_history_posting where post_date like '%".$this->tanggal."%' and location='POSTING'")->num_rows()+$this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%".$this->tanggal."%'")->num_rows(),
			);	
 	$this->load->view('content/andon/andon_stock',$data);
 }
function andon_setting(){
    $query['title']= $this->db->get('tbl_title')->row();
    $query['pesan']= $this->db->get_where('tbl_pesan_andon',array('area'=>'Packing'))->row();
    $data=array(
            'title'=>$query['title']->title,
            'detail'=>$query['title']->detail,
            'owner'=>$query['title']->owner,
            'version'=>$query['title']->version,
            'logo'=>$query['title']->logo,
            'pesan_andon'=>$query['pesan']->pesan,
            'data_customer'=>$this->db->query("SELECT customer_shop,customer_code FROM tbl_master_customer where scan='yes' ORDER BY customer_code,customer_shop asc")->result(),
            'jumlah'=>$this->db->query("SELECT id FROM tbl_master_customer where scan='yes' ORDER BY customer_code,customer_shop asc")->num_rows(),
            'data_setting'=>$this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as plan,count(if(status='CLOSE',qty_kbn,null)) as qty_scan,count(if(status='PARTIAL',qty_kbn,null)) as minus,count(distinct(del_cycle)) as cycle FROM tbl_history_settingadm  where del_date='".$this->tanggal."' GROUP BY customer_code,customer_shop ORDER BY customer_code,customer_shop asc")->result(),
            'data_mistake'=>$this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as mistake FROM tbl_mis_setting  where setting_date like '%".$this->tanggal."%' GROUP BY customer_code,customer_shop ORDER BY customer_code,customer_shop asc")->result(),

            'total_minus'=>$this->db->query("SELECT id FROM tbl_history_settingadm WHERE status='PARTIAL' and setting_date <'".$this->tanggal."'")->num_rows(),
            'total_mistake'=>$this->db->query("SELECT id FROM tbl_mis_setting WHERE setting_date <'".$this->tanggal."'")->num_rows(),
            'hl_minus'=>$this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as qty,job_no,part_no FROM tbl_history_settingadm WHERE status='PARTIAL' GROUP BY job_no ORDER BY qty desc limit 5")->result(),
            'hl_mistake'=>$this->db->query("select customer_code,job_no,part_no,count(job_no) as total from tbl_mis_setting WHERE setting_date like '%".$this->tanggal."%' group by job_no order by total desc limit 5")->result(),

            'jumlahx'=>$this->db->query("SELECT id FROM tbl_history_settingadm where setting_date like '%".$this->tanggal."%' and status!='OPEN'")->num_rows()+$this->db->query("SELECT id FROM tbl_mis_setting where setting_date like '%".$this->tanggal."%'")->num_rows(),
            );  
    $this->load->view('content/andon/andon_setting',$data);
 }
 
 function resultposting(){
	$data = array ('jumlah'=>0);
	$jumlah=$this->db->query("SELECT id FROM tbl_history_posting where post_date like '%".$this->tanggal."%' and location='POSTING'")->num_rows();
	$jumlah1=$this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%".$this->tanggal."%'")->num_rows();
	$data['jumlah']=$jumlah+$jumlah1;;
	echo json_encode($data);
	}
 function resultsetting(){
	$query['temp']= $this->db->query("SELECT * FROM tbl_temp_settingadm limit 1")->row();
    $summary_chart=$this->db->query("SELECT customer_code,customer_shop,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm where andon_date='".$this->andon_date."' group by customer_code,customer_shop order by id asc ")->num_rows();
	$data['status_scan']=$query['temp']->label_customer.$query['temp']->status.$summary_chart;
	echo json_encode($data);
	}

    function ppc(){	
	$data_field=$this->db->field_data($table);
	$date= gmdate('Y-m-d',time()+60*60*7);
	$date1=date('Y-m-d',strtotime('-30 days',strtotime($date)));
	$tgl=$date1.'-01';
	$week=gmdate("W",strtotime($tgl));
	$week=$week-1;
		$data=array(
			'week'=>$week,
			'periode'=>$date1.' s/d '.$date.' (30 Day)',
 			'table'=>'tbl_input_ppc',
 			'data_field'=>$data_field,
 			'field_filter'=>$field,
			 'input_ppc'=>$this->db->query("select * from tbl_input_ppc where job_no!='' order by ss_p1 asc ")->result(),
			);	
				$this->load->view('content/andon/andon_ppc',$data);
			
		
		  
	}

}