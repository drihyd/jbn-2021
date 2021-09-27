<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if ( ! function_exists('log_action')) {
	
	function log_action($action_name, $action_dump='', $log_to_DB=NULL) {
		
		$table = 'actionlogs';
		
		$THIS = get_instance();
		$THIS->load->helper('email_helper');
		
		$session_id 	= session_get_id();
		$username 	= session_get_username();
		$action_dump 	= json_encode($action_dump);
		$ip 			= $THIS->input->ip_address();
		
		$time = date('M-d-Y H:i:s', time());
		$message = "action: {$action_name} | session_id: {$session_id} | username: {$username} | action_dump: {$action_dump} | time: {$time} | ip: {$ip}" . "\n";
		
		$path = APPPATH . 'logs/' . date('M-Y', time()) . '_actionlogs';
		if( ! file_exists($path)) {
			mkdir($path, 0755, true);
		}
		$log_file = $path . '/' . date('M-d-Y', time()) . '_actionlogs.log';
		error_log($message, 3, $log_file);
		
		if($log_to_DB) {
			
			$new_data = array(
				'actionlog_session_id' => $session_id,
				'actionlog_user_id' => $user_id,
				'actionlog_action_name' => $action_name,
				'actionlog_action_dump' => $action_dump,
				'actionlog_date_created' => date('Y-m-d H:i:s', time()),
			);
			
			$THIS->db->insert($table, $new_data);
		}
		
	}
	
}

if ( ! function_exists('log_this_error')) {
	
	function log_this_error($error, $db_query=FALSE, $db_error=FALSE, $log_to_DB=FALSE) {
		$THIS = get_instance();
		
		$table = 'errorlogs';
		$THIS = get_instance();
		$THIS->load->helper('email_helper');
		
		$debug = debug_backtrace();
		$last_debug = $debug[1];
		
		$message = generate_error_message($error, $db_query, $db_error, $last_debug);
		
		$path = APPPATH . 'logs/' . date('M-Y', time()) . '_errors';
		if( ! file_exists($path)) {
			mkdir($path, 0755, true);
		}
		$log_file = $path . '/' . date('M-d-Y', time()) . '_errors.log';
		error_log($message, 3, $log_file);
		
		return;
	}
	
	function generate_error_message($error, $db_query, $db_error, $last_debug) {
		$THIS = get_instance();
		
		$session_id = session_get_id();
		$user_id = session_get_user_id();
		$time = date('M-d-Y H:i:s', time());
		
		$query = FALSE;
		if($db_query) {
			$query = $THIS->db->last_query();
		}
		
		$db_message = FALSE;
		if($db_error) {
			$db_message = json_encode($THIS->db->error());
		}
		
		$file = '';
		if(isset($last_debug['file'])) {
			$file = $last_debug['file'];
		}
		$line = '';
		if(isset($last_debug['line'])) {
			$line = $last_debug['line'];
		}
		$function = '';
		if(isset($last_debug['function'])) {
			$function = $last_debug['function'];
		}
		$class = '';
		if(isset($last_debug['class'])) {
			$class = $last_debug['class'];
		}
		
		$message  = "";
		$message .= "Application error \n";
		$message .= "{$error} \n";
		$message .= "File: {$file} \n";
		$message .= "Line: {$line} \n";
		$message .= "Function: {$function} \n";
		$message .= "Class: {$class} \n";
		if($query) {
			$message .= "--- \n";
			$message .= "DB Problem \n";
			$message .= "Query: {$query} \n";
			$message .= "Sys msg: {$db_message}";
			$message .= "--- \n";
		}
		$message .= "--- \n";
		$message .= "Session ID: {$session_id} \n";
		$message .= "user ID: {$user_id} \n";
		$message .= "--- \n";
		$message .= "Date: " . date('M-d, Y, H:i:s', time()) . "\n";
		
		return $message;
	}
	
}