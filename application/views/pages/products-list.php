<!-- PAGE BODY : BEGIN -->
<main class="main-content">
  <section class="hero p-0">
    <!-- <div class="hero-banner">
    </div> -->
    <img src="<?php echo base_url();?>assets/img/banner.jpg" width="100%" alt="">
    </section>

 

    <div class="product-filters" id="productFilters" data-toggle="affix">
      <div class="d-block d-lg-none d-xl-none">
        <div class="filter-group">
          <span class="filter-btn filter-sort-toggle">Sort by</span>
          <span class="filter-btn filter-menu-toggle">Filter by</span>
        </div>
      </div>
      <form name="filters" id="ajaxfilter" action="<?php echo $ajax_link ?>">
      <div class="pf-container">
        <div class="pf-header d-lg-none">
          <div class="wrapper">
            <span class="filter-menu-toggle"><i class="fas fa-arrow-left"></i></span>
            <div class="title">Filters</div>
            <div><a href="">Clear all</a></div>
          </div>
        </div><!-- Filters header -->
          <ul class="product-filters-list">
            <li class="filter-list">
                <span class="anchor filter-sub-menu-toggle">Price</span>
                <div class="pf-sub-list">
                  <div class="pf-sub-header d-lg-none">
                    <div class="wrapper">
                      <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                      <div class="title">Price</div>
                      <div><a href="">Clear all</a></div>
                    </div>
                  </div>
                  <ul class="sub-filter">
                    <li >

                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="0-5000" autocomplete="off">
                        Below - 5000</span>
                    </li>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="5000-15000" autocomplete="off">
                        Rs. 5000 - 15000</span>
                    </li>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="15000-50000" autocomplete="off">
                        Rs. 15000 - 50000</span>
                    </li>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="50000-100000" autocomplete="off">
                        Rs. 50000 - 100000</span>
                    </li>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="100000-300000" autocomplete="off">
                        Rs. 100000 - 300000</span>
                    </li>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="price_range[]" value="300000-100000000000" autocomplete="off">
                        Above - 300000</span>
                    </li>
                      

                  </ul>
                </div>
            </li>
            <!-- <li class="filter-list ">
              <span class="anchor filter-sub-menu-toggle">Product type</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Product type</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                  <ul class="sub-filter">
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="" value="" autocomplete="off">
                        Earrings</span>
                    </li>
                  </ul>
              </div>
            </li> -->
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">Category</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Category</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <?php if($categories) {
                          foreach ($categories as $category) { ?>
                            <?php if($category->ParentID == 0) { ?>
                <ul class="sub-filter">
                  <li >
                    <ul class="sf-sub-filter" id="moreFilter">
                      
                      <li class="sf-sub-list">
                        <span class="anchor anchor-icon" data-toggle="collapse" data-target="#<?php echo $category->CategorySlug ?>" aria-expanded="false" aria-controls="<?php echo $category->CategorySlug ?>">
                          <?php echo $category->CategoryName;?>
                        </span>
                        
                        <div class="collapse" id="<?php echo $category->CategorySlug ?>" aria-expanded="false" >
                          <ul>
                            <li>
                              <span class="anchor filter-option">
                                <input type="checkbox" name="category[]" value="<?php echo $category->CategorySlug ?>" autocomplete="off">
                                All</span>
                            </li>
                            <?php foreach($categories as $parentfilter) { ?>
                            <?php if($parentfilter->ParentID == $category->CategoryID) { ?>
                            <li>
                              <span class="anchor filter-option">
                                <input type="checkbox" name="category[]" value="<?php echo $parentfilter->CategorySlug ?>" autocomplete="off">
                                <?php echo $parentfilter->CategoryName;?></span>
                            </li>
                            <?php }} ?>
                          </ul>
                        </div>
                        
                      </li>
                    
                    </ul>
                  </li>
                </ul>
                <?php }}} ?>
              </div>
            </li>
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">Weight ranges</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Weight ranges</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <ul class="sub-filter">
                  <li >
                    <!--<span class="anchor filter-option">-->
                      <span class="anchor filter-option">
                      <input type="checkbox" name="weight_ranges[]" value="0-10" autocomplete="off">
                      Below 10 gms</span>
                  </li>
                  <li >
                    <span class="anchor filter-option">
                      <input type="checkbox" name="weight_ranges[]" value="10-30" autocomplete="off">
                      10-30 gms</span>
                  </li>
                  <li >
                    <span class="anchor filter-option">
                      <input type="checkbox" name="weight_ranges[]" value="30-50" autocomplete="off">
                      30-50 gms</span>
                  </li>
                  <li >
                    <span class="anchor filter-option">
                      <input type="checkbox" name="weight_ranges[]" value="50-100" autocomplete="off">
                      50-100 gms</span>
                  </li>
                  <li >
                    <span class="anchor filter-option">
                      <input type="checkbox" name="weight_ranges[]" value="100-10000" autocomplete="off">
                      Above 1000 gms</span>
                  </li>
                </ul>
            </div>
            </li>
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">Material</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Material</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <ul class="sub-filter">
                  <?php foreach ($material_types as $key => $material_type): ?>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="material[]" value="<?php echo $material_type->slug ?>" autocomplete="off">
                        <span class="with-icon"><span class="icon gold"></span></span><?php echo $material_type->MaterialName ?></span>
                    </li>                    
                  <?php endforeach ?>
                </ul>
            </div>
            </li>

