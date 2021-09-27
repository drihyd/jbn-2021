<?php

add_theme_support( 'post-thumbnails' );

add_action('wp_dashboard_setup', 'my_custom_dashboard_widgets');
register_sidebar(array(
	'name'          => __( 'Sidebar', 'new' ),
	'id'            => 'sidebar-1',
	'description'   => 'Global Sidebar through out the website.',
	'class'         => '',
	'before_widget' => '<li id="%1$s" class="widget %2$s">',
	'after_widget'  => '</li>',
	'before_title'  => '<h3 class="widgettitle">',
	'after_title'   => '</h3>' ));
	register_sidebar(array(
	'name'          => __( 'Sidebar_2', 'new' ),
	'id'            => 'sidebar-2',
	'description'   => 'search.',
	'class'         => '',
	'before_widget' => '<li id="%1$s" class="widget %2$s">',
	'after_widget'  => '</li>',
	'before_title'  => '<h3 class="widgettitle">',
	'after_title'   => '</h3>' ));

    
   function paginate() {
		global $wp_query, $wp_rewrite;
		$wp_query->query_vars['paged'] > 1 ? $current = $wp_query->query_vars['paged'] : $current = 1;

		$pagination = array(
		    'base' => @add_query_arg('page','%#%'),
		    'format' => '',
		    'total' => $wp_query->max_num_pages,
		    'current' => $current,
		    'show_all' => true,
		    'type' => 'list',
		    'next_text' => '<i class="fas fa-caret-right"></i>',
		    'prev_text' => '<i class="fas fa-caret-left"></i>'
		    );

		if( $wp_rewrite->using_permalinks() )
		    $pagination['base'] = user_trailingslashit( trailingslashit( remove_query_arg( 'page', get_pagenum_link( 1 ) ) ) . '?page=%#%/', 'paged' );


		if( !empty($wp_query->query_vars['s']) )
		    $pagination['add_args'] = array( 's' => get_query_var( 's' ) );

		echo paginate_links( $pagination );
	}


    
    ?>