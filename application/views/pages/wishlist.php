<!-- PAGE BODY : BEGIN -->
<main class="main-content">
  <section class="bg-bright info">
    <div class="container">
      	  









			<?php
			if ($wishlists_html) {   ?>

				<div class="product-container">
					<?php

			echo $wishlists_html;
			} else { ?>

			<div class=""> 

	 
		
		
		 <div class="row">
            <div class="col-lg-12 text-center">
		<div class="css-rgxxes"><p><span class="er6wa4k0 css-34gj24 efp5dbi0"></span></p><p class="title">Empty Whishlists!</p><p class="sub-title">Let's do some retail therapy!</p><a href="<?php echo base_url();?>products"><button content="Start Shopping" class="btn btn-brand m-0 mt-1">Start Shopping</button></a></div>
		</div>
		</div>
		<?php } ?>

      </div>
    </div>
  </section>
</main>
<!-- PAGE BODY : END -->