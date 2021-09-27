<html>
<body>
  <table style="border:1px solid #FFE7E5;background: #F9F9FA !important;width:600px;margin:3px;background-color:#fff;padding:3px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-bottom: solid 10px #93515A;">
    <thead>
      <tr>
        <th style="text-align:center;"><img style="width: 80px;" src="https://i.imgur.com/pI5oq74.png" alt="JBN"></th>

      </tr>
    </thead>
    <tbody>

  <tr>
        <td style="height:35px;">Dear <?php echo $dear_name;?>,</td>
      </tr>
	  
       <tr>
        <td>
            <h4>Yay! We received your order!</h4>
            
            <h3>Must say, your choice is soo nice!</h3>
            
            </td>
      </tr>       
      
      <tr>
      <td>
     
          <p>Please lay back and chill while we fly your order to your door!</p>
            
            </td>
      </tr> 
      
      <tr>
        <td><p>Your payment has been successful and payment id is <strong><?php echo $PaymentID;?></strong>.</p></td>
      </tr>
	  
	    <tr>
        <td><p>Order Number is <strong><?php echo $OrderID;?></strong>. </p></td>
      </tr>
      
      <tr>
        <td><p>Order Date is <strong><?php echo date('d,M Y');?></strong>. </p></td>
      </tr> 
      
      
      
      <tr>
        <td><a href="https://jewellerybynikitha.com/beta/myaccount/orders"><p>Tap the link below to track your order</p></a></td>
      </tr>
   
     
    </tbody>


    <tfooter>
      <tr>
        <td colspan="2" style="font-size:14px;padding:50px 15px 0 15px;">
          <strong style="display:block;margin:0 0 10px 0;">Regards</strong> Jewellery By Nikitha<br><br><br>
         
        </td>
      </tr>
    </tfooter>
  </table>
</body>

</html>
