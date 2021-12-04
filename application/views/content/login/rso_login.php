<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="assets/img/logo.jpg" />

    <link rel="stylesheet" href="hrp_login/fonts/icomoon/style.css">
    <link rel="stylesheet" href="hrp_login/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="hrp_login/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="hrp_login/css/style.css">
    <title>RSO Login</title>
  </head>
  <body>
  

  <div class="content" style="margin-top:100px;margin-left:70px">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="background-image: url('assets/img/avanza-rm.png'); background-repeat: no-repeat;background-size:110%;">
          
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Rundown Stock Online</h3>
              <p class="mb-4">PT Astra Daihatsu Motor Stamping Plant</p>
            </div>
            <?=form_open('action/login', 'id="mydata" '); ?>
              <div class="form-group first">
                <label for="username">Username</label>
                <input id="username" name="username" type="text" class="form-control">

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input id="password" name="password" type="password" class="form-control">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
              </div>

              <button type="submit" class="btn btn-info"> Sign In </button>
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="hrp_login/js/jquery-3.3.1.min.js"></script>
    <script src="hrp_login/js/popper.min.js"></script>
    <script src="hrp_login/js/bootstrap.min.js"></script>
    <script src="hrp_login/js/main.js"></script>
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
                $("#username").focus();
              }
            }
         });

      });
</script>

  </body>
</html>