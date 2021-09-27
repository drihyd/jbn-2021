<?php
   get_header();
   ?>
<main class="main-content">
   <section>
      <div class="container blog_detail">
         <div class="row">
            <div class="col-sm-12">
               <h2><?php echo the_title(); ?></h2>
               <?php $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' ); ?>
               <img class="img-fluid mt-4" src="<?php echo $image[0];?>">
              
                <div class="blog_strip">
                 <div style="width: 100%">
                <div class="row">
                                    <div class="col-sm-7 col-xs-12 social_user ">
                                       <i class="fa fa-user"></i> 
                                       <span>  Admin </span> 
                                       <i class="fa fa-calendar pl-5"></i>
                                      <span>  <?php echo get_the_date();?>  </span>
                                    </div>
                                    <div class="col-sm-5 col-xs-12">
                                       <span class="catt-display float-right"> <?php
                           $categories = get_the_category();
                           $category_name = $categories[0]->name;
       
                           if ( ! empty( $categories ) ) {
                               echo esc_html( ucfirst( $category_name));  
                           } ?></span>
                <p>
                                    </div>
                                 </div>
                                 
                                 </div>
            </div>
            
               <div class="mt-4">
                  <?php
                     if (the_content() != "")
                         echo the_content();
                     ?>
                  <div class="article-content">
                     <?php //comments_template();  
                        ?>
                  </div>
                  <?php
                     ?>
                  <?php
                     global $post;
                     ?>
               </div>
               
                <?php echo do_shortcode('[supsystic-social-sharing id="2"]') ?>
            </div>
         </div>
      </div>
   </section>
</main>
<?php
  get_footer();
   ?>