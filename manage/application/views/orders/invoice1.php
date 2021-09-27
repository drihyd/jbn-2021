<!-- <html class="no-js" lang>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="viewport" content="width=device-width,initial-scale=1">
      <link rel="shortcut icon" href="./assets/img/favicon.jpg" type="image/x-icon">
      <link rel="icon" href="./assets/img/favicon.jpg" type="image/x-icon">
      <title>Anaya Invoice</title>
      <meta name="description" content="">
      <meta name="keywords" content="">
      <meta name="robots" content="noodp">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   </head>
   <body style="background: #000;"> -->
   	<?php
   	 function AmountInWords(float $amount)
{
   $amount_after_decimal = round($amount - ($num = floor($amount)), 2) * 100;
   // Check if there is any number after decimal
   $amt_hundred = null;
   $count_length = strlen($num);
   $x = 0;
   $string = array();
   $change_words = array(0 => '', 1 => 'One', 2 => 'Two',
     3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six',
     7 => 'Seven', 8 => 'Eight', 9 => 'Nine',
     10 => 'Ten', 11 => 'Eleven', 12 => 'Twelve',
     13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen',
     16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
     19 => 'Nineteen', 20 => 'Twenty', 30 => 'Thirty',
     40 => 'Forty', 50 => 'Fifty', 60 => 'Sixty',
     70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety');
    $here_digits = array('', 'Hundred','Thousand','Lakh', 'Crore');
    while( $x < $count_length ) {
      $get_divider = ($x == 2) ? 10 : 100;
      $amount = floor($num % $get_divider);
      $num = floor($num / $get_divider);
      $x += $get_divider == 10 ? 1 : 2;
      if ($amount) {
       $add_plural = (($counter = count($string)) && $amount > 9) ? 's' : null;
       $amt_hundred = ($counter == 1 && $string[0]) ? ' and ' : null;
       $string [] = ($amount < 21) ? $change_words[$amount].' '. $here_digits[$counter]. $add_plural.' 
       '.$amt_hundred:$change_words[floor($amount / 10) * 10].' '.$change_words[$amount % 10]. ' 
       '.$here_digits[$counter].$add_plural.' '.$amt_hundred;
        }
   else $string[] = null;
   }
   $implode_to_Rupees = implode('', array_reverse($string));
   $get_paise = ($amount_after_decimal > 0) ? "And " . ($change_words[$amount_after_decimal / 10] . " 
   " . $change_words[$amount_after_decimal % 10]) . ' Paise' : '';
   return ($implode_to_Rupees ? $implode_to_Rupees . 'Rupees ' : '') . $get_paise;
}

   	?>
      
      <section>
      	<div class="right_col" role="main">
  <div class="">
    <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
      				<div class="card">
      					<div class="card-body">
      						<div class="row">
      							<div class="col-sm-12">
      								<img src="<?php echo base_url('assets/img/anaya-logo-new.jpg')?>" alt="logo" class="img-responsive" width="120" style="margin-bottom: 15px;">
      							</div>
      						</div>
      						<h2 class="text-center text-black"><b>TAX INVOICE</b></h2>
				      		<div class="row">
				      			<div class="col-sm-6">
				      				<div class="wrapper">
				      					<table class="float-left">
				      						<tbody>
				      							<tr><td><b>To</b></td></tr>
				      							<tr><td><?php echo ucwords($order->o_billing_Fullname)?></td></tr>
				      							<?php if($order->o_billing_Address1){ ?>
				      							<tr><td><?php echo ucwords($order->o_billing_Address1).','?></td></tr>
				      						<?php }else{ 
				      						}?>
				      						<?php if($order->o_billing_Address2){ ?>
				      							<tr><td><?php echo ucwords($order->o_billing_Address2).','?></td></tr>
				      						<?php }else{  
				      						}?>
				      						<?php if($order->o_billing_LandMark){ ?>
				      							<tr><td><?php echo ucwords($order->o_billing_LandMark).','?></td></tr>
				      						<?php }else{  
				      						}?>
				      						<?php if($order->o_billing_City || $order->o_billing_Pincode){ ?>
				      							<tr><td><?php echo ucwords($order->o_billing_City)?><?php echo ' - '.$order->o_billing_Pincode.'.'?></td></tr>
				      						<?php }else{  
				      						}?>
				      						<?php if($order->o_billing_Mobile){ ?>
				      							<tr><td><?php echo 'Ph.No: '.($order->o_billing_Mobile)?></td></tr>
				      						<?php }else{  
				      						}?>



				      						</tbody>
				      					</table>
				      					<!-- <p>To</p>
				      	<p><?php echo $order->u_first_name.' '.$order->u_last_name ?></p>
				      					<p>12-13-367/A/1,</p>
				      					<p>Street No.2, Tarnaka</p>
				      					<p>Hyderabad - 500017.</p>
				      					<p>Ph.No: <?php echo $order->user_phone ?></p> -->
				      				</div>
				      			</div>
				      			<div class="col-sm-6">
				      				<div class="wrapper">
				      					<table class="pull-right">
				      						<tbody>
				      							<tr><td><b>From</b></td></tr>
				      							<tr><td>Jewellery By Nikitha</td></tr>
				      							<tr><td>6-3-1239/3, Somajiguda,</td></tr>
				      							<tr><td>Raj bhavan road,</td></tr>
				      							<tr><td>Hyderabad - 500082.</td></tr>
				      							<tr><td>GSTIN No. : 36AJBPL5128L173</td></tr>
				      							<?php if($order->p_Order_Number){ ?>
				      							<tr><td>Invoice No. : <?php echo $order->p_Order_Number?></td></tr>
				      						<?php }else{ ?>
				      						<tr><td>Invoice No. :</td></tr> 
				      						<?php }?>
				      						<?php
				      							$date = str_replace('/', '-', $order->order_date);
				      							?>
				      							<tr><td>Date : <?php echo date('d-m-Y', strtotime($date))?></td></tr>
				      						</tbody>
				      					</table>
				      				</div>
				      			</div>
				      		</div>
				      		<div class="row" style="margin-top: 20px;">
				      			<div class="col-12">
				      				<table class="table table-bordered">
				      						<thead>
				      							<th>SKU Code</th>
				      							<th>Product Name</th>
				      							<th>Pcs.</th>
				      							<th>Purity</th>
				      							<th>Gross wt (Grams.)</th>
				      							<th>Rate</th>
				      							<th>Amount</th>
				      						</thead>
				      						<tbody>
				      							<?php foreach ($order->items as $value) { ?>
				      								<tr>
				      								<td><?php echo $value->d_ProductSKU?></td>
				      								<td><?php echo $value->d_ProductName?></td>
				      								<td><?php echo $value->d_Quantity?></td>
				      								<td><?php echo $value->pos_OptionName?></td>
				      								<td><?php echo sprintf('%0.2f',$value->p_Gross_weight."Gm's")?></td>
				      								<td><?php echo sprintf('%0.2f',$value->d_ProductPrice)?></td>
				      								<td><?php echo sprintf('%0.2f',$value->d_Amount)?></td>
				      							</tr>
				      							<?php } ?>
				      							
				      							
				      							
				      							<tr>
				      								<td></td>
				      								<td></td>
				      								<td></td>
				      								<td><b>Total <small>(Included 3% GST)</small></b></td>
					

					<?php
					$sum = 0;
foreach($order->items as $sum_value){ 
	$sum = $sum + $sum_value->p_Gross_weight; ?>
	<?php }?>
				      								<td><b><?php echo sprintf('%0.2f',$sum);?></b></td>
				      							

				      								<td></td>
				      								<?php
					$sum_1 = 0;
foreach($order->items as $sum_value){ 
	$sum_1 = $sum_1 + $sum_value->d_Amount; ?>
	<?php }?>
				      								<td><b><?php echo sprintf('%0.2f',$sum_1);?></b></td>
				      								
				      							</td>
				      							</tr>
				      							<tr>
				      								<?php
				      								$s_1 = $order->o_Shipping_Charges_Amount;
				      								//$H_2 = $order->o_Handling_Charges_Amount;
				      								$H_2 = 0;
				      								// print_r($order->items->d_Amount);
// foreach($order->items as $sum_value){ 
	$sum_1 = $s_1+$H_2 + $value->d_Amount; 
  // nummeric value in variable
 
 $get_amount= AmountInWords($sum_1);
 $get_amount;
 ?>

				      								
		
				      								<td colspan="4"></td>
				      								<td colspan="2">Shipping Charges    :</td>
				      								<td><?php echo sprintf('%0.2f',$order->o_Shipping_Charges_Amount);?></td>

				      							</tr>
				      							<!-- <tr>
				      								<td colspan="4"></td>
				      								<td colspan="2">Handling Charges :</td>
				      								<td><?php echo sprintf('%0.2f',$order->o_Handling_Charges_Amount);?></td>
				      							</tr>
				      							<tr>
				      								<td colspan="4"></td>
				      								<td colspan="2">CGST 1.5%    :</td>
				      								<td class=""><?php echo sprintf('%0.2f','0');?></td>
				      							</tr>
				      							<tr>
				      								<td colspan="4"></td>
				      								<td colspan="2">SGST 1.5%    :</td>
				      								<td><?php echo sprintf('%0.2f','0');?></td>
				      							</tr>
				      							<tr>
				      								<td colspan="4"></td>
				      								<td colspan="2">IGST 3%    :</td>
				      								<td><?php echo sprintf('%0.2f','0');?></td>
				      							</tr> -->
				      							<tr>
				      								<td colspan="4"><b>Rs: <?php echo ucwords($get_amount.' Only');?></b></td>
				      								<td colspan="2"><b>Grand Total</b></td>
				      								<?php
				      								$s_1 = $order->o_Shipping_Charges_Amount;
				      								$H_2 = 0;
				      								//$H_2 = $order->o_Handling_Charges_Amount;
				      								// print_r($order->items->d_Amount);
// foreach($order->items as $sum_value){ 
	$sum_1 = $s_1+$H_2 + $value->d_Amount; ?>
				      								<td><b><?php echo sprintf('%0.2f',$sum_1);?></b></td>

				      								
				      							</tr>
				      						</tbody>
				      				</table>
				      				<div class="pull-right">
				      					<a href="<?php echo base_url("orders/view/".$order->order_id)?>" class="btn btn-brand btn-sm">Back</a>
				      					<!-- <button type="submit" class="btn btn-danger btn-sm">back</button> -->
				      					<span class="text-center" id="printPageButton"><button class="btn btn-brand btn-sm py-1 font-16" id="printbtn" onclick="window.print()"><i class="feather icon-printer mr-2"></i>Print</button></span>
				      				</div>
				      			</div>
				      		</div>
      					</div>
      				</div>
      			</div>
      		</div>
      	</div>
      </section>
     <!-- </footer>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script> 
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
   </body>
</html> -->
