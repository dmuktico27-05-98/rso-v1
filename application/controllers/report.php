<?php if(!defined('BASEPATH')) exit('Hacking Attempt : Keluar dari sistem..!');
class Report extends CI_Controller{
function __construct(){
        parent::__construct();
        if($this->session->userdata('isLogin') != true){
			redirect('');
		}
}
function production(){	
			$data=array(
			 'nav'=>'Report Production',
			 'url'=>'report/production',			 
			 'data_shift'=>$this->db->query("select * from tbl_shift")->result(),
			);	
			$this->load->view('content/report/report',$data);		
 }
function stock(){	
			$data=array(
			 'nav'=>'Report Sock FG',
			 'url'=>'report/stock',			 
			 'data_shift'=>$this->db->query("select * from tbl_shift")->result(),
			);	
			$this->load->view('content/report/report',$data);		
 }
 function delivery(){	
			$data=array(
			 'nav'=>'Report Delivery',
			 'url'=>'report/delivery',			 
			 'data_shift'=>$this->db->query("select * from tbl_shift")->result(),
			);	
			$this->load->view('content/report/report',$data);		
 }
 function createreport(){
 		$shift=$this->input->post("shift");
 		$prod_date=$this->input->post("prod_date");	
 		$query="select b.zona,b.line,a.partno,a.partname,a.qty_kbn,a.model,b.wo_sequence,b.pattern,b.qty_wo,b.qty_ok,b.qty_repair,b.qty_ng from tbl_pattern_detail a left join tbl_workorder b on(a.partno=b.partno and a.pattern=b.pattern and b.prod_date='".$prod_date."' and b.shift='".$shift."') order by b.zona,b.line,a.pattern asc";
 		$queryquality="SELECT *,count(category) as freq  FROM tbl_history_quality WHERE prod_date='".$prod_date."' and shift='".$shift."' group by zona,line,category,problem order by zona,line,category";
 		$querydelay="SELECT *,round(sum(durasi),2) as durasi  FROM tbl_history_delay WHERE prod_date='".$prod_date."' and shift='".$shift."' group by zona,line,category,problem order by zona,line,category";
 		$querydandori="SELECT *,round(sum(durasi),2) as durasi  FROM tbl_history_dandori WHERE prod_date='".$prod_date."'  and shift='".$shift."' group by zona,line,dandori order by zona,line,dandori";
 		$data=array(
 			'shift'=>$shift,
 			'prod_date'=>$prod_date,
			'data_prod'=>$this->db->query($query)->result(),
			'data_quality'=>$this->db->query($queryquality)->result(),
			'data_delay'=>$this->db->query($querydelay)->result(),
			'data_dandori'=>$this->db->query($querydandori)->result(),
			);	
		$this->load->view('content/report/reportprint.html',$data);
	
 }
 function repair(){	
			$data=array(
			 'nav'=>'Report Repair',
			 'url'=>'report/repair',
			 'data_shift'=>$this->db->query("select * from tbl_shift")->result(),			 
			 'data_partlist'=>$this->db->query("select * from tbl_partlist")->result(),
			);	
			$this->load->view('content/report/reportrepair',$data);		
 }
 function createreportrepair(){
 		$partno=$this->input->post("partno");
 		$prod_date=$this->input->post("prod_date");	
 		$shift=$this->input->post("shift");	
 		$data1['part']= $this->db->get_where('tbl_partlist',array('partno'=>$partno))->row();
 		$zona=$data1['part']->zona;
 		$line=$data1['part']->line;
 		$data2['line']= $this->db->get_where('tbl_line',array('zona'=>$zona,'line'=>$line))->row();
 		$query=$this->db->query("select * from tbl_history_repair where partno='".$partno."' and prod_date='".$prod_date."' and shift='".$shift."'")->result();
 		$queryproblem=$this->db->query("select * from tbl_problem_repair where partno='".$partno."'")->result();
 		$querysubproblem=$this->db->query("select * from tbl_subproblem_repair")->result();
 		foreach ($query as $key) {
 			$pic=$key->pic;
 		}
 		$data=array(
 			'partno'=>$partno,
 			'prod_date'=>$prod_date,
 			'shift'=>$shift,
 			'model'=>$data1['part']->model,
 			'partname'=>$data1['part']->partname,
 			'name'=>$data2['line']->name,
 			'pic'=>$pic,
 			'data_problem'=>$queryproblem,
 			'data_subproblem'=>$querysubproblem,
			'data_prod'=>$this->db->query("select titik,problem,problem_repair,count(problem) as jumlah from tbl_history_repair where partno='".$partno."' and prod_date='".$prod_date."' and shift='".$shift."' group by problem,problem_repair,titik")->result(),
			'data_prod1'=>$this->db->query("select problem_repair,count(problem) as jumlah from tbl_history_repair where partno='".$partno."' and prod_date='".$prod_date."' and shift='".$shift."' group by problem_repair")->result(),
			);	
		$this->load->view('content/report/reportprintrepair.html',$data);
	
 }
}