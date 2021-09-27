<?php
if(is_array($wishlists)) {
foreach ($wishlists as $key => $value) { 
$image = str_replace(' ', '_', $value->SKU).'_1.jpg'; 
$image_path = base_url().'uploads/products/'.$image;										
if(file_exists("./uploads/products/$image")){
$image_path = $image_path;
}
else{
$image_path = base_url().'/uploads/Not_Available.jpg';
}
								
?>
<div class="product">
<div class="product-card shadow">
<a onclick="return confirm('Are you sure you want to remove?')" href="<?php echo base_url().'cart/remove_wishlist/'.$value->WishlistID;?>">
<span class="product-delete delete-confirm"><i class="fas fa-times"></i></span>
</a>
<a href="<?php echo base_url().'product/'.$value->slug;?>" class="product-img-wrapper">
<img class="product-img lazy" data-original="<?php echo $image_path;?>" alt="">
</a>
<div class="product-info">
<div class="product-price">
<span class="reg-price">₹ <?php echo $this->purchase_cart->number_format($value->Price);?></span>
<!--<span class="strike-price"><del>₹ <?php echo number_format($value->MRP_Price);?></del></span>-->
</div>
<a class="product-name" href="<?php echo base_url().'product/'.$value->slug;?>"><?php echo ucwords($value->Name);?></a>
<a href="<?php echo base_url().'product/'.$value->slug;?>" class="btn btn-brand m-0 mt-1">Move to Cart</a>
</div>
</div>
</div>
<?php } } ?>
