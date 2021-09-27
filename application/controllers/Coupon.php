<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Coupon extends MY_Controller {
    protected $customer = NULL;
    protected $loggedin = false;
    public $count_cart_item;
    public $ac_price=false;
    public function __construct()
    {
       parent::__construct();
    }

    public function index()
    {   
       if(empty($this->session->userdata('cart_id'))){
         session_destroy();
         redirect(base_url()."home");
       }
       
        $data['page'] = 'cart-coupons';
        $data['page_title'] = 'Cart | Anaya Jewellery';

        if($this->loggedin){
           $p = $data['products'] = $this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
            $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
           
        }else{
         
            $p = $data['products'] = $this->purchase_cart->get_cart_items();
            $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
        }
        $data['coupons'] = $this->_get_coupons();

        $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
        $data['include_files'][] = './be-assets/includes/cart.php';    
        $this->load->view('anaya-template', $data);
    }   
  
    public function _get_coupons($coupon_id=NULL)
    { 
       $this->db->select('CouponID, Coupon_title,  CouponCode,  CouponExpiryDate, Description, DiscountType, Discount_value, Is_Active, Is_public', FALSE);
       $this->db->from('coupons');
       $this->db->where('CouponExpiryDate >', date('Y-m-d'), FALSE);
       $this->db->where('Is_Active', 1, FALSE);
       $this->db->where('Is_public', 1, FALSE);
       if ($coupon_id) {
           $this->db->where('CouponID', $coupon_id);
       }
       $query = $this->db->get();

       if ($query->result() > 0) {
            if ($coupon_id) return $query->row();
           return $query->result();
       }else{
        return NULL;
       }
    }  

    public function apply_coupon($coupon_id=7)
    {
        $coupon = $this->_get_coupons($coupon_id);
        $items = $this->purchase_cart->get_cart_items();
        $response = ['status'=>'', 'message'=>""];
        foreach ($items as $key => $item) {
            if($item->Making_chg_On_Grs_Net_Weight == 'gross_weight')
                $weight = $item->Gross_weight;
            else
                $weight = $item->Net_weight;

            if($item->Making_charges_unit == 'gram')
                $making_charges = $item->Making_charges*$weight;
            else
                $making_charges = $item->Making_charges;

            if($coupon->DiscountType == 'percent')
                $discounted_amount =  $making_charges * $coupon->Discount_value/100;
            else
                $discounted_amount =  $making_charges - $coupon->Discount_value;
             
             $set = array(
                'CouponID'=>$coupon->CouponID, 
               'CouponCode'=> $coupon->CouponCode, 
               'discounted_amount'=>$discounted_amount);
             $where = array('Order_DetailsID'=>$item->Order_DetailsID);
            if($this->core->update('cart_details',$set,$where)){
                $set = array(
                'CouponID'=>'', 
               'CouponCode'=> '', 
               'discounted_amount'=>'');
                $where = array('OrderID'=>$item->OrderID);
                $this->core->update('cart_details',$set,$where);
                $response = ['status'=>'failed', 'message'=>"Coupon application failed"];
                break;
            }

            $response = ['status'=>'success', 'message'=>"Coupon applied"];
        }

        
        echo json_encode($response);
         exit();
    }
    
}