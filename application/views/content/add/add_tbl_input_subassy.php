
      <div id="form" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM ADD DATA </h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
      <?=form_open('mastercrud/add_json', 'id="mydata"'); ?>
      <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
        <div class="box-body">
              <div class="row">
              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        
                        <div class="form-group">
                          <label for="exampleInputEmail1">Job No</label>
                          <select id="job_no" class="js-example-basic-multiple w-100 form-control" name="job_no">
                          <option value=""></option>
                          <?php foreach ($master_part as $key) { ?>
                          <option value="<?=$key->job_no;?>">
                          <?=$key->job_no;?></option>
                          <?php } ?>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Sto P1</label>
                          <input id="sto_p1" type="number" name="sto_p1" class="form-control" >
                        </div>
                                              
                  </div>
                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                 
                        <div class="form-group">
                          <label for="exampleInputEmail1">Sto P4</label>
                          <input id="sto_p4" type="number" name="sto_p4" class="form-control" >
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Sto KAP</label>
                          <input id="sto_kap" type="number" name="sto_kap" class="form-control" >
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Sto PPL</label>
                          <input id="sto_ppl" type="number" name="sto_ppl" class="form-control" >
                        </div>
                      
                  </div>
                  <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                  <div class="form-group">
                          <label for="exampleInputEmail1">Sto Process</label>
                          <input id="sto_process" type="number" name="sto_process" class="form-control" >
                        </div>
                     <div class="form-group">
                          <label for="exampleInputEmail1">Select Shop</label>
                          <select id="shop_name" class="form-control" name="shop_name">
                          <option value="<?=$shop_name;?>"><?=$shop_name;?></option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Shift</label>
                          <select id="shift" class="form-control" name="shift">
                          <option value="<?=$shift;?>"><?=$shift;?></option>
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
                timer: 400,
                showConfirmButton: false
              });
                  $('.form-group').removeClass('has-error')
                                  .removeClass('has-success');
                  $('.text-danger').remove();
                  fa[0].reset(); 
                  $("#job_no").focus();
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

<script src="<?=base_url('assets/js/select2.js')?>"></script>

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
        }).datepicker("setDate",'now');
    });
</script>