
      <div id="form" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM ADD DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
      <?=form_open('mastercrud/add_json', 'id="mydata"'); ?>
        <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
        <div class="box-body">
              <div class="row">
                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">                                  
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Level</label>
                          <select id="user_level" class="form-control" name="user_level">
                          <option value=""></option>
                          <?php foreach ($data_level as $key) { if($key->user_group!='Admin'){ ?>
                          <option value="<?=$key->user_level;?>"><?=$key->user_level;?></option>
                          <?php }} ?>
                          <option value="Andon">Andon</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">URL</label>
                          <input id="url" type="text" name="url" class="form-control">
                      </div>
                  </div>
                      
                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">  
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Pos</label>
                          <select id="user_pos" class="form-control" name="user_pos">
                          <option value=""></option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">IP Address</label>
                          <input id="ip_address" type="text" name="ip_address" class="form-control">
                        </div>
                                                                       
                  </div>
                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">                       
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Login Methode</label>
                          <select id="login_methode" class="form-control" name="login_methode">
                            <option value=""></option>
                            <option value="Scan">Scan</option>
                            <option value="Manual">Manual</option>
                            <option value="-">-</option>
                          </select>
                        </div>
                  </div>
              </div>
          </div>
       <!-- /.box-body -->
       <div class="box-footer width-border">
                              <button type="submit" class="btn btn-success"> Submit </button>
                              <button type="reset" class="btn btn-danger exit">Cancel</button>
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
        type: 'post' ,
        data: fa.serialize(),
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            swal({
                title: "Success!!",
                text: "",
                type: "success",
                timer: 1000,
                showConfirmButton: false
              });
                  $('.form-group').removeClass('has-error')
                                  .removeClass('has-success');
                  $('.text-danger').remove();
                  fa[0].reset(); 
                  $("#form").hide();
                  table.ajax.reload();
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
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form").toggle();
  });

});
</script>
<script type="text/javascript"> 
    $("#user_level").click(function(){
      var user_level = $("#user_level").val();
           $.ajax({
            type: "POST",
            url : "<?=base_url('mastercrud/datapos'); ?>",
            data: "user_level="+user_level,
            cache:false,
            success: function(data){
                $("#user_pos").html(data);
                }
            });                              
        });
</script>