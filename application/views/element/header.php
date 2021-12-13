<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title;?> | Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="icon" type="image/png" href="assets/img/logo.jpg" />
  <!-- Bootstrap 3.3.6 -->
 <link rel="stylesheet" href="<?=base_url('assets/lte/sweetalert/sweetalert.css') ?>"/> 
  <link rel="stylesheet" href="<?=base_url('assets/lte/jquery/themes/smoothness/jquery-ui.css');?>">  
  <link rel="stylesheet" href="<?=base_url('assets/lte/uitimepicker/jquery-ui-timepicker-addon.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/lte/datatables/extensions/FixedColumns/css/dataTables.fixedColumns.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.css');?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=base_url('assets/lte/fontawesome-4.3.0/css/font-awesome.min.css');?>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?=base_url('assets/lte/ionicons-2.0.1/css/ionicons.min.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/lte/dist/css/skins/_all-skins.min.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/select2.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/select2-bootstrap.min.css')?>">

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<?=base_url('plugins/fontawesome-free/css/all.min.css')?>">
  <!-- overlayScrollbars -->
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=base_url('dist/css/adminlte.min.css')?>">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?=base_url('plugins/fontawesome-free/css/all.min.css')?>">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=base_url('dist/css/adminlte.min.css')?>">
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
        document.getElementById("clock").innerHTML = (sh.length==1?"0"+sh:sh) + ":" + (sm.length==1?"0"+sm:sm) + ":" + (ss.length==1?"0"+ss:ss);
    }
</script>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
  <?php
        foreach ($menu_mother as $row1) { if($row1->nav!='Security' AND $row1->nav!='Dashboard'){ ?>
          <div class="dropdown <?=$row1->mother;?>">
           <?php if($row1->url!="-"){ 
                if($row1->mother=='andon'){ ?>
                    <button onclick="window.open ('<?=site_url($row1->url)?>','','fullscreen=yes, scrollbars=auto'); window.open('','_parent','');"></i>
                    <?=$row1->nav;?>
                    </button>
                <?php }else{?>
                    <button onclick="return menu('<?=base_url($row1->url); ?>')">
                    <?=$row1->nav;?>
                    </button>
              <?php }
                }else{?>
            <button href="#"  class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <?=$row1->nav;?>
                  <span class="caret"></span>
            </button>&nbsp;&nbsp;
            <?php }?>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <?php foreach ($menu_parent as $row2) { if($row1->mother==$row2->mother) { if($row2->mother=='andon'){ ?>
                    <li class="<?=$row2->parent;?>"><a onclick="window.open ('<?=site_url($row2->url)?>','','fullscreen=yes, scrollbars=auto'); window.open('','_parent','');"><i class="fa fa-circle-o"></i> <?=$row2->nav;?> </a></li>
                      <?php }else{?>
                    <li class="<?=$row2->parent;?>"><a onclick="return menu('<?=base_url($row2->url); ?>','<?=$row2->nav;?>','<?=$row2->tabel.'-'.$row2->add_level.'-'.$row2->edit_level.'-'.$row2->delete_level;?>','<?=$row2->user_level;?>')"><i class="fa fa-circle-o"></i> <?=$row2->nav;?> </a></li>
                <?php }} } ?>
                </div>
        </div>
      <?php } } ?>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
     
        <a class="nav-link" data-widget="fullscreen" href="#" role="button" style="color:black;">
          <i class="fas fa-expand-arrows-alt"></i> &nbsp;-&nbsp; <?=$nama;?>&nbsp;-&nbsp; <?=$shop;?>
        </a>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li> -->
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<?=base_url('home')?>" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" style="padding:10px;" class="brand-image img-circle elevation-3">
      <span class="brand-text font-weight-light"><?=$title;?></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-header">HRP OPERATION</li>

        <?php
        foreach ($menu_mother as $key1) { ?>                 
          <li class="nav-item">
           <?php if($key1->url!="-"){ 
                if($key1->mother=='andon'){ ?>
            <a class="nav-link" onclick="window.open ('<?=site_url($key1->url)?>','','fullscreen=yes, scrollbars=auto'); window.open('','_parent','');">
              <i class="nav-icon fas <?=$key1->icon;?>"></i>
              <p> <?=$key1->nav;?>  <i class="fas fa-angle-left right"></i>  </p>
            </a>
            <?php }else{ ?>
              <a class="nav-link" onclick="return menu('<?=base_url($key1->url); ?>')">
              <i class="nav-icon fas <?=$key1->icon;?>"></i>
              <p> <?=$key1->nav;?>  </p>
            </a>
            <?php }}else{ ?>
              <a class="nav-link" href="#<?=$key1->mother;?>">
              <i class="nav-icon fas <?=$key1->icon;?>"></i>
              <p> <?=$key1->nav;?>  <i class="fas fa-angle-left right"></i>  </p>
            </a>
              <?php } ?>

                    <ul class="nav nav-treeview">
                        <?php foreach ($menu_parent as $key2) { if($key1->mother==$key2->mother) { if($key2->mother=='andon'){ ?>
                        <li class="nav-item"><a class="nav-link" onclick="window.open ('<?=site_url($key2->url)?>','','fullscreen=yes, scrollbars=auto'); window.open('','_parent','');"><i class="far fa-circle nav-icon"></i> <?=$key2->nav;?></a></li>
                          <?php }else{?>
                          <li class="nav-item"><a class="nav-link" onclick="return menu('<?=base_url($key2->url); ?>','<?=$key2->nav;?>','<?=$key2->tabel.'-'.$key2->add_level.'-'.$key2->edit_level.'-'.$key2->delete_level;?>','<?=$key2->user_level;?>')"><i class="far fa-circle nav-icon"></i> <?=$key2->nav;?> </a></li>
                        <?php }} } ?>
                      </ul>
               
          </li>
          <?php } ?>

          <li class="nav-header">OTHERS</li>
          <li class="nav-item">
            <a href="<?=base_url('action/logout')?>" class="nav-link">
              <i class="nav-icon fas fa fa-power-off"></i>
              <p>
                SIGN OUT
              </p>
            </a>
          </li>

             
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="background-color: #f0f0f0">
  <div id="isi"></div>
   

