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
          <h1 class="box-title">
            LOGIN <?=strtoupper($user_level);?> AREA  
          </h1>
          <br><br>
        </div>
        <div class="login-box-body  text-center" style="background-size:100% 100%;vertical-align: middle;">
           <div class="text-center">
            <img src="<?=base_url('assets/img/scan.png');?>" width="40%" >
          </div>
          <?=form_open('action/loginscan', 'id="mydata" '); ?>
          <div class="form-group">
              <label for="exampleInputEmail1"> Please scan smart id card</label>
              <input id="idcard" name="idcard" type="text" class="form-control  text-center" autocomplete="off" style="font-size: 25px;height: 100%" size="27" onfocus="this.value=''">
          </div>
          <?=form_close();?>

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
  document.addEventListener("click", function(){
    $("#idcard").focus();
  });
  $(document).ready(function() {
    $("*").dblclick(function(e){
            e.preventDefault();
          });
      $("#idcard").focus();
 
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
                window.location.href ="<?=base_url('home');?>"
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
                $("#idcard").focus();
              }
            }
         });

      });
  }); 
</script>
<script type="text/javascript">
    setTimeout(function () { 
      location.reload();
    }, (10 * 60) * 1000);
</script>
  </body>
</html>