<?php get_header(); ?>

<main class="main-content">
    <section class="hero">
       
    <div class="container slider-container">
         
		<div class="new-collections hero-collections">
		    <?php if ( get_query_var('paged') ) { $paged = get_query_var('paged'); } else if ( get_query_var('page') ) {$paged = get_query_var('page'); } else {$paged = 1; }
				$temp = $wp_query_;  // re-sets query
				$wp_query = null;   // re-sets query
				$args = array (
					'post_type' => 'post',
					'posts_per_page' =>2,
				// 	'paged' => $paged,
					'order' => 'DESC'
				); 	
				
				$wp_query = new WP_Query($args);
				if ( $wp_query->have_posts() ) {			
			    $i = 1; while($wp_query->have_posts()) : $wp_query->the_post();?>
				<div class="a-post a-post-<?php echo $counter; ?>">
            		<?php $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' ); ?>
                    <div class="item">
                      <div class="row flex-row-desktop">
                        <div class="col-md-12 text-center  text-md-right text-lg-right text-xl-right">
                           <a href="<?php the_permalink(); ?>">
                        <div style="background-image:url('<?php echo $image[0]; ?>');background-size: cover;height:580px">
                            <div class="col-sm-12 banner-text">
                           <div class="heading-content text-center text-md-center text-lg-left text-xl-left">
                            <a href="<?php the_permalink(); ?>"><h1><?php the_title(); ?></h1></a>
                            <p class="mt-3" style="color:#fff;font-size:1rem"> <?php $content = get_the_excerpt();
                            echo mb_strimwidth($content, 0,140, "...");
                            ?> </p>
                        <a href="<?php the_permalink(); ?>" class="mt-3">Read More </a>
                          </div>
                            </div>
                            
                        </div>  </a>
                        
                        </div>
                      
                      </div>
                    </div>
                </div>
            <?php if ( $i % 6 === 0 ) { echo '</div><div class="row">'; } 
					$i++; endwhile; ?>
	    </div>
	    	
      <?php } ?>
    </div>
    
</section>
<?php wp_reset_query();  ?>
   <section class="pt-0">
	<div class="container blog">  

		<div class="row card-container">
				<div class="col-sm-7 col-lg-9">
					<div class="row">
					<?php if ( get_query_var('paged') ) { $paged = get_query_var('paged'); } else if ( get_query_var('page') ) {$paged = get_query_var('page'); } else {$paged = 1; }
					$temp = $wp_query;  // re-sets query
					$wp_query = null;   // re-sets query
					$args = array (
						'post_type' => 'post',
						'posts_per_page' =>2,
						'paged' => $paged,
						'order' => 'DESC'

					
					); 									  
					$wp_query = new WP_Query($args);
					if ( $wp_query->have_posts() ) {			
				    $i = 1; while($wp_query->have_posts()) : $wp_query->the_post();?>
					<div class="col-md-12 col-xs-12 blogcard mt-5">
						<div class="a-post a-post-<?php echo $counter; ?>">
						
						
							
							<?php $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' ); ?>
							<div class="box"> 
							<a href="<?php the_permalink(); ?>">	<h2 class="padding-bottom-15 d"><?php the_title(); ?> </h2> </a>
							<?php if($image[0]!='') { ?>
								<div class="gallery-thumb" style="background-image:url('<?php echo $image[0]; ?>');background-size: cover; min-height:430px; border-radius: 6px;box-shadow: 0 2px 15px 0 rgba(0,0,0,0.15);"></div> <?php } ?> 
								<!--<?php echo do_shortcode('[supsystic-social-sharing id="1"]') ?>-->
								
								
									<div class="box-body white-bg mt-4">
									    
									       <p class=""> 
									       
									         <?php $content = get_the_excerpt();
                                            
                                                    echo mb_strimwidth($content, 0,400, "...");
                                        
                                                ?> 
									       
									       </p>
									       	<hr>	
									       <div class="row">
                              <div class="col-xs-6 col-sm-6">
                                 <span class="pull-left dateofpublish"><?php echo the_date();?></span>
                              </div>
                              <div class="col-xs-6 col-sm-6 social ">
                                  <span class="float-right">
                                <a href="<?php the_permalink(); ?>"> Continue Reading </a>
                                  </span>
                                  </div>
                           </div>
									 
										
								</div>
							</div>
						</div>
					</div>
					<?php if ( $i % 3 === 0 ) { echo '</div><div class="row">'; } 
					$i++; endwhile; ?>		
					</div>
					<nav class="pagination">
						 <?php echo wp_paginate(); ?>
					</nav>
			<?php } 		

wp_reset_query(); ?>
				
				</div>
			    <div class="col-sm-5 col-lg-3">
			        
			        	<?php if ( is_active_sidebar( 'sidebar-1' ) ) : ?>
							<?php dynamic_sidebar( 'sidebar-1' ); ?>
							
					<?php endif; ?>	
			        
			    </div>
		    </div>
	</div>
	</section>
  
</main>
<?php get_footer(); ?>
