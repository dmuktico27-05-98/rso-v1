<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?=$title;?></title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   <link rel="stylesheet" href="<?=base_url('assets/lte/datatables/dataTables.bootstrap.css');?>">
  <link rel="shortcut icon" href="<?=base_url('assets/img/'.$logo);?>" type="image/x-icon" />
<style type="text/css">
  html,body { 
      height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
      font-family: sans-serif;
      background-color:white; 
      font-size: 14px; 
	    text-align:center;
      font-weight: bold;     
    }
    @media (max-width: 899px) {
      .header{
        font-size: 12px;
      }
    }
    @media (min-width: 900px) and (max-width: 1500px) {
      .header{
        font-size: 24px;
      }
    }
     @media (min-width: 1500px) {
      .header{
        font-size: 28px;
      }
    }
    table{
      height: 100%;
      width:100%;
    }
   
</style>
  <!-- Ionicons -->
  <script type="text/javascript">
    //set timezone
    <?php date_default_timezone_set('Asia/Jakarta'); ?>
    //buat object date berdasarkan waktu di server
    var serverTime = new Date(<?php print date('Y, m, d, H, i, s, 0'); ?>);
    //buat object date berdasarkan waktu di client
    var clientTime = new Date();
    //hitung selisih
    var Diff = serverTime.getTime() - clientTime.getTime();    
    //fungsi displayTime yang dipanggil di bodyOnLoad dieksekusi tiap 1000ms = 1detik
    function displayServerTime(){
        //buat object date berdasarkan waktu di client
        var clientTime = new Date();
        //buat object date dengan menghitung selisih waktu client dan server
        var time = new Date(clientTime.getTime() + Diff);
        //ambil nilai jam
        var sh = time.getHours().toString();
        //ambil nilai menit
        var sm = time.getMinutes().toString();
        //ambil nilai detik
        var ss = time.getSeconds().toString();
        //tampilkan jam:menit:detik dengan menambahkan angka 0 jika angkanya cuma satu digit (0-9)
        $("#clock").text((sh.length==1?"0"+sh:sh) + ":" + (sm.length==1?"0"+sm:sm) + ":" + (ss.length==1?"0"+ss:ss));
    }
    setInterval('displayServerTime()',500);
</script>
</head>
<body>
<table style="border-spacing: 0px;color: white;background-color:black" class="header">
  <tr>
    <td style="padding:5px;">
    	<table style="border-spacing: 0px;">
         <tr>
          <td style="height: 10%;">
            <table style="border-spacing: 0px;background-color:#eee;color: black;">
                <tr>
                  <td rowspan="2" style="width: 10%;border:1px solid #000">
                    <img src="<?=base_url('assets/img/'.$logo);?>" style="width:100%;height:50%;vertical-align: middle;"></td>
                  <td align="center" style="border-bottom:none;font-size:200%;border-top:1px solid #000">MONITORING STOCK</td>
                  <td rowspan="2" style="width:20%;font-size:150%;border:1px solid #000">
                    <?=strtoupper(gmdate('d-m-Y',time()+60*60*7));?>
                    <span id="clock"><?=gmdate('H:i:s',time()+60*60*7);?></span>
                  </td>
                </tr>
                <tr>
                  <td align="center" style="border-bottom:1px solid #000;vertical-align: top">PT. Yoska Prima Inti</td>
                </tr>
              </table>

        </td>
      </tr>
      <tr>
        <td colspan="2" style="border:1px solid #000">  
               <table style="border-spacing: 0px;background-color:#eee">
                     <tr>
                      <td style="height: 25%;padding: 5px;">
                        <table style="width: 100%;height:100%;border-spacing:0px;">
                         <tr>
                             <td style="width:20%">
                               <table style="width: 100%;width:100%;border-spacing: 0px;background-color:red;color:white">
                                <tr>
                                  <td style="height: 25%;border:1px solid white;font-size:150%">
                                    EMPTY
                                  </td>
                                </tr>
                                 <tr>
                                  <td style="border:1px solid white;font-size:500%">
                                 <?=$total-$empty;?>
                                  </td>
                                 </tr>
                               </table>
                             </td>
                              <td style="width:20%">
                                <table style="width: 100%;width:100%;border-spacing: 0px;background-color:yellow;color:black">
                                <tr>
                                  <td style="height: 25%;border:1px solid white;font-size:150%">
                                    CRITICAL
                                  </td>
                                </tr>
                                 <tr>
                                  <td style="border:1px solid white;font-size:500%">
                                    <?php foreach ($data_stock as $key) {
                                      $critical=$critical+$key->critical;
                                    } 
                                    echo $critical; ?>
                                  </td>
                                 </tr>
                               </table>
                             </td>
                              <td style="width:20%">
                                <table style="width: 100%;width:100%;border-spacing: 0px;background-color:green;color:white">
                                <tr>
                                  <td style="height: 25%;border:1px solid white;font-size:150%">
                                    SAVE
                                  </td>
                                </tr>
                                 <tr>
                                  <td style="border:1px solid white;font-size:500%">
                                   <?php foreach ($data_stock as $key) {
                                      $save=$save+$key->save;
                                    } 
                                    echo $save; ?>
                                  </td>
                                 </tr>
                               </table>
                             </td>
                              <td style="width:20%">
                                <table style="width: 100%;width:100%;border-spacing: 0px;background-color:blue;color:white">
                                <tr>
                                  <td style="height: 25%;border:1px solid white;font-size:150%">
                                    OVER
                                  </td>
                                </tr>
                                 <tr>
                                  <td style="border:1px solid white;font-size:500%">
                                    <?php foreach ($data_stock as $key) {
                                      $over=$over+$key->over;
                                    } 
                                    echo $over; ?>
                                  </td>
                                 </tr>
                               </table>
                             </td>
                              <td style="width:20%">
                                <table style="width: 100%;width:100%;border-spacing: 0px;background-color:red;color:white">
                                <tr>
                                  <td style="height: 25%;border:1px solid white;font-size:150%">
                                    MIS POSTING
                                  </td>
                                </tr>
                                 <tr>
                                  <td style="border:1px solid white;font-size:500%">
                                    <?=$mis_posting;?>
                                  </td>
                                 </tr>
                               </table>
                             </td>
                          </tr>
                        </table>
                      </td>
                     </tr>
                    <tr>
                      <td style="vertical-align: top;background-color:#eee">
                         <table  id="mytable" style="width: 100%;height: 100%;text-align: center;font-size: 110%;">
                          <thead>
                          <tr style="background-color:#555299; color:white; font-weight: bold;">
                            <th style="text-align: center;padding:5px;border:1px solid #eee;height: 40px;">JOB NO</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">PART NO</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">PART NAME</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">MIN(BOX)</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">MAX(BOX)</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">STOCK(BOX)</th>
                            <th style="text-align: center;padding:5px;border:1px solid #eee;">STATUS</th>
                           
                          </tr>
                        </thead>
                        <tbody>
                       <?php
                          $i=1;
                          foreach ($history_posting as $key) { 
                           if($key->status=='CRITICAL'){
                              $bg="background-color:yellow;color:black;";
                            }elseif($key->status=='CRITICAL'){
                              $bg="background-color:green;color:white;";
                            }else{
                              $bg="background-color:blue;color:white;";
                            }
                            ?>                         
                          <tr style="<?=$bg;?>">
                            <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->job_no;?></td>
                            <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->part_no;?></td>
                            <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->part_name;?></td>
                            <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->min_box;?></td>
                              <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->max_box;?></td>
                              <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->total;?></td>
                              <td style="text-align: center;padding:5px;border:1px solid #eee;"><?=$key->status;?></td>
                          </tr>
                          <?php 
                          $i=$i+1;  } ?> 
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </table>

           </td>
          </tr>
     <tr style="height: 4%;background-color:#eee;">
    <td>
      <marquee style="font-size: 20px;vertical-align: middle;color:black"><i>MARI KITA RAIH ZERO MINUS & MISTAKE SETTING LOGISTIC !!!</i></marquee>
    </td>
  </tr>
        </table>

    </td>
  </tr>
