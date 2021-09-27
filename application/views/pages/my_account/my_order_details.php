<!-- PAGE BODY : BEGIN -->
<main class="main-content">

  <section class="info bg-bright my-account">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-bright border-bottom">
              <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Home</a></li>
              <li class="breadcrumb-item "><a href="<?php echo base_url();?>myaccount">My Account</a></li>
              <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb_item;?></li>
            </ol>
        </nav>
      <div class="row">
        <?php echo $myaccount_sidenav;?>
        <div id="sidebar-overlay" class="myaccount-toggler"></div>
        <div class="col-lg-8">
            <div class="d-flex border-bottom justify-content-between pt-3 pb-2">
                <h5 class="text-dark text-uppercase p-0 m-0">My Orders Details</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>
            <div class="my-account-info">
                <div class="bg-bright py-3 ">
                    <span class="text-dark">Order Number: #<?php echo $order_details_info->o_Order_Number; ?> </span><br>
                     <span class="text-dark">Placed on: <?php echo $order_details_info->order_date;?></span>
                </div>
                <div class="card border-0 rounded-0 bg-light">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <h6 class="text-dark p-0 mb-1">Customer Information</h6>
                                <p class="text-dark m-0"><span class="text-gray">Name: </span><?php echo ucwords($order_details_info->u_first_name);?> <?php if ($order_details_info->u_first_name) {
                                  echo ucwords($order_details_info->u_last_name);
                                } ?></p>
                                <p class="text-dark m-0"><span class="text-gray">Email: </span><?php echo $order_details_info->u_user_email;?></p>
                                <?php if ($order_details_info->user_gender) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Gender: </span><?php echo ucwords($order_details_info->user_gender);?></p> 
                                <?php }?>
                                <?php if ($order_details_info->user_phone) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Phone: </span><?php echo $order_details_info->user_phone; ?>
                                </p>
                              <?php } ?>
                            </div>
                            <div class="col-md-4">
                              <h6 class="text-dark p-0 mb-1">Payment Details</h6>
                              <?php if ($order_details_info->p_Payment_method) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Payment Method</span><?php echo $order_details_info->p_Payment_method;?>
                                </p>
                             <?php } ?>
                             <?php if ($order_details_info->p_TransactionID) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Transaction No: </span><?php echo $order_details_info->p_TransactionID;?>
                                </p>
                             <?php } ?>
                             <?php if ($order_details_info->p_amount) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Amount: </span><?php echo $order_details_info->p_currency;?> <?php echo sprintf('%0.2f',$order_details_info->p_amount);?>
                                </p>
                             <?php } ?>
                             <?php if ($order_details_info->p_payment_date) { ?>
                                <p class="text-dark m-0"><span class="text-gray">Date: </span><?php echo $order_details_info->p_payment_date;?> 
                                </p>
                             <?php } ?>
                                
                            </div>
                            <div class="col-md-4">
                                <table class="table table-sm table-borderless m-0">
                                    <tbody>
                                        <tr>
                                            <td>Total<small><br><p class="mb-0" style="font-size: 10px;">(Included 3% GST)</p></td>
                                            <?php if ($order_details_info->p_amount) { ?>
                                            <td align="right">Rs. <?php echo sprintf('%0.2f',$order_details_info->p_amount-($order_details_info->o_Shipping_Charges_Amount));?></td>
                                          <?php } ?>
                                        </tr>
                                        <tr>
                                            <td>Shipping Chg's..</td>
                                            <td align="right">Rs. <?php echo sprintf('%0.2f',$order_details_info->o_Shipping_Charges_Amount);?></td>
                                        </tr>
                                     <!--    <tr>
                                            <td>Handling Chg's..</td>
                                            <td align="right">Rs. <?php echo sprintf('%0.2f',$order_details_info->o_Handling_Charges_Amount);?></td>
                                        </tr> -->
                                        <tr class="border-top">
                                            <th >Grand Total</th>
                                            <?php if ($order_details_info->p_amount) { ?>
                                            <th class="text-right" style="font-size: 12px;">Rs. <?php echo sprintf('%0.2f',$order_details_info->p_amount);?></th>
                                          <?php } ?>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0 mt-3">
                    <div class="card-body p-2 p-md-3">
                      <?php foreach ($order_details_info->items as $item) { ?>

                        
                        <?php
                
              $path = 'uploads/products/';
         $image = str_replace(' ', '_', $item->d_ProductSKU).'_thumbnail.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $item->d_ProductSKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $item->d_ProductSKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $item->d_ProductSKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
              ?>
                        <div class="order-summery border-0 mb-5">
                          <div class="order-list p-0">
                              <div class="thumbnail" >
                                  <img src="<?php echo $image_path;?>" class="full" alt="" style="width:150px; ">
                              </div>
                              <div class="order-details">
                                <p class="title" style="color: red;"><?php echo ucwords($item->d_ProductName);?></p>
                                <div class="row">
                                  <div class="col-md-6">
                                <table class="text-dark table table-sm ">
                                  <tbody>
                                    <tr>
                                    <tr>
                                      <td><b>NAME: </b></td>
                                      <td><?php echo ucwords($item->d_ProductName);?></td>
                                      
                                    </tr>
                                    <tr>
                                      <td><b>Polish Details: </b></td>
                                      <td><?php echo ucwords($item->p_Polish_Details);?></td>
                                    </tr>
                                    <tr>
                                      <td><b>Size: </b></td>
                                      <td><?php echo $item->p_Height; ?> mm</td>
                                    </tr>
                                    <tr>
                                      <td><b>Length: </b></td>
                                      <td><?php echo $item->p_Length; ?> mm</td>
                                    </tr>
                                    </tr> 
                                  </tbody>
                                </table>
                                </div>
                                <div class="col-md-6">
                                <table class="text-dark table table-sm ">
                                  <tbody>
                                    <tr>
                                      <tr>
                                      <td><b>SKU: </b></td>
                                      <td><?php echo $item->d_ProductSKU;?></td>
                                    </tr>
                                    <tr>
                                      <td><b>Gross weight: </b></td>
                                      <td><?php echo $item->p_Gross_weight;?></td>
                                    </tr>
                                    <tr>
                                      <td><b>Height: </b></td>
                                      <td><?php echo $item->p_Height; ?> mm</td>
                                    </tr>
                                    <tr>
                                      <td><b>Purity: </b></td>
                                      <td><?php echo $item->pos_OptionName; ?></td>
                                    </tr>
                                    </tr> 
                                  </tbody>
                                </table>
                                </div>
                                </div>
                                  <!-- <p class="title"><?php //echo ucwords($item->d_ProductName);?></p>
                                  <p class="sku">SKU: <?php //echo $item->d_ProductSKU;?></p>
                                  <p class="sku">SIZE: <?php// echo $item->d_ProductSKU;?></p>
                                  <p class="sku">METAL: <?php// echo $item->d_ProductSKU;?></p>
                                  <p class="sku">DIAMOND: <?php //echo $item->d_ProductSKU;?></p>
                                  <p class="sku">WEIGHT: <?php// echo $item->d_ProductSKU;?></p>
                                  <p class="sku">WIDTH: <?php// echo $item->d_ProductSKU;?></p>
                                  <p class="sku">HEIGHT: <?php //echo $item->d_ProductSKU;?></p>
                                  <p class="sku">LENGTH: <?php //echo $item->d_ProductSKU;?></p> -->
                                  <!-- <div class="mt-2 mt-md-3 mb-0">
                                    <li class="d-block d-md-inline">
                                      <a href="./login.html" class="btn btn-sm btn-default default-gray m-0">Return / Replace</a>
                                    </li>
                                    <li class="d-block d-md-inline mt-1 mt-md-0">
                                      <a href="./register.html" class="btn btn-sm btn-brand m-0">Get Invoice</span></a>
                                    </li>
                                  </div> -->
                              </div>
                              <!-- <div class="order-price text-right">
                                  <p>₹ <?php// echo sprintf('%0.2f',$item->d_ProductPrice);?><br><del>₹ <?php //echo $item->d_MRP_Price;?></del></p>
                              </div> -->
                          </div>
                        </div>
                      <?php } ?>
                        <div class="tracker">
                          <div class="tracker-header d-flex d-flex-row justify-content-between py-2 mb-4 border-bottom">
                            <p class="m-0 text-dark">Status: <span class="text-success text-uppercase"><?php echo $order_details_info->order_status;?></span></p>
                            <?php if ($order_details_info->order_DeliveryDate !='0000-00-00 00:00:00') { ?>
                            <p class="m-0 text-dark">Delivered: <span class="text-success"><?php echo $order_details_info->order_DeliveryDate;?></span></p>
                          <?php } ?>
                          </div>
                          <!-- <div class="tracker-body text-center">
                            <ul class="list-unstyled multi-steps">
                              <li>Confirmed</li>
                              <li>Packed</li>
                              <li class="is-active">Shipped</li>
                              <li>Out of Delivery</li>
                              <li>Delivered</li>
                            </ul>
                            <a href="./login.html" class="btn btn-sm btn-default default-gray">Track</a>
                          </div> -->
                        </div>
                    </div>
                    <div class="card-footer bg-bright">
                      <!-- <ul class="m-0 pl-3 text-dark">
                        <li>Lorem ipsum dolor sit amet consectetur</li>
                      </ul> -->
                      <div class="row mt-0">
                        <div class="col-md-6">
                            <div class="card bg-light rounded-0 border-0">
                                <div class="card-body">
                                    <p class="text-dark mb-1"><b>SHIPPING ADDRESS</b></p>
                                    <p class="text-dark mb-0"><?php echo ucwords($order_details_info->o_shipping_Fullname);?> ,<br><?php echo ucwords($order_details_info->o_shipping_Address1);?> , <?php echo ucwords($order_details_info->o_shipping_Address2);?> , <br><?php if($order_details_info->o_shipping_LandMark){ echo ucwords($order_details_info->o_shipping_LandMark.','); }?><?php echo ucwords($order_details_info->o_shipping_City);?>,<br><?php echo ucwords($order_details_info->o_shipping_State);?> ,<?php echo ucwords($order_details_info->o_shipping_Country);?> - <?php echo $order_details_info->o_shipping_Pincode;?>, <br> Phone: <?php echo $order_details_info->o_shipping_Mobile;?></p> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card bg-light rounded-0 border-0">
                                <div class="card-body">
                                    <p class="text-dark mb-1"><b>BILLING ADDRESS</b></p>
                                    <p class="text-dark mb-0"><?php echo ucwords($order_details_info->o_billing_Fullname);?> ,<br><?php echo ucwords($order_details_info->o_billing_Address1);?> , <?php echo ucwords($order_details_info->o_billing_Address2);?> , <br><?php if($order_details_info->o_billing_LandMark){ echo ucwords($order_details_info->o_billing_LandMark.','); }?><?php echo $order_details_info->o_billing_City;?>,<br><?php echo $order_details_info->o_billing_State;?> , <?php echo $order_details_info->o_billing_Country;?> - <?php echo $order_details_info->o_billing_Pincode;?>,  <br> Phone: <?php echo $order_details_info->o_billing_Mobile;?></p> 
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </section>
</main>