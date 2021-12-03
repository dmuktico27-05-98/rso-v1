<div class="box">
	<table style="width: 100%"> 
	<?php foreach ($data_table as $row) { 
		foreach ($data_field as $key){ if($key->name!='id'){?>
		<tr>
			<td class="text-right" style="width: 50%;vertical-align: top">
				<?=strtoupper($key->name);?>&nbsp;:&nbsp;
			</td>
			<td class="text-left" style="vertical-align: top">
	  			<?=$row[$key->name];?>
	  		</td>
	  	</tr>
	<?php }}} ?>
	</table>
</div>
