<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gold_price extends MY_Controller {

    function __construct(){
        parent::__construct();
        
        $this->load->model('Core_model','core');
        $this->load->model('Goldprice_model','gold_price');

    }

    public function index(){
        $data['page_title'] = 'Today 24 Carat Gold Rate Per Gram in India (INR)';
        $data['page'] = 'gold_price/update_gold_price';
        $data['gold_price_info']=$this->gold_price->tenData();
          $this->load->view('manage-template', $data);
    }

        public function update_product_prices(){
        $data['page_title'] = 'Update Product Prices';
        $data['page'] = 'gold_price/update_products_price';
        $data['gold_price_info']=$this->gold_price->tenData();
          $this->load->view('manage-template', $data);
    }
    public function update()
    {

        $data['page'] = 'gold_price/update_gold_price';
        $data['page_title'] = 'Update Gold Price';
        $data['gold_price_info_1']=$this->core->get('material_price',array('metal_clar_purity'=>'14'));
        $data['gold_price_info_2']=$this->core->get('material_price',array('metal_clar_purity'=>'18'));
        $data['gold_price_info_3']=$this->core->get('material_price',array('metal_clar_purity'=>'22'));
        $data['gold_price_info_4']=$this->core->get('material_price',array('metal_clar_purity'=>'24'));

        // echo '<pre>'; print_r($data); exit();
        
        // $count_shipping_charges_info_2=count((array)$data['gold_price_info_4']);

        // $this->form_validation->set_rules('goldprice_14', '14 Kt Gold Price', 'trim|required');
        // $this->form_validation->set_rules('goldprice_18', '14 Kt Gold Price', 'trim|required');
        // $this->form_validation->set_rules('goldprice_22', '14 Kt Gold Price', 'trim|required');
        $this->form_validation->set_rules('goldprice_24', '14 Kt Gold Price', 'trim|required');
        
        
        if ($this->form_validation->run() === FALSE) {
           
             $this->session->set_flashdata('error', 'Something went wrong Please try again!');

        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
       if($this->input->post()) {
            $charges_data = $charges_data1=array();
            if($post_fields) {
            // $charges_data['price'] = $post_fields['goldprice_14'];
            // $charges_data['metal_clar_purity'] = "14";
            
            // $charges_data1['price'] = $post_fields['goldprice_18'];
            // $charges_data1['metal_clar_purity'] = "18";

            // $charges_data2['price'] = $post_fields['goldprice_22'];
            // $charges_data2['metal_clar_purity'] = "22";

            $charges_data3['price'] = $post_fields['goldprice_24'];
            $charges_data3['metal_clar_purity'] = "24";
        }
        else{
            $charges_data['price'] = 0;
            $charges_data['metal_clar_purity'] = "14";
            
            $charges_data1['price'] = 0;
            $charges_data1['metal_clar_purity'] = "18";

            $charges_data2['price'] = 0;
            $charges_data2['metal_clar_purity'] = "22";

            $charges_data3['price'] = 0;
            $charges_data3['metal_clar_purity'] = "24";
        }

            $where1 = array('metal_clar_purity'=> '14');
            $where2 = array('metal_clar_purity'=> '18');
            $where3 = array('metal_clar_purity'=> '22');
            $where4 = array('metal_clar_purity'=> '24');

                if ($this->core->get('material_price',$where1)) {
                
                    $this->core->update('material_price',$charges_data,$where1);
                    $this->session->set_flashdata('success', 'Gold Price updated successfully'); 
               
                }
                else{
                    $this->core->insert('material_price',$charges_data);
                    $this->session->set_flashdata('success', 'Gold Price insert successfully');
                }

                if($this->core->get('material_price',$where2)){
                    $this->core->update('material_price',$charges_data1,$where2);
                    $this->session->set_flashdata('success', 'Gold Price updated Successfully'); 
                }
                
                else{
                    $this->core->insert('material_price',$charges_data1);
                    $this->session->set_flashdata('success', 'Gold Price insert successfully');
                }
                if($this->core->get('material_price',$where3)){
                    $this->core->update('material_price',$charges_data2,$where3);
                    $this->session->set_flashdata('success', 'Gold Price updated Successfully'); 
                }
                
                else{
                    $this->core->insert('material_price',$charges_data2);
                    $this->session->set_flashdata('success', 'Gold Price insert successfully');
                }
                if($this->core->get('material_price',$where4)){
                    $this->core->update('material_price',$charges_data3,$where4);
                    $this->session->set_flashdata('success', 'Gold Price updated Successfully'); 
                }
                
                else{
                    $this->core->insert('material_price',$charges_data3);
                    $this->session->set_flashdata('success', 'Gold Price insert successfully');
                }

            }
            redirect('gold_price');
        }
        
           $this->load->view('manage-template', $data); 
        
    }public function add() {

        
        $this->form_validation->set_rules('goldprice_24', '24 Kt Gold Price', 'trim|required');
        if ($this->form_validation->run() === FALSE) {

            $data['include_js'][] = '/assets/js/goldprice.js';
            $data['page'] = 'gold_price/update_gold_price';

        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $charges_data = array();
            $charges_data['price'] = $post_fields['goldprice_24'];
            $charges_data['metal_clar_purity'] = "24";
            $charges_data['material_type_id'] = "1";
            $charges_data['metal_color_id'] = "1";
            $charges_data['units'] = "gm";
            $charges_data['ip_address'] = $this->input->ip_address();
            
            // if (condition) {
            //     # code...
            // }
            $data['gold_price_today']=$this->gold_price->get_last_record()[0];
            // echo '<pre>'; print_r($data['gold_price_today']); exit();
            if ($data['gold_price_today']->price == $post_fields['goldprice_24']) {
                $this->session->set_flashdata('error', "Gold Price already exits in today's date");
                redirect('gold_price');
            }else{
                if ($this->core->insert('material_price',$charges_data)) {
                    $this->session->set_flashdata('success', 'Gold Price added successfully');
                    redirect('gold_price');
                }else{
                    $this->session->set_flashdata('error', 'Gold Price inserted failed');
                    redirect('gold_price');
                }
            }
            
        }
        $this->load->view('manage-template', $data);
    }
    
}

