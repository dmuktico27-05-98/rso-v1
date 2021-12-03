<style>
		/* Style definitions for pdfs */

		/* Lists
		-----------------------------------------------------------------------*/
		.list {
		  border-collapse: collapse;
		  border-spacing: 0px;
		  border-top: 1px solid #8B7958;
		  border-bottom: 1px solid #8B7958;
		  width: 100%;
		}


		tr.list_row>td {
		  background-color: #1f1f2e;
		  border-bottom: 1px dotted #8B7958;
		  font-size: 12;
		}

		tr.list_row:hover td {
		  background-color: black;
		}

		.thread>tr { display: none; }

		/* Lists
		-----------------------------------------------------------------------*/
		tr.list_row:hover td {
		  background-color: grey;
		}
        .footer{
            width: 100%;
            margin-left:-100px;
            margin-bottom:10px;
            line-height: 50px;
            color: #fff;
            position: absolute;
            bottom: 0px;
        }  .footer-tag{
            width: 100%;
            line-height: 50px;
            color: #fff;
            position: absolute;
            bottom: 0px;
        }
	</style>
    <link rel="stylesheet" href="<?=base_url('assets/lte/datatables/extensions/FixedColumns/css/dataTables.fixedColumns.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.css');?>">

 <!-- Content Header (Page header) -->
 <div id="content" style="background-color: #1f1f2e">
    <div class="content-header">
     
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content" >
      <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12">
           
  
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
         
          <!-- /.col -->
          <div class="col-md-12">
            <div class="card">
              <div class="card-header p-1">
              <small class="text-olive float-sm-right"><i><?=gmdate('l, d F Y',time()+60*60*7);?>&nbsp;<span id="clock">date(H:i:s)</span></i></small>
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#ppc_rso" data-toggle="tab">RSO PPC</a></li>
                  <li class="nav-item"><a class="nav-link" href="#docking_rso" data-toggle="tab">RSO Docking</a></li>
                  <li class="nav-item"><a class="nav-link" href="#subassy_rso" data-toggle="tab">RSO subassy</a></li>
                  
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">

                <!-- /.tab-pane -->
                <div class="active tab-pane" id="ppc_rso">
                  <table id="ppc" class="nowrap compact" style="width:100%;font-size: 13px;color:white">
                          <input type="hidden" name="table1" value="<?=$tbl_ppc;?>">
                          <input type="hidden" name="filter" id="filter" value="">
                          <thead>
                            <tr class="head">
                              <th style="text-align:center;width:70px;">Action</th>
                              <th>JOB_NO</th>
                              <th>PART_NO</th>
                              <th>PART_NAME</th>
                              <th>MAX_SHIFT</th>
                              <th>PATAN</th>
                              <th>T_T</th>
                              <th>SHIFT</th>
                              <th>SHOP_NAME</th>
                              <th>STO_P1</th>
                              <th>STO_P4</th>
                              <th>STO_KAP</th>
                              <th>STO_PPL</th>
                              <th>STO_PROCESS</th>
                              <th>SS_P1</th>
                              <th>SS_P4</th>
                              <th>SS_KAP</th>
                              <th>SS_PPL</th>
                              <th>SS_PROCESS</th>
                              <th>AREA</th>
                              <th>PROSES</th>
                              <th>MODEL</th>
                              <th>CREATE_BY</th>
                              <th>CREATE_DATE</th>

                              
                            </tr>
                          </thead>
                          <tbody>
                            <?php 
                                foreach ($ppc as $key) { ?>
                                <tr class="list_row">
                                    <td style="text-align:center;">
                                    <label onclick="return print_hrp('<?=$key->hrp_id?>','<?=$table?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print fa-2x"></i></label>                           
                                    </td>
                                     <td><?=$key->job_no;?></td>
                                     <td><?=$key->part_no;?></td>
                                     <td><?=$key->part_name;?></td>
                                     <td><?=$key->max_shift;?></td>
                                     <td><?=$key->patan;?></td>
                                     <td><?=$key->t_t;?></td>
                                     <td><?=$key->shift;?></td>
                                     <td><?=$key->shop_name;?></td>
                                     <td><?=$key->sto_p1;?></td>
                                     <td><?=$key->sto_p4;?></td>
                                     <td><?=$key->sto_kap;?></td>
                                     <td><?=$key->sto_ppl;?></td>
                                     <td><?=$key->sto_process;?></td>
                                     <td><?=$key->ss_p1;?></td>
                                     <td><?=$key->ss_p4;?></td>
                                     <td><?=$key->ss_kap;?></td>
                                     <td><?=$key->ss_ppl;?></td>
                                     <td><?=$key->ss_process;?></td>
                                    <td><?=$key->area;?></td>
                                    <td><?=$key->proses;?></td>
                                    <td><?=$key->model;?></td>
                                     <td><?=$key->create_by;?></td>
                                     <td><?=$key->create_date;?></td>
              
                                </tr>
                              <?php } ?>
                        </tbody>
                      </table>
                  </div>
                  <!-- /.tab-pane -->
               
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="subassy_rso">
                  <table id="subassy" class="nowrap compact" style="width:100%;font-size: 13px;color:white">
                          <input type="hidden" name="table1" value="<?=$tbl_subassy;?>">
                          <input type="hidden" name="filter" id="filter" value="">
                          <thead>
                            <tr class="head">
                              <th style="text-align:center;width:70px;">Action</th>
                              <th>JOB_NO</th>
                              <th>PART_NO</th>
                              <th>PART_NAME</th>
                              <th>MAX_SHIFT</th>
                              <th>PATAN</th>
                              <th>T_T</th>
                              <th>SHIFT</th>
                              <th>SHOP_NAME</th>
                              <th>STO_P1</th>
                              <th>STO_P4</th>
                              <th>STO_KAP</th>
                              <th>STO_PPL</th>
                              <th>STO_PROCESS</th>
                              <th>SS_P1</th>
                              <th>SS_P4</th>
                              <th>SS_KAP</th>
                              <th>SS_PPL</th>
                              <th>SS_PROCESS</th>
                              <th>AREA</th>
                              <th>PROSES</th>
                              <th>MODEL</th>
                              <th>CREATE_BY</th>
                              <th>CREATE_DATE</th>

                              
                            </tr>
                          </thead>
                          <tbody>
                            <?php 
                                foreach ($subassy as $key) { ?>
                                <tr class="list_row">
                                    <td style="text-align:center;">
                                    <label onclick="return print_hrp('<?=$key->hrp_id?>','<?=$table?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print fa-2x"></i></label>                           
                                    </td>
                                     <td><?=$key->job_no;?></td>
                                     <td><?=$key->part_no;?></td>
                                     <td><?=$key->part_name;?></td>
                                     <td><?=$key->max_shift;?></td>
                                     <td><?=$key->patan;?></td>
                                     <td><?=$key->t_t;?></td>
                                     <td><?=$key->shift;?></td>
                                     <td><?=$key->shop_name;?></td>
                                     <td><?=$key->sto_p1;?></td>
                                     <td><?=$key->sto_p4;?></td>
                                     <td><?=$key->sto_kap;?></td>
                                     <td><?=$key->sto_ppl;?></td>
                                     <td><?=$key->sto_process;?></td>
                                     <td><?=$key->ss_p1;?></td>
                                     <td><?=$key->ss_p4;?></td>
                                     <td><?=$key->ss_kap;?></td>
                                     <td><?=$key->ss_ppl;?></td>
                                     <td><?=$key->ss_process;?></td>
                                    <td><?=$key->area;?></td>
                                    <td><?=$key->proses;?></td>
                                    <td><?=$key->model;?></td>
                                     <td><?=$key->create_by;?></td>
                                     <td><?=$key->create_date;?></td>
              
                                </tr>
                              <?php } ?>
                        </tbody>
                      </table>
                  </div>
                  <!-- /.tab-pane -->

                  <div class="tab-pane" id="docking_rso">
                  <table id="docking" class="nowrap compact" style="width:100%;font-size: 13px;color:white">
                          <input type="hidden" name="table1" value="<?=$tbl_docking;?>">
                          <input type="hidden" name="filter" id="filter" value="">
                          <thead>
                            <tr class="head">
                              <th style="text-align:center;width:70px;">Action</th>
                              <th>JOB_NO</th>
                              <th>PART_NO</th>
                              <th>PART_NAME</th>
                              <th>MAX_SHIFT</th>
                              <th>PATAN</th>
                              <th>T_T</th>
                              <th>SHIFT</th>
                              <th>SHOP_NAME</th>
                              <th>STO_P1</th>
                              <th>STO_P4</th>
                              <th>STO_KAP</th>
                              <th>STO_PPL</th>
                              <th>STO_PROCESS</th>
                              <th>SS_P1</th>
                              <th>SS_P4</th>
                              <th>SS_KAP</th>
                              <th>SS_PPL</th>
                              <th>SS_PROCESS</th>
                              <th>AREA</th>
                              <th>PROSES</th>
                              <th>MODEL</th>
                              <th>CREATE_BY</th>
                              <th>CREATE_DATE</th>

                              
                            </tr>
                          </thead>
                          <tbody>
                            <?php 
                                foreach ($docking as $key) { ?>
                                <tr class="list_row">
                                    <td style="text-align:center;">
                                    <label onclick="return print_hrp('<?=$key->hrp_id?>','<?=$table?>')" title="print hrp" class="badge bg-blue"><i class="fa fa-print fa-2x"></i></label>                           
                                    </td>
                                     <td><?=$key->job_no;?></td>
                                     <td><?=$key->part_no;?></td>
                                     <td><?=$key->part_name;?></td>
                                     <td><?=$key->max_shift;?></td>
                                     <td><?=$key->patan;?></td>
                                     <td><?=$key->t_t;?></td>
                                     <td><?=$key->shift;?></td>
                                     <td><?=$key->shop_name;?></td>
                                     <td><?=$key->sto_p1;?></td>
                                     <td><?=$key->sto_p4;?></td>
                                     <td><?=$key->sto_kap;?></td>
                                     <td><?=$key->sto_ppl;?></td>
                                     <td><?=$key->sto_process;?></td>
                                     <td><?=$key->ss_p1;?></td>
                                     <td><?=$key->ss_p4;?></td>
                                     <td><?=$key->ss_kap;?></td>
                                     <td><?=$key->ss_ppl;?></td>
                                     <td><?=$key->ss_process;?></td>
                                    <td><?=$key->area;?></td>
                                    <td><?=$key->proses;?></td>
                                    <td><?=$key->model;?></td>
                                     <td><?=$key->create_by;?></td>
                                     <td><?=$key->create_date;?></td>
              
                                </tr>
                              <?php } ?>
                        </tbody>
                      </table>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>

          
          </div>
       
          <!-- /.col -->
        
        </div>
    

       
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  </div>
  <!-- /.control-sidebar -->
  <script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js')?>"></script>
  <script src="<?=base_url('assets/lte/jquery/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.js')?>"></script>
<script src="<?=base_url('assets/lte/datatables/extensions/FixedColumns/js/dataTables.fixedColumns.min.js')?>"></script>

<script type="text/javascript">
  $(document).ready(function() {
     var table = $('#ppc').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "order": [], 
            "scrollY":($(window).height()-500),
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
    $('#ppc').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#ppc').DataTable().draw();
  });


  $(document).ready(function() {
     var table = $('#subassy').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "order": [], 
            "scrollY":($(window).height()-500),
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
    $('#subassy').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#subassy').DataTable().draw();
  });

  $(document).ready(function() {
     var table = $('#docking').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "order": [], 
            "scrollY":($(window).height()-500),
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
    $('#docking').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#docking').DataTable().draw();
  });
</script>

