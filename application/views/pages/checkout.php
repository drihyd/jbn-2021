<!-- PAGE BODY : BEGIN -->
<main class="main-content">
<section class="info">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
              <h4 class="text-dark">Checkout</h4>
              <div class="checkout" id="checkout">               
                  <div class="list-group rounded-0">

                    <?php if(empty($_SESSION['anaya_user_data'])) {  ?>

                    <div class="list-group-item p-0" data-acc-step>
                      <h5 class="checkout-title p-3" data-acc-title>Log In</h5>
                      <div data-acc-content>
                        <div class="list-group-content p-3">
                          <div class="form-container mt-3">

                         <?php echo $login_form;?>
                            
          

                          </div>
                        </div>

                      </div>
                    </div>

                  <?php 

$display_second_panel="";
                } else  { 





                    ?>




  <?php } 



  ?>

                    <div class="list-group-item p-0" data-acc-step <?php if($expand_form=="addagift") { ?> style="display:block" <?php  } ?> >
                      <h5 class="checkout-title p-3" data-acc-title>Add a Gift Message</h5>
                      <div data-acc-content <?php if($expand_form=="addagift") { ?> style="display:block" <?php  } ?> >
                        <div class="list-group-content p-3">
                          <div class="row justify-content-center">
                            <div class="col-lg-8 col-xl-8">
                              <form action="<?php echo base_url();?>cart/order_gift_messages" method="post">
                              <div class="form-group">
                                <label>Add a Special Message! (Optional)</label>
                                <textarea name="gift_special_message" id="" class="form-control" cols="30" rows="5"><?php echo $gift_special_message;?></textarea>
                              </div>



                      

                               
                                <div class="form-group">
                                <label>Gift Recipient’s Email (optional)</label>
                                <div class="row">
                                <div class="col"><input type="email" name="gift_email" class="form-control" value="<?php echo $gift_email;?>" /></div>
                                <div class="col">
                                <select id="my-select" class="form-control custom-select" name="gift_for">
                                <option value="">--Select Recipient--</option>
                                <option value="wife" <?php  if($gift_for=="wife") { ?> selected <?php } ?>>Wife</option>
                                <option value="girl_friend" <?php  if($gift_for=="girl_friend") { ?> selected <?php } ?>>Girl Friend</option>
                                <option value="sister" <?php  if($gift_for=="sister") { ?> selected <?php } ?>>Sister</option>
                                </select>
                                </div>
                                </div>
                                </div>

                                  <div class="form-group">
                                <label>Gift Message & Packaging</label>
                                <textarea name="gift_message_packaging" id="" class="form-control" cols="30" rows="4"><?php echo $gift_message_packaging;?></textarea>
                              </div>

                                <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1" name="get_for_updates" <?php  if($get_for_updates=="on") { ?> checked <?php } ?>>
                                <label class="custom-control-label" for="customCheck1">Select this option if you wish to send order updates to the gift Recipient</label>
                                </div>                         

                                <!-- <a href="#" class="btn btn-default" data-acc-btn-prev="">Back</a>     -->
                                <input type="submit" name="addrss" class="btn btn-brand float-right" value="Next">
                                <input type="hidden" name="page_type" value="delivery_pickup">
                                </form>
                
                
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="list-group-item p-0" data-acc-step <?php if($expand_form=="delivery_pickup_address") { ?> style="display:block" <?php  } ?>>
                      <h5 class="checkout-title p-3" data-acc-title>Delivery/Pickup Information</h5>
                      <div data-acc-content <?php if($expand_form=="delivery_pickup_address") { ?> style="display:block" <?php  } ?>>
                        <div class="list-group-content px-4 py-3">
                          <h6 class="mb-1">Delivery Mode</h6>

                          <form action="<?php echo base_url();?>cart/address_pick" method="post" class="needs-validation" novalidate>

<?php

