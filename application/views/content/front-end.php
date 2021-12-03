          
            <?php
            $per_page=12;
            $one_page=1;
            $current_page=1;
            if(isset($_GET['page'])){
            $current_page=$_GET['page'];
            $current_page=($current_page > 1) ? $current_page : 1;
            }
            $total_data = $this->model_master->manualQuery("select * from tbl_panel_side_d12l")->num_rows();
            $total_closerh = $this->model_master->manualQuery("select * from tbl_panel_side_d12l where remarks_rh='close'")->num_rows();
            $total_data_setting = $this->model_master->manualQuery("select remarks_rh from tbl_panel_side_d12l where remarks_rh!='' order by id asc")->num_rows();
            $total_page = ceil($total_data/$per_page);
            $hasil_bagi_per_page = ($total_data_setting) / 12;    
            $awal = ($current_page - 1) * $per_page;
            ?>

<style type="text/css">

.jarak{margin-top:50px}
.btn-custom { 
  color: white; 
  background-color: blue; 
  border-color: #E51DF0; 
} 
 .content{
   height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
 }
.btn-custom:hover, 
.btn-custom:focus, 
.btn-custom:active, 
.btn-custom.active, 
.open .dropdown-toggle.btn-custom { 
  color: white; 
  background-color: red; 
  border-color: #E51DF0; 
} 

.swal-wide{
  width: 1500px;
  height: 500px;
  border: 10px solid;
  position: absolute;
  margin-top: -50%;
  margin-left: -28%;
}

.btn-danger{
  font-size: 50px;
}
 .title{
  font-size: 50px;
 }
 .cancel{
  font-size: 50px;
 }
 .gambar{
  width: 100px;
  height: 20px;
 }
 .text{
  font-size: 40px;
 }

 .nomor{
  float: left;
 }
 .suffix{
  float: right; 
 }

.berkedip{
  margin: auto;
  text-align: center;
  background-color: blue;
}
div #area-text{
 width:100px; padding: 8px; color:#fff;
  text-align:center;background-Color:#AA9D9D;
}

.gambar{ display: flex; text-align: center; padding: 20px; width: 9000px; margin-left: 2%; } 
.gambar1{ background-color: white; padding: 20px; width: 800px; height: 950px;} 
.gambar1 a:hover {background-color: red;}
.gambar2{ background-color: white; padding: 20px; width: 1600px; height: 950px; } 

</style>
<script type="text/javascript">
var x=1;
function blink(id) {
  document.getElementById(id).style.width="300px";
  if(x==1){
    document.getElementById(id).style.backgroundColor = "red";
    x=2;
  } else {
    document.getElementById(id).style.backgroundColor = "";
    x=1;
  }
}
window.onload=function(){
setInterval("blink('alert')", 500);}

var blink_speed = 300; // every 1000 == 1 second, adjust to suit
var t = setInterval(function () {
    var ele = document.getElementById('blink-text');
    ele.style.visibility = (ele.style.visibility == 'hidden' ? '' : 'hidden');
}, blink_speed);
</script>
<script type="text/javascript">
var x=1;
function blink(id) {
  document.getElementById(id).style.width="300px";
  if(x==1){
    document.getElementById(id).style.backgroundColor = "red";
    x=2;
  } else {
    document.getElementById(id).style.backgroundColor = "";
    x=1;
  }
}
window.onload=function(){
setInterval("blink('alert')", 500);}

var blink_speed = 300; // every 1000 == 1 second, adjust to suit
var t = setInterval(function () {
    var ele = document.getElementById('blink-text1');
    ele.style.visibility = (ele.style.visibility == 'hidden' ? '' : 'hidden');
}, blink_speed);
</script>
<!-- <script>
setInterval(function(){
$(".berkedip").toggle();
},300);
</script> -->

  <div id="content" style="background-color: black; /*: url('<?=('asset/dist/img/walback.jpg');?>');*/ background-repeat: no-repeat; background-size: 100%; background-position: center;">

<div class="col-xs-12">

<label style="font-size:45px; color: white; text-align: center; margin-left: 500px;">Welcome to E-WOS System Jundate Panel Side RH D12L</label>
</div>
</div>  

