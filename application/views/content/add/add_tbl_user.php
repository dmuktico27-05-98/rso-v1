
      <div id="form" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM ADD DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
      <?=form_open('mastercrud/add_json', 'id="mydata"'); ?>
        <div class="box-body">
              <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                  
                        <div class="form-group">
                          <label for="exampleInputEmail1">Nama Lengkap</label>
                          <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
                          <input id="nama" type="text" name="nama" class="form-control" title="Input nama lengkap...">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">No. Induk Karyawan</label>
                          <input id="nik" type="text" name="nik" class="form-control" title="Input nik...">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Username</label>
                          <input id="username" type="text" name="username" class="form-control" title="Input username...">
                        </div>
                        <div class="form-group">
                        <label for="exampleInputEmail1">Select shift</label>
                          <select id="shift" class="form-control" name="shift">
                          <option value=""></option>
                          <option value="A">A</option>
                          <option value="B">B</option>
                          <option value="N">N</option>
                          </select>
                        </div>
                        
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Password</label>
                          <input id="password" type="text" name="password" class="form-control" title="Input password...">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Level</label>
                          <select id="level" class="js-example-basic-multiple w-100 form-control" name="level">
                          <option value=""></option>
                            <?php foreach ($data_level as $key) { ?>
                            <option value="<?=$key->user_group."-".$key->user_level."-".$key->user_area;?>"><?=$key->user_level;?></option>
                            <?php } ?>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Shop</label>
                          <select id="shop" class="js-example-basic-multiple w-100 form-control" name="shop">
                          <option value=""></option>
                          <?php foreach ($data_shop as $key) { ?>
                          <option value="<?=$key->shop_name;?>"><?=$key->shop_name;?></option>
                          <?php } ?>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Select Jabatan</label>
                          <select id="jabatan" class="js-example-basic-multiple w-100 form-control" name="jabatan">
                          <option value=""></option>
                          <option value="member">Member</option>
                          <option value="leader">Leader</option>
                          <option value="foreman">Foreman</option>
                          <option value="supervisor">Supervisor</option>
                          <option value="manager">Manager</option>
                          <option value="divisi">Divisi</option>
                          <option value="dic">DIC</option>
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

<script src="<?=base_url('assets/js/select2.js')?>"></script>