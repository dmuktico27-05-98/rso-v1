<style>
		/* Style definitions for pdfs */

		/* Lists
		-----------------------------------------------------------------------*/
    .head {
		  border-collapse: collapse;
		  border-spacing: 0px;
		  border-top: 1px solid #8B7958;
		  width: 100%;
      text-align : center;
		}

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
      color: white;
      text-align: center;
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


              .table-scroll {
        position:relative;
        max-width:600px;
        margin:auto;
        overflow:hidden;
      }
      .table-wrap {
        width:100%;
        overflow:auto;
      }
      .table-scroll table {
        width:100%;
        margin:auto;
       
      }
      .table-scroll th, .table-scroll td {
        padding:2px;
        background:#fff;
        white-space:nowrap;
        vertical-align:top;
      }
      .table-scroll thead, .table-scroll tfoot {
        background:#f9f9f9;
      }
      

      /* width */
::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: grey; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: aqua; 
}
        .invalid-blink {
            background-color: red;
            color: white;
        }
	</style>
 
 <!-- Content Header (Page header) -->
 <div id="content">

    <!-- Main content -->
    <section class="content" >
      <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">         
          <!-- /.col -->
          <div class="col-md-12">
              <div class="card-body">
               
                    <div class="container-fluid">
                      <div class="row">
                            <div class="col-md-12">
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-title">Rundown Stock ppc</h5>

                                  <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                      <i class="fas fa-minus"></i>
                                    </button>
                            
                               
                                  </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                  <div class="row">

                                  <div class="col-md-4">
                                      <p class="text-center">
                                        <strong>STO PPC DETAIL - UPDATE <?=$ppc_grap_update; ?></strong>
                                      </p>

                                      <div id="table-scroll" class="table-scroll">
                                          <div class="table-wrap">
                                            <table class="main-table">
                                              <thead>
                                              <tr class="head" border="1">
                                              <th>MACHINE</th>
                                                <th>JOB_NO</th>
                                                <th>MAKS_SHIFT</th>
                                                <th>PS</th>
                                                <th>PATAN</th>
                                                <th>T_T</th>
                                                <th>SHIFT</th>
                                                <th>SHOP</th>
                                                <th>SS_P1</th>
                                                <th>SS_P4</th>
                                                <th>SS_KAP</th>
                                                <th>SS_PPL</th>
                                                <th>SS_REPAIR</th>
                                                
                                              </tr>
                                              </thead>
                                              <tbody>
                                              <?php  foreach ($ppc_table as $key) {  ?>
                                                    <tr class="list_row">
                                                        <td><?=$key->machine;?></td>
                                                        <td><?=$key->job_no;?></td>
                                                        <td><?=$key->maks_shift;?></td>
                                                        <td><?=$key->ps;?></td>
                                                        <td><?=$key->patan;?></td>
                                                        <td><?=$key->t_t;?></td>
                                                        <td><?=$key->shift;?></td>
                                                        <td><?=$key->shop_name;?></td>
                                                        <td><?=$key->ss_p1;?></td>
                                                        <td><?=$key->ss_p4;?></td>
                                                        <td><?=$key->ss_kap;?></td>
                                                        <td><?=$key->ss_ppl;?></td>
                                                        <td><?=$key->ss_process;?></td>
                                                        
                                                    </tr>
                                                  <?php } ?>
                                              
                                              </tbody>
                                         
                                            </table>
                                          </div>
                                        </div>
                                      <!-- /.progress-group -->
                                    </div>

                                    <div class="col-md-8">
                                      <div class="chart">
                                        <!-- Sales Chart Canvas -->
                                        <div id="ppc_table" style="height: 100px;"></div>
                                      </div>
                                      <!-- /.chart-responsive -->
                                    </div>
                                    <!-- /.col -->
                                    
                                    <!-- /.col -->
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- ./card-body -->
                                <div class="card-footer">
                                  <div class="row">
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- /.card-footer -->
                              </div>
                              <!-- /.card -->
                            </div>
                            <!-- /.col -->
                          </div>
                      <!-- /.row -->
                    </div>

                    <div class="container-fluid">
                      <div class="row">
                            <div class="col-md-12">
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-title">Rundown Stock WH Press (Docking & Door Assy)</h5>

                                  <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                      <i class="fas fa-minus"></i>
                                    </button>
                            
                               
                                  </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                  <div class="row">

                                  <div class="col-md-4">
                                      <p class="text-center">
                                        <strong>STO GENERAL DETAIL - UPDATE <?=$general_grap_update; ?></strong>
                                      </p>

                                      <div id="table-scroll" class="table-scroll">
                                          <div class="table-wrap">
                                            <table class="main-table">
                                              <thead>
                                              <tr class="head" border="1">
                                              <th>MACHINE</th>
                                                <th>JOB_NO</th>
                                                <th>MAKS_SHIFT</th>
                                                <th>PS</th>
                                                <th>PATAN</th>
                                                <th>T_T</th>
                                                <th>SHIFT</th>
                                                <th>SHOP</th>
                                                <th>SS_P1</th>
                                                <th>SS_P4</th>
                                                <th>SS_KAP</th>
                                                <th>SS_PPL</th>
                                                <th>SS_REPAIR</th>
                                                
                                              </tr>
                                              </thead>
                                              <tbody>
                                              <?php  foreach ($general_table as $key) {  ?>
                                                    <tr class="list_row">
                                                        <td><?=$key->machine;?></td>
                                                        <td><?=$key->job_no;?></td>
                                                        <td><?=$key->maks_shift;?></td>
                                                        <td><?=$key->ps;?></td>
                                                        <td><?=$key->patan;?></td>
                                                        <td><?=$key->t_t;?></td>
                                                        <td><?=$key->shift;?></td>
                                                        <td><?=$key->shop_name;?></td>
                                                        <td><?=$key->ss_p1;?></td>
                                                        <td><?=$key->ss_p4;?></td>
                                                        <td><?=$key->ss_kap;?></td>
                                                        <td><?=$key->ss_ppl;?></td>
                                                        <td><?=$key->ss_process;?></td>
                                                        
                                                    </tr>
                                                  <?php } ?>
                                              
                                              </tbody>
                                         
                                            </table>
                                          </div>
                                        </div>
                                      <!-- /.progress-group -->
                                    </div>

                                    <div class="col-md-8">
                                      <div class="chart">
                                        <!-- Sales Chart Canvas -->
                                        <div id="general_table" style="height: 100px;"></div>
                                      </div>
                                      <!-- /.chart-responsive -->
                                    </div>
                                    <!-- /.col -->
                                    
                                    <!-- /.col -->
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- ./card-body -->
                                <div class="card-footer">
                                  <div class="row">
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- /.card-footer -->
                              </div>
                              <!-- /.card -->
                            </div>
                            <!-- /.col -->
                          </div>
                      <!-- /.row -->
                    </div>
                   
                    <div class="container-fluid">
                      <div class="row">
                            <div class="col-md-12">
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-title">Rundown Stock WH PPL</h5>

                                  <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                      <i class="fas fa-minus"></i>
                                    </button>
                            
                               
                                  </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                  <div class="row">

                                  <div class="col-md-4">
                                      <p class="text-center">
                                        <strong>STO PPL DETAIL - UPDATE <?=$ppl_grap_update; ?></strong>
                                      </p>

                                      <div id="table-scroll" class="table-scroll">
                                          <div class="table-wrap">
                                            <table class="main-table">
                                              <thead>
                                              <tr class="head" border="1">
                                              <th>MACHINE</th>
                                                <th>JOB_NO</th>
                                                <th>MAKS_SHIFT</th>
                                                <th>PS</th>
                                                <th>PATAN</th>
                                                <th>T_T</th>
                                                <th>SHIFT</th>
                                                <th>SHOP</th>
                                                <th>SS_PPL</th>
                                              </tr>
                                              </thead>
                                              <tbody>
                                              <?php  foreach ($ppl_table as $key) {  ?>
                                                    <tr class="list_row" >
                                                        <td><?=$key->machine;?></td>
                                                        <td><?=$key->job_no;?></td>
                                                        <td><?=$key->maks_shift;?></td>
                                                        <td><?=$key->ps;?></td>
                                                        <td><?=$key->patan;?></td>
                                                        <td><?=$key->t_t;?></td>
                                                        <td><?=$key->shift;?></td>
                                                        <td><?=$key->shop_name;?></td>
                                                        <td><?=$key->ss_ppl;?></td>
                                                    </tr>
                                                  <?php } ?>
                                              
                                              </tbody>
                                         
                                            </table>
                                          </div>
                                        </div>
                                      <!-- /.progress-group -->
                                    </div>

                                    <div class="col-md-8">
                                      <div class="chart">
                                        <!-- Sales Chart Canvas -->
                                        <div id="ppl_table" style="height: 100px;"></div>
                                      </div>
                                      <!-- /.chart-responsive -->
                                    </div>
                                    <!-- /.col -->
                                    
                                    <!-- /.col -->
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- ./card-body -->
                                <div class="card-footer">
                                  <div class="row">
                                  </div>
                                  <!-- /.row -->
                                </div>
                                <!-- /.card-footer -->
                              </div>
                              <!-- /.card -->
                            </div>
                            <!-- /.col -->
                          </div>
                      <!-- /.row -->
                    </div>

                  </div>
             

        
        </div>
         
       
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

      <!-- Control Sidebar -->
      <aside class="control-sidebar">
        <!-- Control sidebar content goes here -->
      </aside>
  </div>

  <script src="<?=base_url('assets/lte/apexcharts/dist/apexcharts.js')?>"></script>
  <script src="<?=base_url('assets/lte/apexcharts/dist/apexcharts.min.js')?>"></script>

 <script>
  var options = {
          series: [{
          name: 'STO P1',
          data: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
        <?=$row->ss_p1;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO P4',
          data: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
        <?=$row->ss_p4;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO KAP',
          data: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
        <?=$row->ss_kap;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO PPL',
          data: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
        <?=$row->ss_ppl;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO Repair',
          data: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
        <?=$row->ss_process;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }],
          chart: {
          type: 'bar',
          height: 400,
          stacked: true,
        },
        plotOptions: {  
          bar: {
            horizontal: true,
          },
        },
        stroke: {
          width: 1,
          colors: ['#fff']
        },
        title: {
          text: 'STO PPC UPDATE'
        },
        xaxis: {
          categories: [<?php $x = $count_ppc;$x=$x+1; foreach($ppc_table as $row){ ?>
            '<?=$row->job_no;?>',
            <?php }  if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){ ?>
                             '<?=$s;?>',
                             <?php }} ?>],
          labels: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        yaxis: {
          title: {
            text: undefined
          },
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        fill: {
          opacity: 1
        },
        legend: {
          position: 'top',
          horizontalAlign: 'left',
          offsetX: 40
        }
        };

        var chart = new ApexCharts(document.querySelector("#ppc_table"), options);
        chart.render();
      </script>
      
      
 <script>
  var options = {
          series: [{
          name: 'STO P1',
          data: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
        <?=$row->ss_p1;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO P4',
          data: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
        <?=$row->ss_p4;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO KAP',
          data: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
        <?=$row->ss_kap;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO PPL',
          data: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
        <?=$row->ss_ppl;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }, {
          name: 'STO Repair',
          data: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
        <?=$row->ss_process;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }],
          chart: {
          type: 'bar',
          height: 400,
          stacked: true,
        },
        plotOptions: {  
          bar: {
            horizontal: true,
          },
        },
        stroke: {
          width: 1,
          colors: ['#fff']
        },
        title: {
          text: 'STO GENERAL/WH PRESS UPDATE'
        },
        xaxis: {
          categories: [<?php $x = $count_gen;$x=$x+1; foreach($general_table as $row){ ?>
            '<?=$row->job_no;?>',
            <?php }  if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){ ?>
                             '<?=$s;?>',
                             <?php }} ?>],
          labels: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        yaxis: {
          title: {
            text: undefined
          },
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        fill: {
          opacity: 1
        },
        legend: {
          position: 'top',
          horizontalAlign: 'left',
          offsetX: 40
        }
        };

        var chart = new ApexCharts(document.querySelector("#general_table"), options);
        chart.render();
      </script>

