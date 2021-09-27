<form method="get" class="searchform search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
	<fieldset> 
		<input type="text" name="s" class="s" value="<?php echo get_search_query(); ?>" placeholder="<?php _e('Search','anaya_jewellery'); ?>" autocomplete="off"> 
		
	</fieldset>

  <button type="submit" class="search-button" placeholder="<?php _e('Search','anaya_jewellery'); ?>" type="submit" value="<?php _e('Search','anaya_jewellery'); ?>"><i class="fa fa-search"></i></button>
    <!--<span class="fa fa-search form-control-feedback" type="submit" value="<?php _e('Search','anaya_jewellery'); ?>"></span>-->
</form>