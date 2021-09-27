<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Delivery_partners extends MY_Controller {

    function __construct(){
        parent::__construct(); 
        $this->load->model('Core_model','core');
       
    }
    public function index(){

        $data['page_title'] = 'Delivery Partners';
        $data['page'] = 'delivery_partners/delivery_partners_lists';
        $data['delivery_partners_info']=$this->core->get('delivery_partners');
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
        $this->form_validation->set_rules('api_url', 'API URL', 'required|trim|xss_clean');
        $this->form_validation->set_rules('address', 'Address', 'required|trim|xss_clean');
        $this->form_validation->set_rules('mobile', 'Mobile', 'required|trim|xss_clean');
        

        
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/delivery_partners.js';
            $data['page_title'] = 'Add Delivery Partners';
            $data['page'] = 'delivery_partners/add_delivery_partner';
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $delivery_partners_data = array();

            $delivery_partners_data['name']     = $post_fields['name'];
            $delivery_partners_data['api_url']     = $post_fields['api_url'];
            $delivery_partners_data['address'] = $post_fields['address'];
            $delivery_partners_data['mobile'] = $post_fields['mobile'];
            $delivery_partners_data['alt_mobile'] = $post_fields['alt_mobile'];
            

            if ($this->core->insert('delivery_partners',$delivery_partners_data)) {
                $this->session->set_flashdata('success', 'Delivery Partners added successfully');
                redirect('delivery_partners');
            }else{
                $this->session->set_flashdata('error', 'Delivery Partners inserted failed');
                redirect('delivery_partners/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    
    public function edit($id = NULL)
    {


        $AdminID = $this->input->post('AdminID');
         $this->form_validation->set_rules('name', 'Name', 'required|trim|xss_clean');
        $this->form_validation->set_rules('api_url', 'API URL', 'required|trim|xss_clean');
        $this->form_validation->set_rules('address', 'Address', 'required|trim|xss_clean');
        $this->form_validation->set_rules('mobile', 'Mobile', 'required|trim|xss_clean');
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/delivery_partners.js';
            $data['page_title'] = 'Edit Delivery Partners';
            $data['page'] = 'delivery_partners/edit_delivery_partner';
            $data['delivery_partners_info'] = $this->core->get("delivery_partners", array('id'=>$id))[0];
            // die('hello');
        // echo '<pre>'; print_r($data); exit();
        }else{
            // die('stop');

            $post_fields = $this->security->xss_clean($this->input->post());
            
            $delivery_partners_data = array();

            $delivery_partners_data['name']     = $post_fields['name'];
            $delivery_partners_data['api_url']     = $post_fields['api_url'];
            $delivery_partners_data['address'] = $post_fields['address'];
            $delivery_partners_data['mobile'] = $post_fields['mobile'];
            $delivery_partners_data['alt_mobile'] = $post_fields['alt_mobile'];

            if ($this->core->update('delivery_partners',$delivery_partners_data,array('id'=>$AdminID))) {
                $this->session->set_flashdata('success', 'Delivery Partners updated successfully');
             
                redirect('delivery_partners');
            }else{
                $this->session->set_flashdata('error', 'Delivery Partners updation failed');
               redirect('delivery_partners/edit/'.$AdminID);
               
            }
            
        }
    
        $this->load->view('manage-template', $data);
        // die('dfda');
    }
    public function delete($AdminID=NULL)
    {
        $result = $this->core->delete("delivery_partners", array('id'=>$AdminID));
        if($result)
        {
            $this->session->set_flashdata('success', 'Delivery Partners deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Delivery Partners deletion failed');
        }
    
    redirect('delivery_partners'); 
    }

    
}