</table>
<script src="<?=site_url('assets/lte/jquery/jquery-2.2.3.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/jquery.dataTables.min.js')?>"></script>

<script type="text/javascript">
$(document).ready(function() {
     $('#mytable').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "pageLength" :20,
            "order": [], 
            "scrollY":true,
            "scrollX":false,
            "scrollCollapse":true,
            "paging":false,
            "fixedColumns":false,
            "AutoWidth": true,
            "LengthChange": false,
            "bLengthChange": false,
            "bInfo": false,
            "bFilter":false,
          });
 
}); 

</script>
<script type="text/javascript">
$.ajaxSetup ({
    cache: false
});
$(document).ready(function() {
    doesConnectionExist();
       selesai();
     
});
function selesai() {
  setTimeout(function() {
    doesConnectionExist();
    selesai();
  }, 1000);
}

function doesConnectionExist() {
    var xhr = new XMLHttpRequest();
    var file = "#";
    var randomNum = Math.round(Math.random() * 10000);
    var jumlah = "<?=$jumlahx;?>";

    xhr.open('HEAD', file + "?nocache=" + randomNum, true);
    xhr.send();
    
    xhr.addEventListener("readystatechange", processRequest, false);

    function processRequest(e) {
      if (xhr.readyState == 4) {
        if (xhr.status >= 200 && xhr.status < 304) {
          $(document).ready(function(){
                    $.ajax({
                      async: true,
                      type: "POST",
                      url :"<?=base_url('andon/resultposting');?>",
                      cache:false,
                      dataType: 'json',
                      data: "jumlah="+jumlah,                
                      success: function(data){                       
                       if(jumlah!=data.jumlah){
                        location.reload();
                       }
                    }
                });
            
           });
        } else {
            tempAlert("KONEKSI ERROR <br><br><br>Silakan Periksa Koneksi Jaringan / Network Anda !!",4000);
        }
      }
    }
}

function tempAlert(msg,duration)
{
 var el = document.createElement("div");
 el.setAttribute("style","position:absolute;top:15%;left:25%;background-color:yellow");
 el.innerHTML = msg;
 el.style.width = "670px";
el.style.height = "530px";
el.style.textAlign = "center";
el.style.fontSize = "50px";
 setTimeout(function(){
  el.parentNode.removeChild(el);
 },duration);
 document.body.appendChild(el);
}
</script>

<script type="text/javascript">
    setTimeout(function () { 
      location.reload();
    }, (5 * 60) * 1000);
</script>
</body>
</html>