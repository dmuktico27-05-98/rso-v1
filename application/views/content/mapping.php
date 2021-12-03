<div id="content">	
	<section class="content-header text-orange" style="background-color: #edf0f5;">
    <span style="font-size: 20px"> Welcome </span>
    <small class="text-olive"><i><?=gmdate('l, d F Y',time()+60*60*7);?>&nbsp;<span id="clock">date(H:i:s)</span></i></small>
    <ol class="breadcrumb">
      <li><a href="<?=base_url();?>"><i class="fa fa-home"></i> Home</a></li>
      <li><a onclick="return menu('<?=$url; ?>','<?=$nav;?>','<?=$otorisasi;?>')"><?=$nav;?></a></li>
    </ol>
  </section>
 <!-- Main content -->
  <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box box-default">
        <div class="box-header with-border" style="border-bottom: 1px solid #ccc;">
          <h3 class="box-title text-bold"><a href="#">Mapping </a> Problem NG</h3>
        </div>
        <div class="box-body">
          <table border="1" class="text-center" style="width: 100%;">
            <tr class="bg-olive" style="height: 40px;">
              <td>
                LINE NO
              </td>
              <td>
                SEAT
              </td>
              <td>
                SIDE_LABEL
              </td>
              <td>
                MODEL
              </td>
              <td>
                VARIANT
              </td>
              <td>
                PROBLEM_CODE
              </td>
               <td>
                UPDATE_BY
              </td>
               <td>
                UPDATE_TIME
              </td>
              <td>
                ACTION
              </td>
              
            </tr>
            <?php foreach ($data_problem as $key) { ?>
            <tr>
              <td>
                <?=$key->line_no;?>
              </td>
              <td>
                <?=$key->row_seat;?>
              </td>
               <td>
                <?=$key->side_label;?>
              </td>
              <td>
                <?=$key->model;?>
              </td>
              <td>
                <?=$key->variant;?>
              </td>
              <td>
                <?=$key->problem_code;?>
              </td>
              <td>
                <?=$key->update_by;?>
              </td>
              <td>
                <?=$key->update_time;?>
              </td>
              <td style="padding: 2px;">
                <a href="<?=base_url('mapping/create/'.$key->problem_code);?>" class="btn btn-warning" target="_blank">Update</a>
              </td>
            </tr>
          <?php } ?>
          </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <big><code>Informasi :</code></big>
          <ul>
            <li><b>1. Klik tombol update</li>
            <li><b>2. Klik Area Check</li>
            <li><b>3. Pilih NO Problem</li>
          </ul>
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
</div>