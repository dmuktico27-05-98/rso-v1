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
                <?php foreach($Group as $g){?>
                <div class="col-md-12">
                    Last Update : <?= $g->create_date ?>
                    <table class="table table-bordered table-sm" width="100%" style="table-layout: fixed;">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th rowspan="2" width="3%">No</th>
                                <th rowspan="2" width="5%" style="word-wrap: break-word;">Job No</th>
                                <th rowspan="2" width="25%" style="word-wrap: break-word;">Part Name</th>
                                <th rowspan="2" width="4%" style="word-wrap: break-word;">Patan</th>
                                <th rowspan="2" width="4%" style="word-wrap: break-word;">Max /Shift</th>
                                <th rowspan="2" width="3%">T/T</th>
                                <th width="4%">Stock</th>
                                <th rowspan="2" width="4%" style="word-wrap: break-word;">SS</th>
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
                                <th class="bg-info">PPL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i = 1;
                            foreach ($List as $key) { if($key->create_date==$g->create_date){
                                $ppl = 0.734375 * ($key->ss_ppl);
                            ?>
                                <tr class="text-center">
                                    <td><?= $i; ?></td>
                                    <td><?= $key->job_no; ?></td>
                                    <td><?= $key->part_name; ?></td>
                                    <td><?= $key->ps; ?></td>
                                    <td><?= $key->maks_shift; ?></td>
                                     <td><?= $key->t_t; ?></td>
                                     <td><?= $key->sto_ppl; ?></td>
                                     <td><?= $key->ss_ppl;?>
                                    <td class="pl-0">
                                        <div class="bg-info text-right pr-1 position-absolute" style="width: <?= $ppl > 47 ? 47 : $ppl; ?>%;z-index: -1;"><?= $key->ss_ppl; ?></div>
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
<!-- 
<script>  
  var opt = {  
  filename:     'myfile.pdf',
  image:        { type: 'jpeg', quality: 0.98 },
  html2canvas:  { scale: 2},
  jsPDF:        { unit: 'px', format: 'a3', orientation: 'l', hotfixes: ["px_scaling"] }
};

const print = this.document.getElementById("print");
html2pdf().set(opt).from(print).save();
</script> -->


</body>
</html>