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
    <table style="width: 100%;">
        <tr>
            <td style="height: 10%;width: 8%;background:url('<?php echo base_url("assets/img/logo-daihatsu.png") ?>');background-repeat: no-repeat;background-size:100% 100%;">&nbsp;
            </td>
            <td class="bg-dark">
                <h4 class="text-center display-5">Andon Rundown Stock <?= $sip ?> Shift <?= isset($_GET["vendor"]) ? $_GET["vendor"] : ""; ?> <?= isset($_GET["model"]) ? $_GET["model"] : ""; ?></h1>
                <h5 class="text-center display-6">PT. Astra Daihatsu Motor Warehouse PPL</h2>
            </td>
            <td width="13%" class="bg-danger">
                <h5 class="text-center display-5 mb-0">RSO PPL</h3>
                <table width="100%" style="font-size:11px; margin-left: auto;margin-right: auto;" >               
                    <tr>
                        <td width="55%" class="pl-3">
                            Tanggal
                        </td>
                        <td>
                            <?= ' '.$Tanggal ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="pl-3">                        
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
                    <?php foreach($Group as $g){?>
                        <div class="col-md-12">
                            Last Update : <?= $g->create_date ?>
                        <table class="table table-bordered table-sm mb-0" width="100%" style="table-layout: fixed;">
                            <thead class="thead-light">
                                <tr class="text-center" style="font-size:12px">
                                    <th rowspan="2" width="2%">No</th>
                                    <th rowspan="2" width="18%" style="word-wrap: break-word;">Part Name</th>
                                    <th rowspan="2" width="8%">Vendor</th>
                                    <th rowspan="2" width="4%">Model</th>
                                    <th rowspan="2" width="4%" style="word-wrap: break-word;">Area</th>
                                    <th rowspan="2" width="3%" style="word-wrap: break-word;">P/S</th>
                                    <th rowspan="2" width="3%">P/J</th>
                                    <th colspan="3" width="12%">Stock</th>
                                    <th rowspan="2" width="6%" style="word-wrap: break-word;">SS</th>
                                    <th colspan="8" width="10%"><?= $pat[0] ?></th>
                                    <th colspan="8" width="10%"><?= $pat[1] ?></th>
                                    <th colspan="8" width="10%"><?= $pat[2] ?></th>
                                    <th colspan="8" width="10%"><?= $pat[3] ?></th>
                                </tr>
                                <tr class="text-center" style="font-size:12px">
                                    <th class="bg-primary">PPL</th>
                                    <th class="bg-success">Receive</th>
                                    <th class="bg-warning">OTW</th>
                                    <?php for ($i=1; $i <= 32; $i++) { echo '<th class="bg-light">'.$i.'</th>' ;} ?>
                                </tr>
                            </thead>
                            <tbody>
                            <?php $i = 1;
                            foreach ($List as $key) { if($key->create_date==$g->create_date){
                                    // 39 itu masksimal graph nya 
                                              // maksimal kolom (39) / total kolom (4)/ total stack kolom nya (8) 
                                              $ppl = 1.21875 * $key->ss_ppl;
                                              $receive = 1.21875 * ($key->ss_ppl + $key->ss_r);
                                              $otw = 1.21875 * ($key->ss_ppl + $key->ss_r + $key->ss_otw);
                                              $ss = $key->ss_ppl + $key->ss_r + $key->ss_otw;
                                    ?>
                                <tr class="text-center" style="font-size:10px">
                                    <td><?= $i; ?></td>
                                    <td class="text-left" style="font-size:10px"><?= $key->part_name; ?></td>
                                    <td><?= $key->vendor; ?></td>
                                    <td><?= $key->model; ?></td>
                                    <td><?= $key->area; ?></td>
                                    <td><?= $key->prod_shift; ?></td>
                                    <td><?= $key->plan_jam; ?></td>
                                    <td><?= $key->sto_ppl; ?></td>
                                    <td><?= $key->receive; ?></td>
                                    <td><?= $key->otw; ?></td>
                                    <td <?= $ss<=4?'style=" background-color: red;color: white;"':'';?>><?= $ss;?> = <?= $shift=="Day" ? date('H:i', strtotime('07:25')+(60*$ss*60)) : date('H:i', strtotime('20:30')+(60*$ss*60));?></td>
                                    <td class="pl-0">
                                    <div class="bg-warning text-right pr-1 position-absolute" style="width: <?= $otw > 39 ? 39 : $otw; ?>%;z-index: -1;"><?= $key->ss_otw; ?></div>
                                    <div class="bg-success  text-right pr-1 position-absolute" style="width: <?= $receive > 39 ? 39 : $receive; ?>%;z-index: -1;"><?= $key->ss_r; ?></div>
                                    <div class="bg-primary  text-right pr-1 position-absolute" style="width: <?= $ppl > 39 ? 39 : $ppl; ?>%;z-index: -1;"><?= $key->ss_ppl; ?></div>
                                    </td>
                                </tr>
                                </tbody>
                                <?php $i++;
                                    } } ?>
                    </table>                         
                        </div>
                    <?php }?>
                </div>          
            </td>
        </tr>    
    </table>
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
  filename:     'Rundown Stock PPL <?= $sip ?> shift <?= isset($_GET["vendor"]) ? $_GET["vendor"] : ""; ?> <?= isset($_GET["model"]) ? $_GET["model"] : ""; ?>',
  image:        { type: 'jpeg', quality: 0.98 },
  html2canvas:  { scale: 2},
  jsPDF:        { unit: 'px', format: 'a3', orientation: 'l', hotfixes: ["px_scaling"] }
};

const print = this.document.getElementById("print");
html2pdf().set(opt).from(print).save();
</script>


</body>
</html>