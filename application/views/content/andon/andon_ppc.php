<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 html,body { 
      height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
      font-family: sans-serif;
      background-color:white; 
      font-size: 10px; 
      text-align:center;
      font-weight: bold;     
    }
    @media (max-width: 899px) {
      .header{
        font-size: 12px;
      }
    }
    @media (min-width: 900px) and (max-width: 1500px) {
      .header{
        font-size: 22px;
      }
    }
     @media (min-width: 1000px) {
      .header{
        font-size: 20px;
      }
    }
    table{
      height: 100%;
      width:100%;
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

     
    select.form-control{
    display: inline;
    width: 150px;
    margin-left: 25px;
  }

</style>
  <!-- Ionicons -->
 <script type="text/javascript">
    //set timezone
    <?php date_default_timezone_set('Asia/Jakarta'); ?>
    //buat object date berdasarkan waktu di server
    var serverTime = new Date(<?php print date('Y, m, d, H, i, s, 0'); ?>);
    //buat object date berdasarkan waktu di client
    var clientTime = new Date();
    //hitung selisih
    var Diff = serverTime.getTime() - clientTime.getTime();    
    //fungsi displayTime yang dipanggil di bodyOnLoad dieksekusi tiap 1000ms = 1detik
    function displayServerTime(){
        //buat object date berdasarkan waktu di client
        var clientTime = new Date();
        //buat object date dengan menghitung selisih waktu client dan server
        var time = new Date(clientTime.getTime() + Diff);
        //ambil nilai jam
        var sh = time.getHours().toString();
        //ambil nilai menit
        var sm = time.getMinutes().toString();
        //ambil nilai detik
        var ss = time.getSeconds().toString();
        //tampilkan jam:menit:detik dengan menambahkan angka 0 jika angkanya cuma satu digit (0-9)
        $("#clock").text((sh.length==1?"0"+sh:sh) + ":" + (sm.length==1?"0"+sm:sm) + ":" + (ss.length==1?"0"+ss:ss));
    }
    setInterval('displayServerTime()',500);
</script>
<link rel="stylesheet" href="<?=base_url('assets/lte/datatables/extensions/FixedColumns/css/dataTables.fixedColumns.min.css')?>">
<link rel="stylesheet" href="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.css');?>">

<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" /> -->


</head>
<body>
<table style="width: 100%;height: 100%;border-spacing: 1px;padding: 0px;background-color: black;" class="header">
  <tr>
    <th>    
      <table style="height: 100%;width: 100%;border-spacing: 1px;border-collapse: separate;border:2px solid #fff;">
       <tr>
          <td style="height: 10%;">
            <table style="border-spacing: 0px;background-color:#eee;color: black;">
                <tr>
                  <td rowspan="2" style="width: 10%;border:1px solid #000">
                    <img src="<?=base_url('assets/img/logo.jpg');?>" style="width:100%;height:50%;vertical-align: middle;"></td>
                  <td align="center" style="border-bottom:none;font-size:200%;border-top:1px solid #000">ANDON RSO PPC 2A</td>
                  <td rowspan="2" style="width:20%;font-size:150%;border:1px solid #000">
                    <?=strtoupper(gmdate('d-m-Y',time()+60*60*7));?>
                    <span id="clock"><?=gmdate('H:i:s',time()+60*60*7);?></span>
                  </td>
                </tr>
                <tr>
                  <td align="center" style="border-bottom:1px solid #000;vertical-align: top">PT. Astra Daihatsu Motor Stamping Plant</td>
                </tr>
              </table>

        </td>
      </tr>
        <tr style="background-color: #000;">
          <td style="border: 1px solid #fff;padding:1px;">
            <!-- 1.bungkus -->
            <table style="width: 100%;height:100%;border-spacing: 0px;border: 0px solid #fff;text-shadow: 1px 1px black">
              <!-- bagi tinggi-->
              <tr>
                <td style="padding: 0px;">
                  <!-- isi-->
                  <table style="width: 100%;height:100%;border-spacing: 0px;">
                  <tr>
                      <!-- bagi kolom -->
                      <td>
                           <table style="width:100%;height:100%;color:white;text-align: center;background-color: black;font-weight: bold;border-spacing: 1px;border:1px solid #000;">
                            <tr style="background-color:teal;color: black;">
                              <td id="chart_ppc"> </td>  
                            </tr>
                          </table>
                      </td>
                       <!-- bagi kolom -->         
                    </tr>
                    <tr>
                      <!-- bagi kolom -->
                      <td>
                        <div class="category-filter">
                        <select id="categoryFilter" class="form-control">
                         <option value="">Show All</option>
                          <option value="D55L">D55L</option>
                          <option value="D40D">D40D</option>
                          <option value="D26A">D26A</option>
                        </select>
                      </div>
                      <table id="ppc" class="nowrap compact" style="width:100%;font-size: 10px;color:white">
                          <input type="hidden" name="table1" value="<?=$table;?>">
                          <input type="hidden" name="filter" id="filter" value="">
                          
                          <thead>
                            <tr style="">
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
                                foreach ($input_ppc as $key) { ?>
                                <tr class="list_row">
                                  
                                     <td><?=$key->job_no;?></td>
                                     <td><?=$key->part_no;?></td>
                                     <td><?=$key->part_name;?></td>
                                     <td><?=$key->maks_shift;?></td>
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

                    </td>
                       <!-- bagi kolom -->         
                    </tr>
                  </table>
                  <!-- isi-->
                </td>
              </tr>
              
              <!-- bagi tinggi-->             
            </table>
            <!-- 1.bungkus -->

          </td>         
        </tr>
      </table>
    </th>
  </tr>  
  <tr style="height: 4%;">
    <td>
      <marquee style="font-size: 20px;vertical-align: middle;color:yellow"><i>ANDON RSO PPC !!!</i></marquee>
    </td>
  </tr>
  
</table>
<!-- <script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js')?>"></script> -->
<script src="<?=base_url('assets/lte/apexcharts/apexcharts.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.js')?>"></script>
<script src="<?=base_url('assets/lte/datatables/extensions/FixedColumns/js/dataTables.fixedColumns.min.js')?>"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>

<script>
 var options = {
          series: [{
          data: [  <?php $x = $this->db->query("select job_no from tbl_input_ppc")->num_rows();$x=$x+1; foreach($input_ppc as $row){ ?>
        <?=$row->ss_p1;?>,
        <?php } if($x<15){ $j=15-$x+1;
                            for($s=$x;$s<=15;$s++){?>
                            '',
                            <?php }} ?>
        ]
        }],
          chart: {
          type: 'bar',
          foreColor: 'white',
          height: 385
        },
        plotOptions: {
          bar: {
            borderRadius: 10,
            horizontal: true,
          }
        },
        dataLabels: {
          enabled: true
        },
        xaxis: {
          categories: [
            <?php $x = $this->db->query("select job_no from tbl_input_ppc")->num_rows();$x=$x+1; foreach($input_ppc as $row){ ?>
            '<?=$row->job_no;?>',
            <?php }  if($x<15){ $j=15-$x+1;
                            for($s=$x;$s<=15;$s++){ ?>
                             '<?=$s;?>',
                             <?php }} ?>
          ],
        }
        };

        var chart = new ApexCharts(document.querySelector("#chart_ppc"), options);
        chart.render();
      </script>
<!-- 
<script>
   $(document).ready(function() {
     var table = $('#ppc').DataTable( {
            "processing": true, 
            "serverSide": false, 
            "bSort": false,
            "order": [], 
            "scrollY":($(window).height()-400),
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
          $("#ppc_filter.dataTables_filter").append($("#categoryFilter"));
          var categoryIndex = 0;
      $("#ppc th").each(function (i) {
        if ($($(this)).html() == "MODEL") {
          categoryIndex = i; return false;
        }
      });

      $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
          var selectedItem = $('#categoryFilter').val()
          var model = data[categoryIndex];
          if (selectedItem === "" || model.includes(selectedItem)) {
            return true;
          }
          return false;
        }
      );

      $("#categoryFilter").change(function (e) {
        $('#ppc').DataTable().draw();
      });
      $('#ppc').DataTable().draw();
});  
$(window).resize(function(){
   var tinggi = ($(window).height()-410);
    $('#ppc').closest('.dataTables_scrollBody').css('height',tinggi);
    $('#ppc').DataTable().draw();
  });
</script>   -->

<script>
    $("document").ready(function () {
      $("#ppc").dataTable({
        "searching": true,
        "pageLength" :10,
       
           
      });
      //Get a reference to the new datatable
      var table = $('#ppc').DataTable();
      //Take the category filter drop down and append it to the datatables_filter div. 
      //You can use this same idea to move the filter anywhere withing the datatable that you want.
      $("#ppc_filter.dataTables_filter").append($("#categoryFilter"));
      
      //Get the column index for the Category column to be used in the method below ($.fn.dataTable.ext.search.push)
      //This tells datatables what column to filter on when a user selects a value from the dropdown.
      //It's important that the text used here (Category) is the same for used in the header of the column to filter
      var categoryIndex = 0;
      $("#ppc th").each(function (i) {
        if ($($(this)).html() == "MODEL") {
          categoryIndex = i; return false;
        }
      });
      //Use the built in datatables API to filter the existing rows by the Category column
      $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
          var selectedItem = $('#categoryFilter').val()
          var category = data[categoryIndex];
          if (selectedItem === "" || category.includes(selectedItem)) {
            return true;
          }
          return false;
        }
      );
      //Set the change event for the Category Filter dropdown to redraw the datatable each time
      //a user selects a new filter.
      $("#categoryFilter").change(function (e) {
        table.draw();
      });
      table.draw();
    });
  </script> 



