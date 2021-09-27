<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Paymentoptions extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'Payment Options | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'payment-options'));
		

		$this->load->view('anaya-template', $data);

    }
   

}

