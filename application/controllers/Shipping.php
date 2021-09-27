<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'Shipping and Delivery Policy | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'shipping-and-delivery-policy'));
		

		$this->load->view('anaya-template', $data);

     

    }
   

}

