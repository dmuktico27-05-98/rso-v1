
      <div id="form" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM ADD DATA HRP</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
      <?=form_open('mastercrud/add_json', 'id="mydata"'); ?>
      <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
        <div class="box-body">
              <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                  
                        <div class="form-group">
                          <label for="exampleInputEmail1">HRP No.</label>
                          <select id="hrp_id" class="form-control" name="hrp_id">
                          <option value="<?=$hrp_id;?>"><?=$hrp_id;?></option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">HRP Date</label>
                          <input id="hrp_date" type="text" class="form-control date" name="hrp_date" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Job No</label>
                          <select id="job_no" class="js-example-basic-multiple w-100 form-control" name="job_no">
                          <option value=""></option>
                          <?php foreach ($data_master_part as $key) { ?>
                          <option value="<?=$key->job_no.'_'.$key->transaction.'_'.$key->item.'_'.$key->price;?>">
                          <?=$key->job_no.'_'.$key->transaction.'_'.$key->item.'_'.$key->price;?></option>
                          <?php } ?>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Shop</label>
                          <select id="shop_name" class="form-control" name="shop_name">
                          <option value="<?=$shop_name;?>"><?=$shop_name;?></option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Qty</label>
                          <input id="qty" type="text" name="qty" class="form-control">
                        </div>
                      
                        
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                       
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Shift</label>
                          <select id="shift" class="form-control" name="shift">
                          <option value=""></option>
                          <option value="A">A</option>
                          <option value="B">B</option>
                          <option value="N">N</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Cost Center</label>
                          <select id="cost_center" class="form-control" name="cost_center">
                          <option value="<?=$cost_center;?>"><?=$cost_center;?></option>
                          </select>
                         
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Category</label>
                          <select id="category" class="js-example-basic-multiple w-100 form-control" name="category">
                          <option value=""></option>
                          <?php foreach ($data_category as $key) { ?>
                          <option value="<?=$key->category;?>"><?=$key->category;?></option>
                          <?php } ?>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Detail Problem</label>
                          <textarea class="form-control" rows="5" id="detail" name="detail"></textarea>
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
                  menu(url,nav,link,otorisasi);
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