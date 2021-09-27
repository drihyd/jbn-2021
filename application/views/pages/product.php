<main class="main-content">
    <section class="info">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="breadcrumb bg-bright pl-0">
                        <a class="breadcrumb-item" href="<?php echo base_url() ?>">Home</a>
                        <a class="breadcrumb-item" href="<?php echo base_url("products/category/$product->product_type-".strtolower($product->Gender)."-$product->CategorySlug") ?>"><?php echo ucwords($product->CategoryName); ?></a>
                        <span class="breadcrumb-item active"><?php echo ucwords($product->Name); ?></span>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
      
                      <?php 
                      




$product_image = $imagesku=str_replace(' ', '_', $product->SKU);
$images = glob(APPPATH . '../uploads/products/'.$product_image.'??.jpg',GLOB_BRACE );


	?>
                        


<?php 


if($product->product_video_url=="no") { 
$vimeo = $product->product_video_url;
$vimeo=(int) substr(parse_url($vimeo, PHP_URL_PATH), 1);

?>
<!--
<div class="showcase-item">
<div class="showcase-wrap img-zoom" style="line-height: 0px;">
<iframe  width="100%" height="400" src="https://www.youtube.com/embed/<?php echo $YT_ID;?>?ecver=2&enablejsapi=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>
</div>
-->
<?php } else { ?>

<?php
if($images)	 {
	
$YT_ID=$this->purchase_cart->get_youtube_video_id($product->product_video_url);

	$j=1;
foreach ($images as $image) {


if($j==1){
?>
<div class="show1" href="<?php echo  base_url();?>/uploads/products/<?php echo $imagesku;?>_<?php echo $j;?>.jpg">
<img src="<?php echo  base_url();?>/uploads/products/<?php echo $imagesku;?>_<?php echo $j;?>.jpg" id="show-img">
</div>
<?php

$j++;
}
}			  
}
else {
?>
<div class="show1" href="<?php echo  base_url();?>/uploads/products/Not_Available.jpg">
<img src="<?php echo  base_url();?>/uploads/products/Not_Available.jpg" id="show-img">
</div>

<?php 


} ?>

<div class="small-img" >
<img src="<?php echo  base_url();?>/assets/img/online_icon_right@2x.png" class="icon-left" alt="" id="prev-img">
<div class="small-container">
<div id="small-img-roll">
<?php
if($images)	 {	
	$k=1;
foreach ($images as $image) {
	
?>	
<img style="border: 1px solid;" src="<?php echo  base_url();?>/uploads/products/<?php echo $imagesku;?>_<?php echo $k;?>.jpg" class="show-small-img img-border" alt="">
<?php
	$k++;		
}		  
		  
}
?>
<?php if(!empty($YT_ID)) { ?>
<a href="#" data-toggle="modal" data-target=".bd-example-modal-lg">
<img  style="border: 1px solid;" src="https://i1.ytimg.com/vi/<?php echo $YT_ID;?>/default.jpg" class="show-small-img img-border" alt=""/>
</a>
<?php } ?>
</div>
</div>
<img src="<?php echo  base_url();?>/assets/img/online_icon_right@2x.png" class="icon-right" alt="" id="next-img">
</div>
<?php } ?>

                       
              
                </div>
				
				
                <div class="col-12 col-sm-12 col-md-5  offset-md-1 col-lg-5  offset-lg-1 col-xl-5  offset-xl-1">
                  <div class="showcase-info mt-md-0 mt-lg-0 mt-xl-0">
                    <div class="product-info">
                    
                                                <!-- <span class="product-badge badge-bestceller">Bestseller</span> -->
                        <h2 class="product-name"><?php echo ucwords($product->Name) ?></h2>

                         <div class="row justify-content-between p-2">
                     
                        <div class="col col-auto">
                          <a href="<?php echo base_url();?>cart/save_wishlist/<?php echo $product->ProductID;?>">
                            <button type="button" class="btn btn-auto btn-default default-gray btn-block mt-0" data-toggle="tooltip" title="Add to Wishlist"><i class="fas fa-heart"></i></button>
                          </a>
                        </div>
                      </div>

                    <!--       <div class="row justify-content-between">
                        <div class="col col-auto align-self-top">
                          <small class="m-0"><?php echo $product->CategoryName  ?></small>
                        </div>
                        <div class="col col-auto">
                          <a href="<?php echo base_url();?>cart/save_wishlist/<?php echo $product->ProductID;?>">
                            <button type="button" class="btn btn-auto btn-default default-gray btn-block mt-0" data-toggle="tooltip" title="Add to Wishlist"><i class="fas fa-heart"></i></button>
                          </a>
                        </div>
                      </div> -->
                       <!--  <p class="product-rating mt-2 mb-3">
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                        </p> -->
                    </div>
                    <form method="POST" action="<?php echo base_url();?>cart/add">
                      <div class="product-price-info">
                          <div class="form-wrap">
                           <!-- <div class="row justify-content-between">
                              <div class="col-12 col-sm col-md col-1g col-xl">
                                <div class="form-group">
                                  <label for="my-select">Size:</label>
                                   <select id="my-select" name="product_size" class="form-control custom-select" name="">
                                    <?php //foreach ($product->sizes as $key => $size): ?>
                                      <option value="<?php //echo $size->OptionSize ?>"><?php //echo $size->OptionSize ?></option>
                                    <?php //endforeach ?>
                                  </select>                                      
                                      <?php //echo $product->sizes[0]->OptionSize ?>
                                </div>
                              </div>
                              <?php //if (!empty($product->metals_options)): ?>
                              <div class="col-12 col-sm col-md col-1g col-xl">
                                <div class="form-group">
                                  <label for="my-select">Metal:</label>
                                   <select id="my-select" name="product_metal" class="form-control custom-select" name="">
                                    <?php //foreach ($product->metals_options as $key => $metal): ?>
                                      <option value="<?php //echo $metal->Combination_Option_Name ?>"><?php //echo $metal->Combination_Option_Name ?></option>
                                    <?php //endforeach ?>
                                  </select> 
                                 
                                  <?php //echo $product->metals_options[0]->Combination_Option_Name ?>
                                </div>
                              </div>
                               <?php //endif ?>
                            </div>
                           <div class="row justify-content-between">
                              <div class="col-12 col-sm col-md col-1g col-xl">
                                <div class="form-group">
                                   <label for="my-select">Diamond:</label>
                                  <select id="my-select" name="product_diamond" class="form-control custom-select" name="">
                                    <?php //foreach ($product->diamonds as $key => $diamond): ?>
                                      <option data-price="<?php //echo $diamond->OptionPriceincrement ?>" value="<?php //echo $diamond->OptionID.'-'.$diamond->Combination_OptionID ?>"><?php //echo $diamond->Combination_Option_Name.'-'.$diamond->OptionName ?></option>
                                    <?php //endforeach ?>
                                  </select> 
                                 
                                  <?php //echo $product->diamonds[0]->Combination_Option_Name.'-'.$product->diamonds[0]->OptionName ?>
                                </div>
                              </div>-->

                  <!-- Added without html dev -->
                  <div class="row mt-4">
                    <div class="col-12 col-sm col-md-12">

                   
                  <table class="text-dark table table-sm ">
                  <tbody>
                    <?php if (!empty($product->sizes) && $product->sizes[0]->OptionSize != 0): ?>
                      <input type="hidden" name="product_size" value="<?php echo $product->sizes[0]->OptionSize ?>">
                       
					   <!--
					   <tr>
                        <td><b>Metal type: </b></td>
                        <td><?php echo $product->sizes[0]->OptionSize ?></td>
                      </tr>
                      -->
                      <tr>
                        <td><b>Size: </b></td>
                        <td><?php echo $product->sizes[0]->OptionSize ?></td>
                      </tr>
                    <?php endif ?>                    
                    <?php if (!empty($product->metals_options)): ?>
                      <input type="hidden" name="product_metal" value="<?php echo $product->metals_options[0]->Combination_Option_Name ?>">
                    <tr>
                      <td><b>Purity: </b></td>
                      <td><?php echo $product->metals_options[0]->Combination_Option_Name ?></td>
                    </tr>
                  <?php endif ?>                    
                    <?php if (!empty($product->diamonds)): ?>
                      <input type="hidden" name="product_diamond" value="<?php echo $product->diamonds[0]->OptionID.'-'.$product->diamonds[0]->Combination_OptionID ?>">
                    <tr>
                      <td><b>Diamond: </b></td>
                      <td><?php echo $product->diamonds[0]->Combination_Option_Name.'-'.$product->diamonds[0]->OptionName ?></td>
                    </tr>
                  <?php endif ?>                   
                    
                      <tr>
                      <td><b>Net Weight: </b></td>
                      <td><?php echo $product->Net_weight ?> grams</td>
                    </tr> 

					<tr>
                      <td><b>Gross Weight: </b></td>
                      <td><?php echo $product->Gross_weight ?> grams</td>
                    </tr>
                    <tr>
                      <td><b>Width: </b></td>
                      <td><?php echo $product->Width ?> mm</td>
                    </tr>
                    <tr>
                      <td><b>Height: </b></td>
                      <td><?php echo $product->Height ?> mm</td>
                    </tr>
                    <tr>
                      <td><b>Length: </b></td>
                      <td><?php echo $product->Length ?> mm</td>
                    </tr>   
                    
                    <tr>
                      <td><b>Numbers of Pieces: </b></td>
                      <td><?php echo $product->No_of_pieces; ?></td>
                    </tr>  
                        <tr>
                      <td><b>Provision for opening: </b></td>
                      <td><?php echo $product->Provision_for_opening; ?></td>
                    </tr> 
                     <tr>
                      <td><b>Polish Details: </b></td>
                      <td><?php echo $product->Polish_Details; ?></td>
                    </tr> 
                    <tr>
                      <td><b>Certificate number: </b></td>
                      <td><?php echo $product->certificate_number; ?></td>
                    </tr>    
                     <?php if($product->screw_type) { ?>
                    <tr>
                      <td><b>Screw Type: </b></td>
                      <td><?php echo $product->screw_type; ?></td>
                    </tr>    
                     <?php } ?>
                    <?php if($product->mould_availability) { ?>
                    <tr>
                      <td><b>Mould Availability: </b></td>
                      <td><?php echo $product->mould_availability; ?></td>
                    </tr> 
                    
                    <?php } ?>
                    
                     <?php if($product->cad_availability) { ?>
                      <tr>
                      <td><b>CAD Availability: </b></td>
                      <td><?php echo $product->cad_availability; ?></td>
                    </tr> 
                     <?php } ?>
                   <!--  <tr>
                      <td><b>Check Availability : </b></td>
                      <td>
                        <div class="form-group">
                          <div class="input-group m-0">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                            <form action="" id="picode">
                            <input type="text" name="product_chk_deli_date" class="form-control" placeholder="Pincode">
                            <input class="input-group" type="submit" value="Check">
                            </form>
                          </div>
                        </div>
                      </td>
                    </tr>       -->           
                  </tbody>
                </table>
              </div>
            </div>                        
            </div>
                          <div class="product-updated-price mt-2">                            
                            <div class="product-price">
                              <span class="reg-price">₹ <?php  echo $this->purchase_cart->number_format($product->Price )?>/- </h1></span>
                              <?php if (!empty($product->MRP_Price) && $product->Price < $product->MRP_Price): ?>
                              <span class="strike-price"><del>₹ <?php  echo sprintf('%0.2f',  $product->MRP_Price ) ?>/-</del></span>
                              <?php endif ?>
                            </div>
                          </div>
                      </div>
                      <div class="product-cart mt-2">
                          <div class="row form-row">

      <?php  if ($product->Stock>0): ?>
      <div class="col col-auto">
      <button type="submit" class="btn btn-brand btn-wide btn-block">Add to Cart</button>
      </div>

      <?php endif; ?>
                                
                                <?php 
                                //if ($enable_customization == TRUE): 
                                ?>
                                <?php 
                                if ($product->product_type!="gift_cards"):
                                 ?>
                                
								<!--
                            <div class="col col-auto">
                              <a href="<?php echo base_url();?>product/customized_order/<?php echo $product->slug;?>" class="btn btn-brand btn-wide btn-block">
                                Make on Order</a>
                            </div>
							-->

                          <?php 
                          endif; 
                          ?>
                          
                            
                            <input type="hidden" name="product_slug" value="<?php echo $product->slug;?>">
                            <input type="hidden" name="product_pk_ID" value="<?php echo $product->ProductID;?>">
                            <input type="hidden" name="MRP_Amount" value="<?php echo $product->MRP_Price;?>">
                            <input type="hidden" name="Quantity" value="1">
                            <input type="hidden" name="order_method" value="direct">

                              <?php if ($product->product_type=="gift_cards"): ?>
                              <input type="hidden" name="voucher_code" value="<?php echo strtoupper(uniqid())?>">
                              <?php else: ?>
                              <?php endif; ?>

                              <input type="hidden" name="product_type" value="<?php echo $product->product_type;?>">
                              <input type="hidden" name="sub_product_type" value="<?php echo $product->sub_product_type;?>">
                          </div>
        </form>
                      <div class="row ">
                      
                       <form action="" id="pincode_form"  method='post' class="pincode_form">
                        <div class="col col-auto">
                          <b>Check Availability : </b>
                        </div>
                        <div class="form-group col col-auto">
                          <div class="input-group m-0">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                           
                            <input type="text" name="pincode" class="form-control" placeholder="Pincode">
                            <div class="input-group-append">
                            <input class="input-group-text" type="submit" name='submit' value="Check">
                            </div>
                          </div>
                        </div>
                        <div class="errorTxt"></div>
                        </form>
                     

                           <!--  <div class="col-2 pl-0">

                                <a href="<?php //echo base_url();?>cart/save_wishlist/<?php //echo $product->ProductID;?>">
                                <button type="button" class="btn btn-auto btn-default default-gray btn-block" data-toggle="tooltip" title="Add to Wishlist"><i class="fas fa-heart"></i></button>
                                </a>


                            </div> -->


                          </div>
                      </div>


                      <div class="row justify-content-between mt-3">
                          <div class="col-6">
                            <a href="#" class="cta" data-toggle="modal" data-target="#sizeGuideModal">Size Guide</a>
                          </div>
                          <div class="col-6 text-right">
                            <a href="" class="cta"  data-toggle="modal" data-target="#diamondGuideModal">Diamond Guide</a>
                          </div>
                      </div>
                  </div>
                </div>
              </div>

            </div>
        </div>
    </section>

    <section class="info info-dark bg-light">

      <div class="container">
        <h2 class="">Product Information</h2>
        <div class="row mt-3 product-information">
          <div class="col-12 col-lg-10 col-xl-10">
            <div class="list-group list-group-horizontal" id="h-pills-tab" role="tablist" aria-orientation="horizontal">

              <a class="list-group-item list-group-item-action active" id="h-pills-Product-tab" data-toggle="pill" href="#h-pills-Product" role="tab" aria-controls="h-pills-Product" aria-selected="true">Material Details</a>
              <?php if (!empty($product->diamonds)): ?>
              <a class="list-group-item list-group-item-action" id="h-pills-Diamond-tab" data-toggle="pill" href="#h-pills-Diamond" role="tab" aria-controls="h-pills-Diamond" aria-selected="true">Diamond Details</a>                
              <?php endif ?>

              <a class="list-group-item list-group-item-action" id="h-pills-Metal-tab" data-toggle="pill" href="#h-pills-Metal" role="tab" aria-controls="h-pills-Metal" aria-selected="true">Metal Details</a>

              <a class="list-group-item list-group-item-action" id="h-pills-Price-tab" data-toggle="pill" href="#h-pills-Price" role="tab" aria-controls="h-pills-Price" aria-selected="true">Price breakup</a>

             <!-- <a class="list-group-item list-group-item-action" id="h-pills-Tags-tab" data-toggle="pill" href="#h-pills-Tags" role="tab" aria-controls="h-pills-Tags" aria-selected="true">Tags</a>-->

            </div>
            </div>
            
             <div class="col-6">

            <div class="tab-content p-3" id="h-pills-tabContent">

              <!-- tab-pane -->
              <div class="tab-pane fade show active" id="h-pills-Product" role="tabpanel" aria-labelledby="h-pills-Product-tab">
                <table  class="table  product_info_table">
                  <tbody>
                    <tr>
                      <td>SKU</td>
                      <td align="right"><?php echo $product->SKU ?></td>
                    </tr>
                   <!--  <tr>
                      <tr>
                      <td><b>Weight: </b></td>
                      <td><?php //echo $product->Net_weight ?></td>
                    </tr>
                    <tr>
                      <td><b>Width: </b></td>
                      <td><?php //echo $product->Width ?> mm</td>
                    </tr>
                    <tr>
                      <td><b>Height: </b></td>
                      <td><?php //echo $product->Height ?> mm</td>
                    </tr>
                    <tr>
                      <td><b>Length: </b></td>
                      <td><?php //echo $product->Length ?> mm</td>
                    </tr> -->
                    <tr>
                      <td>Category</td>
                      <td align="right"><?php echo ucwords($product->CategoryName); ?></td>
                    </tr>
                    <tr>
                      <td>Description</td>
                      <td align="right"><?php echo ucwords($product->ShortDesc) ?></td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- tab-pane -->
              <div class="tab-pane fade" id="h-pills-Diamond" role="tabpanel" aria-labelledby="h-pills-Diamond-tab">
                <?php if (!empty($product->diamonds)): 
                 ?>
                   
                  <table class="table  product_info_table" width="50%">
                    <tbody>
                      <tr>
                      <th>Color</th>
                      <th>Clarity</th>
					  <th>Weight</th>
                      <th>Unit Price</th>
                      </tr>
                      <?php foreach ($product->diamonds as $key => $diamond): ?>
                      <tr>
                        <td><?php echo $diamond->Combination_Option_Name ?></td>
                        <td><?php echo $diamond->OptionName ?></td>
                        <td><?php echo $diamond->OptionWeight ?></td>
                        <td><?php echo $diamond->OptionPriceincrement ?></td>
                      </tr>
                       <?php endforeach ?> 
                    </tbody>
                  </table>
                                
                <?php endif ?>
              </div>

              <!-- tab-pane -->
              <div class="tab-pane fade" id="h-pills-Metal" role="tabpanel" aria-labelledby="h-pills-Metal-tab">
                <table  class="table  product_info_table">
                  <tbody>
                    <tr>
                      <th>Size</th>
                      <th>Metal</th>
                      <th>Weight</th>
                    </tr>
                    <?php if (!empty($product->material)): ?>
                    <?php foreach ($product->material as $key => $metal): ?>
                      <tr>
                      <td><?php echo $metal->OptionSize ?></td>
                      <td><?php echo $metal->Combination_Option_Name ?></td>
                      <td><?php echo $metal->OptionWeight ?> grams</td>
                      </tr>
                    <?php endforeach ?>
                    <?php endif ?>
                  </tbody>
                </table>
              </div>

              <!-- tab-pane -->
              <div class="tab-pane fade" id="h-pills-Price" role="tabpanel" aria-labelledby="h-pills-Price-tab">
			  <?php echo $price_breackup;?>
			         
              </div>

              <!-- tab-pane -->
              <div class="tab-pane fade" id="h-pills-Tags" role="tabpanel" aria-labelledby="h-pills-Tags-tab">
                Tags
              </div>

          </div>
       
          </div>
        </div>

      </div>
    </section>

    <section class="info">
      <div class="container">

        <h2>You may also like</h2>
        <div class=" slider-container arrows-rb mt-lg-3 pb-0 pb-md-5 pb-lg-5 pb-xl-5">
          <div class="product-container new-arrivals" style="width: 100%;display: block;">
            <?php foreach ($related_products as $key => $rp): ?>
              <?php 
             $path = 'uploads/products/';
              $image = str_replace(' ', '_', $rp->SKU).'_thumbnail.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $rp->SKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $rp->SKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $rp->SKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }
              $image_path = base_url("uploads/products/$image");
              ?>
              <div class="product">
              <div class="product-card shadow">
                  <a class="product-wish" href="<?php echo base_url();?>cart/save_wishlist/<?php echo $rp->ProductID;?>"><i class="fas fa-heart"></i></a>
                <a href="<?php echo base_url("product/$rp->slug") ?>" class="product-img-wrapper">
                  <img class="product-img" src="<?php echo $image_path ?>" alt="<?php echo $image ?>">
                </a>
                <div class="product-info">
                  <div class="product-price">
                     <span class="reg-price">₹ <?php echo $this->purchase_cart->number_format($rp->Price ) ?></span>
                     <?php if ($rp->Price < $rp->MRP_Price): ?>
                       <span class="strike-price"><del>₹ <?php echo sprintf('%0.2f',  $rp->MRP_Price ) ?></del></span>
                     <?php endif ?>
                  </div>
                  <a href="<?php echo base_url("product/$rp->slug") ?>" class="product-name"><?php echo ucwords($rp->Name); ?></a>
                </div>
              </div>
            </div>
              
            <?php endforeach ?>
          </div>
          <ul class="slider-nav-list new-arrivals-slider-nav-list d-none d-md-block d-lg-block d-xl-block">
            <li class="slider-nav prev"><img src="<?php echo base_url('assets') ?>/img/back.svg" class="icon" alt=""></span></li>
            <li class="slider-nav next"><img src="<?php echo base_url('assets') ?>/img/next.svg" class="icon" alt=""></span></li>
          </ul>
        </div>
      </div>
    </section>
    
    <!--

    <section class="info bg-gray-light">
      <div class="container">
        <div class="image-wrap">
          <img src="<?php echo base_url('assets') ?>/img/image.png" alt="">
          <div class="image-wrap-content">
            <h1 class="title m-0">Lorem ipsum dolor ipsum dolor</h1>
            <p class="text-brand mt-2 mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima hic cupiditate esse ducimus itaque neque quo sapiente</p>
            <span class="clearfix"></span>
            <a href="" class="cta mt-3 d-inline-block"><u>Shop Now</u></a>
          </div>
        </div>
      </div>
    </section>
    -->
    
        <section>
      <div class="container">
 
          <img src="<?php echo base_url('assets') ?>/img/productnewimage.jpg" alt="" class="img-responsive" style="height:500px;">
  
    
      </div>
    </section>

