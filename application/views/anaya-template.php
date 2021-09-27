<?php 

 $this->load->view('includes/header');
 
 $no_nav = array();
 $no_nav[] = 'Login';
 $no_nav[] = 'forgot_password_form';
 $no_nav[] = 'ResetPassword';
 $no_nav[] = 'mobile_verify';
 $no_nav[] = 'PrintApplication';
 $no_nav[] = 'termsAndConditions';
 $no_nav[] = 'privacy-policy';
 $no_nav[] = 'newPassword';

if (!in_array($page, $no_nav)) {

	$this->load->view('includes/nav');
	
}
$no_menu = array();
 $no_menu[] = 'Login';
 $no_menu[] = 'forgot_password_form';
 $no_menu[] = 'ResetPassword';
 $no_menu[] = 'mobile_verify';
 $no_menu[] = 'PrintApplication';
 $no_menu[] = 'guide';
 $no_menu[] = 'termsAndConditions';
 $no_menu[] = 'privacy-policy';
 $no_menu[] = 'newPassword';
 $no_menu[] = 'changepassword';
 if (!in_array($page, $no_menu)) {

	//$this->load->view('includes/menu');
	
}

$this->load->view('pages/'.strtolower($page));

/*if (isset($include)) {
	if (is_array($include)) {
		foreach ($include as $view) {
			$this->load->view($view);
		}
	}else{
		$this->load->view($include);
	}
}*/
 $no_footer_nav = array();
 $no_footer_nav[] = 'Login';
 $no_footer_nav[] = 'ResetPassword';
 $no_footer_nav[] = 'mobile_verify';
 $no_footer_nav[] = 'PrintApplication';
 $no_footer_nav[] = 'termsAndConditions';
 $no_footer_nav[] = 'privacy-policy';
 $no_footer_nav[] = 'newPassword';

if (!in_array($page, $no_footer_nav)) {
	$this->load->view('includes/footer-nav');
}
 

$this->load->view('includes/footer');
