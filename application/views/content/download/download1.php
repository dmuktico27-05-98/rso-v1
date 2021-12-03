
      <div id="form5" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM FILTER DOWNLOAD DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
<?=form_open('master/exportexcel', 'id="mydata"'); ?> 
  <div class="box-body">
    <div class="form-group start col-md-6">
      <label for="exampleInputEmail1">Prod. date start</label>
      <input id="start" name="start" type="text" class="form-control date" format="yy-mm-dd">
      <input id="table" name="table" type="hidden" class="form-control" value="<?=$table;?>">
    </div>
   <div class="form-group finish col-md-6">
      <label for="exampleInputEmail1">Prod. date finish</label>
      <input id="finish" name="finish" type="text" class="form-control date" format="yy-mm-dd">
    </div>
  </div>
  <!-- /.box-body -->
    <div class="box-footer width-border">
        <button type="submit" class="btn btn-success"  onclick="eport()"> Export </button>
        <button type="reset" class="btn btn-danger exit">Close</button>
    </div>
  </form>
</div>
</div>
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form5").hide();
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
<script type="text/javascript">
  function eport(){ 
    var start = $("#start").val();
    var finish = $("#finish").val();
    var table = '<?=$table;?>';
    if(start!='' && finish!=''){
                swal({
                  title: "Generate Excel",
                  text: "",
                  type: "success",
                  timer: 25000,
                  showCancelButton: true,
                  cancelButtonText: 'Close',
                  showConfirmButton: false,
                }); 
    }else{
      $(".form-group.start").addClass("text-danger has-error");
      $(".form-group.finish").addClass("text-danger has-error");
    }
  };
</script>