<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class UserLogin extends MY_Controller {

public function capute_data_userTable($set,$redirectToreferr)
{
 $this->session->set_flashdata('success', 'You have successfully logged in.');
	$userMail=$set['UserEmail'];
	$where = array('UserEmail'=>$userMail);
	$this->load->model('Cart_model', 'anayacart');							
	if($userdata = $this->core->get('users', $where)) {
	/*$this->core->insert($employees, elements(array('identifier', 'firstName', 'lastName', 'photoURL', 'gender', 'email'), (array)$user_profile))*/
	if($this->core->update('users', $set, $where)) 
	log_message('info', $userMail.' Upadated ');	
	session_login($userdata);
	$this->anayacart->change_cart_customer_id($userdata->UserID);
	if (isset($redirectToreferr)) redirect($redirectToreferr, 'refresh');
	else redirect('home');
	}else{
	if ($this->core->insert('users', $set, $where)) {
	log_message('success', $userMail.' added ');	
	$userdata = $this->core->get('users', $where);
	session_login($userdata);
	$this->anayacart->change_cart_customer_id($userdata->UserID);
	}else{
	show_error('Customer addition failed');
	}	
	if(isset($redirectToreferr)) redirect($redirectToreferr, 'refresh');
	else redirect('home');
	}	
}
	public function index()
	{
		//print_r('asd'); exit();
		$this->login('Google');

	}

//http://localhost/crm/index.php/hauth/endpoint?hauth.done=Google

	public function login($provider,$page_method=false)
	{

				if($page_method=="checkout") {
				$redirectToreferr=base_url()."cart/".$page_method;
				}
				else{
					$redirectToreferr=base_url();
				}

				//log_message('debug', "controllers.Login.login($provider) called");		

			//log_message('debug', 'controllers.Login.login: loading HybridAuthLib');
			$this->load->library('HybridAuthLib');
			if($this->hybridauthlib->providerEnabled($provider))
			{				

				//log_message('debug', "controllers.Login.login: service $provider enabled, trying to authenticate.");
				$service = $this->hybridauthlib->authenticate($provider);
				if($service->isUserConnected())
				{

					//log_message('debug', 'controller.Login.login: user authenticated.');
					$user_profile = $service->getUserProfile();
					//log_message('info', 'controllers.Login.login: user profile:'.PHP_EOL.print_r($user_profile, TRUE));
					//$data['user_profile'] = $user_profile; //object	
					$set = array();
					$set['UserFirstName'] = $user_profile->displayName;
					$set['UserEmail'] = $user_profile->email;
					$set['UserGender'] = $user_profile->gender;
					$set['UserPhone'] = $user_profile->phone;
					$set['UserAddress'] = $user_profile->address;
					$set['UserCity'] = $user_profile->city;
					$set['UserCountry'] = $user_profile->country;
					$this->capute_data_userTable($set,$redirectToreferr);					
					if (isset($redirectToreferr)) redirect($redirectToreferr, 'refresh');
					else redirect('home');
				}

				else // Cannot authenticate user
				{
					die('User not connected');
					show_error('Cannot authenticate user');

				}

			}
			else // This service is not enabled.
			{
				die('Provider not enabled');
				log_message('error', 'controllers.Login.login: This provider is not enabled ('.$provider.')');
				show_404($_SERVER['REQUEST_URI']);

			}
	}

	public function endpoint()
	{

		log_message('debug', 'controllers.HAuth.endpoint called.');
		log_message('info', 'controllers.HAuth.endpoint: $_REQUEST: '.print_r($_REQUEST, TRUE));
		if ($_SERVER['REQUEST_METHOD'] === 'GET')
		{
			log_message('debug', 'controllers.HAuth.endpoint: the request method is GET, copying REQUEST array into GET array.');
			$_GET = $_REQUEST;
		}
		log_message('debug', 'controllers.HAuth.endpoint: loading the original HybridAuth endpoint script.');
		require_once APPPATH.'/third_party/hybridauth/index.php';
	}
	public function logout($provider='Google')
	{		
		session_destroy();	
		$url = base_url();
		header("Location: $url");	
		exit();
	}


	public function Facebook_Auth()
	{
		$redirectToreferr=$this->session->userdata('redirectToreferr');
		log_message('debug', 'Facebook_Auth.login: user authenticated.');
		$user_profile = $this->input->post();
		log_message('info', 'Facebook_Auth.login: user profile:'.PHP_EOL.print_r($user_profile, TRUE));	
		$set = array();
		$set['UserFirstName'] = $user_profile['name'];
		$set['UserEmail'] = $user_profile['email'];
		$set['UserFacebookID'] = $user_profile['id'];
		$this->capute_data_userTable($set,$redirectToreferr);
	   if(isset($redirectToreferr)) redirect($redirectToreferr, 'refresh');
		else redirect('home');

	}
}

/* End of file hauth.php */
/* Location: ./application/controllers/hauth.php */
