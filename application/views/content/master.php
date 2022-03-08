<?php
   foreach($data_field as $row){ 
      if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){
        $field1[]="<th>".strtoupper($row->name)."</th>"; 
        $name=$row->name;
        $field3[]="<th><input type='text' placeholder='".$row->name."' id='".$row->name."' name='".$row->name."' class='filter' style='width:100%;border:1px solid #999'></th>"; 
        $field4[]="<th style='font-size: 0px;border: 0px;opacity: 0;padding: 0px;margin: 0px;'>".strtoupper(substr($row->name,0,1)).substr($row->name,1)."</th>"; 
        $field2[] = $row->name;
      }
    }
    $field=join('',$field1);
    $field3=join('',$field3);
    $field4=join('',$field4);
    $count = count($field2);

?>
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
                              <?php $link=explode('_',$table);
                                      $tab=$link[0].'_'.$link[1];
                                      $patan=$link[2];
                              if($tab=="tbl_master" OR $patan=="patan" ){?>
                              <?php if($data_user_level=="Administrator" || $shop=="PPL" && $table=='tbl_master_part_ppl'){ ?>
                                <div class="btn btn-default text-green" onclick="upload('<?=$table;?>')"  title="Upload"><i class="fa fa-upload"></i></div>
                                <div class="btn btn-default text-blue" onclick="merging_master('<?=$table;?>')"  title="Merge Master">Merging</div>
                                <?php } ?>
                              <div class="btn btn-default bg-blue" onclick="download('<?=$table;?>')"  title="download all"><i class="fa fa-download"></i></div>
                              <?php }
                              if($table=="tbl_user"){?>
                              <a href="<?=base_url('master/printidcard');?>" class="btn btn-default text-green" title="print id card" target="_blank"><i class="fa fa-print"></i></a>
                              <?php }
                              if($table=="tbl_master_qr"){?>
                              <a href="<?=base_url('master/print_qr');?>" class="btn btn-default text-blue" title="print qrcode" target="_blank"><i class="fa fa-print"></i></a>
                              <?php }
                             if($data_user_level=="Administrator"){?>
                              <div class="btn btn-default text-red" onclick="delete_all('<?=$table;?>')"  title="delete all"><i class="fa fa-trash"></i></div>
                              <?php }
                              if($table=="tbl_planning" OR $table=="tbl_planning_special"){?>
                              <div class="btn btn-default text-green" onclick="delete_detail('<?=$table;?>')"  title="delete"><i class="fa fa-trash"></i></div>
                              <?php }
                              if($add_level=="yes"){?>
                              <div class="btn btn-default text-green" onclick="add('<?=$table;?>')" title="Add Data"><i class="fa fa-plus"></i></div>
                              <?php }?> 
                              <input type="hidden" id="cari" name="cari">
                            </label>
                        </div>                 
                        <div class="small-box text-purple">
                            <div id="adddata"></div>             
                            <div id="edit"></div>
                            <div id="upload"></div>
                            <div id="print_label"></div>
                            <div id="delete"></div>
                        </div>
                      </div>  
                    </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
              <div class="card">
                  <div class="card-body">
                    <input type="hidden" name="table1" value="<?=$table;?>">
                    <input type="hidden" name="filter" id="filter" value="">
                      <table id="mytable" class="display nowrap cell-border hover order-column strip compact" style="width:100%;font-size: 12px;color:black">
                     <thead>
                      <tr>
                        <th style="width: 50px;">
                            ACTION
                        </th>
                        <?=$field; ?>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
                        <tfoot> 
                        <tr>
                          <th class="text-center" style="font-size: 0px;border: 0px;opacity: 0;padding: 0px;margin: 0px;">                 
                          </th>
                          <?=$field4; ?>
                        </tr>
                        </tfoot>
                        <tfoot> 
                        <tr>
                                      
                        </tr>
                        </tfoot>
                
                          <tfoot> 
                        <tr>
                          <th class="text-center text-green">
                            Filter          
                          </th>                
                                <?=$field3;?>
                        </tr>
                      </tfoot>
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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog text-center">
            <div class="modal-header bg-gray"  style="border-radius: 10px 10px 0px 0px;padding: 10px;">
              <button class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
                <label class="modal-title">View Data</label>    
            </div>
          <div class="modal-content" style="border-radius: 0px 0px 10px 10px">
              <div class="box"  id="view"></div>  
           </div>
        </div>
    </div>  
