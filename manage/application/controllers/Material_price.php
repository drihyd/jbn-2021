<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Material_price extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_model','datatable');
        $this->load->model('Core_model','core');
        $this->load->model('Common_model','common');
         
    }
    public function index(){

        $data['page_title'] = 'Material price';
        $data['page'] = 'materials/update_materialprice';
        $this->load->view('manage-template', $data);
    }
    
    public function add() 
    { 
        $this->form_validation->set_rules('Coupon_title', 'Coupon Title', 'trim|required');
        $this->form_validation->set_rules('CouponCode', 'Coupon Code', 'trim|required');
        $this->form_validation->set_rules('Description', 'Coupon Description', 'trim|required');
        $this->form_validation->set_rules('CouponExpiryDate', 'CouponExpiryDate', 'trim|required');
        $this->form_validation->set_rules('DiscountType', 'Coupon Type', 'trim|required');
        $this->form_validation->set_rules('Discount_value', 'Discount Value', 'trim|required');
        $this->form_validation->set_rules('Is_Active', 'Is Active', 'trim|required');
        // $this->form_validation->set_rules('Is_public', 'Is Public', 'trim|required');
        
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/coupon.js';
            $data['page_title'] = 'Add Coupon';
            $data['page'] = 'coupons/add_coupon';
            // $this->load->view('manage-template', $data); 
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $coupons_data = array();
            $coupons_data['Coupon_title']         = $post_fields['Coupon_title'];
            $coupons_data['CouponCode']           = $post_fields['CouponCode'];
            $coupons_data['Description']          = $post_fields['Description'];
            $coupons_data['CouponExpiryDate']     = $post_fields['CouponExpiryDate'];
            $coupons_data['DiscountType']         = $post_fields['DiscountType'];
            $coupons_data['Discount_value']       = $post_fields['Discount_value'];
            $coupons_data['Is_Active']            = $post_fields['Is_Active'];
            // $coupons_data['Is_public']            = $post_fields['Is_public'];
            

            if ($this->core->insert('coupons',$coupons_data)) {
                $this->session->set_flashdata('success', 'Coupon added successfully');
                redirect('coupons');
            }else{
                $this->session->set_flashdata('error', 'Coupon inserted failed');
                redirect('coupons/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    public function edit($id = NULL)
    {
        $CouponID = $this->input->post('CouponID');
        $this->form_validation->set_rules('Coupon_title', 'Coupon Title', 'trim|required');
        $this->form_validation->set_rules('CouponCode', 'Coupon Code', 'trim|required');
        $this->form_validation->set_rules('Description', 'Coupon Description', 'trim|required');
        $this->form_validation->set_rules('CouponExpiryDate', 'CouponExpiryDate', 'trim|required');
        $this->form_validation->set_rules('DiscountType', 'Coupon Type', 'trim|required');
        $this->form_validation->set_rules('Discount_value', 'Discount Value', 'trim|required');
        $this->form_validation->set_rules('Is_Active', 'Is Active', 'trim|required');
        // $this->form_validation->set_rules('Is_public', 'Is Public', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/coupon.js';
            $data['page_title'] = 'Edit Coupon';
            $data['page'] = 'coupons/edit_coupon';
            $data['couponsinfo'] = $this->core->get("coupons", array('CouponID'=>$id))[0];
            // echo '<pre>'; print_r($data); exit();
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $coupons_data = array();
            $coupons_data['Coupon_title']         = $post_fields['Coupon_title'];
            $coupons_data['CouponCode']           = $post_fields['CouponCode'];
            $coupons_data['Description']          = $post_fields['Description'];
            $coupons_data['CouponExpiryDate']     = $post_fields['CouponExpiryDate'];
            $coupons_data['DiscountType']         = $post_fields['DiscountType'];
            $coupons_data['Discount_value']       = $post_fields['Discount_value'];
            $coupons_data['Is_Active']            = $post_fields['Is_Active'];
            // $coupons_data['Is_public']            = $post_fields['Is_public'];
            
            if ($this->core->update('coupons',$coupons_data,array('CouponID'=>$CouponID))) {
                $this->session->set_flashdata('success', 'Coupon updated successfully');
                redirect('coupons');
            }else{
                $this->session->set_flashdata('error', 'Coupon updation failed');
               redirect('coupons/edit/'.$CouponID);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($id=NULL)
    {
        $result = $this->core->delete("coupons", array('CouponID'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Coupon deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Coupon deletion failed');
        }
    
    redirect('coupons'); 
    }
    public function changeStatus($coupons_id) {
        $edit = $this->common->changeStatus($coupons_id);
        $this->session->set_flashdata('success', 'banners '.$edit.' Successfully');
        redirect('manage-banners');
    }
    
}