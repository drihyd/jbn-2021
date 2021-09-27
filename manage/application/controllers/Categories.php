<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categories extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_model','datatable');
        $this->load->model('Core_model','core');
        $this->parent_categeories= $this->core->get('product_category',array('ParentID'=>0));
       
    }
    public function index(){

        $data['page_title'] = 'Categories';
        $data['page'] = 'categeories/categeories';
        $data['categeoriesinfo']=$this->core->get('product_category');

        
        $this->load->view('manage-template', $data);
    }
    public function ajax_list(){
        // die('hello');
        $table="product_category";
        $list = $this->datatable->get_datatables($table);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = $_POST['start'];
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = $sno;
            $row[] = ucwords($item->CategoryName);
            if($item->CategoryImage)
                $row[] = '<a href="'.base_url('upload/'.$item->CategoryImage).'" target="_blank"><img src="'.base_url(''.$item->CategoryImage).'"  width="40" /></a>';
            else
                $row[] = '(No photo)';
            $row[] = ucwords($item->CategoryDesc);
            $row[] = "<a href=".base_url()."categeories/edit/".$item->CategoryID."><i class='fa fa-pencil-square-o'></i></a>/<a href='#' onclick='return trash_categeory_record(".$item->CategoryID.")'><i class='fa fa-trash-o'></i></a>";
            $data[] = $row;
            $sno++;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->datatable->count_all($table),
                        "recordsFiltered" => $this->datatable->count_filtered($table),
                        "data" => $data,
                );
         echo json_encode($output);
    }
    public function view($CategoryID=NULL) {
        $data['page_title'] = 'View Categeory';
        $data['page'] = 'categeories/view_categeory';
        $data['categeoriesinfo'] = $this->core->get('product_category',array('CategoryID'=>$CategoryID))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function add() {

        $data['parent_categeories'] = $this->core->get('product_category',array('ParentID'=>0));
        $data['custom_attributes_info'] = $this->core->get('custom_attributes');
        $this->form_validation->set_rules('CategoryName', 'Category Name', 'required|trim|xss_clean|is_unique[product_category.CategoryName]');
        $this->form_validation->set_rules('CategoryDesc', 'Category Description', 'trim|required');
        $this->form_validation->set_rules('CategorySlug', 'Category Slug', 'trim|required|xss_clean|is_unique[product_category.CategorySlug]');
        // $this->form_validation->set_rules('SEOTitle', 'SEO Title', 'trim|required');
        // $this->form_validation->set_rules('SEODescription', 'SEO Description', 'trim|required');
        // $this->form_validation->set_rules('SEOKeywords', 'SEO Keywords', 'trim|required');
        // $this->form_validation->set_rules('ParentID', 'ParentID', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Add Category';
            $data['page'] = 'categeories/add_categeory';
            $data['include_js'][] = '/assets/js/category.js'; 
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $path = '../uploads/categories';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $config['overwrite'] = TRUE;
            $config['file_name'] = $post_fields['CategorySlug'];
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   
                   
            if (!$this->upload->do_upload('CategoryImage')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $data = array('upload_data' => $this->upload->data());
            }

            if (!empty($data['upload_data']['file_name'])) {
                $import_file = $data['upload_data']['file_name'];
            } else {
                $import_file = 0;
            }
            $inputFileName = $path .'/'. $import_file;
            // $post_fields = $this->security->xss_clean($this->input->post());
            $categeory_data = array();
            $categeory_data['CategoryName']     = $post_fields['CategoryName'];

            if (isset($post_fields['is_customizable'] )) {
                $categeory_data['is_customizable'] = 1;
             }else{
                $categeory_data['is_customizable'] = 0; 
             }
            $categeory_data['ParentID'] = $post_fields['ParentID'];
            $categeory_data['CategoryDesc']     = $post_fields['CategoryDesc'];
            $categeory_data['CategorySlug']     = $post_fields['CategorySlug'];
            $categeory_data['SEOTitle']         = $post_fields['SEOTitle'];
            $categeory_data['SEODescription']   = $post_fields['SEODescription'];
            $categeory_data['SEOKeywords']      = $post_fields['SEOKeywords'];
            // $categeory_data['is_customizable']      = $post_fields['is_customizable'];
            $categeory_data['custom_size']      = $post_fields['custom_size'];
            $categeory_data['CategoryImage']    = $inputFileName;
            $categeory_data['custom_attributes']    = json_encode($post_fields['custom_attributes']);

            if ($this->core->insert('product_category',$categeory_data)) {
                $this->session->set_flashdata('success', 'Categeory added successfully');
                redirect('categories');
            }else{
                $this->session->set_flashdata('error', 'Categeory inserted failed');
                // redirect('categeories/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    public function edit($id = NULL)
    {
        $CategoryID = $this->input->post('CategoryID');
        $this->form_validation->set_rules('CategoryName', 'Category Name', 'required|trim|xss_clean');
        $this->form_validation->set_rules('CategoryDesc', 'Category Description', 'trim|required');
        $this->form_validation->set_rules('CategorySlug', 'Category Slug', 'trim|required|xss_clean');
        // $this->form_validation->set_rules('SEOTitle', 'SEO Title', 'trim|required');
        // $this->form_validation->set_rules('SEODescription', 'SEO Description', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Category';
            $data['page'] = 'categeories/edit_categeory';
            $data['include_js'][] = '/assets/js/category.js';
            $data['custom_attributes_info'] = $this->core->get('custom_attributes');
            $data['categeoriesinfo'] = $this->core->get("product_category", array('CategoryID'=>$id))[0];
            // $this->load->view('manage-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
                $categeory_data = array();
                    
            if (isset($post_fields['is_customizable'] )) {
                $categeory_data['is_customizable'] = 1;
                $categeory_data['custom_size']      = $post_fields['custom_size'];
             }else{
                $categeory_data['is_customizable'] = 0; 
                $categeory_data['custom_size']      = '';
             }
                $categeory_data['CategoryName']     = $post_fields['CategoryName'];
                $categeory_data['ParentID'] = $post_fields['ParentID'];
                
                $categeory_data['CategoryDesc']     = $post_fields['CategoryDesc'];
                $categeory_data['CategorySlug']     = $post_fields['CategorySlug'];
                $categeory_data['SEOTitle']         = $post_fields['SEOTitle'];
                $categeory_data['SEODescription']   = $post_fields['SEODescription'];
                $categeory_data['SEOKeywords']      = $post_fields['SEOKeywords'];
                $categeory_data['custom_attributes']    = json_encode($post_fields['custom_attributes']);

            if ($_FILES['CategoryImage']['name']) { 
           
            $post_fields = $this->security->xss_clean($this->input->post());
            $path = '../uploads/categories';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $config['overwrite'] = TRUE;
            $config['file_name'] = $post_fields['CategorySlug'];
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   

            if (!$this->upload->do_upload('CategoryImage')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $upload_data = array('upload_data' => $this->upload->data());
                $import_file = $upload_data['upload_data']['file_name'];
                $inputFileName = $path .'/'. $import_file;              
                $categeory_data['CategoryImage'] = $inputFileName;
            }   
        }else{
            $data['categeoriesinfo'] = $this->core->get("product_category", array('CategoryID'=>$CategoryID));
            $post_fields = $this->security->xss_clean($this->input->post());
            $path = '../uploads/categories';
            $upload_data = array('upload_data' => $this->upload->data());
            $previous_name = $data['categeoriesinfo'][0]->CategoryImage;
            $ext = pathinfo($previous_name, PATHINFO_EXTENSION);
            $new_name= $path .'/'.$post_fields['CategorySlug'].'.'.$ext;
            if (file_exists($previous_name)) {
                if (rename($previous_name, $new_name)) {
                    $inputFileName= $new_name;
                } 
            }
            $categeory_data['CategoryImage'] = isset($inputFileName)?$inputFileName:"";
        }
            if ($this->core->update('product_category',$categeory_data,array('CategoryID'=>$CategoryID))) {
                $this->session->set_flashdata('success', 'Category updated successfully');
                redirect('categories');
            }else{
                $this->session->set_flashdata('error', 'Category updation failed');
               redirect('categories/edit/'.$CategoryID);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($id=NULL)
    {
        $result = $this->core->delete("product_category", array('CategoryID'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Category deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Category deletion failed');
        }
    
    redirect('categories'); 
    }
}