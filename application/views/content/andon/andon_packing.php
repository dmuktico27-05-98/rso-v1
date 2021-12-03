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
            <td rowspan="2" width="15%"><img src="<?=base_url('assets/img/'.$logo);?>" style="width:100%;height:100px;vertical-align: middle;"></td>
            <td align="center" style="border-bottom:none;font-size:36px;">MONITORING PACKING</td>
            <td rowspan="2" width="15%" align="center" style="font-size:20px;">
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
  <tr height="17%">
    <td>
      <table style="width: 100%;height: 100%;border-spacing: 0px;">
        <tr>
          <td style="width: 10%">
            	<table border="1" cellspacing="0" cellpadding="0" style="height:100%;width: 100%">
                  <tr>
                    <td style="background-color:#9B9BFF;">&nbsp;MODEL</td>
                  </tr>
                  <tr>
                    <td style="background-color:#9B9BFF;">&nbsp;LOT NO</td>
                  </tr>
                  <tr>
                    <td style="background-color:#9B9BFF;">&nbsp;CASE</td>
                  </tr>
                </table>
          </td>
          <?php $i=1; foreach ($data_lot as $key) { ?>
           <td style="width: 10%">
              <table border="1" cellspacing="0" cellpadding="0" style="height:100%;width: 100%;text-align: center;">
                  <tr>
                    <td><?=$key->model;?></td>
                  </tr>
                  <tr>
                    <td><?=$key->lot_no;?></td>
                  </tr>
                  <tr>
                    <td><?=$key->case_no;?></td>
                  </tr>
                </table>
          </td>
          <?php $j=$j+1; } $j=$j+1; for($x=$j;$x<=9;$x++){ ?>
          <td style="width: 10%">
              <table border="1" cellspacing="0" cellpadding="0" style="height:100%;width: 100%">
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table>
          </td>
        <?php } ?>
        </tr>
      </table>
    </td>
  </tr>
  <tr height="1%">
    <td></td>
  </tr>
  <tr valign="top">
    <td>
    	<table width="100%" border="1" cellspacing="0" cellpadding="0" style="width: 100%;height:100%; text-align:center">
          <tr style="background-color:#9B9BFF; height:10%">
            <td colspan="2" align="center">ENGINE</td>
            <td colspan="2">SMALL</td>
            <td>MIDDLE</td>
            <td>BIG</td>
          </tr>
          <tr  style="background-color:#9B9BFF; height:10%">
            <?php foreach ($data_lane as $key) { ?>
            <td><?=$key->lane_no;?></td>
            <?php } ?>
          </tr>
          <tr valign="top">
            <td>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr style="">
                    <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                    <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
                  </tr>
                  <?php foreach ($data_lot1 as $key) { if($key->lane_no=="1"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
                </table>

            </td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr style="">
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
              </tr>
              <?php foreach ($data_lot1 as $key) { if($key->lane_no=="2"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr style="">
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
              </tr>
              <?php foreach ($data_lot1 as $key) { if($key->lane_no=="A"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr style="">
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
              </tr>
              <?php foreach ($data_lot1 as $key) { if($key->lane_no=="B"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr style="">
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
              </tr>
              <?php foreach ($data_lot1 as $key) { if($key->lane_no=="C"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr style="">
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;LOT</td>
                <td style="background-color:#9B9BFF; border-bottom:1px solid #000;">&nbsp;CASE</td>
              </tr>
              <?php foreach ($data_lot1 as $key) { if($key->lane_no=="D"){ ?>
                  <tr>
                    <td style="border-bottom:1px solid #000;"><?=$key->lot_no;?></td>
                    <td style="border-bottom:1px solid #000;"><?=$key->case_no;?></td>
                  </tr>
                <?php }} ?>
            </table></td>
          </tr>
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
