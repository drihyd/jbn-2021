<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_groups extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_model','datatable');
        $this->load->model('Core_model','core');
        $this->parent_categeories= $this->core->get('options_group');
        $this->material_type= $this->core->get('material_type');

        // echo '<pre>'; print_r($this->parent_categeories); exit();
       
    }
    public function index(){

        $data['page_title'] = 'Product Groups';
        $data['page'] = 'product_groups/product_groups';
        $data['product_groupsinfo']=$this->core->get('options_group');
        $data['product_group_otionsinfo']=$this->core->get_order_by('productoptions',"OptionName");

        // echo '<pre>'; print_r($data); exit();

        $this->load->view('manage-template', $data);
    }
    
    public function view($CategoryID=NULL) {
        $data['page_title'] = 'View product group';
        $data['page'] = 'product_groups/view_categeory';
        $data['product_groupsinfo'] = $this->core->get('product_category',array('CategoryID'=>$CategoryID))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function add() {

        $this->form_validation->set_rules('OptionGroupName', 'GroupName', 'required|trim|xss_clean|is_unique[options_group.OptionGroupName ]');
        $this->form_validation->set_rules('material_type_id', 'Material', 'trim|required');
        $this->form_validation->set_rules('slug', 'Group Slug', 'trim|required|xss_clean|is_unique[options_group.slug]');
        
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Add Group Option';
            $data['page'] = 'product_groups/add_product_group';
            $data['include_js'][] = '/assets/js/category.js'; 
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            
            $groupoption_data = array();
            $groupoption_data['OptionGroupName']      = $post_fields['OptionGroupName'];
            $groupoption_data['slug']      = $post_fields['slug'];
            $groupoption_data['Display']           = 'yes';
            $groupoption_data['material_type_id']  = $post_fields['material_type_id'];
            

            if ($this->core->insert('options_group',$groupoption_data)) {
                $this->session->set_flashdata('success', 'Group Option added successfully');
                redirect('product_groups');
            }else{
                $this->session->set_flashdata('error', 'Group Option inserted failed');
                // redirect('categeories/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    public function edit($id = NULL)
    {
        $GroupOptionID = $this->input->post('OptionGroupID');
        $this->form_validation->set_rules('OptionGroupName', 'GroupName', 'required|trim|xss_clean');
        $this->form_validation->set_rules('material_type_id', 'Material', 'trim|required');
        $this->form_validation->set_rules('slug', 'Group Slug', 'trim|required|xss_clean');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Group option';
            $data['page'] = 'product_groups/edit_product_group';
            $data['include_js'][] = '/assets/js/category.js';
            $data['product_groupsinfo'] = $this->core->get("options_group", array('OptionGroupID'=>$id))[0];
            // $this->load->view('manage-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
                $groupoption_data = array();
            $groupoption_data['OptionGroupName']      = $post_fields['OptionGroupName'];
            $groupoption_data['slug']      = $post_fields['slug'];
            $groupoption_data['Display']           = 'yes';
            $groupoption_data['material_type_id']  = $post_fields['material_type_id'];
                    
            

            
            if ($this->core->update('options_group',$groupoption_data,array('OptionGroupID'=>$GroupOptionID))) {
                $this->session->set_flashdata('success', 'Group Option updated successfully');
                redirect('product_groups');
            }else{
                $this->session->set_flashdata('error', 'Group Option updation failed');
               redirect('product_groups/edit/'.$GroupOptionID);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($id=NULL)
    {
        $result = $this->core->delete("options_group", array('OptionGroupID'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Group Option deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Group Option deletion failed');
        }
    
    redirect('product_groups'); 
    }

    public function add_option() {

        $this->form_validation->set_rules('OptionGroupID', 'GroupName', 'required|trim|xss_clean');
        $this->form_validation->set_rules('OptionName', 'Option Name', 'trim|required');
        
        
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Add Group Option';
            $data['page'] = 'product_groups/add_product_group';
            $data['include_js'][] = '/assets/js/category.js'; 
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            
            $groupoption_data = array();
            $groupoption_data['OptionGroupID']      = $post_fields['OptionGroupID'];
            $groupoption_data['OptionName']      = $post_fields['OptionName'];
            
            if ($this->core->insert('productoptions',$groupoption_data)) {
                $this->session->set_flashdata('success', 'Group Option added successfully');
                redirect('product_groups');
            }else{
                $this->session->set_flashdata('error', 'Group Option inserted failed');
                // redirect('categeories/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete_option($id=NULL)
    {
        $result = $this->core->delete("productoptions", array('OptionID'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Group Option deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Group Option deletion failed');
        }
    
    redirect('product_groups'); 
    }
    public function edit_option($id = NULL)
    {
        $GroupOptionID = $this->input->post('OptionGroupID');
        $this->form_validation->set_rules('OptionGroupName', 'GroupName', 'required|trim|xss_clean');
        $this->form_validation->set_rules('material_type_id', 'Material', 'trim|required');
        $this->form_validation->set_rules('slug', 'Group Slug', 'trim|required|xss_clean');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Group option';
            $data['page'] = 'product_groups/edit_product_group';
            $data['include_js'][] = '/assets/js/category.js';
            $data['product_groupsinfo'] = $this->core->get("options_group", array('OptionGroupID'=>$id))[0];
            // $this->load->view('manage-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
                $groupoption_data = array();
            $groupoption_data['OptionGroupName']      = $post_fields['OptionGroupName'];
            $groupoption_data['slug']      = $post_fields['slug'];
            $groupoption_data['Display']           = 'yes';
            $groupoption_data['material_type_id']  = $post_fields['material_type_id'];
                    
            

            
            if ($this->core->update('options_group',$groupoption_data,array('OptionGroupID'=>$GroupOptionID))) {
                $this->session->set_flashdata('success', 'Group Option updated successfully');
                redirect('product_groups');
            }else{
                $this->session->set_flashdata('error', 'Group Option updation failed');
               redirect('product_groups/edit/'.$GroupOptionID);
            }
        }
        $this->load->view('manage-template', $data);
    }
}