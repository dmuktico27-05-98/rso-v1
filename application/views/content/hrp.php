
 <div id="content">
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
                      <div class="col-sm-12">
                      <div class="small-box text-purple">
                           
                        </div>
                          <div class="box box-header no-border">
                            <label style="font-size: 18px;"><a onclick="return menu('<?=$url; ?>','<?=$nav;?>','<?=$link;?>','<?=$otorisasi;?>')"><?=$nav;?></a> 
                            || <small class="text-olive"><i><?=gmdate('l, d F Y',time()+60*60*7);?>&nbsp;<span id="clock">date(H:i:s)</span></i></small>
                                </label>
                              <label class="pull-right">
                              <?php if($nav=="Create HRP"){ ?>
                                <div class="btn btn-default text-green" onclick="add('<?=$table;?>')" title="Add Data"><i class="fa fa-plus"></i></div>
                                <?php if($print=='nok'){ ?>
                              <a href="<?=base_url('master/print_hrp')?>" title="Print Memo" target="_blank"><span class="btn btn-default"><i class="fa fa-print text-info text-lg"></i> </span></a>
                              <?php }} ?>
                              <?php if($nav=="Data HRP"){ ?>
                              <div class="btn btn-default bg-blue" onclick="download('<?=$table;?>')"  title="download all"><i class="fa fa-download"></i></div>
                            <?php } ?>
                              <input type="hidden" id="cari" name="cari">
                            </label>
                        </div>    
                        
                        <div class="small-box text-purple">
                            <div id="adddata"></div>             
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
                        <th style="text-align:center;width:40px;">Action</th>
                        <th>HRP_ID</th>
                        <th>HRP_DATE</th>
                        <th>SHIFT</th>
                        <th>JOB_NO</th>
                        <th>TRANSACTION</th>
                        <th>ITEM</th>
                        <th>PRICE</th>
                        <th>QTY</th>
                        <th>SHOP_NAME</th>
                        <th>COST_CENTER</th>
                        <th>CATEGORY</th>
                        <th>DETAIL</th>
                        <th>CREATE_DATE</th>
                        <th>CREATE_BY</th>
                        <th>QTY_RECEIVE</th>
                        <th>RECEIVE_DATE</th>
                        <th>RECEIVE__BY</th>
                        <th>STATUS</th>
                        
                    </tr>
                </thead>
                <tbody>
                <?php 
                    foreach ($hrp as $key) { if($level=="Administrator"){ ?>
                    <tr>
                        <td style="text-align:center;">
                        <label onclick="return print_hrp('<?=$key->hrp_id?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print"></i></label>                           
                        <label onclick="return delete_hrp('<?=$key->id?>','<?=$table?>')" title="delete" class="badge bg-red"><i class="fa fa-trash"></i></label>      
                        </td>
                        <td><?=$key->hrp_id;?></td>
                        <td><?=$key->hrp_date;?></td>
                        <td><?=$key->shift;?></td>
                        <td><?=$key->job_no;?></td>
                        <td><?=$key->transaction;?></td>
                        <td><?=$key->item;?></td>
                        <td><?='Rp '.number_format($key->price);?></td>
                        <td><?=$key->qty;?></td>
                        <td><?=$key->shop_name;?></td>
                        <td><?=$key->cost_center;?></td>
                        <td><?=$key->category;?></td>
                        <td><?=$key->detail;?></td>
                        <td><?=$key->create_date;?></td>
                        <td><?=$key->create_by;?></td>
                        <td><?=$key->qty_receive;?></td>
                        <td><?=$key->receive_date;?></td>
                        <td><?=$key->receive_by;?></td>
                        <td><?=$key->status;?></td>                       
                    </tr>
                <?php }elseif($level=="Admin_area"){ 
                  if($key->shop_name==$shop){ if($key->status=="Open"){ ?>
                  <tr>
                  <td style="text-align:center;">
                  <label onclick="return print_hrp('<?=$key->hrp_id?>','<?=$table?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print"></i></label>   
                  <?php if($nav=="Create HRP"){?>                        
                        <label onclick="return delete_hrp('<?=$key->id?>','<?=$table?>')" title="delete" class="badge bg-red"><i class="fa fa-trash"></i></label>    
                        <?php } ?>  
                        </td>                       
                      <td><?=$key->hrp_id;?></td>
                        <td><?=$key->hrp_date;?></td>
                        <td><?=$key->shift;?></td>
                        <td><?=$key->job_no;?></td>
                        <td><?=$key->transaction;?></td>
                        <td><?=$key->item;?></td>
                        <td><?='Rp '.number_format($key->price);?></td>
                        <td><?=$key->qty;?></td>
                        <td><?=$key->shop_name;?></td>
                        <td><?=$key->cost_center;?></td>
                        <td><?=$key->category;?></td>
                        <td><?=$key->detail;?></td>
                        <td><?=$key->create_date;?></td>
                        <td><?=$key->create_by;?></td>
                        <td><?=$key->qty_receive;?></td>
                        <td><?=$key->receive_date;?></td>
                        <td><?=$key->receive_by;?></td>
                        <td><?=$key->status;?></td>                       
                    </tr>

                    <?php }}}elseif($key->status=="Open"){ ?>
                      <tr>
                      <td style="text-align:center;">
                      <label onclick="return print_hrp('<?=$key->hrp_id?>','<?=$table?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print"></i></label>                           
                        </td>                       
                      <td><?=$key->hrp_id;?></td>
                        <td><?=$key->hrp_date;?></td>
                        <td><?=$key->shift;?></td>
                        <td><?=$key->job_no;?></td>
                        <td><?=$key->transaction;?></td>
                        <td><?=$key->item;?></td>
                        <td><?='Rp '.number_format($key->price);?></td>
                        <td><?=$key->qty;?></td>
                        <td><?=$key->shop_name;?></td>
                        <td><?=$key->cost_center;?></td>
                        <td><?=$key->category;?></td>
                        <td><?=$key->detail;?></td>
                        <td><?=$key->create_date;?></td>
                        <td><?=$key->create_by;?></td>
                        <td><?=$key->qty_receive;?></td>
                        <td><?=$key->receive_date;?></td>
                        <td><?=$key->receive_by;?></td>
                        <td><?=$key->status;?></td>                       
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
            "order": [], 
            "scrollY":($(window).height()-410),
            "scrollX":true,
            "pagingType": "full_numbers",
            "bPaginate":true,
            "bJQueryUI":true,
            "scrollCollapse":true,
            "paging":true,
            "fixedColumns":true,
            "AutoWidth": true,
            "LengthChange": true,
            "pageResize": true,
            "pageLength" :20,
             "targets": 'no-sort',
          });
 
});  
$(window).resize(function(){
   var tinggi = ($(window).height()-410);
    $('#mytable').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#mytable').DataTable().draw();
  });
</script>

