<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TermsConditions extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'Terms & Conditions | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'terms-and-conditions'));
		$this->load->view('anaya-template', $data);

     

    }
   

}

