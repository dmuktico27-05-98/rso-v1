
  <!-- Main Footer -->
  <footer class="main-footer" style="background-color: #1f1f2e">
    <strong>Copyright &copy; 2021 <a href="https://rahayu-web.my.id"><?=$detail;?></a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 1.0
    </div>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<?=base_url('plugins/jquery/jquery.min.js')?>"></script>
<!-- Bootstrap -->
<script src="<?=base_url('plugins/bootstrap/js/bootstrap.bundle.min.js')?>"></script>
<!-- overlayScrollbars -->
<!-- AdminLTE App -->
<script src="<?=base_url('dist/js/adminlte.js')?>"></script>
<!-- jQuery Mapael -->
<!-- ChartJS -->
<script src="<?=base_url('plugins/chart.js/Chart.min.js')?>"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?=base_url('dist/js/pages/dashboard2.js')?>"></script>

<!-- jQuery 2.2.3 -->
<script src="<?=base_url('assets/lte/jquery/jquery-2.1.3.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/jquery-ui.js')?>"></script>
<script src="<?=base_url('assets/lte/uitimepicker/jquery-ui-timepicker-addon.js')?>"></script>
<script src="<?=base_url('assets/lte/uitimepicker/jquery-ui-sliderAccess.js')?>"></script>
<script src="<?=base_url('assets/lte/sweetalert/sweetalert.js')?>"></script> 
<script src="<?=base_url('assets/lte/jquery/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/lte/jquery/dataTables.jqueryui.min.js')?>"></script>
<script src="<?=base_url('assets/lte/datatables/extensions/FixedColumns/js/dataTables.fixedColumns.min.js')?>"></script>
<script src="<?=base_url('assets/lte/bootstrap/js/bootstrap.min.js')?>"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?=base_url('assets/lte/fastclick/fastclick.js')?>"></script>
<!-- AdminLTE App -->
<script src="<?=base_url('assets/lte/dist/js/app.min.js')?>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?=base_url('assets/js/select2.min.js')?>"></script>
<script src="<?=base_url('assets/js/select2.js')?>"></script>

<!-- page script -->
<script type="text/javascript"> 
  $(window).load(function() { 
      $("#loading").fadeOut("slow");
  })
</script>
<script  type="text/javascript">
$(document).ready(function(){
  $("#form").hide();$("#form1").hide();$("#form2").hide();
   $(".btn.btn-warning.edit").click(function(){
    $("#form1").hide();
    $("#form").hide();
  });
  $(".exit").click(function(){
    $("#form1").hide('slow');
    $("#form").hide('slow');
  });
  
    $(".treeview.home").addClass("active");
    $('.form-control.datetime').timepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'HH:mm:ss',
    stepHour: 1,
    stepMinute: 1,
    stepSecond: 1
    });
    $('.form-control.date').datepicker({
        dateFormat:'yy-mm-dd'
        });
    });
</script>
<script type="text/javascript">
function reset_json(id,username){
  swal({
          title: "Are you sure reset?",
          text: "You will not be able to recover this file!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           
          $.ajax({  
                type: "POST",
                url : "<?=base_url('master/reset'); ?>",
                data: "id="+id+"&username="+username,
                cache:false,
                success: function(data){
                  swal({
                      title: "Reset Success",
                      text: "",
                      type: "success",
                      timer: 1200,
                      showConfirmButton: false
                    });

                }
                });
        });            
    }
</script>
<script type="text/javascript">
function clear_json(password){
  swal({
          title: "Are you sure clear access?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           
          $.ajax({  
                type: "POST",
                url : "<?=base_url('master/clear'); ?>",
                data: "password="+password,
                cache:false,
                success: function(data){
                  swal({
                      title: "Clear Success",
                      text: "",
                      type: "success",
                      timer: 1200,
                      showConfirmButton: false
                    });
                  
                }
                });
        } );            
    }
</script>
<script type="text/javascript">
function print_case(id,table){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/print_case');?>/"+id+"/"+table, "_blank");
        } );            
    }
  function print_part(id,table){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/print_part');?>/"+id+"/"+table, "_blank");
        } );            
    }
  function print_part1(id,table){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/print_part1');?>/"+id+"/"+table, "_blank");
        } );            
    }
  function print_group(id,table){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/print_group');?>/"+id+"/"+table, "_blank");
        } );            
    }
 function print_pallet(id,table){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/print_pallet');?>/"+id+"/"+table, "_blank");
        } );            
    }
function printpallet(){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('mastercrud/printpallet');?>", "_blank");
        } );            
    }
</script>

