<div id="content">
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
        
                    <div class="row">
                      <div class="col-sm-12">
                          <div class="box box-header no-border">
                              <label style="font-size: 18px;"><a onclick="return menu('<?=$url; ?>','<?=$nav;?>','<?=$link;?>','<?=$otorisasi;?>')"><?=$nav;?></a> 
                              || <small class="text-olive"><i><?=gmdate('l, d F Y',time()+60*60*7);?>&nbsp;<span id="clock">date(H:i:s)</span></i></small>
                                  </label>
                                <label class="pull-right">
                                    <div class="btn btn-default text-green" onclick="download('<?=$table;?>')"  title="Download Data"><i class="fa fa-file-excel-o"></i></div> 
                                    <div class="btn btn-default text-green" onclick="return menu('<?=$url; ?>','<?=$nav;?>','<?=$link;?>','<?=$otorisasi;?>')"  title="Refresh"><i class="fa fa-refresh"></i>
                              </label>
                        </div>                 
                      </div>  
                    </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div style="width:1400px;margin-left:23px">
              <div class="card">
                  <div class="card-body">
                    <input type="hidden" name="table1" value="<?=$table;?>">
                    <input type="hidden" name="filter" id="filter" value="">
                      <table id="mytable" class="display nowrap cell-border hover order-column strip compact" style="width:100%;font-size: 12px;color:black">
                        <thead>
                          <tr>
                            <th class="text-left" rowspan="2">Menu User</th>
                            <?php foreach($data_level as $row){ ?>
                            <th colspan="4" class="text-center"><?=$row->user_level; ?></th>
                            <?php } ?>
                          </tr>
                          <tr>
                            <?php for($i=1;$i<=$jumlah_level;$i++){ ?>
                            <th class="text-center"><i class="fa fa-eye text-blue"></i></th>
                            <th class="text-center"><i class="fa fa-plus text-green"></i></th>
                            <th class="text-center"><i class="fa fa-edit text-orange"></i></th>
                            <th class="text-center"><i class="fa fa-trash text-red"></i></th>
                            <?php } ?>              
                          </tr>
                        </thead>          
                        <tbody>
                          <?php $cek=1; foreach($data_menu as $row){ if($cek!=$row->menuid){ ?>
                          <tr> <td class="text-left  <?php if($row->parent=='-'){ echo 'bg-purple';}else{ echo 'bg-gray';}?>"><?=$row->nav; ?></td> <?php } ?>
                              
                              <?php foreach($data_level as $row1){ if($row->user_level==$row1->user_level){ ?>

                              <td class="text-center">
                                <?php if($row->view_level=="yes"){ ?>
                                <div id="viewuncheck<?=$row->id.$row1->id;?>"><i class="fa fa-check-square text-green"></i></div>
                                <div id="viewcheck<?=$row->id.$row1->id;?>"></div>
                                <?php }else{ ?>
                                <div id="viewcheck<?=$row->id.$row1->id;?>"><i class="fa fa-close text-red"></i></div>
                                <div id="viewuncheck<?=$row->id.$row1->id;?>"></div>
                                <?php }?>
                              </td>

                              <td class="text-center">
                                <?php if($row->view_level=="yes" and $row->add_level=="yes" and $row->tabel!="-"){ ?>
                                <div id="adduncheck<?=$row->id.$row1->id;?>"><i class="fa fa-check-square text-green"></i></div>
                                <div id="addcheck<?=$row->id.$row1->id;?>"></div>
                                <?php }elseif($row->view_level=="yes" and $row->add_level=="no" and $row->tabel!="-"){ ?>
                                <div id="addcheck<?=$row->id.$row1->id;?>"><i class="fa fa-close text-red"></i></div>
                                <div id="adduncheck<?=$row->id.$row1->id;?>"></div>
                                <?php }else{ ?>
                                <i class="fa fa-close text-red"></i>
                                <?php }?>
                              </td>

                              <td class="text-center">
                                <?php if($row->view_level=="yes" and $row->edit_level=="yes" and $row->tabel!="-"){ ?>
                                <div id="edituncheck<?=$row->id.$row1->id;?>"><i class="fa fa-check-square text-green"></i></div>
                                <div id="editcheck<?=$row->id.$row1->id;?>"></div>
                                <?php }elseif($row->view_level=="yes" and $row->edit_level=="no" and $row->tabel!="-"){ ?>
                                <div id="editcheck<?=$row->id.$row1->id;?>"><i class="fa fa-close text-red"></i></div>
                                <div id="edituncheck<?=$row->id.$row1->id;?>"></div>
                                <?php }else{ ?>
                                <i class="fa fa-close text-red"></i>
                                <?php }?>
                              </td>

                              <td class="text-center">
                                <?php if($row->view_level=="yes" and $row->delete_level=="yes" and $row->tabel!="-"){ ?>
                                <div id="deleteuncheck<?=$row->id.$row1->id;?>"><i class="fa fa-check-square text-green"></i></div>
                                <div id="deletecheck<?=$row->id.$row1->id;?>"></div>
                                <?php }elseif($row->view_level=="yes" and $row->delete_level=="no" and $row->tabel!="-"){ ?>
                                <div id="deletecheck<?=$row->id.$row1->id;?>"><i class="fa fa-close text-red"></i></div>
                                <div id="deleteuncheck<?=$row->id.$row1->id;?>"></div>
                                <?php }else{ ?>
                                <i class="fa fa-close text-red"></i>
                                <?php }?>
                              </td>

                              <?php } } $cek=$row->menuid; if($cek!=$row->menuid){ ?>                
                          </tr>
                          <?php }} ?> 
                          </tbody>
                        </table>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </section>

     </div> 