<script type="text/javascript">
$.ajaxSetup ({
    cache: false
});
$(document).ready(function() {
    doesConnectionExist();
       selesai();
       
     
});
function selesai() {
  setTimeout(function() {
    doesConnectionExist();
    selesai();
  }, 5000);
}

function doesConnectionExist() {
    var xhr = new XMLHttpRequest();
    var file = "#";
    var randomNum = Math.round(Math.random() * 10000);
    var test = 'test';

    xhr.open('HEAD', file + "?nocache=" + randomNum, true);
    xhr.send();
    
    xhr.addEventListener("readystatechange", processRequest, false);

    function processRequest(e) {
      if (xhr.readyState == 4) {
        if (xhr.status >= 200 && xhr.status < 304) {
        $('#test').load('<?=base_url('andon/test/'); ?>', 'f' + (Math.random()*1000000));
          $(document).ready(function(){
               
            updateChart()
            updateChart1()
           });

        } else {
            tempAlert("KONEKSI ERROR <br><br><br>Silakan Periksa Koneksi Jaringan / Network Anda !!",4000);
        }
      }
    }
}

function tempAlert(msg,duration)
{
 var el = document.createElement("div");
 el.setAttribute("style","position:absolute;top:15%;left:25%;background-color:yellow");
 el.innerHTML = msg;
 el.style.width = "670px";
el.style.height = "530px";
el.style.textAlign = "center";
el.style.fontSize = "50px";
 setTimeout(function(){
  el.parentNode.removeChild(el);
 },duration);
 document.body.appendChild(el);
}
setTimeout(function () { 
      location.reload();
    }, (5 * 60) * 1000);
</script>
</body>
</html>