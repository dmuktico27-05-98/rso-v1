<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>PPC-2A-RSO</title>
<link rel="stylesheet" href="<?=base_url('assets/lte/datatables/extensions/FixedColumns/css/dataTables.fixedColumns.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.css');?>">
<style type="text/css">
html,body{ 
      height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
      font-family: sans-serif;
      background-color:#ccc;
      color: #000;
      text-align: center;
    }
    .dataTables_wrapper{
      font-size: 10px;
    }
  
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

<script type="text/javascript">
    //set timezone
    <?php date_default_timezone_set('Asia/Jakarta'); ?>
    //buat object date berdasarkan waktu di server
    var serverTime = new Date(<?=date('Y, m, d, H, i, s, 0'); ?>);
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
<script src="<?=base_url('assets/lte/apexcharts/apexcharts.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.js')?>"></script>
<script src="<?=base_url('assets/lte/datatables/extensions/FixedColumns/js/dataTables.fixedColumns.min.js')?>"></script>
</head>

<body>
<table cellspacing="2" cellspadding="0" height="50%" width="100%">
  <tr height="6%" style="background-color: #fff;color: black">
    <td style="width:80px;border: 2px solid red;">
      <img src="<?=base_url('assets/img/logo.jpg');?>" style="width:80px;height:60px;vertical-align: middle;">
    </td>
    <td style="font-size: 50px;font-weight: bold;border: 2px solid red;">ANDON RSO PPC 2A</td>
    <td style="font-size: 25px;font-weight: bold;border: 2px solid red;width: 22%"><?=date('l, d M Y');?><br><span id="clock"><?=date('H:i:s');?></span></td>
  </tr>
  <tr style="background-color: #000;">
    <td colspan="3" style="border: 2px solid red;padding: 2px;">
      <table cellspacing="2" cellspadding="0" style="width: 100%;height: 100%;">
     
      <tr height="25%">
        <td width="22%" style="border: 1px solid #ccc;background-color: #fff"  id="chartsummaryitem">
        </td>
        <td width="30%" style="border: 1px solid #ccc;background-color: #fff" id="chartsummaryproblem">
        </td>
       <td width="33%" style="border: 1px solid #ccc;background-color: #fff" id="chartpriceshop">
        </td>
        <td width="15%" style="border: 1px solid #ccc;background-color: #fff" id="chartsummaryshop">
        </td>      
      </tr>
                <table id="dualine" class="nowrap compact" style="width:100%;font-size: 13px;color:white">
                          <input type="hidden" name="table1" value="<?=$table;?>">
                          <input type="hidden" name="filter" id="filter" value="">
                          <thead>
                            <tr class="head">
                              <th>JOB_NUMBER</th>
                              <th>PART_NAME</th>
                              <th>MAX_SHIFT</th>
                              <th>PATAN</th>
                              <th>T_T</th>
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
                             

                              
                            </tr>
                          </thead>
                          <tbody>
                            <?php 
                                foreach ($input_2a as $key) { ?>
                                <tr class="list_row">
                            
                                     <td><?=$key->job_number;?></td>
                                     <td><?=$key->part_name;?></td>
                                     <td><?=$key->max_shift;?></td>
                                     <td><?=$key->patan;?></td>
                                     <td><?=$key->t_t;?></td>
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
                                     
              
                                </tr>
                              <?php } ?>
                        </tbody>
                      </table>
      </table>  


    </td>
  </tr>
</table>
<marquee style="vertical-align: middle;font-weight: bold;font-size: 24px;"><i>HRP PERIODE : <?=$periode;?></i></marquee>
<div id="test" style="display: none"></div>

