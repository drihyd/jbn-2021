<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Custom_attributes extends MY_Controller {

    function __construct(){
        parent::__construct(); 
        $this->load->model('Core_model','core');
       
    }
    public function index(){

        $data['page_title'] = 'Cutom Attributes';
        $data['page'] = 'custom_attributes/custom_attributes_lists';
        $data['custom_attributes_info']=$this->core->get('custom_attributes');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    // public function view($AdminID=NULL) {
    //     $data['page_title'] = 'View User';
    //     $data['page'] = 'users/view_user';
    //     $data['userinfo'] = $this->core->get("admin_user", array('AdminID'=>$AdminID))[0];
    //     // echo '<pre>'; print_r($data); exit();
    //     $this->load->view('manage-template', $data);
    // }
    public function add() {

       // $data['custom_attributes_info']=$this->core->get('custom_attributes');

        $this->form_validation->set_rules('name', 'Name', 'required|trim|xss_clean');
        

        
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/category.js';
            $data['page_title'] = 'Add Custom Attribute';
            $data['page'] = 'custom_attributes/add_custom_attribute';
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $user_data = array();

            $user_data['name']     = $post_fields['name'];
            $user_data['slug']     = $post_fields['slug'];
            $user_data['code'] = $post_fields['code'];
            

            if ($this->core->insert('custom_attributes',$user_data)) {
                $this->session->set_flashdata('success', 'Custom Attributes added successfully');
                redirect('custom_attributes');
            }else{
                $this->session->set_flashdata('error', 'Custom Attribute inserted failed');
                redirect('custom_attributes/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    
    public function edit($id = NULL)
    {


        $AdminID = $this->input->post('AdminID');
        $this->form_validation->set_rules('name', 'Name', 'required|trim|xss_clean');
        
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/category.js';
            $data['page_title'] = 'Edit Custom Attribute';
            $data['page'] = 'custom_attributes/edit_custom_attribute';
            $data['custom_attributes_info'] = $this->core->get("custom_attributes", array('id'=>$id))[0];
            // die('hello');
        // echo '<pre>'; print_r($data); exit();
        }else{
            // die('stop');

            $post_fields = $this->security->xss_clean($this->input->post());
            
            $user_data = array();

            $user_data['name']         = $post_fields['name'];
            $user_data['slug']         = $post_fields['slug'];
            
            $user_data['code']          = $post_fields['code'];

            if ($this->core->update('custom_attributes',$user_data,array('id'=>$AdminID))) {
                $this->session->set_flashdata('success', 'Custom Attributes updated successfully');
             
                redirect('custom_attributes');
            }else{
                $this->session->set_flashdata('error', 'Custom Attributes updation failed');
               redirect('custom_attributes/edit/'.$AdminID);
               
            }
            
        }
    
        $this->load->view('manage-template', $data);
        // die('dfda');
    }
    public function delete($AdminID=NULL)
    {
        $result = $this->core->delete("custom_attributes", array('id'=>$AdminID));
        if($result)
        {
            $this->session->set_flashdata('success', 'Custom Attributes deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Custom Attributes deletion failed');
        }
    
    redirect('custom_attributes'); 
    }

    
}