<!--
    <section class="info shop-category">
      <div class="container">
        <h2>Shop by Category</h2>
        <div class="row sc-slider">
          <?php foreach ($categories as $key => $category): ?>
            <div class="col-md-4 card-img">
              <di class="wrapper">
                <a class="wrapper-imag">

                      <?php 
                      $image = APPPATH.$category->CategoryImage;

                            if(file_exists($image)) {
                                  $temp = explode('../', $image);
                                  $image = base_url().$temp[1];
                              }else{
                                $image = base_url().'/uploads/Not_Available.jpg';
                              }
                            ?>
       
                  <img src="<?php echo $image ?>" alt="">
                </a>
                <div class="mt-2">
                  <a href="<?php echo base_url("products/category/$category->CategorySlug")  ?>" class="cta"><?php echo ucwords($category->CategoryName); ?> </a>
                </div>
              </di>
            </div>
          <?php endforeach ?>
 
        </div>
      </div>
    </section>
    
    -->
</main>

<!-- MODEL POPUP : BEGIN -->
<div class="modal fade" id="sizeGuideModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Size Guide</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eaque veniam necessitatibus quibusdam suscipit ullam perferendis, excepturi dignissimos, est sed porro ab mollitia beatae? Fugiat, iste quidem quibusdam sit placeat error!</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate vero odit sapiente vitae ipsam, exercitationem quis voluptatibus consequatur autem, tempora animi distinctio, aspernatur ullam pariatur quibusdam illo ex at veniam.</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti libero nobis fugiat commodi non, ratione qui iusto delectus recusandae velit magnam iure possimus voluptatibus tenetur ut at! Hic, aut sunt.</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo voluptatibus animi repudiandae fugit ex in. Voluptatem quaerat laudantium earum aperiam porro est et temporibus repudiandae eveniet, nostrum, quos eos totam.</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus quibusdam, itaque omnis animi et recusandae non inventore tempore molestias commodi asperiores quod voluptas modi vel, neque hic pariatur labore. Molestiae.</p>
      </div>
    </div>
  </div>
