<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<style type="text/css">
  html,body { 
      height: 100%;
      width: 100%;
      padding:0px;
      margin:0px;
      font-family: sans-serif;
      background-color: #fff;
      color: #000;
      text-align: center;
      font-weight: 900;
      
    }
    @media (max-width: 899px) {
      .header{
        font-size: 12px;
        font-weight: 900;
      }
      .content{
        font-size: 8px;
        font-weight: 900;
        line-height: 100%;
      }
    }
    @media (min-width: 900px) {
      .header{
        font-size: 20px;
        font-weight: 900;
        line-height: 100%;
      }
      .content{
        font-size: 16px;
        font-weight: 900;
        line-height: 100%;
      }
    }
    table,tr,td{
      padding: 0px;
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
</head>
<body>
<table style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;font-weight: bold;">
  <tr>
    <td style="padding:1px;">

      <table style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;background-color:#ccc;"  class="header">
          <tr>
            <td style="height: 12%;width: 10%;background:url('<?=base_url('assets/img/'.$logo);?>');background-repeat: no-repeat;background-size:100% 100%;border:2px solid #000">&nbsp;
            </td>
            <td style="border:2px solid #000">
              <div style="font-size:230%;color: black;padding: 0px;padding: 0px;margin: 0px;line-height: 100%;">MONITORING SETTING DELIVERY </div> <div style="font-size: 100%"><?=$owner;?></div>
            </td>
            <td style="width: 15%;font-size: 100%;border:2px solid #000">
              <table style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;background-color: yellow;color:#000">
                <tr>
                  <td style="border-bottom:2px solid #000;padding: 0px;"><?=strtoupper(gmdate('d-M-Y',time()+60*60*7));?></td>
                </tr>
                <tr>
                  <td style="padding: 0px;">
                    <span id="clock"><?=gmdate('H:i:s',time()+60*60*7);?></span>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="3" class="content" id="update">
              <table style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;">
                <tr>
                  <td style="height:17%">
                    <table border="2" style="width: 100%;height: 100%;border-spacing: 0px;border-color: white;border-collapse: collapse;">
                      <tr style="background-color: teal;color: white">
                        <td style="height:25px;">
                          CUSTOMER
                        </td>
                        <td>
                          DN/PO NUMBER
                        </td>
                        <td style="width:8%;">
                          TOTAL KBN
                        </td>
                        <td style="width:8%;">
                          OK SCAN
                        </td>
                        <td style="width:8%;">
                          MISTAKE
                        </td>
                        <td style="width:8%;">
                          REMAIN
                        </td>
                        <td style="width:15%;">
                          STATUS
                        </td>
                      </tr>
                      <?php if(!empty($current_scan)) { foreach ($current_scan as $key) { ?>
                      <tr style="font-size: 200%">
                        <td style="background-color: black;color: white">
                          <?=$key->customer_code.' '.$key->customer_shop;?>
                        </td>
                        <td style="background-color: black;color: white">
                          <?=$key->order_no;?>
                        </td>
                        <td>
                          <?=$key->total_kbn;?>
                        </td>
                        <td style="background-color: green;color: white">
                          <?=$key->total_scan;?>
                        </td>
                        <td style="background-color: red;color: white">
                          <?=$key->mistake;?>
                        </td>
                        <td style="background-color: yellow;color: black">
                          <?=$key->remain;?>
                        </td>
                        <td style="background-color: purple;color: white">
                          <?php 
                            if($key->total_kbn==$key->remain){
                            echo 'OPEN';
                           }elseif($key->total_kbn>$key->remain){ 
                            echo 'PARTIAL';
                           }else{
                            echo 'CLOSED';
                           }?>
                        </td>
                      </tr>
                    <?php }}else{ ?>
                      <tr style="font-size: 250%">
                        <td style="background-color: black;color: white">
                          &nbsp;
                        </td>
                        <td style="background-color: black;color: white">
                          &nbsp;
                        </td>
                        <td>
                          &nbsp;
                        </td>
                        <td style="background-color: green;color: white">
                          &nbsp;
                        </td>
                        <td style="background-color: red;color: white">
                          &nbsp;
                        </td>
                        <td style="background-color: yellow;color: black">
                          &nbsp;
                        </td>
                        <td style="background-color: purple;color: white">
                         &nbsp;
                        </td>
                      </tr>
                    <?php } ?>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td style="height:20%">
                    <table border="2" style="width: 100%;height: 100%;border-spacing: 0px;border-color: white;">
                      <tr>
                        <td colspan="4" style="height:25px;background-color:yellow;color: black;font-size: 130%">
                          VERIFIKASI CHECK
                        </td>
                      </tr>
                      <tr>
                        <td style="height:25px;width:45%;background-color:teal;color: white;">
                          KANBAN CUSTOMER
                        </td>
                        <td rowspan="2" style="width:7%;background-color: #3c8dbc;color: white;font-size: 250%">
                          VS
                        </td>
                        <td style="background-color:teal;color: white">
                          KANBAN YOSKA
                        </td>
                        <td style="width:15%;background-color:teal;color: white">
                          JUDGE
                        </td>
                      </tr>
                      <tr style="font-size: 200%">
                        <td style="color: black;">
                           <?=$label_customer;?>
                        </td>
                        <td style="color: black">
                          <?=$label_internal;?>
                        </td>
                        <td style="font-size: 150%;background-color: #000;color:<?php if($status=='OK'){ echo 'lime';}else{ echo 'red';}?>">
                          <?=$status;?>
                        </td>
                      </tr>
                    </table>

                  </td>
                </tr>
                <tr>
                  <td>
                    <table border="2" style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;border-color: white">
                      <tr>
                        <td style="height:25px;width: 48%;background-color:yellow;font-size: 130%">
                          ITEM LIST
                        </td>
                        <td style="background-color: teal;color: white;font-size: 130%"> 
                          SUMMARY / DAY
                        </td>
                      </tr>
                      <tr>
                        <td id="itemlist">
                            <table border="1" style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;border-color: white;font-size: 75%">
                              <tr style="background-color: teal;color: white">
                                <td style="height:15px;">
                                  NO
                                </td>
                                <td>
                                  JOB NO
                                </td>
                                <td>
                                  PART NO
                                </td>
                                <td>
                                  PART NAME
                                </td>
                                <td>
                                  QTY/KBN
                                </td>
                                <td>
                                  &#931; SCAN(KBN)
                                </td>
                              </tr>
                              <?php $x=1; foreach ($item_list as $key) {
                                if($key->total_kbn==$key->total_scan){
                                  $color='background-color: green;color:white';
                                 }elseif($key->total_scan>0){ 
                                  $color='background-color: yellow;color:black;';
                                 }else{
                                  $color='background-color: black;color:white;';
                                 }
                                ?>
                                <tr style="background-color: black;color: white">
                                  <td style="height:15px;">
                                   <?=$x++;?>
                                  </td>
                                    <td>
                                   <?=$key->job_no; ?>
                                  </td>
                                  <td>
                                    <?=$key->part_no; ?>
                                  </td>
                                  <td>
                                    <?=$key->part_name; ?>
                                  </td>
                                  <td>
                                    <?=$key->qty_kbn; ?>
                                  </td>
                                  <td style="<?=$color;?>">
                                    <?=$key->total_scan.'/'.$key->total_kbn; ?>
                                  </td>
                                </tr> 
                                <?php }
                                if($x<15){ $j=15-$x+1;
                                for($s=$x;$s<=$j;$s++){ ?>
                                <tr  style="background-color: black;color: white">  
                                  <td style="height:15px;">
                                   <?=$s;?>
                                  </td>
                                    <td>
                                   &nbsp;
                                  </td>
                                  <td>
                                     &nbsp;
                                  </td>
                                  <td>
                                     &nbsp;
                                  </td>
                                  <td>
                                      &nbsp;
                                  </td>
                                  <td>
                                      &nbsp;
                                  </td>
                                </tr>
                              <?php } } ?>
                            </table>
                        </td>
                        <td>
                            <table border="1" style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;border-color: white;">
                              <tr style="background-color: red;color: white">
                                <td style="height:20px;font-size: 120%">
                                  HIGHLIGHTS MISTAKE
                                </td>
                              </tr>
                              <tr>
                                <td style="height: 30%">
                                  <table border="1" style="width: 100%;height: 100%;border-spacing: 0px;border-collapse: collapse;border-color: white;font-size: 75%">
                                    <tr style="background-color: teal;color: white">
                                      <td style="height:15px;">
                                        NO
                                      </td>
                                      <td>
                                        CUSTOMER
                                      </td>
                                      <td>
                                        JOB NO
                                      </td>
                                       <td>
                                        PART NO
                                      </td>
                                      <td>
                                        QTY KBN
                                      </td>                                  
                                    </tr>
                                    <?php $x=1; foreach ($list_mistake as $key) {?>
                                      <tr style="background-color: black;color: white">
                                        <td style="height:15px;">
                                         <?=$x++;?>
                                        </td>
                                          <td>
                                         <?=$key->customer_code.' '.$key->customer_shop; ?>
                                        </td>
                                        <td>
                                          <?=$key->job_no; ?>
                                        </td>
                                        <td>
                                          <?=$key->part_no; ?>
                                        </td>
                                        <td>
                                          <?=$key->qty_kbn; ?>
                                        </td>
                                      </tr> 
                                      <?php }
                                      if($x<5){ $j=5-$x+1;
                                      for($s=$x;$s<=$j;$s++){ ?>
                                      <tr  style="background-color: black;color: white">  
                                        <td style="height:15px;">
                                         <?=$s;?>
                                        </td>
                                          <td>
                                         &nbsp;
                                        </td>
                                        <td>
                                           &nbsp;
                                        </td>
                                        <td>
                                           &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                      </tr>
                                    <?php } } ?>
                                  </table>
                                </td>
                              </tr>
                              <tr style="background-color: teal;color: white">
                                <td style="height:20px;font-size: 120%">
                                  SUMMARY CHART
                                </td>
                              </tr>
                              <tr>
                                <td style="padding:1px;font-size: 12px;" id="summary_chart">
                                </td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>         
            </td>
          </tr>
        </table>

    </td>
  </tr>
  <tr>
    <td  style="height: 5%;background-color: black;color: yellow;">
      <marquee style="font-size:200%;vertical-align: middle;font-weight: bold;"><i><?=$pesan_andon;?></i></marquee>
    </td>
  </tr>  
</table>
<script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js')?>"></script>
<script src="<?=base_url('assets/lte/echart/echarts.js?='.$this->encrypt->sha1(rand(1000,10000000)));?>"></script>
<script type="text/javascript">
    // Set paths
    // ------------------------------

    require.config({
        paths: {
            echarts: '<?=base_url();?>/assets/lte/echart'
        }
    });


    // Configuration
    // ------------------------------

    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
        ],


        // Charts setup
        function (ec) {
            // Initialize chart
            // ------------------------------
           myChart = ec.init(document.getElementById('summary_chart'));

            // Chart Options
            // ------------------------------
            var chartOptions = {

                // Setup grid
                backgroundColor :['white'],
                grid: {
                    x: 50,
                    x2: 25,
                    y: 20,
                    y2: 45,
                    borderWidth:0,
                    borderColor:'#444',
                },
                // Add tooltip
                tooltip: {
                    trigger: 'axis',
                     axisPointer:{
                          type: 'line',
                          lineStyle: {
                              color: '#444',
                              width: 2,
                              type: 'dashed'
                          },
                          crossStyle: {
                              color: '#1e90ff',
                              width: 1,
                              type: 'dashed'
                          },
                          shadowStyle: {
                              color: 'rgba(150,150,150,0.3)',
                              width: 'auto',
                              type: 'default'
                          },

                     }
                },

                // Add legend
                legend: {
                    data: ['PLAN','ACTUAL']
                },

                // Add custom colors
                color: ['#3c8dbc', '#00FF00'],

                // Enable drag recalculate
                calculable: true,

                // Horizontal axis
                xAxis: [{
                    type: 'category',
                    axisLabel : {
                              rotate: 20,
                              textStyle : {
                                      fontSize : '10',
                                      color  : '#000',
                                  }
                          },
                    boundaryGap : true,
                    axisTick: {onGap:true},
                    axisLine:{
                       lineStyle:
                          {
                          color: '#999',
                          width: 1,
                          type: 'solid'
                      },

                    },
                    splitLine: {show:true},
                    data: [
                    <?php $i=0; foreach($summary_chart as $row){ ?>
                      '<?=$row->customer_code.' '.$row->customer_shop;?>',
                      <?php $i=$i+1; }
                        $j=3-$i;
                        if($j>0){ for($x=1;$x<=$j;$x++){ ?>
                          '0',
                        <?php } }?>
                    ],
                              
                }],

                // Vertical axis
                yAxis : [
                    {
                        type : 'value',
                        name : 'TOTAL',
                        splitNumber: 6,                        
                        boundaryGap: [0.01, 0.01],
                        axisLabel : {
                            formatter: '{value} KBN',
                            textStyle : {
                                    fontSize : '10',
                                    color  : '#000',
                                }
                        },
                        min:0,
                        splitLine:{
                          lineStyle:{
                          color: '#9A9',
                          width: 1,
                          type: 'dashed'
                        }
                        },
                        axisLine:{
                        lineStyle:{
                          color: '#999',
                          width: 1,
                          type: 'solid'
                        }
                      }

                    }
                ],
                

                // Add series
                series : [
                    {
                        name:'PLAN',
                        type:'bar',
                        itemStyle: {
                        normal: {                   // 系列级个性化，横向渐变填充
                            borderRadius: 5,
                            label : {
                                show : true,
                                position : 'inside',
                                textStyle : {
                                    fontSize : '14',
                                    fontFamily : '微软雅黑',
                                    fontWeight : 'bold',
                                    color  : '#000',
                                }
                            },
                            barBorderColor :'#999',
                            barBorderWidth :1
                        }
                    },
                        data:[
                         <?php $i=0; foreach($summary_chart as $row){ ?>
                        '<?=$row->total_kbn;?>',
                        <?php $i=$i+1; }
                        $j=3-$i;
                        if($j>0){ for($x=1;$x<=$j;$x++){ ?>
                          '0',
                        <?php } }?>
                      ]
                    },
                    {
                        name:'ACTUAL',
                        type:'bar',
                        itemStyle: {
                        normal: {                   // 系列级个性化，横向渐变填充
                            borderRadius: 5,
                            label : {
                                show : true,
                                position : 'inside',
                                textStyle : {
                                    fontSize : '14',
                                    fontFamily : '微软雅黑',
                                    fontWeight : 'bold',
                                    color  : '#000',
                                }
                            },
                            barBorderColor :'#999',
                            barBorderWidth :1
                        }
                    },
                        data:[
                        <?php $i=0; foreach($summary_chart as $row){ ?>
                        '<?=$row->total_scan;?>',
                        <?php $i=$i+1; }
                        $j=3-$i;
                        if($j>0){ for($x=1;$x<=$j;$x++){ ?>
                          '0',
                        <?php } }?>
                      ]
                    }


                ]
            };

            // Apply options
            // ------------------------------

            myChart.setOption(chartOptions);


            // Resize chart
            // ------------------------------

            $(function () {

                // Resize chart on menu width change and window resize
                $(window).on('resize', resize);
                $(".menu-toggle").on('click', resize);

                // Resize function
                function resize() {
                    setTimeout(function() {

                        // Resize chart
                        myChart.resize();
                    }, 200);
                }
            });

        }


    );

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
  }, 3000);
}

function doesConnectionExist() {
    var xhr = new XMLHttpRequest();
    var file = "#";
    var randomNum = Math.round(Math.random() * 10000);
    var status_scan = "<?=$status_scan;?>";

    xhr.open('HEAD', file + "?nocache=" + randomNum, true);
    xhr.send();
    
    xhr.addEventListener("readystatechange", processRequest, false);

    function processRequest(e) {
      if (xhr.readyState == 4) {
        if (xhr.status >= 200 && xhr.status < 304) {
          $(document).ready(function(){
                       
              $.ajax({
                  async: true,
                  type: "POST",
                  url :"<?=base_url("andon/resultsetting?=".$this->encrypt->sha1(rand(1000,10000000)));?>",
                  cache:false,
                  dataType: 'json',
                  data: "status_scan="+status_scan,                
                  success: function(data){ 
                    //console.log(data.jumlah);
                          if(status_scan!=data.status_scan){
                            location.reload();
                          }
                  }
                });
            
           });
        } else {
            tempAlert("KONEKSI ERROR <br><br><br>Silakan Periksa Koneksi Jaringan / Network Anda !!",4000);
        }
      }
    }
}

function tempAlert(msg,duration){
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
}, (15 * 60) * 1000);
</script>

</body>
</html>
