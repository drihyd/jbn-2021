<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReturnPolicy extends MY_Controller {

    function __construct(){
        parent::__construct();
    }
    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'Return Policy | Anaya Jewellary';
		$data['content'] = $this->core->get('pages', array('slug'=>'cancellation-and-refund-policy'));

		$this->load->view('anaya-template', $data);
    }
   
}

