<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Disclaimer extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'Disclaimer | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'disclaimer'));
		

		$this->load->view('anaya-template', $data);

     

    }
   

}

