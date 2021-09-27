<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Faqs extends MY_Controller {

    function __construct(){
        parent::__construct();
    }
    public function index()
    {
        $data['page'] = 'page';
        $data['page_title'] = 'Faq | Anaya Jewellary';

        $data['content'] = $this->core->get('pages', array('slug'=>'faqs'));

        $this->load->view('anaya-template', $data);

    }
     
}

