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
            <div class="form-group">
              <label for="exampleInputEmail1">User Group</label>
              <input id="user_group" type="text" name="user_group" class="form-control" title="Input Group...">
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
                  $("#form").toggle();
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