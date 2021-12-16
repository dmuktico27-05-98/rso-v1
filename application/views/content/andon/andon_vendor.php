<!DOCTYPE html>
<html lang="en">

<head>
    <title><?php echo $title; ?></title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/fontawesome-free/css/all.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url() ?>dist/css/adminlte.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

</head>

<body>
    <div class="wrapper">
        <section class="content">
            <div class="container-fluid p-2" id="print">
                <script type="text/javascript">
                    <?php date_default_timezone_set('Asia/Jakarta'); ?>
                    var serverTime = new Date(<?php print date('Y, m, d, H, i, s, 0'); ?>);
                    //buat object date berdasarkan waktu di client
                    var clientTime = new Date();
                    //hitung selisih
                    var Diff = serverTime.getTime() - clientTime.getTime();
                    //fungsi displayTime yang dipanggil di bodyOnLoad dieksekusi tiap 1000ms = 1detik
                    function displayServerTime() {
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
                        $("#clock").text((sh.length == 1 ? "0" + sh : sh) + ":" + (sm.length == 1 ? "0" + sm : sm) + ":" + (ss.length == 1 ? "0" + ss : ss));
                    }
                    setInterval('displayServerTime()', 500);
                </script>

                <table style="width: 100%;">
                    <tr>
                        <td style="height: 12%;width: 10%;background:url('<?php echo base_url("assets/img/logo-daihatsu.png") ?>');background-repeat: no-repeat;background-size:100% 100%;">&nbsp;
                        </td>
                        <td class="bg-dark">
                            <h2 class="text-center display-5">Andon Rundown Stock <?= $Shift ?> Shift <?= isset($_GET["machine"]) ? $_GET["machine"] : ""; ?> <?= isset($_GET["model"]) ? $_GET["model"] : ""; ?></h2>
                            <h1 class="text-center display-6">PT. Astra Daihatsu Motor Stamping Plant</h2>
                        </td>
                        <td width="15%" style="word-wrap: break-word;" class="bg-danger">
                            <h2 class="display-5 text-center">
                                <?= strtoupper(gmdate('d-m-Y', time() + 60 * 60 * 7)); ?>
                                <span id="clock"><?= gmdate('H:i:s', time() + 60 * 60 * 7); ?></span>
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="p-0">
                            <div class="row mt-2">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-warning dropdown-toggle w-100" data-toggle="dropdown">
                                        Download
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-item"><a href="#">Excel</a></li>
                                        <li class="dropdown-item"><a href="<?php echo isset($_GET["model"]) ? base_url("andon/pdf?model=") . $_GET["model"] . "&machine=" . $_GET["machine"] . "&ps=" . $_GET["ps"] . "&date=" . $_GET["date"] . "&shift=" . $_GET["shift"] : base_url("andon/pdf"); ?>" target="_blank">PDF</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select id="Model" class="form-control">
                                            <option value="">Model</option>
                                            <?php foreach ($Models as $k) {?>
                                                <option><?= $k->model ?></option>
                                            <?php }?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select id="PS" class="form-control">
                                            <option value="">Patan Schedule</option>
                                            <?php foreach ($PSs as $k) {?>
                                                <option><?= $k->ps ?></option>
                                            <?php }?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select class="form-control" id="Machine">
                                            <option value="">Machine</option>
                                            <?php foreach ($Machines as $k) {?>
                                                <option><?= $k->machine ?></option>
                                            <?php }?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group date" id="Date" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" data-target="#Date" placeholder="Date" />
                                        <div class="input-group-append" data-target="#Date" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select id="Shift" class="form-control">
                                            <option value="">Shift</option>
                                            <option>Day</option>
                                            <option>Night</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    Last Update : <?= $Tanggal . " " . $Jam ?>
                                    <table class="table table-bordered table-sm" width="100%" style="table-layout: fixed;">
                                        <thead class="thead-light">
                                            <tr class="text-center">
                                                <th rowspan="2" width="2%">No</th>
                                                <th rowspan="2" width="16%" style="word-wrap: break-word;">Part Name</th>
                                                <th rowspan="2" width="3%">Mach</th>
                                                <th rowspan="2" width="3%">Model</th>
                                                <th rowspan="2" width="4%" style="word-wrap: break-word;">PS</th>
                                                <th rowspan="2" width="3%" style="word-wrap: break-word;">M/S</th>
                                                <th rowspan="2" width="3%">T/T</th>
                                                <th colspan="5" width="14%">Stock</th>
                                                <th rowspan="2" width="4%" style="word-wrap: break-word;">Stock Strenght</th>
                                                <th rowspan="2" width="6%"><?= $pat[0] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[1] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[2] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[3] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[0] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[1] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[2] ?></th>
                                                <th rowspan="2" width="6%"><?= $pat[3] ?></th>
                                            </tr>
                                            <tr class="text-center">
                                                <th class="bg-primary">P1</th>
                                                <th class="bg-success">P4</th>
                                                <th class="bg-warning">KAP</th>
                                                <th class="bg-danger">PPL</th>
                                                <th class="bg-dark" style="word-wrap: break-word;">RPR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $i = 1;
                                            foreach ($List as $key) {
                                                $p1 = 0.734375 * $key->ss_p1;
                                                $p4 = 0.734375 * ($key->ss_p1 + $key->ss_p4);
                                                $kap = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap);
                                                $ppl = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap + $key->ss_ppl);
                                                $process = 0.734375 * ($key->ss_p1 + $key->ss_p4 + $key->ss_kap + $key->ss_ppl + $key->ss_process)
                                            ?>
                                                 <tr class="text-center" style="font-size:13px">
                                                    <td><?= $i; ?></td>
                                                    <td class="text-left"><?= $key->part_name; ?></td>
                                                    <td><?= $key->machine; ?></td>
                                                    <td><?= $key->model; ?></td>
                                                    <td><?= $key->ps; ?></td>
                                                    <td><?= $key->maks_shift; ?></td>
                                                     <td><?= $key->t_t; ?></td>
                                                     <td><?= $key->sto_p1; ?></td>
                                                     <td><?= $key->sto_p4; ?></td>
                                                     <td><?= $key->sto_kap; ?></td>
                                                     <td><?= $key->sto_ppl; ?></td>
                                                     <td><?= $key->sto_process; ?></td>
                                                     <td><?= $key->ss_p1 + $key->ss_p4 + $key->ss_kap + $key->ss_ppl + $key->ss_process; ?>
                                                    <td class="pl-0">
                                                        <div class="bg-dark text-right pr-1 position-absolute" style="width: <?= $process > 47 ? 47 : $process; ?>%;z-index: -1;"><?= $key->ss_process; ?></div>
                                                        <div class="bg-danger text-right pr-1 position-absolute" style="width: <?= $ppl > 47 ? 47 : $ppl; ?>%;z-index: -1;"><?= $key->ss_ppl; ?></div>
                                                        <div class="bg-warning text-right pr-1 position-absolute" style="width: <?= $kap > 47 ? 47 : $kap; ?>%;z-index: -1;"><?= $key->ss_kap; ?></div>
                                                        <div class="bg-success  text-right pr-1 position-absolute" style="width: <?= $p4 > 47 ? 47 : $p4; ?>%;z-index: -1;"><?= $key->ss_p4; ?></div>
                                                        <div class="bg-primary  text-right pr-1 position-absolute " style="width: <?= $p1 > 47 ? 47 : $p1; ?>%;z-index: -1;"><?= $key->ss_p1; ?></div>
                                                    </td>
                                                </tr>
                                        </tbody>
                                    <?php $i++;
                                            } ?>
                                    </table>
                                    </span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </section>
    </div>

    <script src="<?php echo base_url() ?>plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<?php echo base_url() ?>plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?php echo base_url() ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url() ?>dist/js/adminlte.js"></script>
    <!-- InputMask -->
    <script src="<?php echo base_url() ?>plugins/moment/moment.min.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<?php echo base_url() ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Select2 -->
    <script src="<?php echo base_url() ?>plugins/select2/js/select2.full.min.js"></script>


    <script>
        $(function() {            
            $('.select2').select2()            
            $('#Date').datetimepicker({
                format: 'DD/MM/YYYY'
                <?php
                if (isset($_GET["date"]) && $_GET["date"] != "") {
                    echo ",defaultDate:'" . date('m/d/Y', strtotime($_GET["date"])) . "'";
                } else {
                    echo ' ';
                }
                ?>
            });

            $('#Model').on('change', function() {
                var url = "<?= base_url() . 'andon/general?' ?>"; // get selected value
                var fix_url = querybuilder(url);
                if (fix_url) { // require a URL
                    window.location = fix_url; // redirect
                }
                return false;
            });

            $('#Machine').on('change', function() {
                var url = "<?= base_url() . 'andon/general?' ?>"; // get selected value
                var fix_url = querybuilder(url);
                if (fix_url) { // require a URL
                    window.location = fix_url; // redirect
                }
                return false;
            });

            var dates = "";
            $("#Date").on("change.datetimepicker", function(e) {
                if (dates != "") {
                    var url = "<?= base_url() . 'andon/general?' ?>"; // get selected value
                    var fix_url = querybuilder(url);
                    if (fix_url) { // require a URL
                        window.location = fix_url; // redirect
                    }
                }
                dates = e.date;
                return false;
            });


            $('#Shift').on('change', function() {
                var url = "<?= base_url() . 'andon/general?' ?>"; // get selected value
                var fix_url = querybuilder(url);
                if (fix_url) { // require a URL
                    window.location = fix_url; // redirect
                }
                return false;
            });

            $('#PS').on('change', function() {
                var url = "<?= base_url() . 'andon/general?' ?>"; // get selected value
                var fix_url = querybuilder(url);
                if (fix_url) { // require a URL
                    window.location = fix_url; // redirect
                }
                return false;
            });

            function querybuilder(url) {
                var fomat = " ";
                if ($('#Date').datetimepicker('viewDate') != " ") {
                    var formattedDate = new Date($('#Date').datetimepicker('viewDate'));
                    var d = formattedDate.getDate();
                    var M = formattedDate.getMonth() + 1;
                    var y = formattedDate.getFullYear();
                    var h = formattedDate.getHours();
                    var s = formattedDate.getSeconds();
                    var m = formattedDate.getMinutes();
                    //var format = y+"-"+M+"-"+d+" "+h+":"+m+":"+s;
                    format = y + "-" + M + "-" + d;
                }
                return url + "model=" + $("#Model").val() + "&machine=" + $("#Machine").val() + "&ps=" + $("#PS").val() + "&date=" + format + "&shift=" + $("#Shift").val();
            }
        })

        <?php
        if (isset($_GET["model"]) && $_GET["model"] != "") {
            echo "$('#Model').val('" . $_GET['model'] . "').change();";
        }

        if (isset($_GET["ps"]) && $_GET["ps"] != "") {
            echo "$('#PS').val('" . $_GET['ps'] . "').change();";
        }

        if (isset($_GET["machine"]) && $_GET["machine"] != "") {
            echo "$('#Machine').val('" . $_GET['machine'] . "').change();";
        }

        if (isset($_GET["shift"]) && $_GET["shift"] != "") {
            echo "$('#Shift').val('" . $_GET['shift'] . "').change();";
        }
        ?>
    </script>
    </body>
</html>