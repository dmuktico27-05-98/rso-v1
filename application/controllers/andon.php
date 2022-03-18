<?php if (!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!!');
// require('./excel/vendor/autoload.php');


// use PhpOffice\PhpSpreadsheet\IOFactory;
// use PhpOffice\PhpSpreadsheet\Spreadsheet;
class Andon extends CI_Controller
{
	public $tanggal;
	public $andon_date;
	function __construct()
	{
		parent::__construct();
		$hour = intval(gmdate('H', time() + 60 * 60 * 7));
		$menit = intval(gmdate('i', time() + 60 * 60 * 7));
		$cek = ($hour * 60) + $menit;
		$tanggal = gmdate('Y-m-d', time() + 60 * 60 * 7);
		if ($cek <= 405) {
			$this->andon_date = date('Y-m-d', strtotime('-1 days', strtotime($tgl)));
		} else {
			$this->andon_date = gmdate('Y-m-d', time() + 60 * 60 * 7);
		}
		$this->tanggal = gmdate('Y-m-d', time() + 60 * 60 * 7);
	}

	function setting()
	{
		$query['title'] = $this->db->get('tbl_title')->row();
		$query['pesan'] = $this->db->get_where('tbl_pesan_andon', array('area' => 'setting'))->row();
		$query['temp'] = $this->db->query("SELECT * FROM tbl_temp_settingadm limit 1")->row();
		$status = $query['temp']->status;
		if ($status == 'OK SETTING') {
			$status = 'OK';
		} elseif ($status == 'MIS SETTING') {
			$status = 'NOK';
		} else {
			$status = '';
		}
		if ($query['temp']->label_internal != '') {
			$query['kbn'] = $this->db->query("SELECT job_no FROM tbl_master_kanban where qrkbn='" . $query['temp']->label_internal . "' limit 1")->row();
			$label_internal = $query['temp']->label_internal . ' ' . $query['kbn']->job_no;
		} else {
			$label_internal = '';
		}
		$summary_chart = $this->db->query("SELECT customer_code,customer_shop,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm where andon_date='" . $this->andon_date . "' group by customer_code,customer_shop order by id asc ");
		$data = array(
			'title' => $query['title']->title,
			'detail' => $query['title']->detail,
			'owner' => $query['title']->owner,
			'version' => $query['title']->version,
			'logo' => $query['title']->logo,
			'pesan_andon' => $query['pesan']->pesan,
			'label_customer' => $query['temp']->label_customer,
			'label_internal' => $label_internal,
			'status' => $status,
			'andon_date' => $this->andon_date,
			'current_scan' => $this->db->query("SELECT a.customer_shop,a.customer_code,a.order_no,count(a.id) as total_kbn,count(if(a.status='CLOSE',a.qty_kbn,null)) as total_scan,count(if(a.status='PARTIAL',a.qty_kbn,null)) as remain,count(if(b.id is not null,b.id,null)) as mistake FROM tbl_history_settingadm a LEFT JOIN tbl_mis_setting b ON(a.label_customer=b.label_customer) where a.order_no='" . $query['temp']->order_no . "' GROUP BY a.order_no")->result(),

			'total_minus' => $this->db->query("SELECT id FROM tbl_history_settingadm WHERE status='PARTIAL' and setting_date <'" . $this->tanggal . "'")->num_rows(),
			'item_list' => $this->db->query("SELECT job_no,part_no,part_name,qty_kbn,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm WHERE order_no='" . $query['temp']->order_no . "' group by part_no order by id asc")->result(),
			'list_mistake' => $this->db->query("SELECT customer_shop,customer_code,job_no,part_no,part_name,qty_kbn FROM tbl_mis_setting order by id desc limit 5")->result(),
			'summary_chart' => $summary_chart->result(),
			'status_scan' => $query['temp']->label_customer . $query['temp']->status . $summary_chart->num_rows(),
		);
		$this->load->view('content/andon/setting', $data);
	}

	function stock()
	{
		$query['title'] = $this->db->get('tbl_title')->row();
		$query['pesan'] = $this->db->get_where('tbl_pesan_andon', array('area' => 'posting'))->row();
		$data = array(
			'title' => $query['title']->title,
			'detail' => $query['title']->detail,
			'owner' => $query['title']->owner,
			'version' => $query['title']->version,
			'logo' => $query['title']->logo,
			'pesan_andon' => $query['pesan']->pesan,
			'history_posting' => $this->db->query("select id_kbn,job_no,part_no,part_name,min_box,max_box,count(id_kbn) as total,if(count(id_kbn)<min_box,'CRITICAL',if(count(id_kbn)>max_box,'OVER','SAVE')) as status from tbl_history_posting where location='POSTING' group by id_kbn order by total asc")->result(),
			'total' => $this->db->query("select id_kbn from tbl_master_kanban group by id_kbn ")->num_rows(),
			'empty' => $this->db->query("select a.id_kbn from tbl_history_posting a inner join tbl_master_kanban b on(a.id_kbn=b.id_kbn) where a.location='POSTING' group by a.id_kbn ")->num_rows(),
			'data_stock' => $this->db->query("SELECT if(count(id_kbn)<min_box,count(DISTINCT(id_kbn)),0) as critical,if(count(id_kbn)>=min_box and count(id_kbn)<=max_box ,count(DISTINCT(id_kbn)),0) as save,if(count(id_kbn)>max_box,count(DISTINCT(id_kbn)),0) as over FROM tbl_history_posting WHERE location='POSTING' group by id_kbn")->result(),
			'data_empty' => $this->db->query("SELECT a.id_kbn,a.job_no,a.part_no,a.part_name,c.min_box,c.max_box FROM tbl_master_kanban a LEFT JOIN tbl_history_posting b ON(a.id_kbn=b.id_kbn and b.location='POSTING') LEFT JOIN tbl_master_rak c ON(a.id_kbn=c.id_kbn) WHERE b.id_kbn IS NULL group by a.id_kbn")->result(),
			'mis_posting' => $this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%" . $this->tanggal . "%'")->num_rows(),
			'jumlahx' => $this->db->query("SELECT id FROM tbl_history_posting where post_date like '%" . $this->tanggal . "%' and location='POSTING'")->num_rows() + $this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%" . $this->tanggal . "%'")->num_rows(),
		);
		$this->load->view('content/andon/andon_stock', $data);
	}

	function andon_setting()
	{
		$query['title'] = $this->db->get('tbl_title')->row();
		$query['pesan'] = $this->db->get_where('tbl_pesan_andon', array('area' => 'Packing'))->row();
		$data = array(
			'title' => $query['title']->title,
			'detail' => $query['title']->detail,
			'owner' => $query['title']->owner,
			'version' => $query['title']->version,
			'logo' => $query['title']->logo,
			'pesan_andon' => $query['pesan']->pesan,
			'data_customer' => $this->db->query("SELECT customer_shop,customer_code FROM tbl_master_customer where scan='yes' ORDER BY customer_code,customer_shop asc")->result(),
			'jumlah' => $this->db->query("SELECT id FROM tbl_master_customer where scan='yes' ORDER BY customer_code,customer_shop asc")->num_rows(),
			'data_setting' => $this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as plan,count(if(status='CLOSE',qty_kbn,null)) as qty_scan,count(if(status='PARTIAL',qty_kbn,null)) as minus,count(distinct(del_cycle)) as cycle FROM tbl_history_settingadm  where del_date='" . $this->tanggal . "' GROUP BY customer_code,customer_shop ORDER BY customer_code,customer_shop asc")->result(),
			'data_mistake' => $this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as mistake FROM tbl_mis_setting  where setting_date like '%" . $this->tanggal . "%' GROUP BY customer_code,customer_shop ORDER BY customer_code,customer_shop asc")->result(),

			'total_minus' => $this->db->query("SELECT id FROM tbl_history_settingadm WHERE status='PARTIAL' and setting_date <'" . $this->tanggal . "'")->num_rows(),
			'total_mistake' => $this->db->query("SELECT id FROM tbl_mis_setting WHERE setting_date <'" . $this->tanggal . "'")->num_rows(),
			'hl_minus' => $this->db->query("SELECT customer_shop,customer_code,count(qty_kbn) as qty,job_no,part_no FROM tbl_history_settingadm WHERE status='PARTIAL' GROUP BY job_no ORDER BY qty desc limit 5")->result(),
			'hl_mistake' => $this->db->query("select customer_code,job_no,part_no,count(job_no) as total from tbl_mis_setting WHERE setting_date like '%" . $this->tanggal . "%' group by job_no order by total desc limit 5")->result(),

			'jumlahx' => $this->db->query("SELECT id FROM tbl_history_settingadm where setting_date like '%" . $this->tanggal . "%' and status!='OPEN'")->num_rows() + $this->db->query("SELECT id FROM tbl_mis_setting where setting_date like '%" . $this->tanggal . "%'")->num_rows(),
		);
		$this->load->view('content/andon/andon_setting', $data);
	}

	function resultposting()
	{
		$data = array('jumlah' => 0);
		$jumlah = $this->db->query("SELECT id FROM tbl_history_posting where post_date like '%" . $this->tanggal . "%' and location='POSTING'")->num_rows();
		$jumlah1 = $this->db->query("SELECT id FROM tbl_mis_posting where post_date like '%" . $this->tanggal . "%'")->num_rows();
		$data['jumlah'] = $jumlah + $jumlah1;;
		echo json_encode($data);
	}
	function resultsetting()
	{
		$query['temp'] = $this->db->query("SELECT * FROM tbl_temp_settingadm limit 1")->row();
		$summary_chart = $this->db->query("SELECT customer_code,customer_shop,count(id) as total_kbn,count(if(status='CLOSE',id,null)) as total_scan FROM tbl_history_settingadm where andon_date='" . $this->andon_date . "' group by customer_code,customer_shop order by id asc ")->num_rows();
		$data['status_scan'] = $query['temp']->label_customer . $query['temp']->status . $summary_chart;
		echo json_encode($data);
	}


	function ppc_new()
	{	
		date_default_timezone_set('Asia/Jakarta'); 

		$nowtime = date('Y-m-d H:i:s');		
		$start = date('Y-m-d').' 16:00:00';
		$end = date('Y-m-d',strtotime($start . "+1 days")).' 03:59:59';

		$now = date('Y-m-d');
		$shift ="";
		$where = "";	
		$dateplus = date('Y-m-d',strtotime($now . "+1 days"));
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));
		if($start <= $nowtime && $nowtime <= $end) {
			$where = " Where `create_date` BETWEEN '$now 16:00:00' AND '$dateplus 03:59:59'";	
			$shift = "Day";
		}else{
			$where = " Where `create_date` BETWEEN '$datemin 15:59:59' AND '$now 04:00:00' ";	
			$shift = "Night";
		}				
		
		if((isset($_GET["date"] ) && $_GET["date"] != "" && $_GET["date"] != "NaN-NaN-NaN" )&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];	
			echo $date;					
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));
			if($shift == "Day"){				
				$where = " Where `create_date` BETWEEN '$date 16:00:00' AND '$dateplus 03:59:59'";									
			}else{
				$where = " Where `create_date` BETWEEN '$dateplus 04:00:00' AND '$dateplus 15:59:59'";	
			}
		}	
		 
		if((isset($_GET["model"] ) && $_GET["model"] != "")&&(isset($_GET["machine"] ) && $_GET["machine"] != "")){			
			$model = $_GET["model"];
			$machine = $_GET["machine"];
			$where = $where." and `model` = '$model' and `machine` = '$machine'";
		}else{			
			if(isset($_GET["model"] ) && $_GET["model"] != ""){				
				$model = $_GET["model"];			
				$where = $where." and `model` = '$model'";
			}elseif(isset($_GET["machine"] ) && $_GET["machine"] != ""){
				$machine = $_GET["machine"];			
				$where = $where." and `machine` = '$machine'";
			}
		}

		$query = "select * from tbl_input_general$where  order by (ss_p1+ss_p4+ss_kap+ss_ppl+ss_process) ASC";
		//echo $query;			
		$hasil = $this->db->query("$query")->result();
		
		$i = 1;
		$c = count($hasil);
		$JobNo = "";
		$P1 ="";
		$P4 ="";
		$KAP ="";
		$PPL ="";
		$Process ="";
		
		foreach($hasil as $h){					
			$JobNo = $c != $i ? "$JobNo'$h->job_no',":"$JobNo'$h->job_no'";
			$P1 =+ $c != $i ?  "$P1$h->ss_p1," : "$P1$h->ss_p1";
			$P4 =+ $c != $i ?  "$P4$h->ss_p4," : "$P4$h->ss_p4";
			$KAP =+ $c != $i ?  "$KAP$h->ss_kap," : "$KAP$h->ss_kap";
			$PPL =+ $c != $i ?  "$PPL$h->ss_ppl," : "$PPL$h->ss_ppl";
			$Process =+ $c != $i ?  "$Process$h->ss_process," : "$Process$h->ss_process";
			$i++;
		}	
		
		$date = gmdate('Y-m-d', time() + 60 * 60 * 7);
		$date1 = date('Y-m-d', strtotime('-30 days', strtotime($date)));
		$tgl = $date1 . '-01';
		$week = gmdate("W", strtotime($tgl));
		$week = $week - 1;
		$query ="select * from tbl_input_docking where job_no!='' order by ss_p1 asc"; 
		$data = array(
			'week' => $week,
			'periode' => $date1 . ' s/d ' . $date . ' (30 Day)',
			'table' => 'tbl_input_docking',			
			'query' => $query,
			'input_ppc' => $hasil,
			'JobNo' => $JobNo,
			'P1' => $P1,
			'P4' => $P4,
			'KAP' => $KAP,
			'PPL' => $PPL,
			'Process' => $Process,
			'Shift' => $shift		
		);
		$this->load->view('content/andon/andon_ppc_new', $data);
	}	

	function general(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');		
		$start = date('Y-m-d').' 04:00:00';		
		$end = date('Y-m-d').' 18:00:00';
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
				

		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$date'";
			}else{
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;	
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$dateplus'";
			}
		}else{
			if($start <= $nowtime && $nowtime <= $end) {
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;			
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";	
				$shift = 'Night';
			}else{
				if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;	
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$datemin'";		
				}else{
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;	
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";		
				}			
				$shift = 'Day';						
			}		
		}	

		if(isset($_GET["proses"] ) && $_GET["proses"] != ""){				
			$proses = $_GET["proses"];			
			$where = $where." and `proses` = '$proses'";			
		}
		
		$models = $this->db->query("select model from tbl_input_general$where group by model")->result();
		$machines = $this->db->query("select machine from tbl_input_general$where group by machine")->result();
		$pss = $this->db->query("select ps from tbl_input_general$where group by ps")->result();		
				
		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["machine"] ) && $_GET["machine"] != ""){
			$machine = $_GET["machine"];			
			$where = $where." and `machine` = '$machine'";
		}
		if(isset($_GET["ps"] ) && $_GET["ps"] != ""){
			$ps = $_GET["ps"];
			$where = $where." and `ps` = '$ps'";
		}				

		$query = "select * from tbl_input_general$where order by (ss_p1+ss_p4+ss_kap+ss_ppl+ss_process) ASC";						
		$hasil = $this->db->query("$query")->result();	

		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
		
		$patern = "NULL";
		switch ($patan) {
			case 'A':
				$patern = "PATAN A,PATAN B,PATAN C,PATAN D";
				break;
			case 'B':
				$patern = "PATAN B,PATAN C,PATAN D,PATAN A";
				break;
			case 'C':
				$patern = "PATAN C,PATAN D,PATAN A,PATAN B";
				break;
			default:
				$patern = "PATAN D,PATAN A,PATAN B,PATAN C";
				break;
		}		

		$data = array('title' => 'Andon',							
			'List' => $hasil,			
			'Shift' => $shift,
			'Models' => $models,
			'Machines' => $machines,
			'PSs' => $pss,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		$this->load->view('content/andon/andon_general',$data);
	}

	public function ppc(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');		
		$start = date('Y-m-d').' 07:15:00';		
		$end = date('Y-m-d').' 20:30:00';
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
					
		
		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' and (create_date>='$date 07:15:00' and create_date<='$date 20:30:00')";
			}else{
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' and (create_date>='$date 20:30:01' and create_date<='$dateplus 17:14:59')";
			}
		}else{
			if(isset($_GET["proses"] ) && $_GET["proses"] == "normal"){	
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';			
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
					$patan = $this->db->query("$query")->row()->patan;			
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";	
					$shift = 'Night';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$datemin'";		
					}else{
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";		
					}			
					$shift = 'Day';						
				}					
			}else{				
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;			
					$where = " Where `patan` = '$patan' and (create_date>='$start' and create_date<='$end')";
					$shift = 'Day';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 07:14:59') {
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' and (create_date>='$now 00:00:00' and create_date<='$now 03:59:59')";
					}else{
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";											
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' and (create_date>='$now 20:30:01' and create_date<='$now 23:59:59')";
					}							
					$shift = 'Night';						
				}		
			}

		}	
		
		$models = $this->db->query("select model from tbl_input_ppc$where group by model")->result();
		$machines = $this->db->query("select machine from tbl_input_ppc$where group by machine")->result();
		$pss = $this->db->query("select ps from tbl_input_ppc$where group by ps")->result();
		$group = $this->db->query("select create_date from tbl_input_ppc$where group by create_date")->result();						
		
		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["machine"] ) && $_GET["machine"] != ""){
			$machine = $_GET["machine"];			
			$where = $where." and `machine` = '$machine'";
		}
		if(isset($_GET["ps"] ) && $_GET["ps"] != ""){
			$ps = $_GET["ps"];
			$where = $where." and `ps` = '$ps'";
		}		

		if(isset($_GET["jam"] ) && $_GET["jam"] != ""){
			$jam = $_GET["jam"];
			$where = $where." and TIME(create_date) = '$jam'";
		}

		$query = "select * from tbl_input_ppc$where order by (ss_p1+ss_p4+ss_kap+ss_ppl+ss_process) ASC";
		$hasil = $this->db->query("$query")->result();					
		
		$machine = $this->db->query("select machine from tbl_input_ppc$where group by machine")->result();
		$ps = $this->db->query("select ps from tbl_input_ppc$where group by ps")->result();
		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
				
		$patern = "";
		switch ($patan) {
			case 'A':
				$patern = "PATAN A,PATAN B,PATAN C,PATAN D";
				break;
			case 'B':
				$patern = "PATAN B,PATAN C,PATAN D,PATAN A";
				break;
			case 'C':
				$patern = "PATAN C,PATAN D,PATAN A,PATAN B";
				break;
			default:
				$patern = "PATAN D,PATAN A,PATAN B,PATAN C";
				break;
		}

		$data = array('title' => 'Andon',							
			'List' => $hasil,			
			'Shift' => $shift,
			'Group' => $group,
			'Models' => $models,
			'Machines' => $machines,
			'PSs' => $pss,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		$this->load->view('content/andon/andon_ppc',$data);
	}

	public function ppl(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');				
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
					
		
		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$shift = $this->db->query("$query")->row()->shift;				
				$where = " Where `shift` = '$shift' and (create_date>='$date 07:15:00' and create_date<='$date 20:30:00')";
			}else{
				$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$shift = $this->db->query("$query")->row()->shift;				
				$where = " Where `shift` = '$shift' and (create_date>='$date 20:30:01' and create_date<='$dateplus 17:14:59')";
			}
		}else{
			if(isset($_GET["proses"] ) && $_GET["proses"] == "normal"){	
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';			
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
					$shift = $this->db->query("$query")->row()->shift;			
					$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$now'";	
					$shift = 'N';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$datemin'";		
					}else{
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$now'";		
					}			
					$shift = 'D';						
				}					
			}else{				
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$shift = $this->db->query("$query")->row()->shift;			
					$where = " Where `shift` = '$shift' and (create_date>='$start' and create_date<='$end')";
					$shift = 'D';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 07:14:59') {
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' and (create_date>='$now 00:00:00' and create_date<='$now 03:59:59')";
					}else{
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";											
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' and (create_date>='$now 20:30:01' and create_date<='$now 23:59:59')";
					}							
					$shift = 'N';						
				}		
			}
		
		}	
		$models = $this->db->query("select model from tbl_input_ppl$where group by model")->result();
		$vendors = $this->db->query("select vendor from tbl_input_ppl$where group by vendor")->result();
		$areas = $this->db->query("select area from tbl_input_ppl$where group by area")->result();
		$group = $this->db->query("select create_date from tbl_input_ppl$where group by create_date")->result();						
		
		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["vendor"] ) && $_GET["vendor"] != ""){
			$vendor = $_GET["vendor"];			
			$where = $where." and `vendor` = '$vendor'";
		}
		if(isset($_GET["area"] ) && $_GET["area"] != ""){
			$area = $_GET["area"];
			$where = $where." and `area` = '$area'";
		}		
		if(isset($_GET["jam"] ) && $_GET["jam"] != ""){
			$jam = $_GET["jam"];
			$where = $where." and TIME(create_date) = '$jam'";
		}		

		$query = "select * from tbl_input_ppl$where order by (ss_ppl + ss_r + ss_otw) ASC";						
		$hasil = $this->db->query("$query")->result();
		
		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
		
		if(isset($_GET["proses"] ) && $_GET["proses"] == "special"){
		$patern = "NULL";
		switch ($shift) {
			case 'D':
				$patern = "Day,Night,Day,Night";
				break;
			case 'N':
				$patern = "Night,Day,Night,Day";
				break;
		}
		if($shift=="D"){
			$s = "Day";
		}else{
			$s = "Night";
		}
		
		}else{
			$patern = "NULL";
			switch ($shift) {
				case 'D':
					$patern = "Night,Day,Night,Day";
					break;
				case 'N':
					$patern = "Day,Night,Day,Night";
					break;
			}

			if($shift=="D"){
				$s = "Night";
			}else{
				$s = "Day";
			}
		}
		
		$data = array('title' => 'Andon',							
			'List' => $hasil,			
			'Shift' => $shift,
			'sip' => $s,
			'Group' => $group,
			'Models' => $models,
			'Vendors' => $vendors,
			'Areas' => $areas,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		
		$this->load->view('content/andon/andon_ppl',$data);
	}

	function pdfppc(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');				
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
		
		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' and (create_date>='$date 07:15:00' and create_date<='$date 20:30:00')";
			}else{
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' and (create_date>='$date 20:30:01' and create_date<='$dateplus 17:14:59')";
			}
			
		}else{
			if(isset($_GET["proses"] ) && $_GET["proses"] == "normal"){	
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';			
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
					$patan = $this->db->query("$query")->row()->patan;			
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";	
					$shift = 'Night';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$datemin'";		
					}else{
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";		
					}			
					$shift = 'Day';						
				}					
			}else{				
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;			
					$where = " Where `patan` = '$patan' and (create_date>='$start' and create_date<='$end')";
					$shift = 'Day';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 07:14:59') {
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' and (create_date>='$now 00:00:00' and create_date<='$now 03:59:59')";
					}else{
						$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";											
						$patan = $this->db->query("$query")->row()->patan;	
						$where = " Where `patan` = '$patan' and (create_date>='$now 20:30:01' and create_date<='$now 23:59:59')";
					}							
					$shift = 'Night';						
				}		
			}
		}	

		$group = $this->db->query("select create_date from tbl_input_ppc$where group by create_date")->result();						

		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["machine"] ) && $_GET["machine"] != ""){
			$machine = $_GET["machine"];			
			$where = $where." and `machine` = '$machine'";
		}
		if(isset($_GET["ps"] ) && $_GET["ps"] != ""){
			$ps = $_GET["ps"];
			$where = $where." and `ps` = '$ps'";
		}		
		if(isset($_GET["jam"] ) && $_GET["jam"] != ""){
			$jam = $_GET["jam"];
			$where = $where." and TIME(create_date) = '$jam'";
		}	

		$query = "select * from tbl_input_ppc$where order by (ss_p1+ss_p4+ss_kap+ss_ppl+ss_process) ASC";	
		$hasil = $this->db->query("$query")->result();					

		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
		
		$patern = "";
		switch ($patan) {
			case 'A':
				$patern = "PATAN A,PATAN B,PATAN C,PATAN D";
				break;
			case 'B':
				$patern = "PATAN B,PATAN C,PATAN D,PATAN A";
				break;
			case 'C':
				$patern = "PATAN C,PATAN D,PATAN A,PATAN B";
				break;
			default:
				$patern = "PATAN D,PATAN A,PATAN B,PATAN C";
				break;
		}		

		$data = array('title' => 'Andon',				
			'List' => $hasil,			
			'Shift' => $shift,
			'Group' => $group,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		$this->load->view('content/andon/pdfppc',$data);
	}	
	
	function pdfppl(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');				
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
					
		
		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$shift = $this->db->query("$query")->row()->shift;				
				$where = " Where `shift` = '$shift' and (create_date>='$date 07:15:00' and create_date<='$date 20:30:00')";
			}else{
				$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$shift = $this->db->query("$query")->row()->shift;				
				$where = " Where `shift` = '$shift' and (create_date>='$date 20:30:01' and create_date<='$dateplus 17:14:59')";
			}
		}else{
			if(isset($_GET["proses"] ) && $_GET["proses"] == "normal"){	
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';			
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
					$shift = $this->db->query("$query")->row()->shift;			
					$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$now'";	
					$shift = 'N';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$datemin'";		
					}else{
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' AND DATE(`create_date`) = '$now'";		
					}			
					$shift = 'D';						
				}
									
			}else{				
				$start = date('Y-m-d').' 07:15:00';		
				$end = date('Y-m-d').' 20:30:00';
				if($start <= $nowtime && $nowtime <= $end) {
					$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$shift = $this->db->query("$query")->row()->shift;			
					$where = " Where `shift` = '$shift' and (create_date>='$start' and create_date<='$end')";
					$shift = 'D';
				}else{
					if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 07:14:59') {
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' and (create_date>='$now 00:00:00' and create_date<='$now 03:59:59')";
					}else{
						$query = "Select `shift` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'N'";											
						$shift = $this->db->query("$query")->row()->shift;	
						$where = " Where `shift` = '$shift' and (create_date>='$now 20:30:01' and create_date<='$now 23:59:59')";
					}							
					$shift = 'N';						
				}		
			}		
		}	
		
		$group = $this->db->query("select create_date from tbl_input_ppc$where group by create_date")->result();						
		
		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["vendor"] ) && $_GET["vendor"] != ""){
			$vendor = $_GET["vendor"];			
			$where = $where." and `vendor` = '$vendor'";
		}
		if(isset($_GET["area"] ) && $_GET["area"] != ""){
			$area = $_GET["area"];
			$where = $where." and `area` = '$area'";
		}		
		if(isset($_GET["jam"] ) && $_GET["jam"] != ""){
			$jam = $_GET["jam"];
			$where = $where." and TIME(create_date) = '$jam'";
		}	

		$query = "select * from tbl_input_ppl$where order by (ss_ppl + ss_r + ss_otw) ASC";		
		$hasil = $this->db->query("$query")->result();					

		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
		if(isset($_GET["proses"] ) && $_GET["proses"] == "special"){
		$patern = "NULL";
		switch ($shift) {
			case 'D':
				$patern = "Day,Night,Day,Night";
				break;
			case 'N':
				$patern = "Night,Day,Night,Day";
				break;
		}
		if($shift=="D"){
			$s = "Day";
		}else{
			$s = "Night";
		}
		
		}else{
			$patern = "NULL";
			switch ($shift) {
				case 'D':
					$patern = "Night,Day,Night,Day";
					break;
				case 'N':
					$patern = "Day,Night,Day,Night";
					break;
			}

			if($shift=="D"){
				$s = "Night";
			}else{
				$s = "Day";
			}
		}
		$data = array('title' => 'Andon',				
			'List' => $hasil,			
			'Shift' => $shift,
			'sip' => $s,
			'Group' => $group,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		$this->load->view('content/andon/pdfppl',$data);
	}

	function pdf(){
		date_default_timezone_set('Asia/Jakarta'); 
		$nowtime = date('Y-m-d H:i:s');		
		$start = date('Y-m-d').' 04:00:00';		
		$end = date('Y-m-d').' 18:00:00';
		$now = date('Y-m-d');		
		$datemin = date('Y-m-d',strtotime($now . "-1 days"));		
		$where = "";
		$patan = "";
		$shift = ""	;		
				

		if((isset($_GET["date"] ) && $_GET["date"] != "")&&(isset($_GET["shift"] ) && $_GET["shift"] != "")){
			$shift = $_GET["shift"];
			$date = $_GET["date"];
			$dateplus = date('Y-m-d',strtotime($date . "+1 days"));										
			if($shift == "Day"){
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'D'";						
				$patan = $this->db->query("$query")->row()->patan;				
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$date'";
			}else{
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$date' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;	
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$dateplus'";
			}
		}else{
			if($start <= $nowtime && $nowtime <= $end) {
				$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'N'";						
				$patan = $this->db->query("$query")->row()->patan;			
				$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";	
				$shift = 'Night';
			}else{
				if ($now.' 00:00:00' <= $nowtime && $nowtime <= $now.' 03:59:59') {
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$datemin' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;	
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$datemin'";		
				}else{
					$query = "Select `patan` from `tbl_master_patan` Where `dates` = '$now' AND `shift` = 'D'";						
					$patan = $this->db->query("$query")->row()->patan;	
					$where = " Where `patan` = '$patan' AND DATE(`create_date`) = '$now'";		
				}			
				$shift = 'Day';						
			}		
		}	

		if(isset($_GET["proses"] ) && $_GET["proses"] != ""){				
			$proses = $_GET["proses"];			
			$where = $where." and `proses` = '$proses'";			
		}					
				
		if(isset($_GET["model"] ) && $_GET["model"] != ""){				
			$model = $_GET["model"];			
			$where = $where." and `model` = '$model'";			
		}
		if(isset($_GET["machine"] ) && $_GET["machine"] != ""){
			$machine = $_GET["machine"];			
			$where = $where." and `machine` = '$machine'";
		}
		if(isset($_GET["ps"] ) && $_GET["ps"] != ""){
			$ps = $_GET["ps"];
			$where = $where." and `ps` = '$ps'";
		}				

		$query = "select * from tbl_input_general $where order by (ss_p1+ss_p4+ss_kap+ss_ppl+ss_process) ASC";						
		$hasil = $this->db->query("$query")->result();


		$c = count($hasil)-1;
		$Tanggal =date('d/m/Y',strtotime($hasil[$c]->create_date));
		$Jam = date('H:i:s',strtotime($hasil[$c]->create_date));
		
		$patern = "NULL";
		switch ($patan) {
			case 'A':
				$patern = "PATAN A,PATAN B,PATAN C,PATAN D";
				break;
			case 'B':
				$patern = "PATAN B,PATAN C,PATAN D,PATAN A";
				break;
			case 'C':
				$patern = "PATAN C,PATAN D,PATAN A,PATAN B";
				break;
			default:
				$patern = "PATAN D,PATAN A,PATAN B,PATAN C";
				break;
		}		

		$data = array('title' => 'Andon',				
			'List' => $hasil,			
			'Shift' => $shift,
			'pat' => explode( ',', $patern ),
			'Scale' => 500 +(35*($c-1)),
			'Tanggal' => $Tanggal,
			'Jam' => $Jam);	
		$this->load->view('content/andon/pdf',$data);
	}
	
}
