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

		$auth = array(
				'super_admin'=>1,
				'admin'=>2,
				'inventory_manager'=>3,					
				'print_manager'=>3,
				'order_manager'=>3,
				'blankcases_manager'=>3,
		);


		$user_data = $user_data[0];
		$ci->session->set_userdata('mec_user_data', $user_data);
		$ci->session->set_userdata('mec_user', $user_data->role);
		$ci->session->set_userdata('mec_username', $user_data->username);
		$ci->session->set_userdata('mec_logged_in', true);		
		$ci->session->set_userdata('mec_started_at',time());

		//

		if (in_array($user_data->role, array_keys($auth)) ) {

			$ci->session->set_userdata('mec_authLevel',$auth[$user_data->role]);

		}else{

			$ci->session->set_userdata('mec_authLevel',4);
		}/**/	
		//print_r($ci->session->mec_authLevel); exit();
		return;

	}

}

if( ! function_exists('session_logout')) {

	function session_logout() {

		$ci = &get_instance();

		$ci->session->unset_userdata('mec_user_data');

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

if ( ! function_exists('pretty_print')) {
	function pretty_print($string) {
		print("<pre>".print_r($string,true)."</pre>");
	
	}
}

if ( ! function_exists('get_academic_year')) {
	function get_academic_year() {
		$cur_month =date('m');
            if ($cur_month >= 7) {
                $next_year = date('y')+1;
                $academic_year = date('Y').'-'.$next_year;
            }else{
                $prev_year = date('Y')-1;
                $academic_year = $prev_year.'-'.date('y');
            }
       return $academic_year;
	}
}
if ( ! function_exists('select_dropdown')) {
	function select_dropdown($table=false,$id=false,$value=false,$orderBy='ASC') {
      $items = array();
      $CI =& get_instance();
      if($orderBy) {
          $CI->db->order_by($value,$orderBy);
      }
      $query = $CI->db->select("$id,$value")->from($table)->get();
      if ($query->num_rows() > 0) {
      		$items =array(''=>'Pick one');	
          foreach($query->result() as $data) {
              $items[$data->$id] = $data->$value;
          }

          // echo '<pre>'; print_r($items); exit();
          $query->free_result();
          
          return $items;
        // return  html_dropdown($items,$table,$option_id);
      }
  }
}

/*if ( ! function_exists('html_dropdown')) {
	function html_dropdown($string=false,$table=false,$option_id=false) {

	$str='';
	$str.='<select class="form-control" name="'.$table.'" id="'.$table.'" required>';
	$str.='<option value="">Pick one</option>';
	foreach ($string as $key => $value) {
		if($option_id==$key)
		{
			$str.='<option value="'.$key.'" selected>'.$value.'</option>';
		}
		else
		{
			$str.='<option value="'.$key.'">'.$value.'</option>';
		}

	}
	
	$str.='</select>';
	return $str;
	
	}

}*/





