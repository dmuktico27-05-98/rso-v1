<?php
require_once('assets/lte/mpdf60/qrcode/qrcode.class.php');
?>
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
      background-color: white;
      color: #000;
      text-align: center;
      
    }

    @media print {
    .pagebreak { page-break-before: always; } /* page-break-after works, as well */
    }
</style>
</head>
<body>

  <?php $i=1; foreach ($data_table as $key) { $j=$i % 7;  $x=$i % 70;
  if($x==1){echo '<table style="width: 100%;height:100%;text-align: center;font-family: sans-serif;">';}
    if($j==1){ echo"<tr style='height: 100%'><td style='padding:5px'>"; }else{ echo"<td style='padding:5px'>";} ?>
  <table style="width: 100%;height:100%;border:1px solid #444;">
    <tr>
      <td style="margin:0px;">
        <table style="width: 100%;height:100%;text-align: center;margin:4.4px">
          <tr>
            <td  style="padding:0px,margin:0px">  
            <span style="font-size:20px;padding: 0px"><b>SCAN HERE!</b></span><br/>
              <img src="<?=base_url('assets/lte/mpdf60/qrcode/image.php?msg='.urlencode($key->qr_code).'&amp;err='.urlencode('Q'));?>" 
              style="width:80px;height: 80px;text-align: center;padding:3.8px;">
            <br><span style="font-size:10px;padding: 0px"><?=$key->qr_code;?></span>
            </td>
          </tr>         
        </table>
      </td>
    </tr>   
  </table>

<?php if($j==0){ echo"</td></tr>"; if($x==0){echo'</table><div class="pagebreak"></div>';} }else{ echo"</td>";} $i=$i+1; } ?>

<script type="text/javascript">
   window.print();
   
</script>
</body>
</html>