<?php
if( ! defined('BASEPATH'))
	exit('No direct script access allowed');
	
if( ! function_exists('initiate_session')) {
	
	// function session_initiate() {
	// 	$THIS = get_instance();
	// 	init_session_data();
	// }
	
	function init_session_data() {
		$THIS = get_instance();
		if( ! $THIS->session->userdata('session_data')) {
			$session_id = $THIS->session->session_id;
			$session_data = array(
				'logged_in' => FALSE,
				'user_data' => FALSE,
			);
			$THIS->session->set_userdata('session_id', $session_id);
			$THIS->session->set_userdata('session_data', $session_data);
		}
		return;
	}
}


if( ! function_exists('session_get_id')) {
	
	function session_get_id() {
		$THIS = get_instance();
		return $THIS->session->session_id;
	}
	
}

if( ! function_exists('session_get_data')) {
	function session_get_data() {
		$THIS = get_instance();
		return $THIS->session->userdata('session_data');
	}
}

if( ! function_exists('session_get_user_data')) {
	function session_get_user_data() {
		$THIS = get_instance();
		$session_data = $THIS->session->userdata('session_data');
		return $session_data['user_data'];
	}
}

if( ! function_exists('session_get_username')) {
	function session_get_username() {
		$THIS = get_instance();
		//$session_data = $THIS->session->userdata('session_data');
		$username = $THIS->session->zap_username;
		if( ! $username) {
			return 0;
		}
		return $username;
	}
}

if( ! function_exists('session_get_user_type')) {
	function session_get_user_type() {
		$THIS = get_instance();
		$session_data = $THIS->session->userdata('session_data');
		$user_data = $session_data['user_data'];
		if( ! $user_data) {
			return 0;
		}
		return $user_data['user_type'];
	}
}