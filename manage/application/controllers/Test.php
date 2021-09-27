<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends MY_Controller {

    function __construct(){
        parent::__construct();
        
        $this->load->model('Test_model','test');
        // $this->parent_categeories= $this->core->get('product_category',array('ParentID'=>0));
       
    }
    public function index(){

       
    }
}