<script>
  window.Apex = {
  chart: {
    foreColor: '#222',
    toolbar: {
      show: false
    },
  },
  stroke: {
    width: 1
  },
  dataLabels: {
    enabled: true
  },
  tooltip: {
    theme: 'dark'
  },
  grid: {
    borderColor: "#222",
    xaxis: {
      lines: {
        show: true
      }
    },
    yaxis: {
      lines: {
        show: true
      }
    }
  }
};
</script>
     <script type="text/javascript">
        var options = {
            chart: {
                width: 300,
                type: 'pie',
                margin:0,
                dropShadow: {
                  enabled: true,
                  color: '#000',
                  top: 3,
                  left: 3,
                  blur: 3,
                  opacity: 0.1
                }
            },
            stroke: {
                show: true,
                width: 5,
                color:'#000',
            },
            series: [
            <?php foreach($summary_shop as $detail){ ?>
            <?=$detail->price;?>,
            <?php } ?>
            ],
            labels: [
             <?php foreach($summary_shop as $detail){ ?>
            "<?=$detail->shop_name;?>",
            <?php } ?>
            ],
            dataLabels: {
                enabled:true,
                 style: {
                colors: ['#000']
              }
            },
            legend:{
              show:true,
              labels:true,
            },
            fill: {
            type: 'solid',
              opacity: 0.9,
              pattern: {
                enabled: true,
                style: ['squares'], 
              },
            },
            states: {
              hover: {
                enabled: true
              }
            },
            theme: {
                palette: 'palette1'
            },
            title: {
                text: "(%)",
                align: 'center',
                margin:0,
                floating: false,
                style: {
                  fontSize:  '16px',
                  color:  '#000',
                  
                },
            }
        }

        var chart2 = new ApexCharts(
            document.querySelector("#chart2"),
            options
        );

        chart2.render();

    function updateChart1(){
    var test="test";
       $.ajax({
            async: true, 
            type: "POST",
            url: "<?=base_url('andon/summarydaily');?>",
            dataType: 'json',
            data:'test='+test,
            cache:false,
            success: function(data){                             
                      x = data.datashop,                     
                     chart2.updateOptions({
                      labels:data.namashop,
                      })
                     chart2.updateSeries(x);
                  }
        }) 

    }
    </script>
    <script>
    var options = {
      chart: {
        height:220,
        type: 'line',
        toolbar: {
          show: false,
        },
      },
      series: [{
        name: 'Item',
        type: 'column',
        data: [
        <?php foreach($summary_dateitem as $row){ ?>
        <?=$row->jumlah_item;?>,
        <?php }?>
        ]
      },
       {
        name: 'Acc',
        type: 'line',
        data: [
        <?php $item=0; foreach($summary_dateitem as $row){ $item2=$row->jumlah_item+$item;?>
        <?=$item2;?>,
        <?php $item=$item2; }?>
        ]
      }],
      stroke: {
        width: [2, 4]
      },
      grid: {
          show: true,
              borderColor: '#bab',
              strokeDashArray: 5,
              position: 'back',
              clipMarkers: true,
        },
      plotOptions: {
                bar: {
                    horizontal: true,
                    columnWidth: '70%',
                },
            },
      //fill: {
        //colors: ['#00ffdd']
      //},
      title: {
        text: 'TOTAL PCS',
        align: 'center',
        margin:0,
        floating: false,  
        style: {
          fontSize:  '16px',
          color:  '#000'
        },
      },
      // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      labels: [
      <?php foreach($summary_dateitem as $row){ if($row->week==$week){$week=$week-1;} ?>
      'W-<?=$row->week-$week;?>',
      <?php }?>
      ],
      dataLabels: {
                enabled: true,
                style: {
                colors: ['#000']
              }
            },
      xaxis: {
        type: ''
      },
      yaxis: [{
        title: {
          text: 'Total Pcs',
        },
         min: 0,
          range: 1,
          max:<?=round($item2*1.4/100)*100;?>,
      }, /*{
        opposite: true,
        title: {
          text: 'Acc'
        },
        min: 0,
        range: 1,
        max:10,
      }*/]

    }

    var chartsummaryitem = new ApexCharts(
      document.querySelector("#chartsummaryitem"),
      options
    );

    chartsummaryitem.render();
  </script>
  <script>
    var options = {
      chart: {
        height:220,
        type: 'line',
        toolbar: {
          show: false,
        },
      },
      series: [{
        name: 'Item',
        type: 'column',
        data: [
        <?php foreach($summary_detail as $row){ ?>
        <?=$row->jumlah_item;?>,
        <?php }?>
        ]
      },
       {
        name: 'Acc',
        type: 'line',
        data: [
        <?php $item=0; foreach($summary_detail as $row){ $item2=$row->jumlah_item+$item;?>
        <?=$item2;?>,
        <?php $item=$item2; }?>
        ]
      }],
      stroke: {
        width: [2, 4]
      },
      grid: {
          show: true,
              borderColor: '#bab',
              strokeDashArray: 5,
              position: 'back',
              clipMarkers: true,
        },
      plotOptions: {
                bar: {
                    horizontal: true,
                    columnWidth: '70%',
                },
            },
      //fill: {
        //colors: ['#00ffdd']
      //},
      title: {
        text: 'TOTAL PCS / PROBLEM',
        align: 'center',
        margin:0,
        floating: false,
        style: {
          fontSize:  '16px',
          color:  '#000',
          
        },
      },
      // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      labels: [
      <?php foreach($summary_detail as $row){ ?>
      '<?=$row->category;?>',
      <?php }?>
      ],
      dataLabels: {
                enabled: true,
                style: {
                colors: ['#000']
              }
            },
      xaxis: {
        type: ''
      },
      yaxis: [{
        title: {
          text: 'Total Pcs',
        },
         min: 0,
          range: 1,
          max:<?=round($item2*1.4/100)*100;?>,
      }, /*{
        opposite: true,
        title: {
          text: 'Acc'
        },
        min: 0,
        range: 1,
        max:10,
      }*/]

    }

    var chartsummaryproblem = new ApexCharts(
      document.querySelector("#chartsummaryproblem"),
      options
    );

    chartsummaryproblem.render();
  </script>
   <script>
    var options = {
      chart: {
        height:220,
        type: 'line',
        toolbar: {
          show: false,
        },
      },
      series: [{
        name: 'Item',
        type: 'column',
        data: [
        <?php foreach($summary_shop as $row){ ?>
        <?=$row->jumlah_item;?>,
        <?php }?>
        ]
      },
       {
        name: 'Acc',
        type: 'line',
        data: [
        <?php $item=0; foreach($summary_shop as $row){ $item2=$row->jumlah_item+$item;?>
        <?=$item2;?>,
        <?php $item=$item2; }?>
        ]
      }],
      stroke: {
        width: [2, 4]
      },
      grid: {
          show: true,
              borderColor: '#bab',
              strokeDashArray: 5,
              position: 'back',
              clipMarkers: true,
        },
      plotOptions: {
                bar: {
                    horizontal: true,
                    columnWidth: '70%',
                },
            },
      //fill: {
        //colors: ['#00ffdd']
      //},
      title: {
        text: 'TOTAL PCS / SHOP',
        align: 'center',
        margin:0,
        floating: false,
        style: {
          fontSize:  '16px',
          color:  '#000'
        },
      },
      // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      labels: [
      <?php foreach($summary_shop as $row){ ?>
      '<?=$row->shop_name;?>',
      <?php }?>
      ],
      dataLabels: {
                enabled: true,
                style: {
                colors: ['#000']
              }
            },
      xaxis: {
        type: ''
      },
      yaxis: [{
        title: {
          text: 'Total Pcs',
        },
         min: 0,
          range: 1,
          max:<?=round($item2*1.4/100)*100;?>,
      }, /*{
        opposite: true,
        title: {
          text: 'Acc'
        },
        min: 0,
        range: 1,
        max:10,
      }*/]

    }

    var chartsummaryshop = new ApexCharts(
      document.querySelector("#chartsummaryshop"),
      options
    );

    chartsummaryshop.render();
  </script>
   <script>
    var options = {
      chart: {
        height:220,
        type: 'line',
        toolbar: {
          show: false,
        },
      },
      series: [{
        name: 'Price',
        type: 'column',
        data: [
        <?php foreach($summary_shop as $row){ ?>
        <?=$row->price;?>,
        <?php }?>
        ]
      },
       {
        name: 'Acc',
        type: 'line',
        data: [
        <?php $price=0; foreach($summary_shop as $row){ $price2=$row->price+$price;?>
        <?=$price2; ?>,
        <?php $price=$price2; }?>
        ]
      }],
      stroke: {
        width: [0, 4]
      },
      grid: {
              show: true,
              borderColor: '#bab',
              strokeDashArray: 5,
              position: 'back',
              clipMarkers: true,
        },
      plotOptions: {
                bar: {
                    horizontal: true,
                    columnWidth: '70%',
                },
            },
      //fill: {
        //colors: ['#00ffdd'],
      //},
      title: {
        text: 'TOTAL PRICE / SHOP',
        align: 'center',
        margin:0,
        floating: false,
         style: {
          fontSize:  '16px',
          color:  '#000'
        },
      },
      // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      labels: [
      <?php foreach($summary_shop as $row){ ?>
      '<?=$row->shop_name;?>',
      <?php }?>
      ],
      dataLabels: {
                enabled: true,
                style: {
                colors: ['#000']
              }
            },
      xaxis: {
        type: '',   
      },
      yaxis: [{
        title: {
          text: 'Total Price',
        },
          min: 0,
          range: 1,
          max:<?=round($price2/1000000)*1.5*1000000;?>,
          
          labels: {
            formatter: function (value) {
              var number=value.toString(),
              sisa = number.length % 3,
              rupiah = number.substr(0,sisa),
              ribuan = number.substr(sisa).match(/\d{3}/g);
              if(ribuan) {
                separator= sisa ? '.' : '';
                rupiah += separator + ribuan.join('.');
              }
              return "Rp. " + rupiah;
            },
          },
      }, /*{
        opposite: true,
        title: {
          text: 'Acc'
        },
        min: 0,
        range: 1,
        max:10,
      }*/]

    }

    var chartpriceshop = new ApexCharts(
      document.querySelector("#chartpriceshop"),
      options
    );

    chartpriceshop.render();
  </script>

