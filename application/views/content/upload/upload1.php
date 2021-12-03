<!-- /.box -->
<div id="form1"  class="box no-border" style="margin-top: -15px;padding: 5px;">
  <div class="small-box text-purple" style="border:1px solid #ccd;margin:5px;padding: 2px;">
    <div class="box-header with-border">
      <button class="btn btn-default text-red pull-right exit"><span class="glyphicon glyphicon-remove"></span></button>
      <h5 class="text-bold">FORM UPLOAD DATA</h5>
    </div>
<!-- /.box-header -->
<!-- form start -->
<form id="submit">
  <div class="box-body">
    <div class="form-group">
        <a href="<?=base_url()?>formatexcel/<?=$table;?>.xlsx" class="btn btn-default text-green" title="Download Format Excel Upload">
            <span class="fa fa-file-excel-o fa-lg"> </span> Format upload file excel
        </a>
    </br></br> 
      <label for="exampleInputFile">File upload excel</label>
      <input id="table" type="hidden" name="table" value="<?=$table;?>"/>
      <input id="fileupload" type="file" name="fileimport">
    </div>
    <p><code id="hasil">progress</code></p>
    <div class="progress active" id="progress">
      
    </div>


  </div>
  <!-- /.box-body -->
    <div class="box-footer width-border">
        <button type="submit" class="btn btn-success" id="save"> Submit </button>
        <button type="reset" class="btn btn-default exit">Close</button>
    </div>
</form>
</div>
</div>
<script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form1").hide();
  stopbar();
  });
});
</script>
<script type="text/javascript">
    var myVar;
    var x = 1;
    var table = "<?=$table;?>";
    $(document).ready(function(){
        $('#submit').submit(function(e){
            var myVar = setInterval('progressbar()',x);
            e.preventDefault(); 
                 $.ajax({
                     url:'<?=base_url();?>master/upload',
                     type:"post",
                     data:new FormData(this),
                     processData:false,
                     contentType:false,
                     cache:true,
                     async:false,
                     dataType: 'json',
                      success: function(data){
                        if(data.status == "error"){
                          swal({
                              title: "Error!",
                              text: data.msg,
                              type: "warning",
                              timer: 1200,
                              showConfirmButton: false
                            });                          
                        }
                                                                                        
                   }

                 });
                  
            }); 
                   
         
    });   
</script>
<script type="text/javascript">
function progressbar(){
                  $.ajax({
                      async: false,
                      type: "POST",
                      url : "<?=base_url('master/statusupload');?>",
                      data: "table="+table,
                      cache:false,
                      dataType: 'json',
                      success: function(data){
                          console.log(data.persen);

                          persen = data.persen+0;
                          if(data.persen == 100){
                            stopbar();
                            tabel.ajax.reload();
                          }
                          $('#hasil').text(data.success+" rows success "+data.failed+" failed from "+data.total+" rows");
                          $("#progress").html("<div class='progress-bar progress-bar-primary progress-bar-striped text-center text-red' role='progressbar' aria-valuenow='100' aria-valuemin='0' aria-valuemax='100' style='width:"+persen+"%'>"+persen+"%</div>");
                          

                      }
                  });
                  
  }
</script>
<script type="text/javascript">
function stopbar(){
    window.clearInterval(myVar);
    var x= 0;       
  }
</script>