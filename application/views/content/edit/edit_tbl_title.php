
      <div id="form3" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM EDIT DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
  <?=form_open_multipart('mastercrud/edit_json', 'id="mydata1" ');
    foreach($data_table as $row){ ?>
    <input type="hidden" id="id" name="id" value="<?=$row->id;?>"/>
    <input type="hidden" id="table" name="table" value="<?=$table;?>"/>
          <div class="box-body">
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                
                <div class="form-group">
                  <label for="exampleInputEmail1">Title</label>                
                  <input id="title" type="text" name="title" class="form-control" value="<?=$row->title;?>">
                </div>                               
                <div class="form-group">
                  <label for="exampleInputEmail1">Detail</label>                 
                  <input id="detail" type="text" name="detail" class="form-control" value="<?=$row->detail;?>">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Owner</label>                  
                  <input id="owner" type="text" name="owner" class="form-control" value="<?=$row->owner;?>">
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                
                                               
                <div class="form-group">
                  <label for="exampleInputEmail1">Version</label>                  
                  <input id="version" type="text" name="version" class="form-control" value="<?=$row->version;?>">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Year</label>                  
                  <input id="year" type="text" name="year" class="form-control" value="<?=$row->year;?>">
                </div>
                <div class="form-group">
                  <label for="exampeInpultEmail1">Logo File (jpg/png/gif) max 2 MB</label>
                  <input  type="file" class="form-control"  name="file" >
                  <span id="file"></span>
              </div>
              </div>
            </div>
</div>
  <?php } ?>
     <!-- /.box-body -->
     <div class="box-footer width-border">
                              <button type="submit" class="btn btn-success"> Submit </button>
                              <button type="reset" class="btn btn-danger exit">Cancel</button>
                            </div>
                        </form>
                  </div>
              </div>
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form3").hide();
  });
});
</script>
<script type="text/javascript"> 
$('#mydata1').submit(function(e){
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
                title: "Update Success!!",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false
              });
                  $('.form-group').removeClass('has-error')
                                  .removeClass('has-success');
                  $('.text-danger').remove();
                  fa[0].reset(); 
                  $("#form3").hide();
                  table.ajax.reload();

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