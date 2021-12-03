<div id="form" class="container-fluid" style="padding: 20px;">
                <div class="box box-header no-border">
                      <div class="box-header with-border">
                       
                        <h5 class="text-bold text-left">FORM ADD DATA HRP</h5>
                      </div>
                      <?=form_open('action/change', 'id="mydata"'); ?>
      <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
        <div class="box-body">
              <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                  
                      
                        <div class="form-group">
                          <label for="exampleInputEmail1">Username</label>
                          <input id="id" type="hidden" name="id" value="<?=$row->id; ?>"/>
                          <select id="username" class="form-control" name="username">
                          <option value="<?=$username;?>"><?=$username;?></option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampeInpultEmail1">Current Password</label> 
                           <input id="currentpwd" type="text" class="form-control" name="currentpwd"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">   
                        <div class="form-group">
                          <label for="exampeInpultEmail1">New Password *</label>            
                          <input id="pwd" type="text" class="form-control" name="pwd"/>
                        </div>
                         <div class="form-group">
                          <label for="exampeInpultEmail1">Confirmation New Password *</label> 
                          <input id="pwdconf" type="text" class="form-control" name="pwdconf"/>
                        </div>
                    </div>
                
                  </div>
                  <!-- /.box-body -->
               <div class="box-footer width-border">
                              <button type="submit" class="btn btn-success"> Submit </button>
                            
                            </div>
                        </form>
                  </div>
              </div>
<script type="text/javascript"> 
$('#mydata').submit(function(e){
    e.preventDefault();
     var fa = $(this);              
      $.ajax({
         url: fa.attr('action'),
         type:"post",
         data:new FormData(this),
         processData:false,
         contentType:false,
         cache:false,
         async:false,
         dataType: 'json',  
        success: function(response) {
          if(response.success ==true) {
                swal({
                    title: "Update success!",
                    text: "Logout system....",
                    type: "success",
                    timer: 1000,
                    showConfirmButton: false
                  });
               window.location.href ="<?=base_url('action/logout');?>/";

          }else{
            $.each(response.messages,function(key, value){
              var element = $('#' + key);
              element.closest('div.form-group')
              .removeClass('has-error')
              .addClass(value.length > 0 ? 'has-error' : 'has-success')
              .find('.text-danger')
              .remove();
              element.after(value);
            });
              $('#file').text(response.error);
              $('div.form-group').addClass('text-danger');
          }
        }
     });
  });
</script>