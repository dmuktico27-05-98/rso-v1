
      <div id="form6" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM FILTER DOWNLOAD DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
<?=form_open('master/exportexcel',  array('id'=>'mydata','target'=>'_blank','method'=>'post')); ?> 
  <input type="hidden" name="table" value="<?=$table;?>">
  <div class="box-body">
    <table style="width: 100%;height: 100%;border-spacing: 0px;margin: 10px;">
   
      <tr>
        <td style="width: 40px;">
          From
        </td>       
        <td>
          <input id="start" name="start" type="text" class="form-control datetime" format="yy-mm-dd">
        </td>
        <td style="width: 40px;text-align: center;">
          To
        </td>
        <td>
          <input id="finish" name="finish" type="text" class="form-control datetime" format="yy-mm-dd">
        </td>
      </tr>
  
    </table>
  <!-- /.box-body -->
    <div class="box-footer width-border">
        <button type="submit" class="btn btn-success"> submit </button>
        <button type="reset" class="btn btn-danger exit">Close</button>
    </div>
  <?=form_close();?> 
</div>
</div>
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form6").hide();
  });
});
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $('.form-control.datetime').datetimepicker({
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
