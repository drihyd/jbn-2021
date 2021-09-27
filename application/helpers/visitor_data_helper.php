<?php

if( ! defined('BASEPATH')) exit('No direct script access allowed');

if( ! function_exists('collect_visitor_data')) {
	
	function collect_visitor_data() {
		
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		$visitor_ip 			= $THIS->input->ip_address();
		$visitor_user_agent 	= $THIS->input->user_agent();
		$visitor_platform 		= $THIS->agent->platform();
		$visitor_browser 		= get_brwser(); // mis-spelled because get_browser() already exists.
		$visitor_is_mobile 		= get_mobile_or_not();
		$visitor_mobile_type 	= get_mobile_type();
		$visitor_is_bot 		= get_bot_or_not();
		$visitor_source_url 	= get_source_url();
		//echo "<script>console.log('{$visitor_source_url}')</script>";
		$visitor_landed_on 		= get_current_url();

		$utm_source 			= trim($THIS->input->get('utm_source', true));
		$utm_medium 			= trim($THIS->input->get('utm_medium', true));
		$utm_campaign 			= trim($THIS->input->get('utm_campaign', true));
		$utm_term 				= trim($THIS->input->get('utm_term', true));
		$utm_content 			= trim($THIS->input->get('utm_content', true));
		
		$current_visitor_data = array(
			'visitor_ip' 			=> $visitor_ip,
			'visitor_user_agent' 	=> $visitor_user_agent,
			'visitor_platform' 		=> $visitor_platform,
			'visitor_browser' 		=> $visitor_browser,
			'visitor_is_mobile' 	=> $visitor_is_mobile,
			'visitor_mobile_type' 	=> $visitor_mobile_type,
			'visitor_is_bot' 		=> $visitor_is_bot,
			'visitor_source_url' 	=> $visitor_source_url,
			'visitor_landed_on'		=> $visitor_landed_on,
			
			'utm_source' 			=> $utm_source,
			'utm_medium' 			=> $utm_medium,
			'utm_campaign' 			=> $utm_campaign,
			'utm_term' 				=> $utm_term,
			'utm_content' 			=> $utm_content,
		);
		
		if( ! $THIS->session->userdata('visitor_data')) {
			$THIS->session->set_userdata('visitor_data', $current_visitor_data);
			//return;
		}
		
		$existing_visitor_data = $THIS->session->userdata('visitor_data');
		
		$existing_utm_source 	= $existing_visitor_data['utm_source'];
		$existing_utm_medium 	= $existing_visitor_data['utm_source'];
		$existing_utm_campaign 	= $existing_visitor_data['utm_campaign'];
		$existing_utm_term 		= $existing_visitor_data['utm_term'];
		$existing_utm_content 	= $existing_visitor_data['utm_content'];
		
		$utms = array(
			'utm_source',
			'utm_medium',
			'utm_campaign',
			'utm_term',
			'utm_content',
		);

		foreach($utms as $utm) {
			$existing = 'existing_'.$utm;
			
			// generating variable names from $utms to check and compare
			if( ($$utm != '') AND ($$utm != $$existing) ) {
				$THIS->session->set_userdata('visitor_data', $current_visitor_data);
				return;
			}
		}
		
		if( ($existing_utm_source == '') AND ($existing_utm_medium == '') AND ($existing_utm_campaign == '') AND ($existing_utm_term == '') AND ($existing_utm_content == '') ) {
			$utm_source = process_utm_source($visitor_source_url, $utm_source);
			
			$current_visitor_data['utm_source'] = $utm_source;
			$THIS->session->set_userdata('visitor_data', $current_visitor_data);
			return;
		}
			
		
		$THIS->session->set_userdata('visitor_data', $existing_visitor_data);
		return;
	}
	
	function process_utm_source($source_url, $utm_source) {
		if( ($source_url == '') AND ($utm_source == '') ) {
			$utm_source = 'D';
			return $utm_source;
		}
		
		$is_organic_lead = is_organic_lead($source_url);
		
		if( ($utm_source == '') AND ($is_organic_lead) ) {
			$utm_source = 'O';
			return $utm_source;
		}
		if( ($utm_source == '') AND ( ! $is_organic_lead) ) {
			$utm_source = 'ref-link';
			return $utm_source;
		}
		
		//return $utm_source;
	}
	
	function is_organic_lead($source_url) {
		$source_url = trim($source_url);
		
		if($source_url == '') {
			return FALSE;
		}
		
		$search_engine_strings = array(
			'www.google.',
			'www.bing.',
			// add more strings here
		);
		foreach($search_engine_strings as $string) {
			if (preg_match("/{$string}/", $source_url)) {
				return TRUE;
			}
		}
		return FALSE;
	}
	
	function get_brwser() {
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		$browser = 'unknown';
		if($THIS->agent->is_browser()) {
			$browser_name = $THIS->agent->browser();
			$browser_version = $THIS->agent->version();		
			$browser = $browser_name . ' ' . $browser_version;
		}
		return $browser;
	}
	
	function get_mobile_or_not() {
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		if($THIS->agent->is_mobile()) {
			return 1;
		}
		return 0;
	}
	
	function get_mobile_type() {
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		$mobile = 'not mobile';
		if($THIS->agent->is_mobile()) {
			$mobile = $THIS->agent->mobile();
		}
		return $mobile;
	}
	
	function get_bot_or_not() {
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		if($THIS->agent->is_robot()) {
			return 1;
		}
		return 0;
	}
	
	function get_source_url() {
		$THIS = get_instance();
		$THIS->load->library('user_agent');
		
		$source = '';
		if($THIS->agent->is_referral()) {
			$source = $THIS->agent->referrer();
		}
		return $source;
	}
		
	function get_current_url() {
		$THIS = get_instance();
		$THIS->load->helper('url');
		
		return current_url();
	}

}

if( ! function_exists('session_get_visitor_data')) {
	
	function session_get_visitor_data() {
		$THIS = get_instance();
		$visitor_data = $THIS->session->userdata('visitor_data');
		if( ! $visitor_data) {
			return 0;
		}
		return $visitor_data;
	}
}
