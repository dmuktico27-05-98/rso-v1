
<option value=""></option>
<?php foreach ($data_table as $key) {?>
<option value="<?=$key->lane_no;?>"><?='LANE '.$key->lane_no.' '.$key->pos_name;?></option>
<?php } ?>
<option value="-">-</option>
