<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page_links extends MY_Controller {

    function __construct(){
        parent::__construct();
    }
    public function index()
    {
        $data['page'] = 'page_links';
        $data['page_title'] = 'Home | Anaya Jewellery';
        $this->load->view('anaya-template', $data);
    }
    public function Products()
    {
        $data['page'] = 'prdcts';
        $data['page_title'] = 'Home | Anaya Jewellery';
        $this->load->view('anaya-template', $data);
    }
}