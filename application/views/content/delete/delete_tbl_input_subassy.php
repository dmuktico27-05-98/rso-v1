
      <div id="form4" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM DELETE DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
      <?=form_open('mastercrud/delete_sebagian', 'id="mydata"'); ?>
        <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
        <div class="box-body">                               
            <div class="form-group">
              <label for="exampleInputEmail1">Create Date</label>
              <input id="create_date" type="text" class="form-control date" name="create_date" class="form-control" title="Input Create Date">
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
          if(response.success == true){
            swal({
                title: "Success!!",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false
              });
                  $('.form-group').removeClass('has-error')
                                  .removeClass('has-success');
                  $('.text-danger').remove();
                  fa[0].reset(); 
                  $("#form").toggle();
                  table.ajax.reload();
          }else if(response.success == false){
              swal({
                title: "Failed!!",
                text: "Data not found",
                type: "warning",
                timer: 1000,
                showConfirmButton: false
              });
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
          }
        }
     });
  });
</script>
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form4").toggle();
  });

});
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('.form-control.datetime').timepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'HH:mm:ss',
    stepHour: 1,
    stepMinute: 1,
    stepSecond: 1
    });
    $('.form-control.date').datepicker({
        changeMonth:true,
        changeYear:true,
        yearRange:"-100:+0",
        dateFormat:"yy-mm-dd"
        });
    });
</script>