$Delivery_Mode=isset($cart_master_data->Delivery_Mode)?$cart_master_data->Delivery_Mode:"";
?>

                          <div class="custom-control custom-radio custom-control-inline form-group">
                            <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input" checked value="delivery_at_address" <?php if($Delivery_Mode=="delivery_at_address") { ?> checked <?php } ?>>
                            <label class="custom-control-label" for="customRadioInline1">Deliver at the Shipping Address</label>
                          </div>
                          <div class="custom-control custom-radio custom-control-inline form-group">
                            <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input" value="pick_up_store" <?php if($Delivery_Mode=="pick_up_store") { ?> checked <?php } ?>>
                            <label class="custom-control-label" for="customRadioInline2">Pick up from  Store</label>
                          </div>

                          <h6 class="mb-2">Shipping Address</h6>
                          
              
              
             
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_Fullname" pattern="^[A-Za-z -]+$" class="form-control" placeholder="Fullname" value="<?php echo $ship_Fullname;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Fullname is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_street_house" class="form-control" placeholder="Street & House Number" value="<?php echo $ship_Address1;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Street & House Number is Required.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_address" class="form-control" placeholder="Address Info (Optional)" value="<?php echo $ship_Address2;?>">
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_pincode" pattern="[0-9]{6}" class="form-control" placeholder="Pincode" value="<?php echo $ship_Pincode;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Pincode is Required.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_city" pattern="^[A-Za-z -]+$" class="form-control" placeholder="City" value="<?php echo $ship_City;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> City is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_county" pattern="^[A-Za-z -]+$" class="form-control" placeholder="Country" value="<?php echo $ship_Country;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Country is Required.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" name="shp_state" pattern="^[A-Za-z -]+$" class="form-control" placeholder="State" value="<?php echo $ship_State;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> State is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" pattern="[6789][0-9]{9}" name="shp_mobile_numer" class="form-control" placeholder="Mobile Number" value="<?php echo $ship_Mobile;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Please Enter 10 digit Mobile Number.</span>
                            </div>
                          </div>

                          <h6 class="mb-2">Billing Address</h6>

                            <label>
        <input type="checkbox" name="homepostalcheck" id="homepostalcheck" <?php if($billing_same_as_shipping=="on") { ?> checked <?php } ?> />&nbsp;Same as above:
      </label>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" pattern="^[A-Za-z -]+$" name="bill_Fullname" class="form-control" placeholder="Fullname" value="<?php echo $bill_Fullname;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Fullname is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" name="bill_street_house" class="form-control" placeholder="Street & House Number" value="<?php echo $bill_Address1;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Street & House Number is Required.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text" name="bill_address" class="form-control" placeholder="Address Info (Optional)" value="<?php echo $bill_Address2;?>">
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text" pattern="[0-9]{6}" name="bill_pincode" class="form-control" placeholder="Pincode" value="<?php echo $bill_Pincode;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Please enter Valid Pincode.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text"  pattern="^[A-Za-z -]+$" name="bill_city" class="form-control" placeholder="City" value="<?php echo $bill_City;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> City is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text"  pattern="^[A-Za-z -]+$" name="bill_county" class="form-control" placeholder="Country" value="<?php echo $bill_Country;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Country is Required.</span>
                            </div>
                          </div>
                          <div class="form-row">
                            <div class="col-sm-5 form-group">
                              <input type="text"  pattern="^[A-Za-z -]+$" name="bill_state" class="form-control" placeholder="State" value="<?php echo $bill_State;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> State is Required.</span>
                            </div>
                            <div class="col-sm-5 form-group">
                              <input type="text"  pattern="[6789][0-9]{9}" name="bill_mobile_numer" class="form-control" placeholder="Mobile Number" value="<?php echo $bill_Mobile;?>" required>
                              <!-- <span class="valid-feedback">Looks good!</span> -->
                              <span class="invalid-feedback"> Please Enter 10 digit Mobile Number.</span>
                            </div>
                          </div>
                         
                         

                          <a href="<?php echo base_url();?>cart/checkout/?page=addagift" class="btn btn-default" data-acc-btn-prev="">Back</a>    
                                <input type="submit" name="addrss" class="btn btn-brand float-right" value="Next">
                                <input type="hidden" name="page_type" value="payment">


                          </form>


                        </div>

                      </div>
                    </div>

                    <div class="list-group-item p-0" data-acc-step <?php if($expand_form=="payment") { ?> style="display:block" <?php  } ?>>
                      <h5 class="checkout-title p-3" data-acc-title>Payment Method</h5>
                      <div data-acc-content <?php if($expand_form=="payment") { ?> style="display:block" <?php  } ?>>
                        <div class="list-group-content px-4 py-3 rounded-0">
                          <h6 class="mb-2">Payment Method</h6>
                          <div class="form-row mb-2">
                            <div class="col-sm-8">
                              <ul class="list-group form-group">
                                <li class="list-group-item">
                                  <div class="form-check">
                                  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="online" checked>
                                  <label class="form-check-label" for="exampleRadios1">
                                    Credit Card/Debit Card/Netbanking/UPI/Wallet
                                  </label>

                                </div>
                                </li>
                         

                         <!--                 <li class="list-group-item">
                                  <div class="form-check">
                                  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="cod" >
                                  <label class="form-check-label" for="exampleRadios1">
                                    COD
                                  </label></div>
                                </li> -->
  
  
                              </ul>



                                <a href="<?php echo base_url();?>cart/checkout/?page=delivery_pickup_address" class="btn btn-default" data-acc-btn-prev="">Back</a>         
<button  id="submit-pay" type="button" onclick="razorpaySubmit(this);" class="btn btn-brand float-right" >Pay Now</button>


                            </div>
                          </div>
                   
                        </div>

                      </div>
                    </div>


                  </div>

                



<div class="row">
    <div class="col-lg-12">
        <?php if(!empty($this->session->flashdata('msg'))){ ?>
            <div class="alert alert-success">
                <?php echo $this->session->flashdata('msg'); ?>
            </div>        
        <?php } ?>
        <?php if(validation_errors()) { ?>
          <div class="alert alert-danger">
            <?php echo validation_errors(); ?>
          </div>
        <?php } ?>
    </div>
