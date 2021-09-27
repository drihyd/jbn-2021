<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categoryknowmore extends MY_Controller {

    function __construct(){
        parent::__construct();
    }


    public function index()
    {
    	$data['page'] = 'page';
		$data['page_title'] = 'category-know-more | Anaya Jewellary';

		$data['content'] = $this->core->get('pages', array('slug'=>'categoryknowmore'));
		

		$this->load->view('anaya-template', $data);

     

    }
   

}