<script type="text/javascript">
function print_idcard(id){
  swal({
          title: "Are you sure print?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: true,
          //closeOnCancel: false
        },
        function(){
           window.open("<?=base_url('master/printidcard');?>/"+id, "_blank");

        } );            
    }

function print_kanban(id){
           window.open("<?=base_url('master/printkanban');?>/"+id, "_blank");
      }
      function print_hrp(hrp_id){
           window.open("<?=base_url('master/print_hrp');?>/"+hrp_id, "_blank");
      }

    function print_rak_in(id){
           window.open("<?=base_url('master/printrakin');?>/"+id, "_blank");         
    }

       function print_rak_out(id){
           window.open("<?=base_url('master/printrakout');?>/"+id, "_blank");          
    }
    // function andon(id,url){
    //        window.open('<?=site_url('rso_ppc')?>','','fullscreen=yes, scrollbars=auto'); window.open('','_parent','');
    //   }

function generatelot(id){
  swal({
          title: "Are you sure generate?",
          text: "",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
          $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/generatelot'); ?>",
                data: "id="+id,
                cache:false,
                dataType: 'json',
                success: function(data){
                        if(data.status == false){
                           swal({
                              title: "Error!",
                              text: " "+data.msg,
                              type: "warning",
                              timer: 2000,
                              showConfirmButton: false
                            });
                        }else{
                          swal({
                              title: "Generate Success",
                              text: "",
                              type: "success",
                              timer: 2000,
                              showConfirmButton: false
                            });
                          table.ajax.reload();                          
                        }
                  }
                });

        });            
    }
</script>
<script type="text/javascript">
function approve_hrp(hrp_id,table){
  swal({
          title: "Are you sure?",
          text: "You will not be able to recover this file!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/approve_hrp'); ?>",
                data: "hrp_id="+hrp_id+"&table="+table,
                cache:false,
                dataType: 'json',
                success: function(data){
                  swal({
                        title: "Approve Success",
                        text: "",
                        type: "success",
                        timer: 800,
                        showConfirmButton: false
                      });
                  location.reload();
                  }
                });
        } );            
    }
function delete_hrp(id,table){
  swal({
          title: "Are you sure?",
          text: "You will not be able to recover this file!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/delete_hrp'); ?>",
                data: "id="+id+"&table="+table,
                cache:false,
                dataType: 'json',
                success: function(data){
                        if(data.status == false){
                           swal({
                              title: "Error!",
                              text: " "+data.msg,
                              type: "warning",
                              timer: 800,
                              showConfirmButton: false
                            });
                        }else{
                           
                          swal({
                              title: "Delete Success",
                              text: "",
                              type: "success",
                              timer: 800,
                              showConfirmButton: false
                            });
                            menu(url,nav,link,otorisasi);
                                               
                        }
                  }
                });
        } );            
    }
function delete_json(id,table1){
  swal({
          title: "Are you sure?",
          text: "You will not be able to recover this file!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/delete_json'); ?>",
                data: "id="+id+"&table="+table1,
                cache:false,
                dataType: 'json',
                success: function(data){
                        if(data.status == false){
                           swal({
                              title: "Error!",
                              text: " "+data.msg,
                              type: "warning",
                              timer: 800,
                              showConfirmButton: false
                            });
                        }else{
                          swal({
                              title: "Delete Success",
                              text: "",
                              type: "success",
                              timer: 800,
                              showConfirmButton: false
                            });
                          table.ajax.reload();                          
                        }
                  }
                });
        } );            
    }
function delete_all(table){
  swal({
          title: "Are you sure?",
          text: "You will not be able to recover this file!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           
          $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/delete_all'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                  swal({
                        title: "Delete Success",
                        text: "",
                        type: "success",
                        timer: 800,
                        showConfirmButton: false
                      });
                  fresh();
                  }
                });
        } );            
    }
</script>
<script type="text/javascript">
       function view_json(id,table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/view_detail'); ?>",
                data: "id="+id+"&table="+table,
                cache:false,
                success: function(data){
                    $("#view").show();
                    $("#view").html(data);
                    $("#myModal").modal('show');
                }
            });
        };
</script>
<script type="text/javascript">
       function add(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/add_detail'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#adddata').html(data);
                }
            });
      $("#form1").hide();
      $("#form3").hide();
        };
</script>
<script type="text/javascript">
       function edit(id,table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/edit_detail'); ?>",
                data: "id="+id+"&table="+table,
                cache:false,
                success: function(data){
                    $('#edit').html(data);
                }
            });
      $("#form1").hide();
      $("#form").hide();
        };
</script>
<script type="text/javascript">
       function upload(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('master/checkupload'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#upload').html(data);
                    
                }
            });
      $("#form").hide();
      $("#form3").hide();
      $("#form4").hide();
      $("#form5").hide();
      };