<script>
        var options = {
         chart: {
          height:300,
          type: 'line',
          margin:0,
          animations: {
                enabled: true,
                easing: 'linear',
                dynamicAnimation: {
                    speed: 1
                }
            },
          toolbar: {
            show: true,
          },


        },
        series: [{
        name: 'Open',
        type: 'column',
        margin:0,
        data: [
        <?php foreach($summary_daily as $row){ ?>
        <?=$row->open;?>,
        <?php }?>
        ]
      },{
        name: 'Closed',
        type: 'column',
        data: [
        <?php foreach($summary_daily as $row){ ?>
        <?=$row->close;?>,
        <?php }?>
        ]
      },
       {
        name: 'Acc',
        type: 'line',
        data: [
        <?php $item=0; foreach($summary_daily as $row){ $item2=$row->open+$row->close+$item;?>
        <?=$item2;?>,
        <?php $item=$item2; }?>
        ]
      }],
        stroke: {
          width: [0, 4, 4],
          curve: 'smooth'
        },
        grid: {
            show: true,
                borderColor: '#bab',
                strokeDashArray: 5,
                position: 'back',
                clipMarkers: true,
                margin:0,

          },
        plotOptions: {
                  bar: {
                      horizontal: true,
                      columnWidth: '90%',
                  },
              },
        title: {
          text: 'DAILY HRP',
          margin:0,
          floating:false,
          align:'center',
          style: {
            fontSize:  '16px',
            color:  '#000',
          },
        },
        // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        labels: [
      <?php foreach($summary_daily as $row){ ?>
      '<?=$row->hrp_date;?>',
      <?php }?>
      ],

      dataLabels: {
                enabled: true,
                style: {
                colors: ['#000']
              }
            },
      xaxis: {
        type: '',
         axisTicks: {
            show: true,
          },
          axisBorder: {
            show: true,
            color: '#00E396'
          },
      },
      yaxis: [{
        title: {
          text: 'Total Pcs',
        },
        axisTicks: {
            show: true,
          },
          axisBorder: {
            show: true,
            color: '#00E396'
          },
         min: 0,
         range: 1,
          max: <?=round($item2*1.4/100)*100;?>,
      }, 
      /* {
         opposite: true,
          seriesName: 'Acc',
          title: {
            text: 'Acc'
          },
          axisTicks: {
            show: true,
          },
          axisBorder: {
            show: true,
            color: '#00E396'
          },
          min: 0,
          range: 1,
          max:<?=round($item2*1.4/100)*100;?>,
        }*/]

      }
  var chartsummarydaily = new ApexCharts(
    document.querySelector("#chartsummarydaily"),
    options
  );

  chartsummarydaily.render();
     
