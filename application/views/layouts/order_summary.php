 <h4 class="text-dark">Order Summary</h4>
                <div class="order-summery">

                        <?php
                        if (is_array($products)) {
                        foreach ($products as $key => $value) { 
						
						
						
						
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

                    <div class="order-list">
                        <div class="thumbnail">
                            <img src="<?php echo $image_path;?>" width="100%" alt="">
                        </div>
                        <div class="order-details align-self-center">
                            <p class="title"><a href="<?php echo base_url().'product/'.$value->slug;?>"><?php echo ucwords($value->ProductName);?></a></p>
                            <p class="sku">SKU: <?php echo ucwords($value->ProductSKU);?></p>
                        </div>
                        <div class="order-price align-self-end text-right">
                            <p>₹<?php echo $this->purchase_cart->number_format($value->ProductPrice);?>
           <!--                  <br><del>₹<?php echo $this->purchase_cart->number_format($sub_total_data['mrp']);?></del> -->

                          </p>
                          <p><small>(Included 3% GST)</small></p>
                            
                        </div>
                    </div>

                  <?php } 
						}
				  ?>
                    <div class="order-list p-0 justify-content-center">
                      <div class="order-details p-0 m-0">
                          <!-- <p class="title">Sphere Dome Jhumkas</p>
                          <p class="sku">SKU: JE04237-YGP900</p>
                          <p class="delivery">Expected Delivery -14th to 15th Sep</p> -->
                          <table class="table m-0 table-borderless bg-ligt-lighter">

                        
                            <tr>
                            <td>Coupon Discount</td>
                              <td align="right">₹<?php echo $this->purchase_cart->number_format($sub_total_data['coupon_discount']);?></td>
                            </tr>

                            <tr>
                              <td>SUBTOTAL</td>
                              <td align="right">₹<?php echo $this->purchase_cart->number_format($sub_total_data['ac_price']);?></td>
                            </tr> 

                            <tr>
                              <td>Shipping Charges</td>
                              <td align="right">
₹<?php echo $this->purchase_cart->number_format($sub_total_data['shipping_charges']);?>
  </td>
                            </tr>

<!--                                                         <tr>
                              <td>Included Handling Charges</td>
                              <td align="right">
₹<?php echo $this->purchase_cart->number_format($sub_total_data['handling_charges']);?>
  </td>
                            </tr> -->
                                                   </table>
                          <table class="table m-0 total-table bg-brand text-bright">
                            <tr>
                              <th>TOTAL COST</th>
                              <th class="text-right">₹<?php echo $this->purchase_cart->number_format($sub_total_data['ac_price']+$sub_total_data['shipping_charges']);?></th>
                            </tr>
                          </table>
                      </div>
                      <!-- <div class="order-price align-self-end text-right">
                          <p>₹61,761<br><del>₹65,352</del></p>
                      </div> -->
                  </div>
                </div>