<script>
  var options = {
          series: [{
          name: 'STO PPL',
          data: [<?php $x = $count_ppl;$x=$x+1; foreach($ppl_table as $row){ ?>
        <?=$row->ss_ppl;?>,
        <?php } if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){?>
                            '',
                            <?php }} ?>]
        }],
          chart: {
          type: 'bar',
          height: 400,
          stacked: true,
        },
        plotOptions: {  
          bar: {
            horizontal: true,
          },
        },
        stroke: {
          width: 1,
          colors: ['#fff']
        },
        title: {
          text: 'STO PPL UPDATE'
        },
        xaxis: {
          categories: [<?php $x = $count_ppl;$x=$x+1; foreach($ppl_table as $row){ ?>
            '<?=$row->job_no;?>',
            <?php }  if($x<5){ $j=5-$x+1;
                            for($s=$x;$s<=5;$s++){ ?>
                             '<?=$s;?>',
                             <?php }} ?>],
          labels: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        yaxis: {
          title: {
            text: undefined
          },
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return val + "H"
            }
          }
        },
        fill: {
          opacity: 1
        },
        legend: {
          position: 'top',
          horizontalAlign: 'left',
          offsetX: 40
        }
        };

        var chart = new ApexCharts(document.querySelector("#ppl_table"), options);
        chart.render();

      </script>

