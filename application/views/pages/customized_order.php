<?php 
$custom_attributes=json_decode($single_categories->custom_attributes);
 ?>
<main class="main-content">
    <section class="info">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="breadcrumb bg-bright pl-0">
                        <a class="breadcrumb-item" href="<?php echo base_url() ?>">Home</a>
                        <a class="breadcrumb-item" href="<?php echo base_url("products/category/$product->CategorySlug") ?>"><?php echo $product->CategoryName ?></a>
                        <span class="breadcrumb-item active"><?php echo $product->Name ?></span>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="showcase">
                      <?php  

                        $product_image = str_replace(' ', '_', $product->SKU);
                        $images = glob(APPPATH . '../uploads/products/'.$product_image.'*.jpg');
                       
                      ?>
                        <div class="showcase-display showcase-slider">
                           <?php 


                           if (!empty($images)): ?>
                          <?php foreach ($images as $key => $image): ?>
                            <?php 
                            if(file_exists($image)) {
                                  $temp = explode('../', $image);
                                  $image = base_url().$temp[1];
                                  $reg_match = $product_image.'_dp.jpg';
                                  $pattern = "/{$reg_match}/";
                                  preg_match($pattern, $image, $matches); 

                                  if ($matches)  $zoom_image = base_url()."/uploads/products/{product_image}_dp.jpg";
                                  else $zoom_image = $image;

                              }else{
                                  $zoom_image = $image = base_url().'uploads/products/Not_Available.jpg';
                              } ?>
                            <div class="showcase-item">
                            <div class="showcase-wrap img-zoom">
                              <img  src="<?php echo  $zoom_image ?>" alt="">
                            </div>
                          </div>
                          <?php endforeach ?>
                          <?php else: ?>
                            <img  src="<?php echo  base_url().'uploads/products/Not_Available.jpg' ?>" alt="">
                           <?php endif ?>
                        </div>
                        
                        <div class="sd-items-container">
                            <div class="sd-items showcase-tabs">
                             <?php foreach ($images as $key => $image): ?>
                                <?php 


                            if(file_exists($image)) {
                                  $temp = explode('../', $image);
                                  $image = base_url().$temp[1];
                                  $reg_match = $product->SKU.'_dp.jpg';
                                  $pattern = "/{$reg_match}/";
                                  preg_match($pattern, $image, $matches); 

                                  if ($matches)  $zoom_image = base_url()."/uploads/products/{$product->SKU}_dp.jpg";
                                  else $zoom_image = $image;

                              }else{
                                  $zoom_image = $image = base_url().'/uploads/Not_Available.jpg';
                              }
                            ?>
                                <div class="sd-item">
                                    <div class="wrapper">
                                      <img  data-lazy="<?php echo $image ?>" alt="">
                                    </div>
                                </div>
                              <?php endforeach ?>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-5  offset-md-1 col-lg-5  offset-lg-1 col-xl-5  offset-xl-1">
                  <div class="showcase-info mt-md-0 mt-lg-0 mt-xl-0">
                    <div class="product-info">
                      <div class="row justify-content-between">
                        <div class="col col-auto align-self-top">

                            <h1 class="product-name"><?php echo ucwords($product->CategoryName)  ?></h1>
                        </div>
                        <div class="col col-auto">
                          <a href="<?php echo base_url();?>cart/save_wishlist/<?php echo $product->ProductID;?>">
                            <button type="button" class="btn btn-auto btn-default default-gray btn-block mt-0" data-toggle="tooltip" title="Add to Wishlist"><i class="fas fa-heart"></i></button>
                          </a>
                        </div>
                      </div>

 <form id="customized" method="POST" action="<?php echo base_url();?>cart/add_customized">
  <div class="product-price-info">
                      <div class="col-12 col-sm-12 pl-0 pr-0">
                              <div class="row">
                            <div class="form-group col-sm-6">
                              <label for=""><strong>Material Size*:</strong></label>

           
                              <select id="my-select" class="form-control " name="custom_order_size" required>
                                <option value="">--Size--</option>
                                    <?php if(!empty($single_categories->custom_size)){

                                      $split_values=explode(",", $single_categories->custom_size);
                                      foreach ($split_values as $key => $value) {
                                      echo "<option value='".$value."'>".$value."</option>";
                                      }
                                     ?> 
                                    <?php } ?>

                              </select>
                            </div>

                          <?php
                          if(in_array("polish-details", $custom_attributes))
                          {
                            ?>

                          <div class="form-group col-sm-6">
                          <label for=""><strong>Polish Details:</strong></label>
                          <select id="" class="form-control " name="custom_order_polish" required>
                          <option value="">--Pick One--</option>
                          <?php foreach ($polish as $key => $value) { 
                          echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                          } 
                          ?>                       
                          </select>
                          </div>
                          <?php } ?>



                            </div>
                          </div>
                        <div class="justify-content-left">
                          <h6>Diamond Type Properities</h6>
                         
                         
   <?php
                          if(in_array("diamonds", $custom_attributes))
                          {
                            ?>

                             <div class="row">

                          <div class="form-group col-md-6">
                          <label for=""><strong>Diamond Color:</strong></label>
                          <select id="" class="form-control " name="daimond_color" required>
                          <option value="">--Pick One--</option>
                          <?php foreach ($daimond_color as $key => $value) { 
                          echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                          } 
                          ?>                       
                          </select>
                          </div>



                        <div class="form-group col-md-6">
                          <label for=""><strong>Diamond Clarity:</strong></label>
                          <select id="" class="form-control " name="daimond_clartiy" required>
                          <option value="">--Pick One--</option>
                          <?php foreach ($daimond_clartiy as $key => $value) { 
                          echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                          } 
                          ?>                       
                          </select>
                          </div>


                          <div class="form-group col-md-6">
                          <label for=""><strong>Diamond Shape:</strong></label>
                          <select id="" class="form-control " name="daimond_shape" required>
                          <option value="">--Pick One--</option>
                          <?php foreach ($daimond_shape as $key => $value) { 
                          echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                          } 
                          ?>                       
                          </select>
                          </div>


                          <div class="form-group col-md-6">
<label for=""><strong>Diamond Quantity:</strong></label>
<input type="text" class="form-control " name="cust_diamond_quantity" required/>
</div> 

                         
</div>
                          <?php } ?>

                         


