<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PrivacyPolicy extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'PrivacyPolicy | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'privacy-policy'));
		

		$this->load->view('anaya-template', $data);

     

    }
   

}

