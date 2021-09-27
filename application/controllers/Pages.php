<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends MY_Controller {

    function __construct(){
        parent::__construct();
        

    }
    public function index(){

        $data['page'] = 'Home';
        $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));

    }
    public function view($slug=null)
    {
    	$data['page'] = 'page';
		$data['page_title'] = $slug.' | Anaya Jewellary';
		$data['content_page'] = $this->core->get('pages', array('slug'=>$slug));
		$this->load->view('anaya-template', $data);
        
    }
    public function support()
    {
        $data['page'] = 'support';
        $data['page_title'] = 'Support | Anaya Jewellary';
        // $data['content_page'] = $this->core->get('pages', array('slug'=>$slug));
        $this->load->view('anaya-template', $data);
    }
   

}