</section>
</div>
<script type="text/javascript">
var url="<?=$url;?>";
var nav="<?=$nav;?>";
var link="<?=$link;?>";
var otorisasi="<?=$otorisasi;?>";
$(document).ready(function() {
     var table = $('#mytable').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "pageLength" :-1,
            "order": [], 
            "scrollY":($(window).height()-410),
            "scrollX":true,
            "pagingType": "full_numbers",
            "scrollCollapse":true,
            "paging":true,
            "fixedColumns":false,
            "AutoWidth": true,
            "LengthChange": true,
          });
 
}); 
$(window).resize(function(){
   var tinggi = ($(window).height()-410);
    $('#mytable').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#mytable').DataTable().draw();
  });
</script>
 <?php foreach($data_menu as $row){ 
        foreach($data_level as $row1){ if($row->user_level==$row1->user_level){ ?>
            <script type="text/javascript"> 
              $("#viewcheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/viewcheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#viewcheck<?=$row->id.$row1->id;?>").hide();
                               $("#viewuncheck<?=$row->id.$row1->id;?>").html(data);
                               $("#viewuncheck<?=$row->id.$row1->id;?>").show();
                               menu(url,nav,link,otorisasi);
                          }
                      });
                  });
            </script>
            <script type="text/javascript"> 
              $("#viewuncheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/viewuncheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#viewuncheck<?=$row->id.$row1->id;?>").hide();
                               $("#viewcheck<?=$row->id.$row1->id;?>").html(data);
                               $("#viewcheck<?=$row->id.$row1->id;?>").show();
                                menu(url,nav,link,otorisasi);
                               
                          }
                      });
                  });
            </script>        
  
            <script type="text/javascript"> 
              $("#addcheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                  //alert('add'+menuid+user_level);
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/addcheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#addcheck<?=$row->id.$row1->id;?>").hide();
                               $("#adduncheck<?=$row->id.$row1->id;?>").html(data);
                               $("#adduncheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
          
            <script type="text/javascript"> 
              $("#adduncheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                  //alert('addun'+menuid+user_level);
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/adduncheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#adduncheck<?=$row->id.$row1->id;?>").hide();
                               $("#addcheck<?=$row->id.$row1->id;?>").html(data);
                               $("#addcheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
   
            <script type="text/javascript"> 
              $("#editcheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/editcheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#editcheck<?=$row->id.$row1->id;?>").hide();
                               $("#edituncheck<?=$row->id.$row1->id;?>").html(data);
                               $("#edituncheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
            <script type="text/javascript"> 
              $("#edituncheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/edituncheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#edituncheck<?=$row->id.$row1->id;?>").hide();
                               $("#editcheck<?=$row->id.$row1->id;?>").html(data);
                                $("#editcheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
  
            <script type="text/javascript"> 
              $("#deletecheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/deletecheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#deletecheck<?=$row->id.$row1->id;?>").hide();
                               $("#deleteuncheck<?=$row->id.$row1->id;?>").html(data);
                               $("#deleteuncheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
            <script type="text/javascript"> 
              $("#deleteuncheck<?=$row->id.$row1->id;?>").click(function(){
                  var menuid = "<?=$row->menuid;?>";
                  var user_level ="<?=$row1->user_level;?>";
                      $.ajax({
                          type: "POST",
                          url : "<?=base_url('master/deleteuncheck'); ?>",
                          data: "menuid="+menuid+"&user_level="+user_level,
                          cache:false,
                          success: function(data){
                               $("#deleteuncheck<?=$row->id.$row1->id;?>").hide();
                               $("#deletecheck<?=$row->id.$row1->id;?>").html(data);
                               $("#deletecheck<?=$row->id.$row1->id;?>").show();
                          }
                      });
                  });
            </script>
            
  <?php }}} ?>
  <script type="text/javascript">
function load(url,nav,table,otorisasi){ 
    $("#content").hide();
    $.ajax({
        type: "POST",
        url :url,
        data: "nav="+nav+"&url="+url+"&table="+table+"&otorisasi="+otorisasi,
        cache:false,
        success: function(data){
            $('#isi').html(data);
        }
    });
};
</script>
