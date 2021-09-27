<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends MY_Controller {

    function __construct(){
        parent::__construct();
       $this->load->model('Product_model','product',TRUE);
    }
    public function index()
    {
        //$this->session->flashdata('error', "Please Choose a Product");
        redirect('products','refresh');
    	$data['page'] = 'product';
		$data['page_title'] = 'Product';
		$this->load->view('anaya-template', $data);
    }
    public function view($slug)
    {
        $data['page'] = 'product';
        $data['page_title'] = ucwords(str_replace('-', ' ', $slug));

        $test = $this->core->get('products', array('slug'=>$slug));

        if (empty($test) || (is_array($test) && count($test) !== 1)) {
            $this->session->set_flashdata('error', 'Invalid Product details');
            redirect('products','refresh');
        }
        $product = $data['product'] = $this->product->get_product($slug);
        $data['enable_customization'] = True;
         $data['include_files'][] = './be-assets/includes/product.php';
         
       $data['related_products'] =$this->product->get_related_products($product->ProductID,$product->CategoryID);
       $data['categories'] = $this->core->get("product_category", array('ParentID'=>0));
       
       $data['price_breackup'] = $this->get_stone_prices($slug);

    
       $this->load->view('anaya-template', $data);
    } 
    
    
    public function get_stone_prices($slug=null)
    {
        

     
        if(isset($slug) and !empty($slug)){
        $records = $this->core->get('products', array('slug'=>$slug));
        $records=array($records);
        $total_withour_gst = $records[0]->price_with_netweight+$records[0]->price_with_diamond_weight+$records[0]->price_with_gemstone_weight+$records[0]->price_with_pearl_weight+$records[0]->price_with_polki_weight+$records[0]->price_with_beads_weight+$records[0]->price_with_other_weight+$records[0]->price_with_handling+$records[0]->price_makingchrg_on_gw_nw;
        $total = $records[0]->price_with_netweight+$records[0]->price_with_diamond_weight+$records[0]->price_with_gemstone_weight+$records[0]->price_with_pearl_weight+$records[0]->price_with_polki_weight+$records[0]->price_with_beads_weight+$records[0]->price_with_other_weight+$records[0]->price_with_handling+$records[0]->price_makingchrg_on_gw_nw+$records[0]->price_on_cgst+$records[0]->price_on_sgst;
            


        $output= '
         
          <table class="table  product_info_table">
          <thead>
          <tr>
          <th>Stone</th>
          <th style="text-align:right">Price</th>
          </tr>
            </thead>
           <tr>
            <td><b>Price of Weight</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_netweight).'</td>
           </tr>
           <tr>
            <td><b>Price of Diamonds</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_diamond_weight).'</td>            
           </tr>            
           <tr>
            <td><b>Price of Gemstones</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_gemstone_weight).'</td>            
           </tr> 
           <tr>
            <td><b>Price of Pearls</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_pearl_weight).'</td>            
           </tr>
           <tr>
            <td><b>Price of Polki</b></td>
            <td align=right>'.$this->purchase_cart->number_format($records[0]->price_with_polki_weight).'</td>            
           </tr>             
           <tr>
            <td><b>Price of Beads</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_beads_weight).'</td>            
           </tr>
           <tr>
            <td><b>Other Charges</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_other_weight).'</td>
           </tr> 
            <tr>
            <td><b>Making Charges</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_makingchrg_on_gw_nw).'</td>
           </tr>  
            <tr>
            <td><b>Handling Charges</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_with_handling).'</td>
           </tr> 
            <tr>
            <tr>
            <td><b>Sub Total</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($total_withour_gst).'</td>
           </tr> 
            <tr>
            <td><b>CGST</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_on_cgst).'</td>
           </tr>   
            <tr>
            <td><b>SGST</b></td>
            <td align=right>'.INRICON.' '.$this->purchase_cart->number_format($records[0]->price_on_sgst).'</td>
           </tr>                       
           <tr>
            <td><b style="font-size: 16px;">Grand Total</b></td>
            <td align=right><b style="font-size: 16px;">'.INRICON.' '.$this->purchase_cart->number_format($total).'</b></td>            
           </tr>                        
       </table>
      ';

           return $output;


        }
        
        exit();


    }

    public function check_availability()
    {
        $pincode = $this->input->post('pincode');
        $response = array();

        $details = $this->core->get('available_locations', array('pincode'=>$pincode, 'is_available'=>1));

        if (!empty($details->pincode)) {
            $response = ['status'=>'success', 'message'=>"Delivery is available for your location. Happy Shopping !!!"];
        }else{
             $response = ['status'=>'failed', 'message'=>"Delivery is not available for your location. Try again soon !!!"];
        }
        echo json_encode($response);
        exit();
    }


     public function customized_order($slug)
    {

        $data['page'] = 'customized_order';
        $data['page_title'] = ucwords(str_replace('-', ' ', $slug));

        $test = $this->core->get('products', array('slug'=>$slug));

        if (empty($test) || (is_array($test) && count($test) !== 1)) {
            $this->session->set_flashdata('error', 'Invalid Product details');
            redirect('products','refresh');
        }
        $product = $data['product'] = $this->product->get_product($slug);



        
        $data['solitaire_color'] = $this->core->get('productoptions', array('OptionGroupID'=>11));
        $data['solitaire_clarity'] = $this->core->get('productoptions', array('OptionGroupID'=>12));
        $data['polish'] = $this->core->get('productoptions', array('OptionGroupID'=>6));
        $data['related_products'] =$this->product->get_related_products($product->ProductID,$product->CategoryID);
        $data['solitaire_cut'] = $this->core->get('productoptions', array('OptionGroupID'=>13));
        $data['solitaire_size'] = $this->core->get('productoptions', array('OptionGroupID'=>14));



        /* Diamond Attributes*/

        $data['daimond_color'] = $this->core->get('productoptions', array('OptionGroupID'=>1));
        $data['daimond_clartiy'] = $this->core->get('productoptions', array('OptionGroupID'=>5));
        $data['daimond_shape'] = $this->core->get('productoptions', array('OptionGroupID'=>9));



/* Pearl Attributes*/
$data['cust_pearls'] = $this->core->get('productoptions', array('OptionGroupID'=>7));

/* Beads Attributes*/
$data['cust_beads'] = $this->core->get('productoptions', array('OptionGroupID'=>16));


/* Gemstone Attributes*/
$data['cust_gemstone'] = $this->core->get('productoptions', array('OptionGroupID'=>8));


        $data['include_files'][] = './be-assets/includes/product.php';

       $data['categories'] = $this->core->get("product_category", array('ParentID'=>0));

       $data['single_categories'] = $this->core->get("product_category", array('CategoryID'=>$product->CategoryID));

       
       $this->load->view('anaya-template', $data);
    } 

    public function add_to_cart($product_id)
    {
         
    }

    public function add_to_wishlist($product_id)
    {
         
    }

    public function remove_from_cart($product_id)
    {
         
    }  

}