<?php if (!empty($roducts)): ?>
          <?php foreach ($roducts as $key => $product): ?>

          <div class="product">
            <div class="product-card shadow">
              <span class="product-wish"><i class="fas fa-heart"></i></span>
              <a href="<?php echo base_url();?>product/<?php echo $product->slug;?>" class="product-img-wrapper">
                <?php 
              $path = 'uploads/products/';
              $image = str_replace(' ', '_', $product->SKU).'_thumbnail.jpg'; 

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

            <img class="product-img lazy" src="<?php $image_path ?>" data-original="<?php echo $image_path ?>" alt="<?php echo $product->Name?>">
            </a>
            <div class="product-info">
            <div class="product-price">
            <span class="reg-price"> Rs <?php echo sprintf('%0.2f',  $product->Price ) ?></span>
            <?php if ($product->MRP_Price > $product->Price): ?>
              <span class="strike-price"><del> Rs <?php echo sprintf('%0.2f',  $product->MRP_Price ) ?></del></span>
            <?php endif ?>
            
            </div>
            <a href="<?php echo base_url();?>product/<?php echo $product->slug;?>" class="product-name"><?php echo $product->Name ?></a>
            </div>
            </div>
          </div>
        <?php endforeach ?>          
        <?php endif ?>  