<?php 
   get_header(); 
   ?>
<!-- Inner Layout Start -->
<main class="main-content">
   <section>
   <div class="container">
      <div class="row">
         <!-- Content Start -->
         <div class="col-sm-9 col-md-9 col-lg-9">
            <section class="inner-lead">
               <div class="row">
                   <h1 class="heading mb-2 pl-3"><?php single_cat_title(); ?></h1>
                  <div class="col-sm-12">
                    
                     <ul class="posts-list">
                        <?php 
                           if ( have_posts() ) {
                           				while ( have_posts() ) {
                           								the_post();
                               				?>
                        <li style="list-style:none" class=" mt-5">
                             
                           <a href="<?php echo get_permalink(); ?>" alt="<?php echo the_title(); ?>" title="<?php echo the_title(); ?>">  
                              <h2 class="heading"><?php echo the_title();?></h2></a>
                             
                              <?php 
                                 $url = wp_get_attachment_url( get_post_thumbnail_id($post->ID), 'thumbnail' ); 
                                 if($url!="") : 
                                 ?>
                              <img src="<?php echo $url ?>" class="img-fluid mt-4" alt="<?php the_title(); ?>" title="<?php the_title(); ?>" />
                              <?php endif; ?>
                              <p class="excerpt mt-4"><?php $content = get_the_excerpt();
                                 echo mb_strimwidth($content, 0,400, "...");
                                 
                                 ?> </p>
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
                          
                        </li>
                        <?php } 
                           }
                           else {
                           // no posts found
                           }
                           wp_reset_query();
                           ?>
                     </ul>
                  </div>
               </div>
            </section>
         </div>
         <!-- Content End -->
         <!-- Sidebar Start -->
         <div class="col-sm-3 col-md-3" id="sidebar-col">
            <?php if ( is_active_sidebar( 'sidebar-1' ) ) : ?>
            <?php dynamic_sidebar( 'sidebar-1' ); ?>
            <?php endif; ?>							
         </div>
         <!-- Sidebar End -->
      </div>
   </div>
   </sectiom>
</main>
<!-- Inner Layout End -->
<?php get_footer(); ?>