<?php

defined('BASEPATH') OR exit('No direct script access allowed');



if ( ! function_exists('is_valid_indian_mobile_number')) {

	function is_valid_indian_mobile_number($phone_number) {

        $matches = null;

        preg_match('/^(((\+?91|0)\-?)?)?\d{10}$/', $phone_number, $matches);

        if ($matches) {

            return true;

        }

        return false;

    }

}
if ( ! function_exists('isJson')) {
	function isJson($string) {
		if (is_string($string)) {
			 json_decode($string);
			return (json_last_error() == JSON_ERROR_NONE);
		}
		return false;
	
	}
}

if ( ! function_exists('rmdir_recursive')) {

	function rmdir_recursive($dir, $deleteFolder=false) 
	{	

		if (file_exists($dir)) {
		    foreach(scandir($dir) as $file) {
		        if ('.' === $file || '..' === $file) continue;
		        if (is_dir("$dir/$file")) $this->rmdir_recursive("$dir/$file");
		        else unlink("$dir/$file");
		    }
		    if ($deleteFolder == true) rmdir($dir);

		    return TRUE;
		}else{
			return false;
		}
	}
}

if( ! function_exists('get_file_extension')) {

	function get_file_extension($file_name) {

		return substr(strrchr($file_name,'.'),1);

	}

}



if( ! function_exists('session_login')) {

	function session_login($user_data) {

		$ci = &get_instance();
		if (isset($user_data) && $user_data != '') {
			$ci->session->set_userdata('anaya_user_data', $user_data);
			$ci->session->set_userdata('anaya_user', $user_data->UserFirstName);
			$ci->session->set_userdata('anaya_logged_in', true);		
			$ci->session->set_userdata('anaya_started_at',time());
		}	
	
		return;

	}

}

if( ! function_exists('getRealIpAddr')) {

	function getRealIpAddr()
	{
	    if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
	    {
	      $ip=$_SERVER['HTTP_CLIENT_IP'];
	    }
	    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
	    {
	      $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
	    }
	    else
	    {
	      $ip=$_SERVER['REMOTE_ADDR'];
	    }
	    return $ip;
	}

}

if( ! function_exists('session_logout')) {

	function session_logout() {

		$ci = &get_instance();

		$ci->session->unset_userdata('zap_user_data');

		session_destroy();

		return;

	}

}


if ( ! function_exists('generate_alert_success')) {

	function generate_alert_success($message) {

		return "<div class='alert alert-success alert-dismissible fade in' role='alert'> <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button> {$message}</div>";

	}

}



if ( ! function_exists('generate_alert_danger')) {

	function generate_alert_danger($message) {

		return "<div class='alert alert-danger alert-dismissible fade in' role='alert'> <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button> {$message}</div>";

	}

}



function fileUpload($file, $uploadPath)

{

	$ci =& get_instance();

    $ci->load->helper(array('form','url'));

     

	$config['allowed_types'] = 'gif|jpeg|jpg|png';

	$config['upload_path'] = $uploadPath;

	$config['max_size'] = 100000;	

	$ci->load->library('upload', $config);



//print_r($_FILES); exit();

	if ($ci->upload->do_upload($file))	return $ci->upload->data('file_name');

	else return false;

	    	    

}
    function paragraph_limit($str, $limit=100, $strip = false) {
    $str = ($strip == true)?strip_tags($str):$str;
    if (strlen ($str) > $limit) {
        $str = substr ($str, 0, $limit - 3);
        return (substr ($str, 0, strrpos ($str, ' ')).'...');
    }
    return trim($str);
}



if ( ! function_exists('field_enums'))
{
    function field_enums($table = '', $field = '')
    {
        $enums = array();
        if ($table == '' || $field == '') return $enums;
        $CI =& get_instance();
        preg_match_all("/'(.*?)'/", $CI->db->query("SHOW COLUMNS FROM {$table} LIKE '{$field}'")->row()->Type, $matches);
        foreach ($matches[1] as $key => $value) {
            $enums[$value] = $value; 
        }
        return $enums;
    }  
}
if(!function_exists('count_cart'))
{
function count_cart()
{		
		$ci = &get_instance();	
		$products = $ci->purchase_cart->get_cart_items();
		$data=$ci->purchase_cart->get_summary_prices($products);
		return $data;

 }
}

if(!function_exists('count_wishlists'))
{
function count_wishlists()
{		
		$ci = &get_instance();	

		$wishlists = $ci->purchase_cart->get_wishlists(MY_SESSION_ID);		
		$nof_records=count((array)$wishlists);
		if($wishlists!=false){
		if($nof_records>0){
			return $nof_records;
		}
		else{
			return 0;
		 }
		}
		else{
			return 0;
		}
		
}
}