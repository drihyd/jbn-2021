<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping_charges extends MY_Controller {

    function __construct(){
        parent::__construct();
        
        $this->load->model('Core_model','core');

    }

    public function index(){

        $data['page_title'] = 'Applicable Charges';
        $data['page'] = 'shipping _charges/shipping_charges_list';
        $data['shipping_charges_info'] = $this->core->get('shipping_charges');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function add()
    {

        $data['page'] = 'shipping _charges/add_shipping_charges';
        $data['page_title'] = 'Add Shipping charges';
        $data['shipping_charges_info_1']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_1'));
        $data['shipping_charges_info_2']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_2'));
        $data['handling_charges_info']=$this->core->get('shipping_charges',array('slug'=>'handling_charges'));
        
        $count_shipping_charges_info_2=count((array)$data['shipping_charges_info_2']);

        $this->form_validation->set_rules('from_price', 'From Price', 'trim|required');
        $this->form_validation->set_rules('to_price', 'To Price', 'trim|required');
        $this->form_validation->set_rules('charges', 'Charges', 'trim|required');
        $this->form_validation->set_rules('from_price1', 'From Price', 'trim|required');
        $this->form_validation->set_rules('to_price1', 'To Price', 'trim|required');
        $this->form_validation->set_rules('charges1', 'Charges', 'trim|required');
        
        
        if ($this->form_validation->run() === FALSE && $count_shipping_charges_info_2==0) {
           
             $this->session->set_flashdata('error', 'Something went wrong Please try again!');

        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
       if($this->input->post()) {
            $charges_data = $charges_data1=array();
            if($post_fields) {
            $charges_data['from_price'] = $post_fields['from_price'];
            $charges_data['slug'] = "shipping_charge_1";
            $charges_data['to_price'] = $post_fields['to_price'];
            $charges_data['charges'] = $post_fields['charges'];
            
    
            $charges_data1['from_price'] = $post_fields['from_price1'];
            $charges_data1['slug'] = "shipping_charge_2";
            $charges_data1['to_price'] = $post_fields['to_price1'];
            $charges_data1['charges'] = $post_fields['charges1'];
        }
        else{
         $charges_data['from_price'] = 0;
            $charges_data['slug'] = "shipping_charge_1";
            $charges_data['to_price'] = 0;
            $charges_data['charges'] = 0;
            
    
            $charges_data1['from_price'] = 0;
            $charges_data1['slug'] = "shipping_charge_2";
            $charges_data1['to_price'] = 0;
            $charges_data1['charges'] = 0;
        }

            $where1 = array('slug'=> 'shipping_charge_1');
            $where2 = array('slug'=> 'shipping_charge_2');

                            if ($this->core->get('shipping_charges',$where1)) {
                            
                            $shipping_charge_1=$this->core->update('shipping_charges',$charges_data,$where1);
                             $this->session->set_flashdata('success', 'Shipping details updated successfully'); 
                           
                            }
                            else{
                            $this->core->insert('shipping_charges',$charges_data);
                            $this->session->set_flashdata('success', 'Shipping details insert successfully');
                            }

                            if($this->core->get('shipping_charges',$where2)){
                            $this->core->update('shipping_charges',$charges_data1,$where2);
                            $this->session->set_flashdata('success', 'Shipping details updated Successfully'); 
                            }
                            
                            else{
                            $this->core->insert('shipping_charges',$charges_data1);
                            $this->session->set_flashdata('success', 'Shipping details insert successfully');
                            }

                        }
        }


$data['shipping_charges_info_1']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_1'));
        $data['shipping_charges_info_2']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_2'));
        $data['handling_charges_info']=$this->core->get('shipping_charges',array('slug'=>'handling_charges'));
        
           $this->load->view('manage-template', $data); 
        
    }
    public function add_handling_charges()
    {
         $data['page'] = 'shipping _charges/add_shipping_charges';
        $data['page_title'] = 'Add Shipping charges';
        $data['shipping_charges_info_1']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_1'));
        $data['shipping_charges_info_2']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_2'));
        $data['handling_charges_info']=$this->core->get('shipping_charges',array('slug'=>'handling_charges'));

        // echo '<pre>'; print_r($data); exit();
        
        $count_handling_charges_info=count((array)$data['handling_charges_info']);

        $this->form_validation->set_rules('charges', 'Handling Charges', 'trim|required');
        // $this->form_validation->set_rules('is_enable', 'Is enable', 'trim|required');
        
        
        
        if ($this->form_validation->run() === FALSE && $count_handling_charges_info==0) {
           
             $this->session->set_flashdata('error1', 'Something went wrong Please try again!');

        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
       if($this->input->post()) {
            $handling_charges_data =array();
            if($post_fields) {
            $handling_charges_data['charges'] = $post_fields['charges'];
            $handling_charges_data['slug'] = "handling_charges";
            // $handling_charges_data['is_enable'] = $post_fields['is_enable'];
        }
        else{
         $handling_charges_data['charges'] = 0;
            $handling_charges_data['slug'] = "handling_charges";
            // $handling_charges_data['is_enable'] = 0;
        }

            $where = array('slug'=> 'handling_charges');
            

                            if ($this->core->get('shipping_charges',$where)) {
                            
                            $this->core->update('shipping_charges',$handling_charges_data,$where);
                             $this->session->set_flashdata('success1', 'Handling details updated successfully'); 
                           
                            }
                            else{
                            $this->core->insert('shipping_charges',$handling_charges_data);
                            $this->session->set_flashdata('success1', 'Handling details insert successfully');
                            }

                        }
        }


        $data['shipping_charges_info_1']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_1'));
        $data['shipping_charges_info_2']=$this->core->get('shipping_charges',array('slug'=>'shipping_charge_2'));
        $data['handling_charges_info']=$this->core->get('shipping_charges',array('slug'=>'handling_charges'));
    
        
           $this->load->view('manage-template', $data); 
    }
    
}

