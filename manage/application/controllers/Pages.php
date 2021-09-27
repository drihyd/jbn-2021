<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends MY_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('Pages_model', 'pages', TRUE);
        /*<script src="<?php echo base_url(); ?>manage-assets/ckeditor/build-config.js"> 
    </script>
    <script src="<?php echo base_url(); ?>manage-assets/ckeditor/ckeditor.js"></script>
    <script src="<?php echo base_url(); ?>manage-assets/ckeditor/config.js"></script>
    <script src="<?php echo base_url(); ?>manage-assets/ckeditor/styles.js"></script>*/
     /*CKEditor
     <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>*/

    }
    public function index(){

        $data['page_title'] = 'Pages';
        $data['page'] = 'pages/page_view';
        $pages = $this->core->get('pages',array('id'));
        $data['pages'] = $pages;
        // echo '<pre>'; print_r($pages); exit();
        $this->load->view('manage-template', $data);
    }

    public function view($id=NULL){
        $data['pageinfo'] = $this->core->get("pages", array('id'=>$id))[0];
        // echo '<pre>'; print_r($data); exit();
        $data['page_title'] = 'page';
        $data['page'] = 'pages/single_page_view';
        $this->load->view('manage-template', $data);

    }
    public function add() {

        $this->form_validation->set_rules('name', 'Page Name', 'trim|required');
        $this->form_validation->set_rules('title', 'Page Title', 'trim|required');
        $this->form_validation->set_rules('slug', 'Slug', 'trim|required');
        $this->form_validation->set_rules('content', 'Content', 'trim|required');
        // $this->form_validation->set_rules('keywords', 'Keywords', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Pages';
            $data['page'] = 'pages/page_add';
            $data['include_js'][] = '/assets/js/category.js';
            $data['include_js'][] = '/manage-assets/ckeditor/build-config.js';
            $data['include_js'][] = '/manage-assets/ckeditor/ckeditor.js';
            $data['include_js'][] = '/manage-assets/ckeditor/config.js';
            $data['include_js'][] = '/manage-assets/ckeditor/styles.js';
            $data['include_js'][] = '/assets/js/page.js';

        }else{

            $path = 'page_images';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   
                   
            if (!$this->upload->do_upload('FeaturedImage')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $data = array('upload_data' => $this->upload->data());
            }

              if (!empty($data['upload_data']['file_name'])) {
                $import_file = $data['upload_data']['file_name'];
            } else {
                $import_file = 0;
            }
            if ($import_file != 0) {
                $inputFileName = $path .'/'. $import_file;
            }else{
               $inputFileName = ''; 
            }
            

            $post_fields = $this->security->xss_clean($this->input->post());
            $pages_data = array();

            $pages_data['name']                 = $post_fields['name'];
            $pages_data['title']                = $post_fields['title'];
            $pages_data['slug']                 = $post_fields['slug'];
            $pages_data['content']              = $post_fields['content'];
            $pages_data['keywords']             = $post_fields['keywords'];
            $pages_data['order_logic']          = $post_fields['order_logic'];
            $pages_data['featured_image_path']  = $inputFileName;

            if ($this->core->insert('pages',$pages_data)) {
                $this->session->set_flashdata('success', 'New Page inserted successfully');
                redirect('pages');
            }else{
                $this->session->set_flashdata('error', 'Page inserted failed');
                redirect('pages/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    // public function edit($id = NULL) {
    //     $data['page_title'] = 'Edit Page';
    //     $data['page'] = 'pages/page_edit';
        
    //     $data['include_js'][] = '/manage-assets/ckeditor/build-config.js';
    //     $data['include_js'][] = '/manage-assets/ckeditor/ckeditor.js';
    //     $data['include_js'][] = '/manage-assets/ckeditor/config.js';
    //     $data['include_js'][] = '/manage-assets/ckeditor/styles.js';
    //     $data['include_js'][] = '/assets/js/page.js';
    //     $data['pageinfo'] = $this->core->get("pages", array('id'=>$id))[0];

    //     // echo '<pre>'; print_r($data); exit();

    //     $this->load->view('manage-template', $data);
    // }
    public function edit($id = NULL)
    {

        // $data['page_title'] = 'Edit Page';
        $pageID = $this->input->post('pageID');
        $this->form_validation->set_rules('name', 'Page Name', 'trim|required');
        $this->form_validation->set_rules('title', 'Page Title', 'trim|required');
        $this->form_validation->set_rules('slug', 'Slug', 'trim|required');
        $this->form_validation->set_rules('content', 'Content', 'trim|required');
        // $this->form_validation->set_rules('keywords', 'Keywords', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Page';
            $data['page'] = 'pages/page_edit';
            $data['include_js'][] = '/assets/js/category.js';
            $data['include_js'][] = '/manage-assets/ckeditor/build-config.js';
            $data['include_js'][] = '/manage-assets/ckeditor/ckeditor.js';
            $data['include_js'][] = '/manage-assets/ckeditor/config.js';
            $data['include_js'][] = '/manage-assets/ckeditor/styles.js';
            $data['include_js'][] = '/assets/js/page.js';
            $data['pageinfo'] = $this->core->get("pages", array('id'=>$id))[0];
        }else{
          
            $post_fields = $this->security->xss_clean($this->input->post());
            
             
                $pages_data = array();

                $pages_data['name']                 = $post_fields['name'];
                $pages_data['title']                = $post_fields['title'];
                $pages_data['slug']                 = $post_fields['slug'];
                $pages_data['content']              = $post_fields['content'];
                $pages_data['keywords']             = $post_fields['keywords'];
                $pages_data['order_logic']          = $post_fields['order_logic'];
                // $pages_data['featured_image_path']  = $inputFileName;
                //$categeory_data['CategoryImage']    = $inputFileName;

            if ($_FILES['FeaturedImage']['name']) { 
           
    
            $path = 'page_images';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   
                   
            if (!$this->upload->do_upload('FeaturedImage')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $upload_data = array('upload_data' => $this->upload->data());
                $import_file = $upload_data['upload_data']['file_name'];
                $inputFileName = $path .'/'. $import_file;              
                $pages_data['featured_image_path'] = $inputFileName;
                //unlink('./categeory_images/'.$products[0]->CategoryImage);
            }
            
        }
            if ($this->core->update('pages',$pages_data,array('id'=>$pageID))) {
                $this->session->set_flashdata('success', 'Page updated successfully');
                redirect('pages');
            }else{
                $this->session->set_flashdata('error', 'Page updation failed');
               redirect('pages/edit/'.$pageID);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($id=NULL)
    {
        $result = $this->core->delete("pages", array('id'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Page deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'page deletion failed');
        }
    
    redirect('pages'); 
    }
}