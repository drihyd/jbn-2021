<?php
include 'email_header.php';
?>
    <tbody>
      <tr>
        <td style="height:35px;"></td>
      </tr>

  <tr>
        <td style="height:35px;">Dear <?php echo $dear_name;?>,</td>
      </tr>
	  
       <tr>
        <td style="height:35px;"><strong>You have been Subcribed Thank you..!</strong></td>
      </tr>
	  
	    <!-- <tr>
        <td style="height:35px;"><p>Your Order Number is <strong><?php echo $OrderID;?></strong>. </p></td>
      </tr> -->
   
      <tr>
        <td style="height:35px;"></td>
      </tr>
    </tbody>


    <?php
include 'email_footer.php';
?>
