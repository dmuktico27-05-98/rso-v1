<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?=$title;?> | Login</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<?=base_url('assets/lte/bootstrap/css/bootstrap.min.css');?>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?=base_url('assets/lte/fontawesome-4.3.0/css/font-awesome.min.css');?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?=base_url('assets/lte/dist/css/AdminLTE.min.css');?>">
    <link rel="manifest" href="<?=base_url('manifest.json');?>">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="shortcut icon" href="<?=base_url('assets/img/'.$logo);?>" type="image/x-icon" />
  </head>
  <body class="login-page" style="background:url('<?=base_url('assets/img/bg.jpg');?>');background-repeat: no-repeat;background-size:100% 100%;vertical-align: middle;">
    <div id="loading"></div>
    <div class="login-box">
      <div class="login-logo">
        <a href="<?=base_url('action');?>">
          <label class="bg-blue-active text-yellow" style="padding: 2px;font-family: Snell;font-style: italic;border-radius:10px 0px 0px 10px;">&nbsp;YPI&nbsp;</label><label class="bg-yellow" style="padding: 2px;font-family: Snell;font-style: italic;border-radius:0px 10px 10px 0px;">&nbsp;System&nbsp;</label></a>
      </div>
      <div class="box box-default" style="border-radius:10px;border:4px solid white">
        <div class="box-header bg-blue-active text-center" style="border-radius:10px 10px 0px 0px;"><br>
          <h2 class="box-title">
            LOGIN <?=strtoupper($user_level);?> AREA 
          </h2>
          <br><br>
        </div>
        <div class="login-box-body text-center" style="height: 300px;vertical-align: middle;background-image: linear-gradient(to right,white,gray);opacity: 0.9;">
            <button id="tampiluser" class="btn btn-success btn-lg" style="margin-top:100px;">Sign In</button>

          <div id="login" class="bg-gray" style="width: 100%;border:1px solid #ccc;padding: 10px;height: 200px;">
              <div class="bg-gray text-center" style="font-family: Snell;font-style: italic;">
                <i class="fa fa-edit"></i> <?php if (empty($msg)){$msg="";}echo $msg;?> Please type password
              </div>
                <?=form_open('action/login', 'id="mydata" '); ?>
                <div class="form-group has-feedback">
                  <label for="exampleInputEmail1"></label>
                  <input id="username" type="hidden" class="form-control text-center" name="username" />
                  <input id="password" type="password" class="form-control text-center" name="password" />
                  <span class="fa fa-lock form-control-feedback"></span>
                </div>
                <div class="row">
                  <div class="col-xs-6">
                    <a class="btn btn-default btn-block" href="<?=base_url();?>">Cancel</label></a>
                  </div>
                  <div class="col-xs-6">                           
                    <button type="submit" class="btn btn-success btn-block">Submit</button>
                  </div>
                </div>
                <?=form_close();?>
        </div>
        <div style="height:230px;overflow-y:auto;overflow-x:hidden;">
          <?php foreach ($data_user as $key) { if($key->typefile==""){$file="default.jpg";}else{
            $file=$key->typefile;}?>
            <div id="<?=$key->username;?>" class="btn bg-gray btn-block pilihuser btn-sm">
                <div class="row text-white text-bold text-left">
                  <div class="col-xs-12" style="font-size: 18px;">
                    <img src="<?=base_url('assets/img/'.$file);?>" class="img-circle" width="30" height="29"/>
                    <?=$key->nama;?>
                  </div>
                </div>
             </div>
            <?php } ?>
        </div>

    </div>
        <div class="box-footer bg-blue-active text-center" style="border-radius:0px 0px 30px 10px;font-family: Snell;font-style: italic;">Copy Right &copy; <?=$year;?> | <?=$owner;?></div>
    </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

<script src="<?=base_url('assets/lte/jquery/jquery-2.2.3.min.js')?>"></script>
<script src="<?=base_url('assets/lte/sweetalert/sweetalert.js')?>"></script>
<script type="text/javascript"> 
  $(window).load(function() { 
      $("#loading").fadeOut("slow");
      $("#login").hide();
      $(".pilihuser").hide();
      $("#tampiluser").click(function(){
        $(".pilihuser").show();
        $("#tampiluser").hide();
      });    
    })
    //----------------------
    $('#mydata').submit(function(e){
        e.preventDefault();
         var fa = $(this);            
          $.ajax({
            url: fa.attr('action'),
            type: 'post' ,
            data: fa.serialize(),
            dataType: 'json',
            success: function(response) {
              if(response.success == true) {
                window.location.href ="<?=base_url();?>"
              }else{
                $.each(response.messages,function(key, value){
                  var element = $('#' + key);
                  element.closest('div.form-group')
                  .removeClass('has-error')
                  .addClass(value.length > 0 ? 'has-error' : 'has-success')
                  .find('.label.label-warning')
                  .remove();
                  element.after(value);
                });
                $("#username").focus();
              }
            }
         });

      });
    //-----------------------------
      <?php foreach ($data_user as $key) {?>
            $("#<?=$key->username;?>").click(function(){
            $("#login").show();
            $(".pilihuser").hide();
            $("#tampiluser").attr('disabled', true);
            $("#password").focus();
            $("#username").val("<?=$key->username;?>");
          });
          <?php }?>
  </script>
  <script type="text/javascript">
    setTimeout(function () { 
      location.reload();
    }, (10 * 60) * 1000);
</script>
  </body>
</html>
