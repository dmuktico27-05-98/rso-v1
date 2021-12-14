<!DOCTYPE html>
<html lang="en">
<head>
  <title><?php echo $title;?></title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/fontawesome-free/css/all.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">  
  <!-- JQVMap -->
  <link rel="stylesheet" href="<?php echo base_url() ?>plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url() ?>dist/css/adminlte.min.css">
</head>
<body>
<div class="wrapper">
<section class="content">
<div class="container-fluid p-2" id="print">
<?php $counter = 1;
$count = 0;
while(count($List)!=0){ 
    echo (($counter-1) % 25) ==0 && $count != 0? '<div class="html2pdf__page-break"></div>' : '' ;
    ?>
    <table style="width: 100%; <?= (($counter-1) % 25) ==0  && $count != 0? 'margin-top: 0.1875cm;':''?>">
        <tr>
            <td style="height: 12%;width: 10%;background:url('<?php echo base_url("assets/img/logo-daihatsu.png") ?>');background-repeat: no-repeat;background-size:100% 100%;">&nbsp;
            </td>
            <td class="bg-dark">
                <h2 class="text-center display-5">Andon Rundown Stock <?= $Shift ?> Shift <?= isset($_GET["machine"])?$_GET["machine"]:""?></h2>
                <h1 class="text-center display-6">PT. Astra Daihatsu Motor Stamping Plant</h2>
            </td>
            <td width="15%" class="bg-danger">
                <h3 class="text-center display-5"><?= $pat[0] ?></h3>
                <table width="100%">               
                    <tr>
                        <td width="40%" class="pl-2">
                            Tanggal
                        </td>
                        <td>
                            <?= ' '.$Tanggal ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="pl-2">                        
                            Jam
                        </td>
                        <td>
                            <?= ' '.$Jam ?>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="p-0">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-bordered table-sm" width="100%" style="table-layout: fixed;">
                            <thead class="thead-light">                            
                                <tr class="text-center">
                                    <th rowspan="2" width="3%">No</th>
                                    <th rowspan="2" width="5%" style="word-wrap: break-word;">Job No</th>
                                    <th rowspan="2" width="6%" style="word-wrap: break-word;">Patan Schedule</th>
                                    <th rowspan="2" width="6%" style="word-wrap: break-word;">Pcs/Shift (Max)</th>
                                    <th rowspan="2" width="3%">T/T</th>
                                    <th colspan="5" width="22%">Stock</th>
                                    <th rowspan="2" width="7%" style="word-wrap: break-word;">Total Stock Strength</th>
                                    <th rowspan="2" width="6%"><?= $pat[0] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[1] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[2] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[3] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[0] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[1] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[2] ?></th>
                                    <th rowspan="2" width="6%"><?= $pat[3] ?></th>
                                </tr>
                                <tr class="text-center">                                
                                    <th class="bg-primary">P1</th>
                                    <th class="bg-success">P4</th>
                                    <th class="bg-warning">KAP</th>
                                    <th class="bg-danger">PPL</th>
                                    <th class="bg-dark" style="word-wrap: break-word;">Repair</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php for($j=1 ;$j<=25; $j++) {
                                    $key = $List[$count];
                                    $p1 = 0.734375 * $key->ss_p1;
                                    $p4 = 0.734375 * ($key->ss_p1 + $key->ss_p4);
                                    $kap = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap);
                                    $ppl = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap + $key->ss_ppl);
                                    $process = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap + $key->ss_ppl + $key->ss_process)
                                    ?>
                                    <tr class="text-center">  
                                        <td><?= $counter; ?></td>                                   
                                        <td><?= $key->job_no; ?></td>
                                        <td><?= $key->ps; ?></td>
                                        <td><?= $key->maks_shift; ?></td>
                                         <td><?= $key->t_t; ?></td>
                                         <td><?= $key->sto_p1; ?></td>
                                         <td><?= $key->sto_p4; ?></td>
                                         <td><?= $key->sto_kap; ?></td>
                                         <td><?= $key->sto_ppl; ?></td>
                                         <td><?= $key->sto_process; ?></td>
                                         <td><?= $key->ss_p1+$key->ss_p4+$key->ss_kap+$key->ss_ppl+$key->ss_process; ?>
                                        <td class="pl-0">
                                            <div class="bg-dark text-right pr-1 position-absolute" style="width: <?= $process > 47 ? 47 : $process; ?>%;z-index: -1;"><?= $key->ss_process; ?></div>
                                            <div class="bg-danger text-right pr-1 position-absolute" style="width: <?= $ppl > 47 ? 47 : $ppl; ?>%;z-index: -1;"><?= $key->ss_ppl; ?></div>
                                            <div class="bg-warning text-right pr-1 position-absolute" style="width: <?= $kap > 47 ? 47 : $kap; ?>%;z-index: -1;"><?= $key->ss_kap; ?></div>
                                            <div class="bg-success  text-right pr-1 position-absolute" style="width: <?= $p4 > 47 ? 47 : $p4; ?>%;z-index: -1;"><?= $key->ss_p4; ?></div>
                                            <div class="bg-primary  text-right pr-1 position-absolute " style="width: <?= $p1 > 47 ? 47 : $p1; ?>%;z-index: -1;"><?= $key->ss_p1; ?></div>
                                        </td>
                                    </tr>
                                    <?php $counter++;$count++;  if(($counter-1) == count($List))break;} ?>                              
                            </tbody>                    
                        </table>                    
                    </div>
                </div>          
            </td>
        </tr>    
    </table>
<?php if($counter-1 == count($List))break;} ?>
</div>
</section>
</div>

<script src="<?php echo base_url() ?>plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<?php echo base_url() ?>plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?php echo base_url() ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo base_url() ?>dist/js/adminlte.js"></script>

<script src="<?php echo base_url() ?>plugins/html2pdf/html2pdf.bundle.min.js"></script>

<script>  
  var opt = {  
  filename:     'myfile.pdf',
  image:        { type: 'jpeg', quality: 0.98 },
  html2canvas:  { scale: 2},
  jsPDF:        { unit: 'px', format: 'a3', orientation: 'l', hotfixes: ["px_scaling"] }
};

const print = this.document.getElementById("print");
html2pdf().set(opt).from(print).save();
</script>


</body>
</html>