</div>
<!-- MODEL  -->

<!-- MODEL POPUP : BEGIN -->

<div class="modal fade" id="diamondGuideModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Diamond Guide</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>DIAMOND EDUCATION
Every diamond used in Anaya Jewellery is hand-picked & sourced from conflict-free and ethical mines. Graded by the International Diamond Grading Laboratories like GIA, IGI and more, we pride ourselves in delivering maximum brilliance and lustre performance of every jewellery we vend. Assuring the finest non-rounded and fancy-shaped diamonds in the market, we will be honoured to help you find the perfect diamond for you.</p>
<p>


SHAPE
Choose Your Diamond Shape
Diamond’s characteristic chemical composition and crystal structure make it a unique member of the mineral kingdom.Being the only gem made of a single element, it is typically about 99.95% carbon. The other 0.05 percent can include one or more trace elements, which are atoms that aren’t a part of the diamond’s essential chemistry. Certain trace elements can influence the colour and crystal shape of the diamond. Since all diamond shapes are different, their unique characteristics determine the quality for each shape. Select your shape below to learn how to recognize a beautiful diamond.</p>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="videomodal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<h5 class="modal-title">Diamond Guide</h5>-->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

         <div class="video-wrapper">
              <video width="100%" controls id="video1">
                  <source src="<?php echo base_url()."uploads/videos/sample.mp4"; ?>" type="video/mp4">
              </video>
          </div>
      </div>
    </div>
  </div>
</div>



<!-- MODEL  -->

<!-- Video Model-->


<!-- Large modal -->


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      <iframe  width="100%" height="600" src="https://www.youtube.com/embed/<?php echo $YT_ID;?>?ecver=2&enablejsapi=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="show-small-img img-border"></iframe>
    </div>
  </div>
</div>



