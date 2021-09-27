<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products_list extends MY_Controller {

    function __construct(){
        parent::__construct();
        // $this->load->model('Product_model','product',TRUE);
    }
    public function index()
    {
    	$data['page'] = 'products_list_view';
		$data['page_title'] = 'Products | Anaya Jewellary';
		 // $data['products'] = $this->product->get_products();
		$this->load->view('anaya-template', $data);
    }
}