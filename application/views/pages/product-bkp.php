<!-- PAGE BODY : BEGIN -->
<main class="main-content">
    <section class="info">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="breadcrumb">
                        <a class="breadcrumb-item" href="#">Home</a>
                        <a class="breadcrumb-item" href="#">Diamond</a>
                        <a class="breadcrumb-item" href="#">Ring</a>
                        <span class="breadcrumb-item active">Ring Set</span>
                    </nav>
                </div>
            </div>
            <div class="row">
              <?php $images = glob(APPPATH . '../uploads/'.$product->SKU.'_*.jpg'); ?>

                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="showcase">
                        <div class="showcase-display showcase-slider">
               <?php 

                $i = 0;

              foreach ($images as $key => $image):

                if(file_exists($image)) {
                  $temp = explode('../', $image);
                  $image = base_url().$temp[1];
                  $reg_match = $product->SKU.'_dp.jpg';
                  $pattern = "/{$reg_match}/";
                  preg_match($pattern, $image, $matches);

                  if ($matches)
                    $zoom_image = base_url()."uploads/1000_{$product->SKU}_dp.jpg";
                  else
                    $zoom_image = $image;

                }else{
                  $zoom_image = $image = base_url().'uploads/imp/Not_Available.jpg';
                }


            ?>

              <div class="showcase-item">
                  <div class="showcase-wrap img-zoom">
                    <img  src="<?php echo $image ?>" alt="<?php echo ucwords($product->Name); ?>" title="<?php echo ucwords($product->Name); ?>" >
                  </div>
                </div>

            <?php $i++; endforeach ?>

                        </div>
                        <div class="sd-items-container">
                            <div class="sd-items showcase-tabs">

                              <?php
                $i = 0;

              foreach ($images as $key => $image):

                if(file_exists($image)) {
                  $temp = explode('../', $image);
                  $image = base_url().$temp[1];
                  $reg_match = $product->SKU.'_dp.jpg';
                  $pattern = "/{$reg_match}/";
                  preg_match($pattern, $image, $matches);

                  if ($matches)
                    $zoom_image = base_url()."uploads/1000_{$product->SKU}_dp.jpg";
                  else
                    $zoom_image = $image;

                }else{
                  $zoom_image = $image = base_url().'uploads/imp/Not_Available.jpg';
                }


            ?>

              <div class="showcase-item">
                  <div class="showcase-wrap img-zoom">
                    <img  src="<?php echo $image ?>" alt="<?php echo ucwords($product->Name); ?>" title="<?php echo ucwords($product->Name); ?>" >
                  </div>
                </div>

                <div class="sd-item">
                    <div class="wrapper">
                      <img  data-lazy="<?php echo $image ?>" alt="<?php echo ucwords($product->Name); ?>" title="<?php echo ucwords($product->Name); ?>" >
                    </div>
                </div>

            <?php $i++; endforeach ?>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-5  offset-md-1 col-lg-5  offset-lg-1 col-xl-5  offset-xl-1">
                    <div class="showcase-info mt-4 mt-md-0 mt-lg-0 mt-xl-0">
                        <div class="product-info">
                            <small>Bridal Set</small>
                            <h1 class="product-name">Petite Contoured Diamond Bridal Set</h1>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-8">
                                <div class="product-price-info">
                                    <span>From: &#8377; 4,500.00</span>
                                    <span>Quantity: </span>
                                    <span>Ring Size: </span>
                                </div>
                                <div class="product-cart">
                                    <a href="#" class="btn btn-brand btn-block">Choose your diamond</a>
                                    <a href="#" class="btn btn-brand btn-block">Add to Cart</a>
                                </div>
                                <div class="product-content">
                                    <p>Also available in Gold</p>
                                </div>
                                <div class="row justify-content-between mt-3">
                                    <div class="col-6">
                                      <a href="" class="cta">Size guide</a>
                                    </div>
                                    <div class="col-6 text-right">
                                      <a href="" class="cta">Find in store</a>
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                  <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="showcase-content mt-3">
                      <h4>Description & Details</h4>
                      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut qui eum cumque quisquam maiores repudiandae nostrum eos iure, adipisci dolores accusantium. Provident maiores eius ab vel magnam veniam officiis explicabo.</p>
                      <h4>Description & Details</h4>
                      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut qui eum cumque quisquam maiores repudiandae nostrum eos iure, adipisci dolores accusantium. Provident maiores eius ab vel magnam veniam officiis explicabo.</p>
                    </div>
                  </div>
                </div>

            </div>
        </div>
    </section>
    <section class="info pt-0">
      <div class="container">
        <h2>You may also like</h2>
        <div class="related-products">
          <div class="row rp-slider">
            <div class="col-md-4 card-img">
              <div class="wrapper">
                <a href="" class="wrapper-imag">
                  <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
                </a>
              </div>
            </div>
             <div class="col-md-4 card-img">
            <div class="wrapper">
              <a href="" class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-4 card-img">
            <div class="wrapper">
              <a href="" class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-4 card-img">
            <div class="wrapper">
              <a href="" class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-4 card-img">
            <div class="wrapper">
              <a href="" class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
            </div>
          </div>
          </div>
        </div>
      </div>
    </section>
    <section class="info shop-category">
      <div class="container">
        <h2>Shop by Category</h2>
        <div class="row sc-slider">
          <div class="col-md-4 card-img">
            <di class="wrapper">
              <a class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
              <div class="mt-2">
                <a href="" class="cta">Shop Rings ></a>
              </div>
            </di>
          </div>
          <div class="col-md-4 card-img">
            <div class="wrapper">
              <a class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
              <div class="mt-2">
                <a href="" class="cta">Shop Rings ></a>
              </div>
            </div>
          </div>
          <div class="col-md-4 card-img">
            <div class="wrapper">
              <a class="wrapper-imag">
                <img src="<?php echo base_url('assets') ?>/img/JR00313-WGP900_11_listfront.jpg" alt="">
              </a>
              <div class="mt-2">
                <a href="" class="cta">Shop Rings ></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</main>