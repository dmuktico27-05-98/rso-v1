<?php
   foreach($data_field as $row){ 
      if($row->name!='id' AND $row->name!='password' AND $row->name!='idcard'){
        $field1[]="<th>".strtoupper(substr($row->name,0,1)).substr($row->name,1)."</th>"; 
        $field2[] = $row->name; 
      }
    }
    $count = count($field2)-1;
    $field=join('',$field1);
?>
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
<?php
header("Content-type:application/vnd.ms-excel");
header("Content-Disposition:attachment;file_name:Data_".$table.".xls");
?>
<h3>EXPORT DATA <?=strtoupper($table);?></h3>
<table border="1">
  <tr style="background-color: gray;">
    <th>No</th>
    <?=$field;?>
  </tr>
  <?php $no=1; foreach ($data_table as $key) { ?>
  <tr>
    <td style="text-align: center;"><?=$no;?></td>
    <?php for($i=0; $i<=$count; $i++) { ?>
    <td>
      <?=$key[$field2[$i]];?>
    </td>
    <?php } ?>
  </tr>
  <?php $no=$no+1; } ?>
</table>
</body>
</html>