</div>


 
    <div class="row">
        <div class="col-md-4">

<?php
$productinfo = "testing";
$txnid = time();
$surl = $surl;
$furl = $furl;        
$key_id = RAZOR_KEY_ID;
$currency_code = CURRENCY_CODE;            
$total = $order_total; 

/*
Allow only 60% amount to payable
$percent_amount=($order_total*40/100);
$order_total=($order_total*1-$percent_amount*1);

*/



$amount = $order_total*100;
$merchant_order_id = isset($cart_master_data->Order_Number)?$cart_master_data->Order_Number:"";


  if (isset($_SESSION['anaya_user_data'])) {
    $card_holder_name=$_SESSION['anaya_user_data']->UserFirstName." ".$_SESSION['anaya_user_data']->UserLastName;
    $email=$_SESSION['anaya_user_data']->UserEmail;
    $phone=$_SESSION['anaya_user_data']->UserPhone;
    }
    else{
     $card_holder_name="Guest";
     $email="guest@gmail.com";
     $phone="";
    }
$name = APPLICATION_NAME;
$return_url = site_url().'razorpay/callback';
?>
<div class="row">
    <div class="col-lg-12">
        <?php if(!empty($this->session->flashdata('msg'))){ ?>
            <div class="alert alert-success">
                <?php echo $this->session->flashdata('msg'); ?>
            </div>        
        <?php } ?>
        <?php if(validation_errors()) { ?>
          <div class="alert alert-danger">
            <?php echo validation_errors(); ?>
          </div>
        <?php } ?>
    </div>
</div>
 <form name="razorpay-form" id="razorpay-form" action="<?php echo $return_url; ?>" method="POST">
  <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id" />
  <input type="hidden" name="merchant_order_id" id="merchant_order_id" value="<?php echo $merchant_order_id; ?>"/>
  <input type="hidden" name="merchant_trans_id" id="merchant_trans_id" value="<?php echo $txnid; ?>"/>
  <input type="hidden" name="merchant_product_info_id" id="merchant_product_info_id" value="<?php echo $productinfo; ?>"/>
  <input type="hidden" name="merchant_surl_id" id="merchant_surl_id" value="<?php echo $surl; ?>"/>
  <input type="hidden" name="merchant_furl_id" id="merchant_furl_id" value="<?php echo $furl; ?>"/>
  <input type="hidden" name="card_holder_name_id" id="card_holder_name_id" value="<?php echo $card_holder_name; ?>"/>
  <input type="hidden" name="merchant_total" id="merchant_total" value="<?php echo $total; ?>"/>
  <input type="hidden" name="merchant_amount" id="merchant_amount" value="<?php echo $amount; ?>"/>

</form>

 
<!--     <div class="row">
        <div class="col-lg-12 text-right">

            <button  id="submit-pay" type="button" onclick="razorpaySubmit(this);" class="btn btn-brand btn-lg btn-block" >Pay Now</button>
        </div>
    </div> -->
 

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
  var razorpay_options = {
    key: "<?php echo $key_id; ?>",
    amount: "<?php echo $amount; ?>",
    name: "<?php echo $card_holder_name; ?>",
    description: "Purchase Order # <?php echo $merchant_order_id; ?>",
    netbanking: true,
    currency: "<?php echo $currency_code; ?>",
    prefill: {
      name:"<?php echo $card_holder_name; ?>",
      email: "<?php echo $email; ?>",
      contact: "<?php echo $phone; ?>", 
    },
    notes: {
      soolegal_order_id: "<?php echo $merchant_order_id; ?>",
      voucher_code: "<?php echo $products[0]->voucher_code; ?>",
      product_type: "<?php echo $products[0]->product_type; ?>",
    },
    handler: function (transaction) {
        document.getElementById('razorpay_payment_id').value = transaction.razorpay_payment_id;
        document.getElementById('razorpay-form').submit();
    },
    "modal": {
        "ondismiss": function(){
            location.reload()
        }
    }
  };
  var razorpay_submit_btn, razorpay_instance;
 
  function razorpaySubmit(el){

var radioValue = $("input[name='exampleRadios']:checked").val();

if(radioValue=="online"){

  if(typeof Razorpay == 'undefined'){
      setTimeout(razorpaySubmit, 200);
      if(!razorpay_submit_btn && el){
        razorpay_submit_btn = el;
        el.disabled = true;
        el.value = 'Please wait...';  
      }
    } else {
      if(!razorpay_instance){
        razorpay_instance = new Razorpay(razorpay_options);
        if(razorpay_submit_btn){
          razorpay_submit_btn.disabled = false;
          razorpay_submit_btn.value = "Pay Now";
        }
      }
      razorpay_instance.open();
    }

}
else{
  document.getElementById('razorpay-form').submit();
}


    
  }  
</script>


                  </div>
 </div>
               
              </div>
            </div>

            <div class="col-lg-5">

  <?php if($products[0]->product_type!="gift_cards") { ?>

  <?php echo $order_summary_data;?>

  <?php } ?>


        </div>
    </div>
</section>
</main>


    </script>

</body>



