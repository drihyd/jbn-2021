<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Coupons extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_model','datatable');
        $this->load->model('Core_model','core');
        $this->load->model('Common_model','common');
        // $this->status = $this->core->get_enum_values('coupons','Is_Enabled');
         
    }
    public function index(){

        $data['page_title'] = 'Coupons';
        $data['page'] = 'coupons/view_coupons';
        $this->load->view('manage-template', $data);
    }
    public function ajax_list_coupon($value=NULL){
        // die('hello');

        $table="coupons";
        $list = $this->datatable->get_datatables($table,$value);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = $_POST['start'];
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = $sno;
            $row[] = ucwords($item->Coupon_title);
            $row[] = $item->CouponCode;
            $row[] = $item->Description;
            $row[] = $item->CouponAddedon;
            $row[] = $item->CouponExpiryDate;
            $row[] = $item->DiscountType;
            $row[] = $item->Discount_value;
            if ($item->Is_Active == 1) {
                $row[] = 'Active';
            }else{
                $row[] = 'Inactive';
            }
            // $row[] = '<a href='.base_url()."coupons/changeStatus/".$item->CouponID.'>' . if($item->Is_Active==0){ .''. echo .'<i class="fa fa-lock"></i>'; } else { .'' . echo . '<i class="fa fa-unlock"></i>'; .''. } .' </a>';
            $row[] = "<a href=".base_url()."coupons/edit/".$item->CouponID."><i class='fa fa-pencil-square-o'></i></a> / <a href='#' onclick='return trash_coupon_record(".$item->CouponID.")'><i class='fa fa-trash-o'></i></a>";
            $data[] = $row;
            $sno++;
        }
        
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->datatable->count_all($table),
                        "recordsFiltered" => $this->datatable->count_filtered($table),
                        "data" => $data,
                );
         // echo '<pre>'; print_r($output); exit();
         echo json_encode($output);
         exit();
    }
    public function add() {

        
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
            $coupons_data['Is_public']            = $post_fields['Is_public'];
            

            if ($this->core->insert('coupons',$coupons_data)) {
                $this->session->set_flashdata('success', 'Coupon added successfully');
                redirect('coupons');
            }else{
                $this->session->set_flashdata('error', 'Coupon inserted failed');
                redirect('coupons/add');
            }
        }
        $data['categeoriesinfo']=$this->core->get_order_by('product_category', array('ParentID' =>0 ),"CategoryName","ASC");
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
            $coupons_data['Is_public']            = $post_fields['Is_public'];
            
            if ($this->core->update('coupons',$coupons_data,array('CouponID'=>$CouponID))) {
                $this->session->set_flashdata('success', 'Coupon updated successfully');
                redirect('coupons');
            }else{
                $this->session->set_flashdata('error', 'Coupon updation failed');
               redirect('coupons/edit/'.$CouponID);
            }
        }
        $data['categeoriesinfo']=$this->core->get_order_by('product_category', array('ParentID' =>0 ),"CategoryName","ASC");
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