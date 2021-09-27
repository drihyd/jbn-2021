<html>

<body style="background-color:#e2e1e0;font-family: Open Sans, sans-serif;font-size:100%;font-weight:400;line-height:1.4;color:#000;">
  <table style="max-width:600px;margin:50px auto 10px;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px #93515A;">
    <thead>
      <tr>
        <th style="text-align:left;"><img style="max-width: 150px;" src="https://i.imgur.com/5wR58YQ.png" alt="Anaya"></th>
        <th style="text-align:right;font-weight:400;"><?php echo date('D, M - Y') ?></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="height:35px;"></td>
      </tr>
      <tr>
        <td colspan="2" style="border: solid 1px #ddd; padding:10px 20px;">
          <p style="font-size:14px;margin:0 0 6px 0;"><span style="font-weight:bold;display:inline-block;min-width:150px">Order status</span><b style="color:green;font-weight:normal;margin:0"><?php echo $order->order_status ?></b></p>
          <p style="font-size:14px;margin:0 0 6px 0;"><span style="font-weight:bold;display:inline-block;min-width:146px">Transaction ID</span><?php echo $order->p_TransactionID ?></p>
          <p style="font-size:14px;margin:0 0 0 0;"><span style="font-weight:bold;display:inline-block;min-width:146px">Order amount</span> Rs. <?php echo $order->order_amount ?></p>
        </td>
      </tr>
      <tr>
        <td style="height:35px;"></td>
      </tr>
      <tr>
        <td style="width:50%;padding:20px;vertical-align:top">
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px">Name:</span> <?php echo $order->u_first_name.' '.$order->u_last_name ?></p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Email:</span>  <?php echo $order->u_user_email ?></p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Phone:</span> <?php echo $order->user_phone ?></p>
        </td>
        <td style="width:50%;padding:20px;vertical-align:top">
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Address</span> <?php 
          $address = $order->o_shipping_Fullname;
          if (!empty($order->o_shipping_Address1)) {
            $address .= ', '.$order->o_shipping_Address1;
          }
          if (!empty($order->o_shipping_Address2)) {
            $address .= ', '.$order->o_shipping_Address2;
          }
          if (!empty($order->o_shipping_LandMark)) {
            $address .= ', '.$order->o_shipping_LandMark;
          }
          if (!empty($order->o_shipping_City)) {
            $address .= ', '.$order->o_shipping_City;
          }
          if (!empty($order->o_shipping_Pincode)) {
            $address .= ', '.$order->o_shipping_Pincode;
          }
          if (!empty($order->o_shipping_Country)) {
            $address .= ', '.$order->o_shipping_Country;
          }
          echo $address; ?></p>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="font-size:20px;padding:30px 15px 0 15px;">Items</td>
      </tr>
      <tr>
        <td colspan="2" style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:10px;border:solid 1px #ddd;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">Wdding Rings</span> Rs. 3500
          </p>
          <p style="font-size:14px;margin:0;padding:10px;border:solid 1px #ddd;font-weight:bold;"><span style="display:block;font-size:13px;font-weight:normal;">Gift Ring</span> Rs. 2000</p>
        </td>
      </tr>
    </tbody>
    <tfooter>
      <tr>
        <td colspan="2" style="font-size:14px;padding:50px 15px 0 15px;">
          <strong style="display:block;margin:0 0 10px 0;">Regards</strong> Anaya<br> Hyderabad, Pin/Zip - 500001, Telangana, India<br><br>
          <b>Phone:</b> 040-222011<br>
          <b>Email:</b> contact@anaya.in
        </td>
      </tr>
    </tfooter>
  </table>
</body>
</html>
