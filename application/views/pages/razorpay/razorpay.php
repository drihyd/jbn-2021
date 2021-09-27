
<div class="row">
    <div class="col-lg-12">
        <h2>Razorpay Payment Gateway Integration In Codeigniter using cURL</h2>                 
    </div>
</div><!-- /.row -->
<div class="row">
    <?php 
	print_r($productInfo);
	foreach($productInfo as $key=>$element) { ?>
        <div class="col-lg-6 col-md-6 mb-6">
            <div class="card h-100">
                
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#"><?php echo $element->ProductName;?></a>
                    </h4>
                    <h5>₹<?php echo $element->ProductPrice;?></h5>
                    <p class="card-text"><?php print $element->ShortDesc;?></p>
                </div>
                <div class="card-footer text-right">                    
                    <a href="<?php site_url()?>checkout/<?php echo $element->ProductID;?>" class="add-to-cart btn-success btn btn-sm" data-productid="<?php print $element->ProductID;?>" title="Add to Cart"><i class="fa fa-shopping-cart fa-fw"></i> Buy Now</a>                    
                </div>
            </div>
        </div>
    <?php } ?>          
</div>
