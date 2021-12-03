<?php
require_once('assets/lte/mpdf60/qrcode/qrcode.class.php');
?>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HRP-Online-<?=$hrp_id;?></title>
<style>
		/* Style definitions for pdfs */

		/**********************************************************************/
		/* Default style definitions
		/**********************************************************************/

		/* General
		-----------------------------------------------------------------------*/
		
		/* Table Data
		-----------------------------------------------------------------------*/
		.h_scrollable { 
		  overflow: -moz-scrollbars-horizontal;
		}

		.v_scrollable { 
		  overflow: -moz-scrollbars-vertical;
		}

		.scrollable {
		  overflow: auto;/*-moz-scrollbars-horizontal;*/
		}

		tr.head>td.center,
		tr.list_row>td.center,
		.center {
		  text-align: center;
		}

		.left,
		tr.head>td.left,
		tr.list_row>td.left { 
		  text-align: left;
		  padding-left: 2em;
		}

		.total,
		.right,
		.list tr.head td.right,
		tr.list_row td.right,
		tr.foot td.right,
		tr.foot td.total {
		  text-align: right;
		  padding-right: 2em;
		}

		.list tr.foot td {
		  font-weight: bold;
		}

		.no_wrap {
		  white-space: nowrap;
		}

		.bar {
		  border-top: 1px solid black;
		}

		.total {
		  font-weight: bold;
		}

		.summary_spacer_row {
		  line-height: 2px;
		}

		.light { 
		  color: #999999;
		}

		

		/* Lists
		-----------------------------------------------------------------------*/
		.list {
		  border-collapse: collapse;
		  border-spacing: 0px;
		  border-top: 1px solid #8B7958;
		  border-bottom: 1px solid #8B7958;
		  width: 99%;
		  margin-top: 3px;
		}

		.list tr.head td {
		  font-size: 0.7em;
		  white-space: nowrap;
		  padding-right: 0.65em;
		  border-bottom: 1px solid #8B7958;
		}

		.list table.sub_head td {
		  border: none;
		  white-space: nowrap;
		  font-size: 10px;
		}

		.list tr.foot td {
		  border-top: 1px solid #8B7958;
		  font-size: 0.7em;
		}

		tr.list_row>td {
		  background-color: #EDF2F7;
		  border-bottom: 1px dotted #8B7958;
		  font-size: 0.65em;
		  padding: 3px;
		}

		tr.list_row:hover td {
		  background-color: #F8EEE4;
		}

		tr.problem_row>td {
		  background-color: #FDCCCC;
		  border-bottom: 1px dotted #8B7958;
		  font-size: 0.65em;
		  padding: 3px;
		}

		tr.problem_row:hover td {
		  background-color: #F8EEE4;
		}

		.row_form td {
		  font-size: 0.7em;
		  padding: 3px;
		  white-space: nowrap;
		/*  text-align: center; */
		}

		.row_form td.label {
		  text-align: left;
		  white-space: normal;
		}

		.inline_header td {
		  color: #8B7958;
		  font-size: 0.6em;
		  white-space: nowrap;
		  text-align: center;
		}

		
		/* Note List */
		.note>td {
		  background-color: #EDF2F7;
		  padding-left: 10px;
		  border-bottom: 1px dotted #E5D9C3;
		}

		.note:hover>td,
		.note:hover>td>p {
		  background-color: #EDF2F7;
		}

		.note_author {
		  font-size: 0.65em;
		  text-align: center;
		  border-right: 1px dotted #E5D9C3;
		}

		.note p {
		  margin-left: 3%;
		  font-size: 0.75em;
		  background-color: #EDF2F7;
		}

		.topic_spacer td {
		  border-bottom: 1px solid #8B7958;
		  line-height: 2px;
		}

		td.note_indent {
		  background-color: #F9F0E9;
		  width: 2%;
		  border-bottom: none;
		}

		.note_control td { 
		  padding-left: 2%;
		  padding-bottom: 1%;
		  font-weight: normal;
		  font-size: 0.6em;
		  background-color: #EDF2F7;
		  border-bottom: 1px dotted #E5D9C3;
		}

		.topic_title {
		  font-size: 0.8em;
		  font-weight: bold;
		}

		.note_title {
		  font-size: 0.8em;
		}

		.problem .topic_title {
		  color: #860000;
		}

		.thread>tr { display: none; }

		/* Summaries
		-----------------------------------------------------------------------*/
		.summary {
		  border: 1px solid black;
		  background-color: white;
		  padding: 1%;
		  font-size: 0.8em;
		}

		.summary h1 {
		  color: black;
		  font-style: normal;
		}

		/* Print preview
		-----------------------------------------------------------------------*/
		.page { 
		  background-color: white;
		  padding: 0px;
		  border: 1px solid black;
		/*  font-size: 0.7em; */
		  width: 95%;
		  margin-bottom: 15px;
		  margin-right: 5px;
		  padding: 20px;
		}

		.page table.header td {
		  padding: 0px;
		}

		.page table.header td h1 { 
		  padding: 0px;
		  margin: 0px;
		}

		.page h1 {
		  color: black;
		  font-style: normal;
		  font-size: 1.3em;
		}

		.page h2 {
		  color: black;
		}

		.page h3 {
		  color: black;
		  font-size: 1em;
		}

		.page p { 
		  text-align: justify;
		  font-size: 0.8em;
		}

		.page table { 
		  font-size: 0.8em;
		}

		.page em {
		  font-weight: bold;
		  font-style: normal;
		  text-decoration: underline;
		  margin-left: 1%;
		  margin-right: 1%;
		}

		.page table.money_table {
		  font-size: 1.1em;
		  border-collapse: collapse;
		  width: 85%;
		  margin-left: auto;
		  margin-right: auto;
		}

		.page table.money_table tr.foot td { 
		  font-size: 1em;
		  border-top: 0.4pt solid black;
		  font-weight: bold;
		  background-color: white;
		  color: black;
		}

		.page table.money_table tr.foot td.right { 
		  padding-right: 1px;
		}

		.written_field {
		  border-bottom: 1px solid black;
		}

		.page .written_field { 
		  border-bottom: 0.4pt solid black;
		}

		.page .indent * { margin-left: 4em; }

		.checkbox { 
		  border: 1px solid black;
		  padding: 1px 2px;
		  font-size: 7px;
		  font-weight: bold;
		}


		table.signature_table { 
		  width: 80%;
		  font-size: 0.7em;
		  margin: 2em auto 2em auto;
		}

		table.signature_table tr td { 
		  padding-top: 1.5em;
		  vertical-align: top;
		  white-space: nowrap;
		}

		#special_conditions { 
		  font-size: 1.3em;  
		  font-style: italic;
		  margin-left: 2em;
		  font-weight: bold;
		}

		.sa_head p {
		  font-size: 1em;
		}


		.page hr {
		  border-bottom: 1px solid black;
		}

		.page table.detail,
		.page table.fax_head {
		  margin-left: auto;
		  margin-right: auto;
		}

		.page .narrow,
		.page .fax_head {
		  border: none;
		}

		.page tr.head td {
		  color: black;
		  background-color: #eee;
		}

		.page td.label {
		  color: black;
		  background-color: white;
		  width: 20%;
		}

		.page td.label_right {
		  color: black;
		  background-color: white;
		}

		.page td.field {
		  background-color: white;
		  font-weight: bold;
		}

		.page td.field_money {
		  background-color: white;
		}

		.page td.field_total {
		  font-weight: bold;
		  background-color: white;
		}

		.page tr.detail_spacer_row td {
		  background-color: white;
		  border-top: 1px solid black;
		}

		.page .header { 
		  border-spacing: 0px;
		  border-collapse: collapse;
		  padding: 0px;
		}

		.page .header tr td {
		  border-top: 1px solid black;
		  border-bottom: 1px solid black;
		  background-color: #eee;
		}
		/* Style definitions for printable pages */



		/* General
		-----------------------------------------------------------------------*/
		@page { 
		  margin: 0.25in;
		}

		body { 
		  background-color: white;
		  color: black;
		}

		h1 {
		  color: black;
		}

		h2 {
		  color: black;
		}

		pre {
		  color: black;
		}

		ul {
		  color: black;
		}

		a:link,
		a:visited {
		  color: black;
		}

		a:hover {
		  text-decoration: none;
		  color: black;
		}

		p a {
		  display: none;
		}

		#body { 
		  background-color: white;
		}

		#body pre {
		  color: black;
		}

		/* Inputs
		-----------------------------------------------------------------------*/
		input {
		  color: black;
		  border: 1px solid black;
		  background-color: white;
		}

		select {
		  color: black;
		  border: 1px solid black;
		  background-color: white;
		}

		textarea {
		  color: black;
		  border: 1px solid black;
		  background-color: white;
		}

		a.button {
		  display: none;
		}

		a.block_button {
		  display: none;
		}

		input[type=button], 
		input[type=submit], 
		input[type=reset] {
		  display: none;
		}


		/* Tables
		-----------------------------------------------------------------------*/
		.head td {
		  color: black;
		  background-color: white;
		}

		.head input {
		}

		.foot td {
		  color: black;
		  background-color: white;
		}

		.label {
		  color: black;
		  background-color: white;
		}

		.sublabel {
		  color: black;
		}

		.field {
		  color: black;
		  background-color: white;
		}

		.field_center {
		  color: black;
		  background-color: white;
		}

		.field_nw {
		  color: black;
		  background-color: white;
		}

		.field_money {
		  color: black;
		  background-color: white;
		}

		.field_total {
		  color: black;
		  background-color: white;
		}

	

		/* Lists
		-----------------------------------------------------------------------*/
		.list {
		  border-top: 1px solid black;
		  border-bottom: 1px solid black;
		}

		.list tr.head>td {
		  border-bottom: 1px solid black;
		}
		.list tr.foot td {
		  border-top: 1px solid black;
		}

		tr.list_row>td {
		  background-color: white;
		  border-bottom: 1px dotted #666;
		}

		tr.list_row:hover td {
		  background-color: white;
		}

		/* Pages
		-----------------------------------------------------------------------*/
		.page>*>p, .page>p { 
		  font-size: 1.5em;
		}

		.written_field { 
		  font-size: 1em;
		  border-bottom: 1px solid black;
		}

		.page h1 {
		  font-size: 1em;
		}

		.page h2 { 
		  font-size: 0.9em;
		}

		@page {
		  margin-bottom: 0.75in;
		}
		/* General
		-----------------------------------------------------------------------*/
		body { background-color: white; }

		/* Lists
		-----------------------------------------------------------------------*/
		.list tr.head td { 
		  background-color: #eee;
		}

		tr.list_row>td {
		  background-color: white;
		  border-bottom: 0.7pt dotted #666;
		}

		.list tr.foot td { 
		  background-color: #eee;
		}

		/* Pages
		-----------------------------------------------------------------------*/
		.page { 
		  font-size: 1em;
		  border: none;
		  margin: none;
		  width: auto;
		  padding: 0px;
		}

		.foot td { 
		  font-size: 1em;
		}


		.page>*>p, .page>p { 
		  font-size: 0.8em;
		}


		table.signature_table { 
		  width: 88%;
		  font-size: 0.6em;  
		}

		#special_conditions { 
		  font-size: 1.5em;
		}

		.header h1 {
		  font-size: 0.8em;
		}

		p.small { 
		  font-size: 0.8em;
		}

		.page td {
		  padding: 1px;
		}

		td.label {
		  font-size: 0.7em;
		}

		td.field {
		  font-size: 0.7em;
		}

		td.field_money {
		  font-size: 0.7em;
		}
		.page_break{
			page-break-before:always;
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
</head>

<body>
<br>
<div class="page">
	<table style="width: 100%;border:1px solid #444;border-collapse: collapse;margin-top: -10px">
        <tr>
            <td style="border:1px solid #444;width:25%;vertical-align: middle;font-size:10px;text-align: left;">
            <table style="width: 100%;margin:0px;">
                <tr>
                    <td style="width:25%">
                        <img src="<?=base_url('assets/img/logo.jpg');?>" style="width:90px;"/>
                    </td>
                    <td style="text-align: left;font-weight: bold;vertical-align: middle;">
                        PT. ASTRA DAIHATSU MOTOR <br>LOGISTIC <?=strtoupper($shop);?>
                    </td>
                </tr>
            </table>
            </td>
            <td style="border:1px solid #444;width:50%;vertical-align: middle;font-size: 20px;text-align: center;">
                MEMO HRP
            </td>
            <td style="border:1px solid #444;vertical-align: middle;text-align: center;width: 23%">
                <table style="width: 100%;margin:0px;">
                <tr>
                    <td style="width:25%" align="center" valign="middle"><img src="<?=base_url('assets/lte/mpdf60/qrcode/image.php?msg='.urlencode($hrp_id).'&amp;err='.urlencode('Q'));?>" style="width: 50px;height: 50px;"></td>
                    
                    <td style="text-align: center;font-size: 10px;font-weight: bold;">
                        FOR <?php if($i==1){ echo"LOGISTIC"; }else{ echo strtoupper($shop); }?><br>
                        TO LPB
                    </td>
                </tr>
            </table>
                
            </td>
        </tr>
	</table>		

	<table class="detail" style="width: 100%">
    <?php foreach ($data_hrp as $key) { ?>
        <?php $create_by = $key->create_by; $cc = $key->cost_center; $shop = $key->shop_name;?>
        <?php } ?>
        <tr>
            <td class="label">HRP Number</td>
            <td class="field">: <?=$hrp_id;?></td>
            <td class="label">Cost Center</td>
            <td class="field">: <?=$cc;?></td>
        </tr>

        <tr>
            <td class="label">Created</td>
            <td class="field">: <?=$create_by;?></td>
            <td class="label">To</td>
            <td class="field">: <?=$gr_code;?></td>

        </tr>

        <tr>
            <td class="label">From</td>
            <td class="field">: <?=$shop;?></td>
            <td class="label">Plan Delivery</td>
            <td class="field">: <?=$create_date;?></td>
        </tr>
	</table>
    <hr>
	<span style="font-size: 8px;">List Items : </span>
	<table class="list" style="width: 100%;">
        <tr class="head">
            <td class="center" style="width: 5%">No.</td>
            <td class="center" style="width: 10%">Job Number</td>
            <td style="width: 15%">Part Number</td>
            <td>Part Name</td>
            <td style="width: 10%;">Transaction</td>
            <td style="width: 5%;">item</td>
            <td style="width: 10%;">Problem</td>
            <td class="center" style="width: 5%;">Qty</td>
            <td class="center" style="width: 10%;">Price</td>
            <td class="center" style="width: 5%;">Check</td>
        </tr>

        <?php $y=1; foreach ($data_hrp as $key) { ?>
            <tr class="list_row">
            <td class="center"><?=$y;?></td>
            <td class="center"><?=$key->job_no;?></td>
            <td><?=$key->part_no;?></td>
            <td><?=$key->part_name;?></td>
            <td><?=$key->transaction;?></td>
            <td><?=$key->item;?></td>
            <td><?=$key->category;?></td>
            <td class="center"><?=$key->qty;?></td>
            <td class="center"><?='Rp '.number_format($key->qty*$key->price);?></td>
            <td class="center"></td>
            </tr>
        <?php $y=$y+1; }?>
        <?php for ($i=$y; $i <= 15 ; $i++) { ?>
            <tr class="list_row">
            <td class="center"><?=$i;?></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            </tr>
        <?php }?>
        <tr class="list_row">
            <td colspan="3" class="center">Grand Total Price</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="center"><?='Rp '.number_format($tot_price);?></td>
            <td></td>
            </tr>
        <div class="footer">
		<table style="text-align: center;width: 100%;">
        <br>
			<tr>
              <td style="width: 25%;"></td>
                <td>Acknowledge by:<br></td> 
				<td>Approved by:<br></td> 
				<td>Checked by:<br></td>
				<td>Created by:<br></td>
			</tr>
			<tr style="height: 100px;">
				<td style="width: 25%;"></td>
                <td style="width: 15%;">
				<?php if($sd=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$sd_date;?>
				<?php }else{ ?>
					<br><br><br>
				<?php } ?>
				<br>(__________________)
                <br><?=$divisi;?></td>
				<td style="width: 15%;">
				<?php if($sma=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$sma_date;?>
				<?php }else{ ?>
					<br><br><br>
				<?php } ?>
				<br>(__________________)
				<br><?=$manager_area;?></td>
				<td style="width: 15%;">
				<?php if($ssa=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$ssa_date;?>
				<?php }else{ ?>
					<br><br>
				<?php } ?>
				<br>(__________________)
				<br><?=$spv_area;?></td>
				<td style="width: 15%;">
				<?php if($spa=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$spa_date;?>
				<?php }else{ ?>
					<br><br>
				<?php } ?>
				<br>(__________________)
				<br><?=$create_by;?></td>
				
			</tr>
			
		</table>
	</div>
	</table>
    <div class="footer">
		<table style="text-align: center;width: 100%;">
			<tr>
              <td style="width: 20%;"></td>
                <td colspan="2">Received by:<br></td> 
				
				<td><br></td>
				<td><br></td>
			</tr>
			<tr style="height: 100px;">
				<td style="width: 20%;"></td>
                <td style="width: 20%;">
				<?php if($smg=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$smg_date;?>
				<?php }else{ ?>
					<br><br><br>
				<?php } ?>
				<br>(__________________)
                <br><?=$ga;?></td>
				<td style="width: 20%;">
				<?php if($smm=="ok"){ ?>
				<img style="width:40px;height:40px;" src="<?=base_url('assets/img/jempol.png')?>">
				<br><?=$smm_date;?>
				<?php }else{ ?>
					<br><br><br>
				<?php } ?>
				<br>(__________________)
				<br><?=$mdic;?></td>
				<td style="width: 20%;"><br><br><br>
				<br></td>
				<td style="width: 20%;"><br><br><br>
				<br></td>
				
			</tr>
			
		</table>
		<hr>
		<table style="margin-left:100px;border-collapse: collapse;width:70%;font-size:12px">
		<tr >
            <td colspan="2" style="padding:2px;text-align:left">Apporval limit rules ( Moving Averange Price / Book Value )</td>
        </tr>
		<tr >
            <td colspan="2" style="border:1px solid;padding:2px;text-align:center">Book Value</td>
        </tr>
		<tr>
            <td style="border:1px solid;padding:2px;text-align:center;">Amount Limit</td>
			<td style="border:1px solid;padding:2px;text-align:center;">Approve By</td>
        </tr>
        <tr>
            <td style="border:1px solid;padding:2px;text-align:center">≤ Rp. 50.000.000,00</td>
			<td style="border:1px solid;padding:2px;text-align:center">Div Head</td>
        </tr>
        <tr>
			<td style="border:1px solid;padding:2px;text-align:center">≥ Rp. 50.000.000,00</td>
            <td style="border:1px solid;padding:2px;text-align:center">DIC</td>
        </tr>
		<tr>
            <td colspan="2">Distribution of Memo : Original = User; Copy 1 = Logistic; copy 2 = GSM ; Copy 3 = Finance</td>
        </tr>
		
    </table>
	</div>
	
    <div class="footer-tag">
		<table style="width: 100%;">
	
			<tr>
			
				<td colspan="4" style="text-align: left;font-style: italic;font-size: 7px;">
					<p>Printed by hrp system <?php echo gmdate("Y-m-d H:i:s",time()+60*60*7);?></p>
				</td>
			</tr>
			
		</table>
	</div>
</div>



<script type="text/javascript">
   window.print();
   setTimeout(function() { 
        window.close();
   }, 1000);
</script>
</body>
</html>
