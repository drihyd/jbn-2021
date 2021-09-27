<?php 

 $this->load->view('inc/header');

$no_sidebar_menu = array();
 $no_sidebar_menu[] = 'pages/login';
 // $no_nav[] = 'resetpassword';
 // $no_nav[] = 'reset_form';

if (!in_array($page, $no_sidebar_menu)) {

	$this->load->view('inc/sidebar-menu');
}

 
 $no_top_nav = array();
 $no_top_nav[] = 'pages/login';
 // $no_nav[] = 'resetpassword';
 // $no_nav[] = 'reset_form';

if (!in_array($page, $no_top_nav)) {

	$this->load->view('inc/top_nav');
}

$this->load->view($page);

/*if (isset($include)) {
	if (is_array($include)) {
		foreach ($include as $view) {
			$this->load->view($view);
		}
	}else{
		$this->load->view($include);
	}
}*/
$no_footer = array();
$no_footer[] = 'pages/login';
 
if (!in_array($page, $no_footer)) {
	$this->load->view('inc/footer');
}

// $this->load->view('inc/footer');