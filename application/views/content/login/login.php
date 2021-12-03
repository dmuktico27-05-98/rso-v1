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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="shortcut icon" href="<?=base_url('assets/img/'.$logo);?>" type="image/x-icon" />
  </head>
  <body class="login-page" style="background:url('<?=base_url('assets/img/5.jpg');?>');background-repeat: no-repeat;background-size:100% 100%;vertical-align: middle;">
    <div id="loading"></div>
    <div class="login-box">
      <div class="login-logo">
        <a href="<?=base_url('action');?>">
          <label class="bg-blue-active text-yellow" style="padding: 2px;font-family: Snell;font-style: italic;border-radius:10px 0px 0px 10px;">&nbsp;EWOS&nbsp;</label><label class="bg-yellow" style="padding: 2px;font-family: Snell;font-style: italic;border-radius:0px 10px 10px 0px;">&nbsp;System&nbsp;</label></a>
      </div>
      <div class="box box-default" style="border-radius:10px;border:4px solid white">
        <div class="box-header bg-blue-active text-center" style="border-radius:10px 10px 0px 0px;">
          <br>
          <h1 class="box-title" style="font-size: 150%;font-family: Snell;font-style: italic;">
            <i class="fa fa-sign-in"></i> <?php if (empty($msg)){$msg="";}echo $msg;?> Sign in to start your session
          </h1>
          <br><br>
        </div>
        <div class="login-box-body" style="background-image: linear-gradient(to right,white,gray);opacity: 0.9;">
          <?=form_open('action/login', 'id="mydata" '); ?>
          <div class="form-group has-feedback">
            <label for="exampleInputEmail1">Username</label>
            <input id="username" type="text" class="form-control" name="username" sty/>
            <span class="fa fa-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <label for="exampleInputEmail1">Password</label>
            <input id="password" type="password" class="form-control" name="password" />
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">                           
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-default bg-blue btn-block">Sign In</button>
            </div><!-- /.col -->
          </div>
        </form>

        <div class="">
          <br>
        </div><!-- /.social-auth-links -->

    </div>
        <div class="box-footer bg-blue-active text-center" style="border-radius:0px 0px 30px 10px;font-family: Snell;font-style: italic;">Copy Right &copy; <?=$year;?> | <?=$owner;?></div>
    </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.3 -->
<script src="<?=base_url('assets/lte/jquery/jquery-2.2.3.min.js')?>"></script>
<script type="text/javascript"> 
  $(window).load(function() { 
      $("#loading").fadeOut("slow");
      $("#username").focus();
    })
  </script>
  <script type="text/javascript"> 
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
</script>
  </body>
</html>