<?php 
$jumlah_id_wos_pallet_rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE wos_pallet_rh!=''")->num_rows();
$jumlah_id_panel_side_12rh = $this->db->query("SELECT * FROM tbl_panel_side_d12l WHERE remarks_rh!=''")->num_rows();
  $username = $this->session->userdata('username');
    $data2['user']= $this->db->get_where('tbl_user',array('username'=>$username))->row();
    $post = $data2['user']->post;
$cek = $this->db->query("SELECT * FROM tbl_cek_wos WHERE post='".$post."' ORDER BY cek")->result();
foreach ($cek as $key) {
$wos_cek = $key->cek;
}
if($jumlah_id_panel_side_12rh!=$jumlah_id_wos_pallet_rh && $wos_cek!='cek'){ ?>
<div class="row">
<?php 
foreach ($menu_exprh12 as $row1) {
?>
<div class="col-lg-3 col-xs-6">
<!-- small box -->
<?php if($row1->remarks_rh == 'close'){ ?>
<div onclick="setting_jsonrh12('<?=$row1->id;?>')" id="<?=$row1->id;?>" class="small-box btn" style="background-color: black; border: 1px solid;" disabled> 
<?php }elseif($row1->rh_pending=='pending'){ ?>
<div onclick="setting_jsonrh12('<?=$row1->id;?>')" id="<?=$row1->id;?>" class="small-box btn" style="background-color: red; border: 1px solid;">
<?php }elseif($row1->job_var_rh==1){ ?>
<div onclick="setting_jsonrh12('<?=$row1->id;?>')" id="<?=$row1->id;?>" class="small-box btn" style="background-color: blue; border: 1px solid;">
<?php }else{ ?>
<div onclick="setting_jsonrh12('<?=$row1->id;?>')" id="<?=$row1->id;?>" class="small-box btn" style="background-color: orange; border: 1px solid;"> 
<?php } ?>

<div class="inner" style="border: 2px solid; border-color: white;"> 
<div class="nomor">          
<h1 class="" style="font-size: 50px; color: white;"><?php echo $row1->no_wos;?></h1>
</div>
<div class="suffix">
<h4 class="" style="font-size: 50px; color: white;"><?php echo $row1->code;?></h4>
</div>
<h4 class="" style="color: white; font-size: 23px;"><?php echo $row1->variant;?></h4>
<?php if($row1->rh_pending=='pending'){ ?>
<h4 class="" style="color: yellow; font-weight: bold; font-size: 30px;">(<?php echo strtoupper($row1->rh_pending); ?>)</h4>
<?php }elseif($row1->rh_pending=='pending'){ ?>
<h4 class="" style="color: red; font-weight: bold; font-size: 30px;">()</h4>
<?php }elseif($row1->job_var_rh==1){ ?>
<h4 class="" style="color: blue; font-weight: bold; font-size: 30px;">()</h4>
<?php }else{ ?>
<h4 class="" style="color: orange; font-weight: bold; font-size: 30px;">()</h4>
<?php } ?>

<?php if($row1->lhd == 'LHD'){ ?>
<h2 class="pull-right" style="font-size: 30px; color: blue; font-weight: bold; border: 1px solid;">LHD</h2>
<?php } ?> 
<h2 class="pull-left" style="font-size: 50px; color: red; font-weight: bold; border: 1px solid;"><?php echo $row1->wos_pallet_rh;?></h2>

<?php foreach ($job_variant as $row2) { if($row1->panel_side_rh == $row2->job_variant){ ?>
<h2 class="pull-right" style="font-size: 30px; color: blue; font-weight: bold; border: 1px solid;">VAR</h2>
<?php } } ?> 

<h3 class="" style="font-size: 120px; color: white;"><?php echo $row1->panel_side_rh;?></h3>


<span class="small-box-footer" style="font-size: 30px; color: white; font-weight: bold;"><?php echo $row1->wos_date;?> <i class="fa fa-arrow-circle-right"></i></span>
</div>
</div>

</div>
<?php } ?>
</div>
</div>
</div>
</div>

<?php }elseif($jumlah_id_panel_side_12rh==$jumlah_id_wos_pallet_rh && $wos_cek=='cek') { ?>
<div class="row">
<?php
foreach ($menu_cek_exprh12 as $row1) {
?>
<div class="col-lg-3 col-xs-6">
<!-- small box -->
<?php if($row1->remarks_rh == 'close'){ ?>
<div onclick="#" id="<?=$row1->id;?>" class="small-box btn" style="background-color: black; border: 1px solid;" disabled>  
<?php }elseif($row1->rh_pending=='pending'){ ?>
<div onclick="#" id="<?=$row1->id;?>" class="small-box btn" style="background-color: red; border: 1px solid;" disabled>
<?php }elseif($row1->job_var_rh==1){ ?>
<div onclick="#" id="<?=$row1->id;?>" class="small-box btn" style="background-color: blue; border: 1px solid;" disabled>
<?php }else{ ?>
<div onclick="#" id="<?=$row1->id;?>" class="small-box btn" style="background-color: orange; border: 1px solid;" disabled> 
<?php } ?>


<div class="inner" style="border: 2px solid; border-color: white;"> 
<div class="nomor">          
<h1 class="" style="font-size: 50px; color: white;"><?php echo $row1->no_wos;?></h1>
</div>
<div class="suffix">
<h4 class="" style="font-size: 50px; color: white;"><?php echo $row1->code;?></h4>
</div>
<h4 class="" style="color: white; font-size: 23px;"><?php echo $row1->variant;?></h4>
<?php if($row1->rh_pending=='pending'){ ?>
<h4 class="" style="color: yellow; font-weight: bold; font-size: 30px;">(<?php echo strtoupper($row1->rh_pending); ?>)</h4>
<?php }elseif($row1->rh_pending=='pending'){ ?>
<h4 class="" style="color: red; font-weight: bold; font-size: 30px;">()</h4>
<?php }elseif($row1->job_var_rh==1){ ?>
<h4 class="" style="color: blue; font-weight: bold; font-size: 30px;">()</h4>
<?php }else{ ?>
<h4 class="" style="color: orange; font-weight: bold; font-size: 30px;">()</h4>
<?php } ?>

<?php if($row1->lhd == 'LHD'){ ?>
<h2 class="pull-right" style="font-size: 30px; color: blue; font-weight: bold; border: 1px solid;">LHD</h2>
<?php } ?> 
<h2 class="pull-left" style="font-size: 50px; color: red; font-weight: bold; border: 1px solid;"><?php echo $row1->wos_pallet_rh;?></h2>

<?php foreach ($job_variant as $row2) { if($row1->panel_side_rh == $row2->job_variant){ ?>
<h2 class="pull-right" style="font-size: 30px; color: blue; font-weight: bold; border: 1px solid;">VAR</h2>
<?php } } ?> 

<h3 class="" style="font-size: 120px; color: white;"><?php echo $row1->panel_side_rh;?></h3>


<span class="small-box-footer" style="font-size: 30px; color: white; font-weight: bold;"><?php echo $row1->wos_date;?> <i class="fa fa-arrow-circle-right"></i></span>
</div>
</div>

</div>
<?php } ?>
</div>
</div>
</div>

<div class="btn bg-lg" title="Back to Page : <?=($current_page - 1); ?>" style="font-size: 30px; color: white;">
<a onclick="prev()" href="<?=base_url($ewos)?>?page=<?php echo $current_page - 1 ?>" style="background-color: blue; font-size: 35px; color: white;" class="pull-left small-box btn btn-lg">❮❮ PREVIOUS  </a> 
</div>
<div class="btn bg-lg pull-right" title="Go to Page : <?=($current_page + 1); ?>" style="font-size: 30px; color: white;">
<a onclick="next()" href="<?=base_url($ewos)?>?page=<?php echo $current_page + 1 ?>" style="background-color: blue; font-size: 35px; color: white;" class="pull-right small-box btn btn-lg">NEXT ❯❯ </a>
</div>
</div>

<?php }else{ ?>
<!--     <div style="">
</div> -->
<div class="gambar"> 
<div class="gambar1"> 
<a class="center" style="border-radius: 10px; border: 1px solid; border-color: blue; padding: 20px; color: black; font-size: 50px;" href="<?=base_url('asset/dist/img/ewos_rev1.wmv');?>">Watch Tutorial Video
<span class="fa fa-download"></span></a> 
<h1></h1>
<h2 class="pull-left"></h2>
<h1 style="font-weight: bold;">The Last Setting</h1>
<?php $lastset = $this->db->query("select * from tbl_panel_side_d12l where remarks_rh!='' order by remarks_rh desc limit 1 ")->result();
  foreach ($lastset as $key) {
    $job_no = $key->panel_side_rh;
    $variant = $key->variant;
    $wos_date = $key->wos_date;
    $jdt = $key->jdt;
    $lhd = $key->lhd;
    $wos_no = $key->no_wos;
    $code = $key->code;
    $pallet = $key->wos_pallet_rh;
    $job_var_rh = $key->job_var_rh;
    if($job_var_rh==1){
      $jobvar = 'VARIANT JOB';
    }else{
      $jobvar = 'REGULER JOB';
    }
  }
  $datamaster = $this->db->query("select * from tbl_master where job_number='".$job_no."' ")->result();
  foreach ($datamaster as $key) {
    $job_master = $key->job_master;
    $part_no = $key->part_number;
    $part_name = $key->part_name_all_variant;
  }
 ?>
<table style="width: 100%;height:70%;padding: 0px;font-family: sans-serif;border-spacing: 0px;font-size: 30px;">
  <tr>
   <td style="border: 1px solid;">Wos No : <?php echo $wos_no; ?></td>
   <td style="border: 1px solid;">Code : <?php echo $code; ?></td>
   <td style="border: 1px solid;">Jdt : <?php echo $jdt; ?></td>
   <td style="border: 1px solid;">Lhd : <?php echo $lhd; ?></td>
   <td style="border: 1px solid;">Plt No : <?php echo $pallet; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $job_no; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $job_master; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $part_no; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $part_name; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $variant; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $jobvar; ?></td>
  </tr>
   <tr>
   <td colspan="5" style="border: 1px solid;"><?php echo $wos_date; ?></td>
  </tr>
</table><br>
<marquee><span style="font-size: 50px;">INOVATION OR DIE</span><img src="<?=base_url('asset/dist/img/boy.png')?>"  style="width: 100px; height: 100px;"></marquee>
</div><!-- &nbsp;&nbsp;&nbsp; -->


<div class="gambar2"> 
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
<li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>

</ol>
<div class="carousel-inner">
<div class="item active">
<img src="<?=base_url('asset/dist/img/1.jpg')?>"  style="width: 1600px; height: 900px;">

<div class="carousel-caption">

</div>
</div>
<div class="item">
<img src="<?=base_url('asset/dist/img/2.jpg')?>"  style="width: 1600px; height: 900px;">

<div class="carousel-caption">

</div>
</div>
<div class="item">
<img src="<?=base_url('asset/dist/img/3.jpg')?>"  style="width: 1600px; height: 900px">

<div class="carousel-caption">

</div>
</div>
<div class="item">
<img src="<?=base_url('asset/dist/img/4.jpg')?>"  style="width: 1600px; height: 900px">

<div class="carousel-caption">

</div>
</div>
<div class="item">
<img src="<?=base_url('asset/dist/img/5.jpg')?>"  style="width: 1600px; height: 900px">

<div class="carousel-caption">

</div>
</div>


</div>

<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
<span class="fa fa-angle-left"></span>
</a>
<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
<span class="fa fa-angle-right"></span>
</a>
</div>
<!-- <video width="400px" height="350px" controls>
  <source src="ewos_review.mp4" type="video/mp4">
</video> -->


</div>
</div>

<div class="btn bg-lg" title="Back to Page : <?=($current_page - 1); ?>" style="font-size: 30px; color: white; margin-top: 950px;" >
</div>
<div class="btn bg-lg pull-right" title="Go to Page : <?=($current_page + 1); ?>" style="font-size: 30px; color: white; margin-top: 950px;"  >
</div>

<?php } ?>

