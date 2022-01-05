
      <div id="form1" class="container-fluid" style="margin-top: 15px;padding: 5px;">
                <div class="box box-header no-border">

                      <div class="box-header with-border">
                        <button class="btn btn-default text-red pull-right exit"><span class="fa fa-close"></span></button>
                        <h5 class="text-bold text-left">FORM UPLOAD DATA</h5>
                      </div>
                      <!-- /.box-header -->
                      <!-- form start -->
            <div class="box-body">
                    <form id="submit" class="forms-sample">
                      <div class="form-group">
                        <input id="fileupload" type="file" name="fileimport">
                        <div class="input-group">
                          <input id="table" type="hidden" name="table" value="<?=$table;?>">
                        </div>
                        <p><code id="hasil">Progress</code></p>
                        <div class="progress active" id="progress">
                          
                        </div>
                      </div>
                      <!-- /.box-body -->
                      <div class="box-footer width-border">
                        <button type="submit" class="btn btn-success" id="save"> Submit </button>
                        <button type="reset" class="btn btn-danger exit">Cancel</button>
                      </div>
                  </form>
            </div>
        </div>
      </div>
      <script  type="text/javascript">
$(document).ready(function(){
  $(".exit").click(function(){
  $("#form1").hide();
  });
});
</script>
<script type="text/javascript">
    
    $(document).ready(function(){
        $('#submit').submit(function(e){
            $("#save").attr('disabled', true);
            e.preventDefault(); 
                 $.ajax({
                     url:'<?php if($table=='tbl_history_settingadm'){ echo base_url('master/uploadplanning'); }else{ echo base_url('master/upload');}?>',
                     type:"post",
                     data:new FormData(this),
                     processData:false,
                     contentType:false,
                     cache:false,
                     async:true,
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
    var myVar;
    var x = 100;
    var tabel1 = "<?=$table;?>";
$("#save").click(function(){
  myVar = setInterval(
    function () {
                  $.ajax({
                      async: false,
                      type: "POST",
                      url : "<?=base_url('master/statusupload');?>",
                      data: "table="+tabel1,
                      cache:false,
                      async:true,
                      dataType: 'json',
                      success: function(data){
                          persen = (data.persen *1)+0;
                          $('#hasil').text(data.success+" success "+data.failed+" failed from "+data.total+" rows");
                          $("#progress").html("<div class='progress-bar progress-bar-primary progress-bar-striped text-center text-white' role='progressbar' aria-valuenow='100' aria-valuemin='0' aria-valuemax='100' style='width:"+persen+"%'>"+persen+"%</div>");                       
                          if(persen == 100){
                            table.ajax.reload();
                            window.clearInterval(myVar);
                            x= 0; 
                            
                          }
                      }
                  });
                },x);  
                  
  });
</script>
<script type="text/javascript">
function stopbar(){
    var myVar;
    window.clearInterval(myVar);
    x= 0;       
  }
</script>