<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('initiate_page')) {
	
	function initiate_page() {
		 
		// Get a reference to the controller object
		$THIS = get_instance();
		$THIS->load->model('model_users', 'users');

		$logged_in = $THIS->users->check_logged_in();
		
		if($logged_in === FALSE) {
			redirect('login', 'refresh');
		}
		
		$user_data = $logged_in;
		
		$data = array(
			'user_id' => $user_data['id'],
			'username' => $user_data['username'],
			'user_email' => $user_data['email'],
			'user_type' => $user_data['type'],
		);
		
		return $data;
	}
}