</section><!-- /.content -->
  </div>

<script type="text/javascript">
function setting_jsonrh12(id){ 

          $.ajax({  
                type: "POST",
                url : "<?=base_url('ewossetting/setting_jsonrh12'); ?>",
                data: "id="+id,
                cache:false,
                dataType: 'json',
                success: function(data){
                 if(data.status=='ok'){

                  $('#'+id).attr('style',true);
                  
                 }else {
                   swal({
                    title: "gagal setting",
                    text: "",
                    type: "warning",
                    timer: 1200,
                    showConfirmButton: false
                });
                 }
                 }
                });            
       }
</script>

<script type="text/javascript">
  function pallet_number(id){
    $.ajax({
      type: "POST",
      url: "<?=base_url('ewossetting/pallet_number'); ?>",
      data:"id="+id,
      cache:false,
      dataType: 'json',
      success: function(data){
        if(data.status=='oke'){
          location.reload();
        }else{
          swal({
            title: "update pallet number and finished your setting failed",
            type: "warning",
            timer: 800,
            showConfirmButton: false
          });
        }
      }
    });
  }
</script>


<script type="text/javascript">
function submit(id){
  swal({
          title: "ARE YOU SURE TO SUBMIT ?",
          showCancelButton: true,
          titleClass: 'title',
          text: "IF YOU SURE CLICK YES , AND IF YOU'RE NOT SURE CLICK CHECK AGAIN !!!",
          textClass: 'text',
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'YES - I SURE TO NEXT SETTING',
          cancelButtonText: 'CHECK AGAIN !!',
          cancelButtonClass: 'cancel',
          closeOnConfirm: false,
          customClass: "swal-wide",
          imageUrlClass: 'gambar',
          imageUrl: "asset/dist/img/gif/lingkaran.gif"
        },
        function(){
              $.ajax({
      type: "POST",
      url: "<?=base_url('ewossetting/compare_wos_pallet'); ?>",
      data: "id="+id,
      cache: false,
      dataType: 'json',
      success: function(data){
        if(data.status=='oke'){
          location.reload();
        }else{
          swal({
            title: "Data Submit Jundate Setting Failed",
            type: "warning",
            timer: 800,
            showConfirmButton: false,
          });
        }
      }
    });
        });            
       }
