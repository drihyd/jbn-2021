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
                <h5 class="text-dark text-uppercase p-0 m-0">My WishList</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>

            <div class="my-account-info ">
                <div class="col">
                    <div class="row">
                        <div class="col px-0 pr-lg-2 mb-2 mb-lg-0">
                            <div class="order-summery border-0 mb-5">
                              <?php foreach ($wishlist_details as $key => $wishlist) { ?>
                               
                        <?php
                
              $path = 'uploads/products/';
         $image = str_replace(' ', '_', $wishlist->p_SKU).'_thumbnail.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $wishlist->p_SKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $wishlist->p_SKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $wishlist->p_SKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
              ?>
                                <div class="order-list py-3 pl-0 border-bottom">
                                    <div class="thumbnail">
                                        <img src="<?php echo $image_path;?>" class="full" alt="<?php echo $image_path;?>">
                                    </div>
                                    <div class="order-details">
                                        <p class="title"><?php echo $wishlist->p_Name;?></p>
                                        <p class="sku">SKU: <?php echo $wishlist->p_SKU;?></p>


                                        <div class="mt-2 mt-md-3 mb-0">
                                          <li class="d-block d-md-inline">
                                            <a href="<?php echo base_url().'product/'. $wishlist->p_slug;?>" class="btn btn-sm btn-brand m-0">Add to Cart</a>
                                          </li>

                                          <li class="d-block d-md-inline mt-1 mt-md-0 ml-md-2">

                                            <a  class="cta text-uppercase text-gray" onclick="return confirm('Are you sure you want to remove?')" href="<?php echo base_url().'cart/remove_wishlist/'.$wishlist->w_WishlistID;?>">
                                            Remove form wishlist</a>
                                          </li>
                                        </div>
                                    </div>
                                </div>
                              <?php } ?>
                                
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