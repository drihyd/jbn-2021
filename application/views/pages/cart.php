<!-- PAGE BODY : BEGIN -->
<main class="main-content">

    
<section class="info">
    <div class="container">
	
	
	    <?php
                        if (is_array($products)) {


                        
                        ?>     
        <div class="row">
            <div class="col-lg-8">
                <div class="row m-0 cart-total justify-content-between">
                    <span class="intro-text text-dark">Total (<?php echo $sub_total_data['total_items'];?> Items) : ₹<?php echo $sub_total_data['ac_price'];?></span>
                    <!-- <span class="save-cart"><a href="" class="text-brand">Save Cart</a></span> -->
                </div>
                <div class="cart-container">
                    <!-- cart-card : BEGIN -->
                                 
<?php 
$cart_sno=1;
$discounted_amount =0;
foreach ($products as $key => $value) { 


$discounted_amount += $value->discounted_amount;

$single_product_data=$this->core->select('products', array("ProductID"=>$value->ProductID), "","");
$stock=$single_product_data[0]->Stock;


 ?>
                    <div class="cart-card">
                        <div class="cart-wrap-left">
                            <div class="cart-thumb">
                                
                                <a  href="<?php echo base_url().'product/'.$value->slug;?>">
								
								<?php
								
							$path = 'uploads/products/';
         $image = str_replace(' ', '_', $value->SKU).'_thumbnail.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $value->SKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $value->SKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $value->SKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
              ?>
     
								
								<img src="<?php echo $image_path;?>" alt=""></a>



                            </div>
                            <div class="cart-info">
                                <div class="cart-details">
                                    <p class="item-name"><a href="<?php echo base_url().'product/'.$value->slug;?>"><?php echo ucwords($value->ProductName);?></a></p>
                                    <p class="item-sku"><?php echo ucwords($value->ProductSKU);?></p>
                                    <p class="item-qty text-bold">Quantity: 

                                        <?php if($value->order_method!="customized") { ?>
                                          <span class="form-group">
                                        <select name="cart_item_quantity" class="form-controle custome-select" id="cart_item_quantity" onchange="updateItemQty(this.value,<?php echo $value->Order_DetailsID;?>)">
                                        <?php for ($loop=1;$loop<=$stock;$loop++) { ?>
                                         <option value="<?php echo $loop;?>" <?php if($value->Quantity==$loop) { ?> selected <?php } ?>><?php echo $loop;?></option>
                                        <?php } ?>
                                      </select>
                                      </span>
                                      <?php } else { 
                                        echo $value->Quantity;
                                      } ?>


                                    
                                  </p>
                                 <!--    <p class="item-inventory">Last <?php echo $stock;?></p> -->

                                </div>
                                <?php if($value->order_method=="customized") { ?>

                                <p><a href="#" data-toggle="modal" data-target="#customized_order_myModal_<?php echo $cart_sno;?>"><i class="fas fa-star"></i> <?php echo ucwords($value->order_method);?></p></a>
                              <?php } ?>
                                <div class="cart-price-datils">
                                   <!--  <p class="item-edd">Expected Delivery - 28th to 29th Aug</p> -->
                                    
                                    <?php if($value->order_method!="customized") { ?>
                                    <p class="item-price">₹ <?php echo $this->purchase_cart->number_format($value->Amount);?> 
                                    <!-- <span class="strike">₹<?php echo $this->purchase_cart->number_format($value->MRP_Amount);?></span> <span class="save">Save ₹<?php echo $this->purchase_cart->number_format($value->MRP_Amount*1-$value->Amount*1);?></span> -->

                                  </p>
                                    <?php } else { ?>

                                      <p class="item-price">Product Price: ₹<?php echo $this->purchase_cart->number_format($value->ProductPrice);?></p>
                                      <p class="item-price">Advance payment: ₹<?php echo $this->purchase_cart->number_format($value->Amount);?></p>
                                      <p class="item-price">Remaining payment: ₹<?php echo $this->purchase_cart->number_format($value->ProductPrice-$value->Amount);?></p>

                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="cart-wrap-right">
                            <div class="cart-btns">
                                <a onclick="return confirm('Are you sure you want to remove?')" href="<?php echo base_url();?>cart/remove/<?php echo $value->Order_DetailsID;?>/<?php echo $value->ProductID;?>/<?php echo $value->OrderID;?>"><button class="btn btn-default default-accent btn-block">Remove</button></a>

<!--                                     <a href="<?php echo base_url();?>cart/save_wishlist/<?php echo $value->ProductID;?>">
                                    <button data-data="<?php echo $value->ProductID;?>" class="btn btn-default default-brand btn-block addtowishlist" id="">Move to Wish list</button>
                                    </a> -->

                                    <a href="<?php echo base_url();?>cart/save_wishlist/<?php echo $value->ProductID;?>/<?php echo $value->Order_DetailsID;?>/<?php echo $value->OrderID;?>">
                                    <button  class="btn btn-default default-brand btn-block " id="">Move to Wish list</button>
                                    </a>

                            </div>
                        </div>
                    </div>
                    <!-- cart-card : END -->


<?php if($value->order_method=="customized") { ?>
<!-- The Modal -->
<div class="modal" id="customized_order_myModal_<?php echo $cart_sno;?>">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Customized Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
    
     <table class="table table-bordered table-sm">

    <tbody>    
<?php
$split_data=json_decode($value->customized_product_data,true);


foreach ($split_data as $key => $value) {
    echo "<tr>";
    echo  "<th>".ucwords(str_replace("_", " ", $key))."</th>";
    echo  "<th>".ucwords(trim($value))."</th>";
    echo "</tr>";
}

?>

 
    </tbody>
  </table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<?php } ?>


                <?php 

$cart_sno++;
              }  ?>


                  

                   

                </div>
            </div>





<div class="col-lg-4">

  <?php if($products[0]->product_type!="gift_cards") { ?>
<div class="cart-checkout">
<!-- <button class="apply-cupon btn btn-default btn-block btn-lg mt-0">Apply Coupon <span>1 Available Coupon</span></button> -->
<span class="intro-text text-dark d-inline-block mb-2">Order Summary</span>
<div class="card rounded-0">
<div class="card-body py-3">
<p class="d-flex flex-row justify-content-between"><span>Subtotal</span> <span class="price">₹
<?php echo $this->purchase_cart->number_format($sub_total_data['mrp']);?>

</span></p>
<p><small>(Included 3% GST)</small></p>

<!-- <p class="d-flex flex-row justify-content-between"><span>You Saved</span> <span class="price text-brand">- ₹<?php echo $this->purchase_cart->number_format($sub_total_data['save_price']);?></span></p> -->

<?php if($this->purchase_cart->number_format($sub_total_data['mrp']-$sub_total_data['ac_price'])>0){ ?>
<p class="d-flex flex-row justify-content-between"><span>Remaining Amount</span> <span class="price text-brand"> ₹<?php echo $this->purchase_cart->number_format($sub_total_data['mrp']-$sub_total_data['ac_price']);?></span></p>
<?php } ?>
<p class="d-flex flex-row justify-content-between"><span>Coupon Discount</span> <span class="price text-brand">
<?php if($discounted_amount > 0): ?>
<span><?php echo $this->purchase_cart->number_format($discounted_amount) ?></span>
<form action="" method='post' class="remove_coupon_form">
<input type="hidden" name="coupon_id" value="<?php echo $products[0]->CouponID ?>">
<input class="" type="submit" name="" value="Remove Coupon" data-toggle="tooltip" data-placement="right" data-html="true" title="Applied Coupon: <?php echo $products[0]->CouponCode  ?>">
</form>
<?php else: ?>
<a href="" class="text-voilet" data-toggle="modal" data-target="#applyCuponModal">Apply Coupon</a>
<?php endif ?>

</span></p>
<p class="d-flex flex-row justify-content-between"><span>Delivery Charge (Standard)</span> <span class="price text-brand"><?php echo $this->purchase_cart->number_format(0);?></span></p>

<p class="d-flex flex-row justify-content-between"><span>Shipping Charges</span> 
<span class="price text-brand">
<?php echo $this->purchase_cart->number_format($sub_total_data['shipping_charges']);?>
</span>
</p>

<!-- <p class="d-flex flex-row justify-content-between"><span>Included Handling Charges</span> 
<span class="price text-brand">
<?php echo $this->purchase_cart->number_format($sub_total_data['handling_charges']);?>
</span>
</p> -->

<p class="d-flex flex-row justify-content-between font-weight-bold mb-0"><span class=" text-uppercase">Total Cost</span> <span class="price">₹
<?php echo $this->purchase_cart->number_format($sub_total_data['ac_price']+$sub_total_data['shipping_charges']);?>

</span></p>
</div>
</div>

<a href="<?php echo base_url();?>cart/checkout">
<button class="btn btn-brand btn-lg btn-block mt-4">Checkout Securely</button>
</a>
</div>
<?php } else { ?>
<div class="row">
<div class="col-lg-12 text-center">
<div class="cart-checkout" >
<a href="<?php echo base_url();?>cart/checkout">
<button class="btn btn-brand btn-lg btn-block mt-4">Checkout Securely</button>
</a>
</div>
</div>
</div>
<?php } ?>

</div>





        </div>
		
		<?php } else { ?>
		
		
		 <div class="row">
            <div class="col-lg-12 text-center">
		<div class="css-rgxxes"><p><span class="er6wa4k0 css-34gj24 efp5dbi0"></span></p><p class="title">Empty Bag!</p>
		<!--<p class="sub-title">Let's do some retail therapy!</p>-->
		
		<a href="<?php echo base_url();?>"><button content="Start Shopping" class="btn btn-brand m-0 mt-1">Start Shopping</button></a>
		
		</div>
		</div>
		</div>
		<?php } ?>
		
		
    </div>
</section>
</main>


<!-- MODEL POPUP : BEGIN -->

<div class="modal fade" id="applyCuponModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center">Coupons</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body coupon-container">

        <!-- COUPON CARD -->
        <?php if (!empty($coupons)): ?>
          <?php foreach ($coupons as $key => $coupon): ?> 

          <div class="card coupon-card">
          <div class="card-body row p-0 m-0">
            <div class="col p-1 bg-light" style="display: flex;align-items: center;">
              <div class="coupon-badge text-center m-auto">
                <h4 class="badge-title"><?php echo strtoupper($coupon->CouponCode) ?></h4>
                  <!-- <h4 class="badge-title"><?php echo $coupon->Discount_value; if($coupon->DiscountType == 'percent') echo "% OFF"; if($coupon->DiscountType == 'fixed') echo " Rs. <br>Flat OFF";
                  ?></h4> -->
              </div>
            </div>
            <div class="col-6 align-self-center">
              <div class="coupoun-disc">
                <h5 class="mb-1 p-0"><?php echo $coupon->Coupon_title ?></h5>
                <!-- <h5 class="mb-1 p-0">CODE: <?php echo strtoupper($coupon->CouponCode) ?></h5> -->
                <p class="p-0 m-0"><?php echo $coupon->Description ?></p>
              </div>
            </div>
            <div class="col p-0 align-self-center">

              <div class="coupoun-apply">
                <form action="" method='post' class="coupon_form">
                  <input type="hidden" name="coupon_id" value="<?php echo $coupon->CouponID ?>">
                  <input class="btn btn-default " type="submit" name="Apply" value="Apply" >
                </form>
              </div>
            </div>
          </div>
        </div>

        <?php endforeach ?>
         <?php endif ?>
      </div>
    </div>
  </div>
</div>
<!-- MODEL  -->


