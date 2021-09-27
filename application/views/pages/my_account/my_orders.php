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
                <h5 class="text-dark text-uppercase p-0 m-0">My Orders</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>
            <?php foreach ($orderinfo as $key => $item) { ?>
             
            <div class="my-account-info">
                <div class="card rounded-0 mt-3">
                    <div class="card-header row border-bottom bg-bright p-0 m-0">
                      <div class="col-12 col-md d-flex flex-row justify-content-between p-0">
                        <div class="bg-bright p-2 align-self-stretch">
                          <span class="text-dark"><b>Order Number: </b>#<?php echo $item->o_Order_Number;?></span>
                          <br><span class="text-gray"><b>Placed on:</b> <?php echo $item->order_date;?></span>
                        </div>
                        <div class=" text-dark p-2">
                          SHIP TO<br>
<!--                           <a href="#" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<div class='m-0 p-2 text-left'>
                            <p class='font-weight-bold mb-2'><?php echo $item->o_shipping_Fullname;?></p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, laboriosam odio. Natus repudiandae earum nesciunt nam! Unde, minima excepturi aut ratione vero, neque illo numquam, itaque deleniti officiis ut adipisci.</p>
                          </div>"><?php echo $item->o_shipping_Fullname;?></a> -->
                          <div class="dropdown" style="position: relative;">
  <a href="#" class="dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $item->o_shipping_Fullname;?></a>
  <div class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton">  
    <p class="small"><b><?php echo $item->o_shipping_Fullname;?></b><br>
                                <?php echo $item->o_shipping_Address1;?>,<br> <?php echo $item->o_shipping_Address2;?>,<?php if ($item->o_shipping_LandMark) { ?>
                                  <?php echo $item->o_shipping_LandMark;?>
                                 <?php } ?><br><?php echo $item->o_shipping_City;?><br><?php echo $item->o_shipping_State;?>,<?php echo $item->o_shipping_Country;?> - <?php echo $item->o_shipping_Pincode;?><br>
                                <span class="text-gray">Phone: </span><?php echo $item->o_shipping_Mobile;?></p>
  </div>
</div>
                        </div>
                      </div>
                      <div class="col-12 col-md-4 d-flex flex-row justify-content-between p-0">
                          <div class="bg-bright p-2">
                          </div>
                          <div class=" align-self-stretch p-2">

                            <!-- <a href="#" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<div class='m-0 p-2 text-left'>
                              <ul class='p-0 m-0 list-unstyled'>
                                <li><a href='' class='text-bright'>P-slip/Warranty 1</a></li>
                                <li><a href='' class='text-bright'>Request Invoice</a></li>
                                <li><a href='' class='text-bright'>Printable Order Summary</a></li>
                              </ul>
                            </div>">Invoice</a> -->
                            <div class="dropdown" style="position: relative;">
  <a href="<?php echo base_url("myaccount/invoice/$item->order_id"); ?>" class="btn btn-brand btn-sm" type="button" id="dropdownMenuButton" >Invoice</a>
  <!-- <div class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton">  
    <p class="small"><b><a target="_blank" href="<?php echo base_url("myaccount/invoice/$item->order_id"); ?>">Request Invoice</a></b><br>
                                </p>
  </div> -->
</div>
                          </div>
                      </div>
                    </div>
                    <div class="card-body p-2 p-md-3">

                      <?php 


                      foreach ($item->items as $value) { ?>

                        


                            <?php
                
              $path = 'uploads/products/';
         $image = str_replace(' ', '_', $value->d_ProductSKU).'_thumbnail.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $value->d_ProductSKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $value->d_ProductSKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $value->d_ProductSKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
              ?>
                        
                        <div class="order-summery border-0 mb-3">
                          <div class="order-list p-0">
                              <div class="thumbnail">
                                  <a href="<?php echo base_url('product/'.$value->p_slug)?>"><img src="<?php echo $image_path;?>" class="full" alt=""></a>
                              </div>
                              <div class="order-details">
                                  <p class="title"><?php echo $value->d_ProductName; ?></p>
                                  <p class="sku"><strong>SKU:</strong> <?php echo $value->d_ProductSKU; ?></p>
                                  <div class="mt-2 mt-md-3 mb-0">
                                    <!-- <li class="d-block d-md-inline">
                                      <a href="<?php echo base_url();?>myaccount/return" class="btn btn-sm btn-default default-gray m-0">Return / Replace</a>
                                    </li> -->
                                    <li class="d-block d-md-inline mt-1 mt-md-0">
                                      <!-- <a href="./my-order-details.html" class="btn btn-sm btn-brand m-0">Product Details</span></a> -->
                                    </li>
                                  </div>
                              </div>
                              <div class="order-price text-right">
                                
                                  <p>₹<?php echo sprintf('%0.2f',$value->d_ProductPrice);?><br>

                                <small>(Included 3% GST)</small>
                                  </p>

                                  <!-- <del>₹<?php// echo sprintf('%0.2f',$value->d_MRP_Price);?></del> -->
                              </div>
                          </div>
                        </div>
                      <?php } ?>

                        <div class=" border-top pb-2">
                          <div class="row">
                            <div class="col-md-4">
                              <h6 class="mb-1 text-dark">Payment</h6>
                              <?php $json =  json_decode($item->p_JsonData);
                              $json1 = json_decode($json->content);
                              // echo '<pre>'; print_r($json1->method); exit();
                               ?>
                              <p class="mb-0 text-dark">Payment through: <?php echo ucwords($json1->method) ?></p>
                              <?php if ($item->p_PaymentStatus == 'authorized') { ?>
                              <p class="mb-0 text-dark">Payment Status: <?php echo 'Confirmed'?></p>
                            <?php }else{ ?>
                              <p class="mb-0 text-dark">Payment Status: <?php echo 'Failed'?></p>
                            <?php } ?>

                              <p class="mb-0 text-dark">Transaction ID: <?php echo $item->p_TransactionID?></p>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs">
                              <?php if ($item->o_shipped_traking_no) { ?>
                                 <h6 class="mb-1 text-dark">Shipping</h6>
                              <p class="mb-0 text-dark">Product Shipped via</p>
                              <p class="mb-0 text-dark"><?php echo $item->dp_name?></p>

                              <p class="mb-0 text-dark">AWB#: <?php echo $item->o_shipped_traking_no;?></p>
                              <p class="mb-0 text-dark">Status: <?php 

                             $shppigsts=$this->myaccount->order_track($item->o_shipped_traking_no);
                             if($shppigsts==false)
                             {
                              echo $shppigsts;
                             }
                             else{
                              echo "AWB Number is wrong.";
                             }

                             ?></p>
                             <?php }else{ ?>
<br>
                              <p class="mb-0 text-dark">Status: <?php echo ucwords($item->Order_status);?></p>

                            <?php  } ?>
                             
                            </div>
                            <div class="col-md-4">
                              <!-- <div class="half-sec"> -->
                          <div class="tracker-body text-right py-2">
                            <p class="mb-2"><b>Shipping charges: <strong>₹ <?php echo sprintf('%0.2f',$item->o_Shipping_Charges_Amount);?></strong></b></p>
                            <!-- <p class="mb-2"><b>Handling charges: <strong>₹ <?php echo sprintf('%0.2f',$item->o_Handling_Charges_Amount);?></strong></b></p> -->
                            <p class="mb-2"><b>Grand Total: </b><strong>₹ <?php echo sprintf('%0.2f',$item->p_amount);?></strong></p>
                            <a href="<?php echo base_url('myaccount/orders_details/'.$item->order_id);?>" class="btn btn-brand btn-sm mb-0">Get order details</a>
                          </div>
                        <!-- </div> -->
                              
                            </div>
                          </div>
                          
                    </div>
                    <!-- <div class="card-footer">
                      ul class="m-0 pl-3">
                        <li>Lorem ipsum dolor sit amet consectetur</li>
                      </ul>
                    </div> -->
                </div>

            </div>
           <?php } ?>


        </div>
      </div>
    </div>
  </section>
</main>