<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backup extends CI_Controller{
   
  // backup files in directory
  function files(){
    ini_set('memory_limit','1024M');
     $opt = array(
       'src' => 'application', // dir name to backup
       'dst' => 'backup/file' // dir name backup output destination
     );
     
     // Codeigniter v3x
     $this->load->library('recurseZip_lib', $opt);
     $this->recursezip_lib->compress();
     //$download = $this->recursezip_lib->compress();
     /* Codeigniter v2x
     $zip    = $this->load->library('recurseZip_lib', $opt);     
     $download = $zip->compress();
     */
     
     //redirect(base_url($download));
  }
   
  // backup database.sql
  public function database(){
     ini_set('memory_limit','1024M');
     $date=gmdate('Y-m-d',time()+60*60*7); 
     $tgl=date('Y-m-d H:i:s',strtotime('-30 days',strtotime($date)));

     $this->db->query("INSERT INTO tbl_history_production_backup SELECT * FROM tbl_history_production where tbl_history_production.status='OK' and tbl_history_production.prod_date<='".$tgl."'");
     $this->db->query("DELETE FROM tbl_history_production where status='OK' and prod_date<='".$tgl."'");
     $this->load->dbutil();
   
     $prefs = array(
       'format' => 'zip',
       'filename' => 'my_db_backup.sql'
     );
   
     $backup = $this->dbutil->backup($prefs);
     $db_name = 'backup-on-' .gmdate("Y-m-d",time()+60*60*7). '.zip'; // file name
     $save  = 'backup/db/' . $db_name; // dir name backup output destination
   
     $this->load->helper('file');
     write_file($save, $backup);
   	
   	 //save to downlod
     //$this->load->helper('download');
     //force_download($db_name, $backup);
     redirect('andon/production');
  }
   
}