<?php
if(in_array("pearls", $custom_attributes))
{
?>

<div class="row">

<div class="form-group col-md-6">
<label for=""><strong>Pearls:</strong></label>
<select id="" class="form-control " name="cust_pearls" required>
<option value="">--Pick One--</option>
<?php foreach ($cust_pearls as $key => $value) { 
echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
} 
?>                       
</select>
</div>  

<div class="form-group col-md-6">
<label for=""><strong>Pearl Quantity:</strong></label>
<input type="text" class="form-control " name="cust_pearls_quantity" required/>
</div> 

</div>
<?php } ?>




<?php
if(in_array("gemstone", $custom_attributes))
{
?>

<div class="row">

<div class="form-group col-md-6">
<label for=""><strong>Gemstone:</strong></label>
<select id="" class="form-control " name="cust_gemstone" required>
<option value="">--Pick One--</option>
<?php foreach ($cust_gemstone as $key => $value) { 
echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
} 
?>                       
</select>
</div> 


<div class="form-group col-md-6">
<label for=""><strong>Gemstone Quantity:</strong></label>
<input type="text" class="form-control " name="cust_gemstone_quantity" required/>
</div> 

</div>
<?php } ?>

<?php
if(in_array("beads", $custom_attributes))
{
?>

<div class="row">

<div class="form-group col-md-6">
<label for=""><strong>Beads:</strong></label>
<select id="" class="form-control " name="cust_beads" required>
<option value="">--Pick One--</option>
<?php foreach ($cust_beads as $key => $value) { 
echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
} 
?>                       
</select>
</div> 



<div class="form-group col-md-6">
<label for=""><strong>Beads Quantity:</strong></label>
<input type="text" class="form-control " name="cust_beads_quantity" required/>
</div> 


</div>
<?php } ?>


                         <!--  <div class="col-12 col-md">
                            <div class="form-group">
                              <label for=""><strong>Solitarie:</strong></label>

                            <div class="row">
                            <div class="form-group col-sm-6">
                             <select id="" class="form-control " name="custom_order_size_metal" required>

                                <option value="">--Size--</option>
                               <?php foreach ($solitaire_size as $key => $value) { 
                                 echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                                 } 
                                 ?>                                
                              </select>
                            </div>
                            <div class="col-sm-6">
                              <select id="my-select" class="form-control custom-select " name="custom_order_color" required>
                                 <option value="">--Color--</option>
                                  <?php foreach ($solitaire_color as $key => $value) { 
                                  echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                                 } 
                                 ?>  
                                                                  
                              </select>
                            </div>
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group col-sm-6">
                              <select id="" class="form-control custom-select" name="custom_order_clarity" required>
                                 <option value="">--Clarity--</option>
                                  <?php foreach ($solitaire_clarity as $key => $value) { 
                                    echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                                    } 
                                  ?>                                                             
                              </select>
                            </div>

                            <div class="form-group col-sm-6">
                             <select id="" class="form-control " name="custom_order_cut" required>
                                <option value="">--Cut--</option>
                                  <?php foreach ($solitaire_cut as $key => $value) { 
                                    echo "<option value='".$value->OptionID."'>".ucwords($value->OptionName)."</option>";
                                    } 
                                  ?>                                  
                              </select>
                            </div>
                          </div>
                           
                          </div> -->



                          </div>
                          <div class="product-updated-price mt-4">
                            <div class="product-price mt-1">
                                 <span class="reg-price">₹ <?php echo $product->Price ?>/- </h1></span>
                              <?php if (!empty($product->MRP_Price) && $product->Price < $product->MRP_Price): ?>
                              <span class="strike-price"><del>₹ <?php echo $product->MRP_Price ?>/-</del></span>
                              <?php endif ?>
                            </div>
                          </div>
                          <!-- <div id="diamon-details" class="accordion mt-2">
                            <div class="card mb-0 border-0 radius-0">
                                <div class="card-header border-0 collapsed" data-toggle="collapse" href="#collapseOne">
                                    <a class="card-title">
                                        Choose your diamond
                                    </a>
                                </div>
                                <div id="collapseOne" class="card-body px-0 collapse" data-parent="#diamon-details" >
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio molestias eum earum culpa rem quibusdam reiciendis cum et, vitae velit possimus consectetur animi tempora blanditiis fugit harum sequi, dicta sint.</p>
                                </div>
                            </div>
                          </div> -->
                      </div>
            </div>
                       
                      </div>
                      <div class="product-cart mt-2">
                          <div class="row form-row">
                            <div class="col col-auto">

                             <button type="submit" class="btn btn-brand btn-wide btn-block">Add to Cart</button>
                              
                            </div>
                      <input type="hidden" name="product_slug" value="<?php echo $product->slug;?>">
                      <input type="hidden" name="product_pk_ID" value="<?php echo $product->ProductID;?>">
                      <input type="hidden" name="MRP_Amount" value="<?php echo $product->MRP_Price;?>">
                      <input type="hidden" name="Quantity" value="1">

                      <input type="hidden" name="order_method" value="customized">
                      </form>
                          </div>
                      </div>
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
              $image = $rp->SKU.'_thumbnail.jpg'; 
              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = $rp->SKU.'_1.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = $rp->SKU.'_dp.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = 'Not_Available.jpg';
                  }
                }
              }
              $image_path = base_url($path.$image);
              ?>
              <div class="product">
              <div class="product-card shadow">
                <span class="product-wish"><i class="fas fa-heart"></i></span>
                <a href="<?php echo base_url("product/$rp->slug") ?>" class="product-img-wrapper">
                  <img class="product-img" src="<?php echo $image_path ?>" alt="<?php echo $image ?>">
                </a>
                <div class="product-info">
                  <div class="product-price">
                     <span class="reg-price">₹ <?php echo $rp->Price ?></span>
                     <?php if ($rp->Price < $rp->MRP_Price): ?>
                       <span class="strike-price"><del>₹ <?php echo $rp->MRP_Price ?></del></span>
                     <?php endif ?>
                  </div>
                  <a href="<?php echo base_url("product/$rp->slug") ?>" class="product-name"><?php echo $rp->Name ?></a>
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

    <section class="info bg-gray-light">
      <div class="container">
        <div class="image-wrap">
          <img src="./img/image.png" alt="">
          <div class="image-wrap-content">
            <h1 class="title m-0">Lorem ipsum dolor ipsum dolor</h1>
            <p class="text-brand mt-2 mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima hic cupiditate esse ducimus itaque neque quo sapiente</p>
            <span class="clearfix"></span>
            <a href="" class="cta mt-3 d-inline-block"><u>Shop Now</u></a>
          </div>
        </div>
      </div>
    </section>

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
                  <a href="<?php echo base_url("products/category/$category->CategorySlug")  ?>" class="cta"><?php echo $category->CategoryName ?> </a>
                </div>
              </di>
            </div>
          <?php endforeach ?>
 
        </div>
      </div>
    </section>
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


