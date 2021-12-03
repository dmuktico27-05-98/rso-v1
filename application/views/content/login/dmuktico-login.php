<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon.ico">

	<title>HRP-P1</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	<link rel="icon" type="image/png" href="assets/img/andro.jpg" />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />

	<!-- CSS Files -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/material-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="assets/css/demo.css" rel="stylesheet" />
</head>

<body>
	<div class="image-container set-full-height" style="background-color: grey">
	    <!--   Creative Tim Branding   -->
	    <a href="<?=base_url('action');?>">
	         <div class="logo-container">
	            <div class="logo">
	                <img src="dist/img/logo.jpg">
	            </div>
	            <div class="brand">
	                HRP ONLINE
	            </div>
	        </div>
	    </a>



	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div style="margin-left:25%" class="col-sm-6 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div style="background-color:transparent;" class="card wizard-card" data-color="green" id="wizardProfile">
		            

		                    	<div class="wizard-header" style="color: white;">
		                        	<h3 class="wizard-title" style="color: white">
		                        	   ADM-P1
		                        	</h3>
									<h5>Let's start with the basic information (with validation)</h5>
		                    	</div>
				
		                              <div class="row" >
		                                	
						<div class="col-sm-11">
							<?=form_open('action/login', 'id="mydata" '); ?>
							<div class="input-group">
								<span class="input-group-addon" style="color: white">
									<i class="material-icons">face</i>
								</span>
								<div class="form-group label-floating">
						          <label class="control-label" style="color: white">Username <small>(required)</small></label>
						          <input style="color:white;" id="username" name="username" type="text" class="form-control">
						        </div>
							</div>

							<div class="input-group">
								<span class="input-group-addon" style="color: white">
									<i class="material-icons">lock</i>
								</span>
								<div class="form-group label-floating">
								  <label class="control-label"style="color: white">Password <small>(required)</small></label>
								  <input style="color:white;" id="password" name="password" type="password" class="form-control">
								</div>
							</div>
							                               
						<div class="box-footer width-border pull-right">
						<button type="submit" class="btn btn-success"> Sign In </button>
						</div>
					</form>
						</div>
		                                	
		                            	</div>
		                            
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div><!-- end row -->
	    </div> <!--  big container -->

	    <div class="footer">
	        <div class="container text-center">
	             COPYRIGHT BY <a href="http://rahayu-web.my.id">DMUKTICO</a>. 
	        </div>
	    </div>
	</div>

<!--   Core JS Files   -->
    <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="assets/js/material-bootstrap-wizard.js"></script>

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