</script>
<script type="text/javascript"> 
function fresh(){
  table.ajax.reload(); 
  } 
</script>
<script type="text/javascript">
function menu(url,nav,table,otorisasi){ 
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
<script type="text/javascript">
        function download(table){
           var cari = $("#cari").val();
          $.ajax({
              type: "POST",
              url: "<?=base_url('master/checkdownload/');?>/",
              data: "table="+table,
              dataType: 'json',
               success: function(data){
                        if(data.status == "error") {
                           swal("Error!", data.msg, "warning");
                        }else{
                          swal({
                              title: "Generate Excel",
                              text: "",
                              type: "success",
                              timer: 1000,
                              showConfirmButton: false
                            });
                          window.location.href ="<?=base_url('master/download');?>/"+table+"--"+cari;
                          
                        }
                   }
              }); 
            }    

              function download_format(table){
           var cari = $("#cari").val();
          $.ajax({
              type: "POST",
              url: "<?=base_url('master/checkdownload/');?>/",
              data: "table="+table,
              dataType: 'json',
               success: function(data){
                        if(data.status == "error") {
                           swal("Error!", data.msg, "warning");
                        }else{
                          swal({
                              title: "Generate Excel",
                              text: "",
                              type: "success",
                              timer: 1000,
                              showConfirmButton: false
                            });
                          window.location.href ="<?=base_url('master/download_format');?>/"+table+"--"+cari;
                          
                        }
                   }
              }); 
            }     
</script>
<script type="text/javascript">
       function delete_detail(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/delete_detail'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#delete').html(data);
                }
            });
      $("#form").hide();
      $("#form1").hide();
      $("#form2").hide();
      $("#form3").hide();
      $("#form5").hide();
        };
</script>
<script type="text/javascript">
       function truncate(table){
          swal({
          title: "Are you sure?",
          text: "You will delete all!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/truncate'); ?>",
                data: "table="+table,
                cache:false,
                dataType: 'json',
                success: function(data){
                    if(data.status == "sukses"){
                          swal({
                              title: "Delete Success",
                              text: "",
                              type: "success",
                              timer: 800,
                              showConfirmButton: false
                            });
                        }else{
                            swal({
                              title: "Delete Error",
                              text: "",
                              type: "warning",
                              timer: 800,
                              showConfirmButton: false
                            });
                        }
                        fresh(); 
                }
            });
            });
        }

</script>
<script type="text/javascript">
       function print_label(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/print_label'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#print_label').html(data);
                }
            });
      $("#form").hide();
      $("#form1").hide();
      $("#form2").hide();
      $("#form3").hide();
      $("#form4").hide();
        };
  function filter(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/filter'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#filter').html(data);
                }
            });
        $("#form").hide();
        $("#form1").hide();
        $("#form2").hide();
        $("#form3").hide();
        $("#form4").hide();
        };

  function printlayout(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/formlayout'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#printlayout').html(data);
                }
            });
        $("#form").hide();
        $("#form7").hide();
        $("#form2").hide();
        $("#form4").hide();
        };
   function printcase(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/formprintcase'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#printlot').html(data);
                }
            });
        $("#form").hide();
        $("#form7").hide();
        $("#form2").hide();
        $("#form3").hide();
        $("#form5").hide();
        };
   function printgroup(table){
            $.ajax({
                type: "POST",
                url : "<?=base_url('mastercrud/formprintgroup'); ?>",
                data: "table="+table,
                cache:false,
                success: function(data){
                    $('#printlot').html(data);
                }
            });
        $("#form").hide();
        $("#form7").hide();
        $("#form2").hide();
        $("#form3").hide();
        $("#form5").hide();
        };
</script>

<script type="text/javascript">
  function save(table){
  swal({
          title: "Are you sure to save the data?",
          text: "You will not be able to edit this file except administrator!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: 'btn-danger',
          confirmButtonText: 'Yes',
          closeOnConfirm: false,
          //closeOnCancel: false
        },
        function(){
           
          $.ajax({  
                type: "POST",
                url : "<?=base_url('mastercrud/save'); ?>",
                data: "table="+table,
                cache:false,
                dataType: 'json',
                success: function(data){
                  if(data.success==true){
                     swal({
                        title: "Save Success",
                        text: "",
                        type: "success",
                        timer: 1200,
                        showConfirmButton: false
                      });
                  fresh();
                }else{
                   swal({
                        title: "Delete Failed",
                        text: "Empty Data || Not Yet Setting",
                        type: "warning",
                        timer: 800,
                        showConfirmButton: false
                      });
                  fresh();
                }
                 
                  }
                });
        } );  
  }
</script>

</body>
</html>