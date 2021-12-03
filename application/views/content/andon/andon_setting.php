<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 html,body { 
      height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
      font-family: sans-serif;
      background-color:white; 
      font-size: 12px; 
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
        font-size: 22px;
      }
    }
     @media (min-width: 1500px) {
      .header{
        font-size: 24px;
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
<table style="width: 100%;height: 100%;border-spacing: 1px;padding: 0px;background-color: black;" class="header">
  <tr>
    <th>    
      <table style="height: 100%;width: 100%;border-spacing: 1px;border-collapse: separate;border:2px solid #fff;">
       <tr>
          <td style="height: 10%;">
            <table style="border-spacing: 0px;background-color:#eee;color: black;">
                <tr>
                  <td rowspan="2" style="width: 10%;border:1px solid #000">
                    <img src="<?=base_url('assets/img/'.$logo);?>" style="width:100%;height:50%;vertical-align: middle;"></td>
                  <td align="center" style="border-bottom:none;font-size:200%;border-top:1px solid #000">MONITORING SETTING</td>
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
        <tr style="background-color: #000;">
          <td style="border: 1px solid #fff;padding:1px;">
            <!-- 1.bungkus -->
            <table style="width: 100%;height:100%;border-spacing: 0px;border: 0px solid #fff;text-shadow: 1px 1px black">
              <!-- bagi tinggi-->
              <tr>
                <td style="padding: 0px;">
                  <!-- isi-->
                  <table style="width: 100%;height:100%;border-spacing: 0px;">
                    <tr>
                      <!-- bagi kolom -->
                      <td style="width: 25%">
                         
                          <table style="width:100%;height:100%;color:white;text-align: center;background-color: black;font-weight: bold;font-size:26px;border-spacing: 2px;">
                            <tr>
                               <td style="border:1px solid #bbb;width: 40%;height: 60px;background-color:teal">
                                Last <br>Setting
                              </td>
                              <td style="border:1px solid #bbb;font-size: 28px;background-color:teal">
                                Total (&#931;Box)
                              </td> 
                            </tr>  
                            <tr>
                              <td style="border:1px solid #bbb;background-color:orange">
                                Minus
                              </td>
                                <td style="border:1px solid #bbb;color: orange;font-size: 300%;">
                           <!--    <?php foreach ($total_minus as $key) { ?>
                                <?php $key->minus; ?>
                             <?php } ?> -->
                              <?=$total_minus;?>
                              </td>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color:red">
                                Mistake
                              </td>
                                <td style="border:1px solid #bbb;color: red;font-size: 300%;">
                               <?=$total_mistake;?>
                              </td>
                            </tr>                                                
                        </table>

                      </td>
                      <td id="summaryminus">
                         
                           <table style="width:100%;height:100%;color:white;text-align: center;background-color: black;font-weight: bold;border-spacing: 1px;border:1px solid #000;">
                            <tr style="background-color:orange;color: white;height: 30px;font-size: 26px;">
                              <td colspan="6">
                                Hight Light Minus
                              </td>
                            </tr>
                            <tr style="background-color:teal;color: white;height: 30px;">
                              <td>
                               No.
                              </td>
                               <td>
                               Cust.
                              </td>
                              <td>
                               Job No.
                              </td>
                              <td>
                               Part No.
                              </td>                          
                              <td>
                               &#931;Box
                              </td>
                            </tr>
                            <?php $x=1; foreach ($hl_minus as $key) {?>
                            <tr>
                              <td style="border:1px solid #bbb;">
                               <?=$x++;?>
                              </td>
                               <td style="border:1px solid #bbb;">
                               <?=$key->customer_code;?>
                              </td>
                              <td style="border:1px solid #bbb;">
                               <?=$key->job_no;?>
                              </td>
                              <td style="border:1px solid #bbb;">
                              <?=$key->part_no;?>
                              </td>
                              <td style="border:1px solid #bbb;">
                               <?=$key->qty;?>
                              </td>
                            </tr> 
                            <?php } ?>                           
                          </table>

                      </td>
                      <td id="summarymistake">
                         
                           <table style="width:100%;height:100%;color:white;text-align: center;background-color: black;font-weight: bold;border-spacing: 1px;border:1px solid #000;">
                            <tr style="background-color:red;color: white;height: 30px;font-size: 26px;">
                              <td colspan="6">
                               Hight Light Mistake
                              </td>
                            </tr>
                            <tr style="background-color:teal;color: white;height: 30px;">
                              <td>
                               No.
                              </td>
                               <td>
                               Cust.
                              </td>
                              <td>
                               Job No.
                              </td>
                              <td>
                               Part No.
                              </td>
                              <td>
                               &#931;Box
                              </td>
                            </tr>
                            <?php $x=1; foreach ($hl_mistake as $key) {?>
                            <tr>
                              <td style="border:1px solid #bbb;">
                               <?=$x++;?>
                              </td>
                                <td style="border:1px solid #bbb;">
                               <?=$key->customer_code; ?>
                              </td>
                              <td style="border:1px solid #bbb;">
                                  <?=$key->job_no; ?>
                              </td>
                              <td style="border:1px solid #bbb;">
                                  <?=$key->part_no; ?>
                              </td>
                              <td style="border:1px solid #bbb;">
                                   <?=$key->total; ?>
                              </td>
                            </tr> 
                            <?php }
                            if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){ ?>
                            <tr>  
                              <td style="border:1px solid #bbb;">
                               <?=$s;?>
                              </td>
                                <td style="border:1px solid #bbb;">
                               &nbsp;
                              </td>
                              <td style="border:1px solid #bbb;">
                                 &nbsp;
                              </td>
                              <td style="border:1px solid #bbb;">
                                 &nbsp;
                              </td>
                              <td style="border:1px solid #bbb;">
                                  &nbsp;
                              </td>
                            </tr>
                          <?php } } ?>
                          </table>

                      </td>
                       <!-- bagi kolom -->         
                    </tr>
                  </table>
                  <!-- isi-->
                </td>
              </tr>
              <tr style="height: 60%">
                <td style="padding: 0px;">
                  <!-- isi-->
                  <table style="width: 100%;height:100%;border-spacing: 0px;">
                    <tr>
                      <!-- bagi kolom -->
                      <td>
                         
                          <table style="width:100%;height:100%;color:white;text-align: center;background-color: black;font-weight: bold;border-spacing: 1px;">
                            <tr>
                               <td rowspan="2" style="border:1px solid #bbb;background-color: teal;">
                                Current
                              </td>
                              <td colspan="<?=$jumlah;?>" style="border:1px solid #bbb;background-color: teal;height:15%;font-size: 100%">
                                Customer Shop
                              </td>                           
                            </tr>
                            <tr>
                             <?php foreach ($data_customer as $key) { ?>
                                <td style="border:1px solid #bbb;background-color: teal;height:10%;font-size:100%;width: <?=90/$jumlah;?>%">
                                <?=$key->customer_shop;?>
                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: teal;width: 10%">
                                Total Cycle
                              </td>
                              <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: white">
                                  <?php foreach ($data_setting as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo $key->cycle;
                                   } } ?>

                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: teal;width: 10%">
                                Plan(box)
                              </td>
                              <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: white">
                                  <?php foreach ($data_setting as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo $key->plan;
                                   } } ?>

                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: teal;">
                                Scan(box)
                              </td>
                                <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: white">
                                  <?php foreach ($data_setting as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo $key->qty_scan;
                                   } } ?>

                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: teal;">
                                ( % )
                              </td>
                              <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: lime">
                                  <?php foreach ($data_setting as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo round($key->qty_scan/$key->plan,4)*100;
                                   } } ?>

                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: orange;">
                                Minus
                              </td>
                              <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: orange">
                                  <?php foreach ($data_setting as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo $key->minus;
                                   } } ?>
                              </td>
                              <?php } ?>
                            </tr>
                            <tr>
                              <td style="border:1px solid #bbb;background-color: red;">
                                Mistake
                              </td>
                              <?php foreach ($data_customer as $row) { ?>
                                <td style="border:1px solid #bbb;background-color: black;height:10%;font-size:100%;color: red">
                                  <?php foreach ($data_mistake as $key){ if($row->customer_shop==$key->customer_shop){ 
                                  echo $key->mistake;
                                   } } ?>

                              </td>
                              <?php } ?>
                            </tr>
                        </table>

                      </td>
                       <!-- bagi kolom -->         
                    </tr>
                  </table>
                  <!-- isi-->
                </td>
              </tr>
              <!-- bagi tinggi-->             
            </table>
            <!-- 1.bungkus -->

          </td>         
        </tr>
      </table>
    </th>
  </tr>  
  <tr style="height: 4%;">
    <td>
      <marquee style="font-size: 20px;vertical-align: middle;color:yellow"><i>MARI KITA RAIH ZERO MINUS & MISTAKE SETTING LOGISTIC !!!</i></marquee>
    </td>
  </tr>
</table>
<div id="test" style="display: none"></div>
<script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js?='.$this->encrypt->sha1(rand(1000,10000000)));?>"></script>
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
                      url :"<?=base_url('andon/resultsetting');?>",
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
