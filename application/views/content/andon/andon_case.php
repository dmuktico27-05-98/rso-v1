<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html>
<head>
  <style type="text/css">
    html,body { 
      height: 100%;
      width: 100%;
      margin: 0px;  
      padding: 0px;
      font-size: 10px;
      font-weight: bold;
    }

  
  </style>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width: 100%;height:100%;padding: 0px;font-family:Arial;font-size:22px;border-spacing: 0px;" >
  <tr height="12%">
    <td>
    	<table width="100%" border="1" cellspacing="0" cellpadding="0" style="width: 100%;height:100%; background-color:#9B9BFF">
          <tr>
            <td rowspan="2" width="8%"><img src="<?=base_url('assets/img/'.$logo);?>" style="width:200px;height:100px;vertical-align: middle;"></td>
            <td align="center" style="border-bottom:none;font-size:36px;">MONITORING STOCK CASE</td>
            <td rowspan="2" width="17%" align="center" style="font-size:20px;">
              <?=strtoupper(gmdate('l',time()+60*60*7));?>,<br>
              <?=strtoupper(gmdate('d-m-Y',time()+60*60*7));?>
            	<span id="clock"><?=gmdate('H:i:s',time()+60*60*7);?></span>
            </td>
          </tr>
          <tr>
            <td align="center" style="border-top:none;vertical-align: top">PT. Nippon Konpo Indonesia</td>
          </tr>
        </table>

    </td>
  </tr>
  <tr height="1%">
    <td></td>
  </tr>
  <tr valign="top">
    <td>
    	<table width="100%" border="1" cellspacing="0" cellpadding="0" style="text-align: center;">
          <tr align="center" style="background-color:#9B9BFF; height:40px">
            <td width="5%">No</td>
            <td width="10%">MODEL</td>
            <td width="10%">COUNTRY</td>
            <td width="8%">LOT</td>
            <td width="8%">CONT</td>
            <td width="8%">PLAN</td>
            <td width="8%">PACKING</td>
            <td>INV./PC NO.</td>
            <td>VANNING</td>
          </tr>
      <?php if(!empty($data_lot)){ $i=1; foreach ($data_lot as $key) { ?>
          <tr>
            <td><?=$i;?></td>
            <td><?=$key->model;?></td>
            <td><?=$key->country;?></td>
            <td><?=$key->lot_no;?></td>
            <td><?=$key->cont_no;?></td>
            <td><?=$key->plan;?></td>
            <td><?=$key->packing;?></td>
            <td><?=$key->pc_no;?></td>
            <td><?=$key->vanning_date;?></td>
          </tr>
        <?php $i=$i+1; }}else{ ?>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        <?php }?>
        </table>

    </td>
  </tr>
  <tr height="1%">
    <td></td>
  </tr>
  <tr>
    <td height="5%"> <marquee style="font-size: 20px;vertical-align: middle;color:black"><i><?=$pesan_andon;?></i></marquee></td>
  </tr>
</table>
<script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js?='.$this->encrypt->sha1(rand(1000,10000000)));?>"></script>


</body>
</html>