<!--
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">Metal Color</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Metal</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <ul class="sub-filter">
                  <?php foreach ($gold_colors as $key => $color): ?>
                    <li >
                      <span class="anchor filter-option">
                        <input type="checkbox" name="color[]" value="<?php echo $color->OptionName ?>" autocomplete="off">
                        <span class="with-icon"><span class="icon gold"></span></span><?php echo $color->OptionName ?></span>
                    </li>
                  <?php endforeach ?>
                </ul>
            </div>
            </li>
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">Metal Purity</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">Metal</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <ul class="sub-filter">
                  <?php foreach ($metals as $key => $metal): ?>
                    <li >
                    <span class="anchor filter-option">
                      <input type="checkbox" name="purity[]" value="<?php echo $metal->OptionName ?>" autocomplete="off">
                      <span class="with-icon"><span class="icon gold"></span></span><?php echo $metal->OptionName ?></span>
                  </li>
                  <?php endforeach ?>
                </ul>
            </div>
            </li>
            <li class="filter-list">
              <span class="anchor filter-sub-menu-toggle">See more filters</span>
              <div class="pf-sub-list">
                <div class="pf-sub-header d-lg-none">
                  <div class="wrapper">
                    <span class="filter-sub-menu-toggle"><i class="fas fa-arrow-left"></i></span>
                    <div class="title">See more filters</div>
                    <div><a href="">Clear all</a></div>
                  </div>
                </div>
                <ul class="sub-filter">
                  <li >
                    <ul class="sf-sub-filter" id="moreFilter">

                      <li class="sf-sub-list">
                        <span class="anchor anchor-icon" data-toggle="collapse" data-target="#gemstone" aria-expanded="false" aria-controls="gemstone">
                          Gemstone
                        </span>
                        <div class="collapse" id="gemstone" aria-expanded="false" >
                          <ul>
                            <?php foreach ($gemstones as $key => $gemstone): ?>
                              <li>
                                <span class="anchor filter-option">
                                  <input type="checkbox" name="gemstone[]" value="<?php echo $gemstone->OptionName ?>" autocomplete="off">
                                  <?php echo $gemstone->OptionName ?></span>
                              </li>
                            <?php endforeach ?>
                          </ul>
                        </div>
                      </li>
                    </ul>
                  </li>
                  <li >
                    <ul class="sf-sub-filter" id="moreFilter">

                      <li class="sf-sub-list">
                        <span class="anchor anchor-icon" data-toggle="collapse" data-target="#pearls" aria-expanded="false" aria-controls="pearls">
                          Pearls
                        </span>
                        <div class="collapse" id="pearls" aria-expanded="false" >
                          <ul>
                            <?php foreach ($gemstones as $key => $gemstone): ?>
                              <li>
                                <span class="anchor filter-option">
                                  <input type="checkbox" name="gemstone[]" value="<?php echo $gemstone->OptionName ?>" autocomplete="off">
                                  <?php echo $gemstone->OptionName ?></span>
                              </li>
                            <?php endforeach ?>
                          </ul>
                        </div>
                      </li>

                    </ul>
                  </li>
                </ul>
              </div>
            </li>

          -->
          </ul>
      </div>
      
      <div class="pf-sort-container">
        <div class="filter-content pt-2 pt-md-3 pt-lg-3 pt-xl-3  pb-2 pb-md-3 pb-lg-3 pb-xl-3">
          <div class="container">
            <div class="row">
              <div class="col">
                <div class="filter-tags d-none d-lg-block">
                  <ul class="list-inline tags-list m-0" id="selected-filters">                    
                  </ul>
                  <a href="<?php echo base_url('products') ?>" id="clear-filters" class="ml-3" >Clear all</a>
                </div>
                <div class="filter-category">
                  <ul class="list-inline mt-0 mt-md-3 mb-0 scrollEnable">
                    <li class="list-inline-item">
                      <a href="" class="btn btn-brand m-0">All <span id="products_count" class="count">(<?php echo isset($No_of_Products)?$No_of_Products:0;?>)</span></a>
                    </li>
 <!--                    <li class="list-inline-item">
                      <a href="" class="btn btn-default default-gray m-0">Try at Home</a>
                    </li>
                    <li class="list-inline-item">
                      <a href="" class="btn btn-default default-gray m-0">Designs in Store</a>
                    </li>
                    <li class="list-inline-item">
                      <a href="" class="btn btn-default default-gray m-0">Fast Delivery</a>
                    </li> -->
                  </ul>
                </div>
              </div>
              
              
               <!--
              <div class="col-4 ml-auto align-self-end d-none d-lg-block">
                <div class="custom-select-wrapper">
                  <div class="custom-select">
                      
                     
                    <select name="sorting" id="" class="custom-select-trigger">
                    <div class="custom-options custom-scrollbar">                      
                        <span class="custom-option selected">
                        <option value=""><strong>Sort by</strong></option>
                        </span> 
                        <span class="custom-option ">
                        <option value="price-asc">Price: Low to High</option>
                        </span>
                        <span class="custom-option ">
                        <option value="price-desc">Price: High to Low</option>
                        </span>
               
                      </div>
                      </select>    
                     
       
                  </div>
                </div>
              </div>
               -->
               
              </div>
            </div>
        </div>
      </div>

      <!-- <div class="overlay filter-sort-toggle"></div>
      <div class="custom-sort d-block d-lg-none d-xl-none">
        <div class="custom-sort-container">
          <div class="sort-heading">Sort by: <span class="filter-sort-toggle pull-right"><i class="fas fa-arrow-right"></i></span></div>
          <span class="custom-option selected" data-value="tesla">Tesla</span>
          <span class="custom-option" data-value="volvo">Volvo</span>
          <span class="custom-option" data-value="mercedes">Mercedes</span>
          <span class="custom-option" data-value="tesla">Tesla</span>
          <span class="custom-option" data-value="volvo">Volvo</span>
          <span class="custom-option" data-value="mercedes">Mercedes</span>
          <span class="custom-option" data-value="tesla">Tesla</span>
        </div>
    </div> -->
    </div>

  </form>
   
   <!-- List of producst -->
    <section class="info products-sec" id="products-section">
      <div class="container">
          <div class="product-container filter_data" id="products-grid">
          <?php if (!empty($products)): ?>
          <?php foreach ($products as $key => $product): ?>

          <div class="product">
            <div class="product-card shadow">
              <a class="product-wish" href="<?php echo base_url();?>cart/save_wishlist/<?php echo $product->ProductID;?>"><i class="fas fa-heart"></i></a>
              <a href="<?php echo base_url();?>product/<?php echo $product->slug;?>" class="product-img-wrapper">
                <?php 
              $path = 'uploads/products/';
              $image = str_replace(' ', '_', $product->SKU).'_1.jpg'; 

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $product->SKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $product->SKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $product->SKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
              ?>

            <img class="product-img lazy" src="<?php echo $image_path ?>" data-original="<?php echo $image_path ?>" alt="<?php echo $product->Name?>">
            </a>
            <div class="product-info">
            <div class="product-price">
            <span class="reg-price"> Rs <?php echo $this->purchase_cart->number_format($product->Price ) ?></span>
            <?php if ($product->MRP_Price > $product->Price): ?>
              <span class="strike-price"><del> Rs <?php echo  $this->purchase_cart->number_format($product->MRP_Price ) ?></del></span>
            <?php endif ?>
            
            </div>
            <a href="<?php echo base_url();?>product/<?php echo $product->slug;?>" class="product-name"><?php echo ucwords($product->Name); ?></a>
            </div>
            </div>
          </div>
        <?php endforeach ?> 
        <?php else: ?>
        <div>
          Not Available
        </div>         
        <?php endif ?>     
          </div>
      </div>
    </section>

   <!-- End -->

</main>