</script>

<script type="text/javascript">
function cek(id){
  swal({
          title: "ARE YOU SURE TO CHECK IT ?",
          showCancelButton: true,
          titleClass: 'title',
          text: "IF YOU SURE CLICK YES , AND IF YOU'RE NOT SURE CLICK BACK TO SETTING !!!",
          textClass: 'text',
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'YES - I SURE TO CHECK IT',
          cancelButtonText: 'BACK TO SETTING !!',
          cancelButtonClass: 'cancel',
          closeOnConfirm: false,
          customClass: "swal-wide",
          imageUrlClass: 'gambar',
          imageUrl: "asset/dist/img/gif/lingkaran.gif"
        },
        function(){
              $.ajax({
      type: "POST",
      url: "<?=base_url('ewossetting/cek'); ?>",
      data: "id="+id,
      cache: false,
      dataType: 'json',
      success: function(data){
        if(data.status=='oke'){
          location.reload();
        }else{
          swal({
            title: "Check Jundate Setting Failed",
            type: "warning",
            timer: 800,
            showConfirmButton: false,
          });
        }
      }
    });
        });            
       }
</script>

<script>
 function myFunction(id){
    $.ajax({
      type: "POST",
      url: "<?=base_url('ewossetting/warning_main_pallet'); ?>",
      data:"id="+id,
      cache:false,
      dataType: 'json',
      success: function(data){
        if(data.status=='oke'){
           var x = document.getElementById("myDIV");
                if (x.style.display === "none") {
                x.style.display = "block";
                } else {
                x.style.display = "none";
                }
        }else{
          swal({
           title: "oops, ubah main pallet hanya bisa ketika netral/tidal dalam proses setting",
            type: "warning",
            timer: 800,
            showConfirmButton: false
          });
        }
      }
    });
  }
</script>

<script type="text/javascript"> 
$('#mydata1').submit(function(e){
    e.preventDefault();
     var fa = $(this);            
      $.ajax({
        url: fa.attr('action'),
        type: 'post' ,
        data: fa.serialize(),
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            swal({
                    title: "Your file has been Updated!",
                    text: "",
                    type: "success",
                    timer: 800,
                    showConfirmButton: false
                  });
                  $('.form-group').removeClass('has-error')
                                  .removeClass('has-success');
                  $('.text-danger').remove();
                  fa[0].reset(); 
                  t.ajax.reload();
          } else {
            $.each(response.messages,function(key, value){
              var element = $('#' + key);
              element.closest('div.form-group')
              .removeClass('has-error')
              .addClass(value.length > 0 ? 'has-error' : 'has-success')
              .find('.text-danger')
              .remove();
              element.after(value);
            });
          }
        }
     });
  });
</script>