<script>
  var column;
  var table;
$(document).ready(function() {
  table = $('#mytable').DataTable({
            "processing": true, 
            "serverSide": true,             
            "sScrollY":($(window).height()-400),
            "sScrollX":true,
            "bPaginate":true,
            "bJQueryUI":true,
            "paging":true, 
            "pagingType": "full_numbers",
            "AutoWidth": true,
            "pageResize": true,
            "pageLength" :20,
             "targets": 'no-sort',
            "bSort": false,
            "aLengthMenu":[[10,20,25,50,100],[10,20,25,50,100]],
            "columnDefs": [
            { 
                "targets": [ 0 ], 
                "orderable": false,
                "className":"text-center" 
            },            
            ],     
            "order": [[0, 'desc']],
            "ajax": {
            "url": "<?=base_url('master/get_data')?>",
            "type": "POST",          
            data: function(data){ 
                    <?php
                   foreach($data_field as $row){ 
                      if($row->name!='id' AND $row->name!='id_check' AND $row->name!='password' AND $row->name!='idcard'){ ?>

                         data.<?=$row->name;?> = $('#<?=$row->name;?>').val();
                     <?php } } ?>
                    data.filter = $('#filter').val();
                   
                    data.table = "<?=$table;?>";
                    data.edit_level = "<?=$edit_level;?>";
                    data.delete_level = "<?=$delete_level;?>";
              
               },
                "deferLoading": 59,  
                "error": function(){
                  window.location.href ="<?=base_url('action/logout');?>";
                }           
            },                           
        });


   $('#mytable tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
 
    $('#button').click( function () {
        alert( table.rows('.selected').data().length +' row(s) selected' );
    } );
   $('#loadtable').click(function(){ //button filter event click
        table.ajax.reload();  //just reload table
    });

  
    $("#mytable").on('search.dt',function(){
      var cari =$('.dataTables_filter input').val();
      $('#cari').val(cari);
  });
    new $.fn.dataTable.FixedColumns( table, {
        leftColumns: 1,
        rightColumns: 0
      });
    $('.filter').on('keyup change',function() {
        $('#filter').val(this.value);
        table.ajax.reload();
    });
});
$(window).resize(function(){
    var tinggi = ($(window).height()-400);
    $('#mytable').closest('.dataTables_scrollBody').css('height',tinggi);
  })

</script>
<script type="text/javascript"> 
    function printkanban1(){
           $.ajax({
              url: '<?=base_url('master/data_job');?>',
              dataType: 'json',
              success: function(data) {                
                  var options = {};
                  $.map(data,
                      function(o) {
                          options[o.id] = o.job_no;
                      });
                   Swal.fire({
                      title: "Print",
                      text: " Kanban",
                      input: "select",
                      icon: "question",
                      allowOutsideClick:true,
                      inputOptions: options,
                      inputPlaceholder: 'Pilih Job No',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Submit!',
                      heightAuto: false,
                      inputValidator: (value) => {
                      return new Promise((resolve) => {
                           
                               if (value=='') {
                                   resolve('Silahkan Pilih Job No')
                                }else{
                                   resolve()
                                   $("<iframe id='printabel'>")    
                                      .hide()                     
                                      .attr("src", "<?=base_url('master/printkanban1');?>/"+value) 
                                      .appendTo("body"); 

                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Print Kanban sukses',
                                        text:'',
                                        showConfirmButton: false,
                                        heightAuto: false,
                                        timer: 1500
                                      })

                            }
                        })
                    }
            
            })  

      }
    })
  }
</script>
 


  