function updateChart(){
  var test="test";
       $.ajax({
            async: true, 
            type: "POST",
            url: "<?=base_url('andon/summarydaily');?>",
            dataType: 'json',
            data:'test'+test,
            cache:false,
            success: function(data){
                  let series = [
                      {
                        name: 'Open',
                        type: 'column',
                        data: data.dataopen,
                      },
                      {
                        name: 'Close',
                        type: 'column',
                        data: data.dataclose,
                      },
                      
                      {
                        name: 'Acc',
                        type: 'line',
                        data: data.dataacc,
                      }
                      ]
                       
                    chartsummarydaily.updateOptions({
                      labels:data.datatgl,
                      yaxis:{ 
                          min: 0,
                          range: 1,
                          max:data.height,
                        }
                    })

                    chartsummarydaily.updateSeries(series);
                 
                  }
        }) 

    }
  function back(){
    no= $("#back").val();
       $.ajax({
            async: true, 
            type: "POST",
            url: "<?=base_url('andon/backsummarydaily');?>",
            dataType: 'json',
            data:'no='+no,
            cache:false,
            success: function(data){
                  let series = [
                      {
                        name: 'Open',
                        type: 'column',
                        data: data.dataopen,
                      },
                      {
                        name: 'Close',
                        type: 'column',
                        data: data.dataclose,
                      },
                      
                      {
                        name: 'Acc',
                        type: 'line',
                        data: data.dataacc,
                      }
                      ]
                       
                    chartsummarydaily.updateOptions({
                      labels:data.datatgl,
                      yaxis:{ 
                            title: {
                              text: 'Total Pcs',
                          },
                          min: 0,
                          range: 1,
                          max:data.height,
                        }
                    })

                    chartsummarydaily.updateSeries(series);
                    no=Number(no)+1;
                    $("#back").val(no);
                  }
        }) 

    }
   function reset(){
    no= 0;
       $.ajax({
            async: true, 
            type: "POST",
            url: "<?=base_url('andon/summarydaily');?>",
            dataType: 'json',
            data:'no='+no,
            cache:false,
            success: function(data){
                  let series = [
                      {
                        name: 'Open',
                        type: 'column',
                        data: data.dataopen,
                      },
                      {
                        name: 'Close',
                        type: 'column',
                        data: data.dataclose,
                      },
                      
                      {
                        name: 'Acc',
                        type: 'line',
                        data: data.dataacc,
                      }
                      ]
                       
                    chartsummarydaily.updateOptions({
                      labels:data.datatgl,
                      yaxis:{ 
                            title: {
                              text: 'Total Pcs',
                          },
                          min: 0,
                          range: 1,
                          max:data.height,
                        }
                    })

                    chartsummarydaily.updateSeries(series);
                    $("#back").val(0);
                  }
        }) 

    } 
    function next(){
    no= $("#back").val();
       $.ajax({
            async: true, 
            type: "POST",
            url: "<?=base_url('andon/nextsummarydaily');?>",
            dataType: 'json',
            data:'no='+no,
            cache:false,
            success: function(data){
                  let series = [
                      {
                        name: 'Open',
                        type: 'column',
                        data: data.dataopen,
                      },
                      {
                        name: 'Close',
                        type: 'column',
                        data: data.dataclose,
                      },
                      
                      {
                        name: 'Acc',
                        type: 'line',
                        data: data.dataacc,
                      }
                      ]
                       
                    chartsummarydaily.updateOptions({
                      labels:data.datatgl,
                          yaxis:{ 
                            title: {
                              text: 'Total Pcs',
                          },
                          min: 0,
                          range: 1,
                          max:data.height,
                        },                      
                    })

                    chartsummarydaily.updateSeries(series);
                    no=Number(no)-1;
                    $("#back").val(no);
                  }
        }) 

    } 
</script>
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