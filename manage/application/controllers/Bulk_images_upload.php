<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bulk_images_upload extends MY_Controller {

    function __construct(){
        parent::__construct();
    }
    public function index(){

    	$data['page_title'] = 'Upload Images';
        $data['page'] = 'pages/bulk_upload_images';
        $this->load->view('manage-template', $data);
    }
    function doupload() {
   		$data = [];
   		$files = $_FILES;
		$count = count($_FILES['files']['name']);

		for($i=0;$i<$count;$i++){

		    if(!empty($_FILES['files']['name'][$i])){

		      	$_FILES['file']['name'] = $_FILES['files']['name'][$i];
			    $_FILES['file']['type'] = $_FILES['files']['type'][$i];
			    $_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
			    $_FILES['file']['error'] = $_FILES['files']['error'][$i];
			    $_FILES['file']['size'] = $_FILES['files']['size'][$i];
			    $path = '../uploads/products/';
			    $config['upload_path'] = $path; 
			    $config['allowed_types'] = 'jpg|jpeg|png';
			    // $config['max_size'] = '5000';
			    $config['file_name'] = $_FILES['files']['name'][$i];

			    $this->load->library('upload',$config); 

			    if($this->upload->do_upload('file')){
			       	$uploadData = $this->upload->data();
			        $filename = $uploadData['file_name'];
			        $data['totalFiles'][] = $filename;
			    }
		    }
		}
		redirect('bulk_images_upload/gallery');
      $this->load->view('manage-template', $data);
	}
	public function gallery(){

    	$data['page_title'] = 'Image Gallery';
        $data['page'] = 'pages/image_gallery';
        $this->load->view('manage-template', $data);
    }
}
