<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Videos_upload extends MY_Controller {

    function __construct(){
        parent::__construct();
        /* <script src="<?php echo base_url(); ?>manage-assets/dropzone/dist/min/dropzone.min.js">
        
    </script>*/
    // <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.2.0/min/dropzone.min.js"></script>
        
    }
    public function index(){

    	$data['page_title'] = 'Upload Videos';
    	// $data = array();
        // $data['files'] = $this->file->getRows(); 
        $data['include_js'][] = '/manage-assets/dropzone/dist/min/dropzone.min.js'; 
        $data['include_js'][] = '/assets/js/video_upload.js'; 
        $data['page'] = 'pages/video_upload_view';
        $this->load->view('manage-template', $data);
    }
    function dragDropvideoUpload(){ 
        if(!empty($_FILES)){ 
            
            $uploadPath = '../uploads/products/videos/'; 
            $config['upload_path'] = $uploadPath; 
            $config['allowed_types'] = 'mp4|mpg|mpeg|mov|avi|wmv|flv'; 
            // $config['max_size']      = 51200;
            $config['overwrite'] = TRUE;
             
            
            $this->load->library('upload', $config); 
            $this->upload->initialize($config); 
             
            // Upload file to the server 
            if($this->upload->do_upload('file')){ 
                $fileData = $this->upload->data(); 
                $uploadData['file_name'] = $fileData['file_name']; 
                // $uploadData['uploaded_on'] = date("Y-m-d H:i:s"); 
                 
                // // Insert files info into the database 
                // $insert = $this->file->insert($uploadData); 
            } 
        } 
    } 
	public function gallery(){

    	$data['page_title'] = 'Image Gallery';
        $data['page'] = 'pages/image_gallery';
        $this->load->view('manage-template', $data);
    }
}
