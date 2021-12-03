<div id="content">	
	<section class="content-header text-orange" style="background-color: #edf0f5;">
    <span style="font-size: 20px"> Welcome </span>
    <small class="text-olive"><i><?=gmdate('l, d F Y',time()+60*60*7);?>&nbsp;<span id="clock">date(H:i:s)</span></i></small>
    <ol class="breadcrumb">
      <li><a href="<?=base_url();?>"><i class="fa fa-home"></i> Home</a></li>
      <li><a onclick="return menu('<?=$url; ?>','<?=$nav;?>','<?=$otorisasi;?>')"><?=$nav;?></a></li>
    </ol>
  </section>
 <!-- Main content -->
  <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box box-default">
        <div class="box-header with-border" style="border-bottom: 1px solid #ccc;">
          <h3 class="box-title text-bold"><a href="#">Dashboard </a> Configuration</h3>
        </div>
        <div class="box-body">
          <table class="table table-border text-center">
            <tr class="bg-olive">
              <td>
                Line
              </td>
              <td>
                Line Name
              </td>
              <td>
                Status
              </td>
              <td>
                Update Time
              </td>
              <td>
                Update by
              </td>
              <td>
                Tact Time(Seconds)
              </td>
              <td>
                Over Time(minute)
              </td>
              <td>
                Source Current
              </td>
              <td>
                Source Plan
              </td>
              <td>
                Cut Off Lifting
              </td>
               <td>
                Action
              </td>
            </tr>
            <?php foreach ($data_table as $key) { ?>
            <tr class="bg-gray">
              <td>
                <?=$key->line_no;?>
              </td>
              <td>
                <?=$key->line_name;?>
              </td>
              <td>
                <?=$key->status;?>
              </td>
              <td>
                <?=$key->update_time;?>
              </td>
              <td>
                <?=$key->update_by;?>
              </td>
              <td>
                <div id="formtakt_time<?=$key->id;?>" class="form-group">
                <input id="takt_time<?=$key->id;?>" type="number" name="takt_time<?=$key->id;?>" class="form-control text-center" value="<?=$key->takt_time;?>">
                </div>
              </td>
              <td>
                <div id="formover_time<?=$key->id;?>" class="form-group">
                <input id="over_time<?=$key->id;?>" type="number" name="over_time<?=$key->id;?>" class="form-control text-center" value="<?=$key->over_time;?>">
              </div>
              </td>
              <td>
                 <div id="formsource_current<?=$key->id;?>" class="form-group">
                    <select id="source_current<?=$key->id;?>" class="form-control" name="source_current<?=$key->id;?>">
                      <option value="<?=$key->source_current;?>"><?=$key->source_current;?></option>
                      <?php foreach ($data_source as $row) {
                        if($row->tabel!=$key->source_current){ ?>
                          <option value="<?=$row->tabel;?>"><?=$row->tabel;?></option>
                      <?php }} ?>
                    </select>
                </div> 
              </td>
              <td>
                 <div id="formsource_plan<?=$key->id;?>" class="form-group">
                    <select id="source_plan<?=$key->id;?>" class="form-control" name="source_plan<?=$key->id;?>">
                      <option value="<?=$key->source_plan;?>"><?=$key->source_plan;?></option>
                       <option value=""></option>
                      <?php foreach ($data_source as $row) {
                        if($row->tabel!=$key->source_plan){ ?>
                          <option value="<?=$row->tabel;?>"><?=$row->tabel;?></option>
                      <?php }} ?>
                    </select>
                </div> 
              </td>
              <td>
                <div id="formcutoff_lifting<?=$key->id;?>" class="form-group">
                <input id="cutoff_lifting<?=$key->id;?>" type="text" name="cutoff_lifting<?=$key->id;?>" class="form-control text-center" value="<?=$key->cutoff_lifting;?>">
              </div>
              </td>
              <td>
                <button id="submit<?=$key->id;?>" class="btn btn-warning">Update</button>
              </td>
            </tr>
          <?php } ?>
          </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <big><code>Information Source Data</code></big>
          <ul>
            <li><b>1. tbl_planning</b> (planning production by upload)</li>
            <li><b>2. tbl_jpo</b> (planning production synchronized by JPO Toyota)</li>
            <li><b>3. tbl_planning_special</b> (planning production special event by upload)</li>
          </ul>
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
</div>
<script type="text/javascript">
    <?php foreach($data_table as $row){ ?>
    $("#submit<?=$row->id;?>").click(function(){
        var id = "<?=$row->id;?>";
        var line_no = "<?=$row->line_no;?>";
        var takt_time =$("#takt_time<?=$row->id;?>").val();
        var over_time =$("#over_time<?=$row->id;?>").val();
        var source_current =$("#source_current<?=$row->id;?>").val();
        var source_plan =$("#source_plan<?=$row->id;?>").val();
        var cutoff_lifting =$("#cutoff_lifting<?=$row->id;?>").val();
        var number =/^[0-9]+$/;
          if(takt_time<=0){
            $("#formtakt_time<?=$row->id;?>").addClass("has-error");
          }else if(!over_time.match(number)){
            $("#formover_time<?=$row->id;?>").addClass("has-error");
          }else if(source_plan!='' && cutoff_lifting==''){
            $("#formcutoff_lifting<?=$row->id;?>").addClass("has-error");
          }else if(source_plan=='' && cutoff_lifting!=''){
            $("#formsource_plan<?=$row->id;?>").addClass("has-error");
          }else{
            $("#formtakt_time<?=$row->id;?>").removeClass("has-error");
            $("#formover_time<?=$row->id;?>").removeClass("has-error");
            $("#formcutoff_lifting<?=$row->id;?>").removeClass("has-error");
            $("#formsource_plan<?=$row->id;?>").removeClass("has-error");
            $("#formsource_current<?=$row->id;?>").addClass("has-success");
            $("#formtakt_time<?=$row->id;?>").addClass("has-success");
            $("#formover_time<?=$row->id;?>").addClass("has-success");
            $("#formsource_plan<?=$row->id;?>").addClass("has-success");
            $("#formcutoff_lifting<?=$row->id;?>").addClass("has-success");
            $.ajax({
                  type: "POST",
                  url : "<?=base_url('master/submitadjust'); ?>",
                  data: "id="+id+"&line_no="+line_no+"&takt_time="+takt_time+"&over_time="+over_time+"&source_current="+source_current+"&source_plan="+source_plan+"&cutoff_lifting="+cutoff_lifting,
                  cache:false,
                  success: function(data){
                    if(takt_time>0){
                          swal({
                              title: "Success!",
                              text: "",
                              type: "success",
                              timer: 1000,
                              showConfirmButton: false
                            });
                     }
                          $('#content').html(data);
                  }
              });

          }
            
        });
      <?php }?>
  </script>