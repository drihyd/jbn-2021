<?php
get_header(); ?>
<style>
    .search-button
    {
        top:100px !important;
    }
</style>
<main class="main-content">
 <section>
		<div class="container">
		<div class="content-area home-content-area row">
			<div class="content-home col-sm-12">
				<h1 class="section-heading uppercase"><?php _e('Search Results', 'anaya_jewellery'); ?></h1>
					<?php if ( is_active_sidebar( 'sidebar-2' ) ) : ?>
							<?php dynamic_sidebar( 'sidebar-2' ); ?>
							
					<?php endif; ?>	
				<div class="">
				<div class="content mt-4 row">
					<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
					<div class="col-sm-5 col-lg-5 mt-4"> 
				<p class="btn btn-accent">	<?php
                           $categories = get_the_category();
                           $category_name = $categories[0]->name;
       
                           if ( ! empty( $categories ) ) {
                               echo esc_html( ucfirst( $category_name));  
                           } ?></p>
					<?php $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' ); ?>
                 <img class="img-fluid mt-2 mb-4" src="<?php echo $image[0];?>"> 
               </div>
               <div class="col-sm-7 col-lg-7 mt-4 blog-desc"> 
						<a href="<?php the_permalink(); ?>"><h3><?php the_title(); ?></h3></a>
					<article <?php post_class( 'post-excerpt' ); ?> style="margin-bottom:4%">
				 <?php $content = get_the_excerpt();
                echo mb_strimwidth($content, 0,300);
                ?>
										
					</article><!-- end .post-excerpt -->
					<a href="<?php the_permalink(); ?>" class="mt-3 btn btn-brand">Read More </a>	
					</div>	
				<?php endwhile; endif;?>
				</div>
			<?php if ( !have_posts() ) : ?>
					
					<div class="no-posts-found ten columns alpha">

						<p><em><?php _e( 'Sorry, but no results were found. Please try the search again.', 'anaya_jewellery' ); ?></em></p>
					
					</div><!-- end .no-posts-found -->
					
				<?php endif; ?>
				
				</div><!--content-->
				
			</div>
		
			</div>
			</div>
		 </section>
	
	</main>
	<?php get_footer(); ?>