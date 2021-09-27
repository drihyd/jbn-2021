<?php
 
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
/**
 * @package Razorpay :  CodeIgniter Razorpay Gateway
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 *   
 * Description of Razorpay Controller
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
 
class Razorpay extends MY_Controller {
    // construct
    public function __construct() {
        parent::__construct();   
        $this->load->model('Razorpay_model', 'razor_model');    
        $this->load->helper('string'); 
    }
    // index page
    public function index() {
        $data['title'] = 'Razorpay | TechArise';  
     

  
        //$data['productInfo'] = $this->purchase_cart->get_cart_items();
             
        //$this->load->view('pages/razorpay/razorpay', $data);
    }
    
    // checkout page
    public function checkout($id) {
        $data['title'] = 'Checkout payment | TechArise';  
        //$this->site->setProductID($id);
        //$data['itemInfo'] = $this->site->getProductDetails(); 
        $data['return_url'] = site_url().'razorpay/callback';
        $data['surl'] = site_url().'razorpay/success';
        $data['furl'] = site_url().'razorpay/failed';
        $data['currency_code'] = CURRENCY_CODE;
        $this->load->view('pages/razorpay/checkout', $data);
    }
 
    // initialized cURL Request
    private function get_curl_handle($payment_id, $amount)  {
        $url = 'https://api.razorpay.com/v1/payments/'.$payment_id.'/capture';
        $key_id = RAZOR_KEY_ID;
        $key_secret = RAZOR_KEY_SECRET;
        $fields_string = "amount=$amount";
        //cURL Request
        $ch = curl_init();
        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_USERPWD, $key_id.':'.$key_secret);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_CAINFO, dirname(__FILE__).'/ca-bundle.crt');
        return $ch;
    }   
        

 function get_web_page( $url )
{
    $options = array(
        CURLOPT_RETURNTRANSFER => true,     // return web page
        CURLOPT_HEADER         => false,    // don't return headers
        CURLOPT_FOLLOWLOCATION => true,     // follow redirects
        CURLOPT_ENCODING       => "",       // handle all encodings
        CURLOPT_USERAGENT      => "spider", // who am i
        CURLOPT_AUTOREFERER    => true,     // set referer on redirect
        CURLOPT_CONNECTTIMEOUT => 120,      // timeout on connect
        CURLOPT_TIMEOUT        => 120,      // timeout on response
        CURLOPT_MAXREDIRS      => 10,       // stop after 10 redirects
        CURLOPT_SSL_VERIFYPEER => false     // Disabled SSL Cert checks
    );

    $ch      = curl_init( $url );
    curl_setopt_array( $ch, $options );
    $content = curl_exec( $ch );
    $err     = curl_errno( $ch );
    $errmsg  = curl_error( $ch );
    $header  = curl_getinfo( $ch );
    curl_close( $ch );
    $header['errno']   = $err;
    $header['errmsg']  = $errmsg;
    $header['content'] = $content;
    return $header;
}

    // callback method
public function callback() {
$razorpay_payment_id=$this->input->post('razorpay_payment_id');
$merchant_order_id = $this->input->post('merchant_order_id');
$currency_code = CURRENCY_CODE;   
$amount = $this->input->post('merchant_amount');
$total = $this->input->post('merchant_total');
$fullname=$this->input->post('card_holder_name_id');
$merchant_trans_id=$this->input->post('merchant_trans_id');
$fullname=isset($fullname)?$fullname:"";

if(!empty($razorpay_payment_id)){
    $razorpay_payment_id=$razorpay_payment_id;
}else{
    $razorpay_payment_id="";
}
if(!empty($merchant_trans_id))
{
$merchant_trans_id=$merchant_trans_id;
}
else{
$merchant_trans_id="";
}

if(!empty($razorpay_payment_id)) {
$url="https://rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com/v1/payments/".$razorpay_payment_id;
$val=$this->get_web_page($url);
$result_content=json_decode($val['content']);
$payment_status=$result_content->status;
$error_description=$result_content->error_description;
$error_code=$result_content->error_code;
 if($payment_status=="authorized" || $payment_status=="captured") {
    $payment_array=array(
                                "PaymentID"=>$result_content->id,
                                "entity"=>$result_content->entity,
                                "UserID"=>MY_SESSION_ID,
                                "Order_ID"=>0,
                                "Order_Number"=>$result_content->notes->soolegal_order_id,
                                "CartID"=>0,
                                "amount"=>(($result_content->amount*1)/100),
                                "merchant_total"=>(($result_content->amount*1)/100),
                                "payment_date"=>date("Y-m-d h:i:s"),
                                "currency"=>$result_content->currency,
                                "TransactionID"=>$merchant_trans_id,
                                "PaymentStatus"=>$result_content->status,
                                "fullname"=>$fullname,
                                "emailid"=>$result_content->email,
                                "contact_number"=>$result_content->contact,
                                "Payment_method"=>$result_content->method,
                                "created_at"=>$result_content->created_at,
                                "captured"=>$result_content->captured,
                                "description"=>$result_content->description,
                                "IP"=>$this->input->ip_address(),
                                "BankRefNumber"=>0,
                                "JsonData"=>json_encode($val),
                                "invoice_number"=>0,
                                "code_execute_dt"=>date("Y-m-d h:i:s"),
                                "success"=>true,
                            );

                                if(!empty($result_content->id)){



                                $this->razor_model->insert("payments",$payment_array);         
                                $this->move_cart_order($result_content->id);

                                /*Payment is success mail*/
                                $view_file_params=array(
                                "dear_name"=>$fullname,
                                "PaymentID"=>$result_content->id,
                                "OrderID"=>$result_content->notes->soolegal_order_id,
                                );
                                $payment_mail_body = $this->load->view('email_templates/payment_success',$view_file_params,true);
                                $mail_params=array(
                                "to_address"=>$result_content->email,
                                "to_name"=>$fullname,
                                "subject"=>"Wow! You just placed an order! | Jewellery By Nikitha",
                                "body_message"=>$payment_mail_body,
                                );
                                $this->send_mail_payment_success($mail_params); 



                                /*Send Voucher code to user*/
                                if($result_content->notes->product_type=="gift_cards"){
                                    $view_file_params=array(
                                    "dear_name"=>$fullname,
                                    "voucher_code"=>$result_content->notes->voucher_code,
                                    "OrderID"=>$result_content->notes->soolegal_order_id,
                                    );
                                    $voucher_code_mail_body = $this->load->view('email_templates/voucher_code',$view_file_params,true);
                                    $mail_params_2=array(
                                    "to_address"=>$result_content->email,
                                    "to_name"=>$fullname,
                                    "subject"=>"You purchased a voucher | Jewellery By Nikitha",
                                    "body_message"=>$voucher_code_mail_body,
                                    );
                                    $this->send_mail_payment_success($mail_params_2);
                                }
                                /*End */




                                redirect('razorpay/success/'.$result_content->id.'/'.$result_content->notes->soolegal_order_id);
                                }

                                else{
                                /*Payment is failed mail*/
                                $view_file_params=array(
                                "dear_name"=>$fullname,
                                "PaymentID"=>$result_content->id,
                                );
                                $payment_mail_body = $this->load->view('email_templates/payment_failed',$view_file_params,true);
                                $mail_params=array(
                                "to_address"=>$result_content->email,
                                "to_name"=>$fullname,
                                "subject"=>"Your Payment Failed | Jewellery By Nikitha",
                                "body_message"=>$payment_mail_body,
                                );
                                $this->send_mail_payment_failed($mail_params);
                                redirect('razorpay/failed');

                        }

 }
 else{
    $payment_array=array(
                                "PaymentID"=>$result_content->id,
                                "entity"=>$result_content->entity,
                                "UserID"=>MY_SESSION_ID,
                                "Order_ID"=>0,
                                "Order_Number"=>$result_content->notes->soolegal_order_id,
                                "CartID"=>0,
                                "amount"=>(($result_content->amount*1)/100),
                                "merchant_total"=>(($result_content->amount*1)/100),
                                "payment_date"=>date("Y-m-d h:i:s"),
                                "currency"=>$result_content->currency,
                                "TransactionID"=>$merchant_trans_id,
                                "PaymentStatus"=>$result_content->status,
                                "fullname"=>$fullname,
                                "emailid"=>$result_content->email,
                                "contact_number"=>$result_content->contact,
                                "Payment_method"=>$result_content->method,
                                "created_at"=>$result_content->created_at,
                                "captured"=>$result_content->captured,
                                "description"=>$result_content->description,
                                "IP"=>$this->input->ip_address(),
                                "BankRefNumber"=>0,
                                "JsonData"=>json_encode($val),
                                "invoice_number"=>0,
                                "code_execute_dt"=>date("Y-m-d h:i:s"),
                                "success"=>false,
                            );
                   
                            if(!empty($result_content->id)){
                            $this->razor_model->insert("payments",$payment_array); 

                                /*Payment is failed mail*/
                                $view_file_params=array(
                                "dear_name"=>$fullname,
                                "PaymentID"=>$result_content->id,
                                );
                                $payment_mail_body = $this->load->view('email_templates/payment_failed',$view_file_params,true);
                                $mail_params=array(
                                "to_address"=>$result_content->email,
                                "to_name"=>$fullname,
                                "subject"=>"Payment Failed",
                                "body_message"=>$payment_mail_body,
                                );
                                $this->send_mail_payment_failed($mail_params);


                            redirect('razorpay/failed');    
                        }
                       
 }
}
else{
redirect('razorpay/failed'); 

 } 
}


public function cart_to_orderdetails($cart_ID=false,$OrderID=false){
    $where['OrderID'] = $cart_ID;
    $cart_details = $this->core->select("cart_details",$where);
    $cart_details= json_decode(json_encode($cart_details),true);

    foreach ($cart_details as $key=>$value) {
         $ord_m_insert=array(
            "OrderID"=>$OrderID,
            "ProductID"=>$cart_details[$key]['ProductID'],
            "product_type"=>$cart_details[$key]['product_type'],
            "sub_product_type"=>$cart_details[$key]['sub_product_type'],
            "voucher_code"=>$cart_details[$key]['voucher_code'],
            "ProductName"=>$cart_details[$key]['ProductName'],
            "MRP_Price"=>$cart_details[$key]['MRP_Price'],
            "ProductPrice"=>$cart_details[$key]['ProductPrice'],
            "ProductSKU"=>$cart_details[$key]['ProductSKU'],
            "Quantity"=>$cart_details[$key]['Quantity'],
            "CouponID"=>$cart_details[$key]['CouponID'],
            "CouponCode"=>$cart_details[$key]['CouponCode'],
            "Amount"=>$cart_details[$key]['Amount'],
            "attribute_json_data"=>$cart_details[$key]['attribute_json_data'],
            "order_method"=>$cart_details[$key]['order_method'],
            "customized_product_data"=>$cart_details[$key]['customized_product_data'],
            "MRP_Amount"=>$cart_details[$key]['MRP_Amount'],
            "discounted_amount"=>isset($cart_details[$key]['discounted_amount'])?$cart_details[$key]['discounted_amount']:0,
         );

        $latest_Order_ID=$this->core->insert("order_details",$ord_m_insert);
        if($latest_Order_ID){

            if($cart_details[$key]['product_type']=="gift_cards"){
                $coupons_data = array();
                $coupons_data['Coupon_title']         = $cart_details[$key]['product_type'];
                $coupons_data['CouponCode']           = $cart_details[$key]['voucher_code'];
                $coupons_data['Description']          = $cart_details[$key]['product_type'];
                $coupons_data['user_id']          = MY_SESSION_ID;
                $coupons_data['DiscountType']         = fixed;
                $coupons_data['Discount_value']       = $cart_details[$key]['ProductPrice'];
                $coupons_data['Is_Active']            = 1;
                $coupons_data['Is_public']            = 0;
                $coupons_data['generated_by']            = 'S';
                if ($this->core->insert('coupons',$coupons_data)) {
                }else{
                }

            }



        }

    }
}

public function move_cart_order($PaymentID=false)
{

$where=array();
$where['UserlD'] =  MY_SESSION_ID;
$where['Order_status'] =  "on Hold";
$cart = $this->core->select("cart_master",$where);
$cart= json_decode(json_encode($cart),true);
foreach ($cart as $key=>$value) {
    $ord_m_insert=array(
        "UserlD"=>$cart[$key]['UserlD'],
        "CartID"=>$cart[$key]['OrderlD'],
        "Order_Number"=>$cart[$key]['Order_Number'],
        "OrderAmount"=>$cart[$key]['OrderAmount'],
        "Shipping_Charges_Amount"=>$cart[$key]['Shipping_Charges_Amount'],
        "Handling_Charges_Amount"=>$cart[$key]['Handling_Charges_Amount'],
        "OrderShipName"=>$cart[$key]['OrderShipName'],
        "OrderPhone"=>$cart[$key]['OrderPhone'],
        "OrderShipping"=>$cart[$key]['OrderShipping'],
        "OrderTax"=>$cart[$key]['OrderTax'],
        "OrderEmall"=>$cart[$key]['OrderEmall'],
        "OrderDate"=>$cart[$key]['OrderDate'],
        "OrderShipped"=>$cart[$key]['OrderShipped'],
        "OrderTrackingNumber"=>$cart[$key]['OrderTrackingNumber'],
        "Delivery_Mode"=>$cart[$key]['Delivery_Mode'],
        "DeliveryDate"=>$cart[$key]['DeliveryDate'],
        "Order_status"=>"placed",
        "shipping_Fullname"=>$cart[$key]['billing_Fullname'],
        "shipping_Address1"=>$cart[$key]['billing_Address1'],
        "shipping_Address2"=>$cart[$key]['billing_Address2'],
        "shipping_LandMark"=>$cart[$key]['billing_LandMark'],
        "shipping_City"=>$cart[$key]['billing_City'],
        "shipping_Pincode"=>$cart[$key]['billing_Pincode'],
        "shipping_State"=>$cart[$key]['billing_State'],
        "shipping_Country"=>$cart[$key]['billing_Country'],
        "shipping_Mobile"=>$cart[$key]['billing_Mobile'],
        "billing_Fullname"=>$cart[$key]['shipping_Fullname'],
        "billing_Address1"=>$cart[$key]['shipping_Address1'],
        "billing_Address2"=>$cart[$key]['shipping_Address2'],
        "billing_LandMark"=>$cart[$key]['shipping_LandMark'],
        "billing_City"=>$cart[$key]['shipping_City'],
        "billing_Pincode"=>$cart[$key]['shipping_Pincode'],
        "billing_State"=>$cart[$key]['shipping_State'],
        "billing_Country"=>$cart[$key]['shipping_Country'],
        "billing_Mobile"=>$cart[$key]['shipping_Mobile'],
        "voucher_code"=>$cart[$key]['voucher_code'],
        "PaymentID"=>$PaymentID
    );
    $latest_Order_ID=$this->core->insert("order",$ord_m_insert);
        if($latest_Order_ID){
          $this->cart_to_orderdetails($cart[$key]['OrderlD'],$latest_Order_ID);
           $this->core->update('cart_master', array("Order_status"=>"placed"), array("OrderlD"=>$cart[$key]['OrderlD']), "");
        }
}
}



public function success($paymentID=false,$OrderlD=false) {
    $data['page'] = 'success';
    $data['paymentID'] = $paymentID;
    $data['OrderlD'] = $OrderlD;
    $data['page_title'] = 'Payment Success | Anaya Jewellery';
    $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
    $this->session->set_flashdata('success', 'Payment has been successfully processed');
    $this->load->view('anaya-template', $data);
}  
public function failed() {
    $data['page'] = 'failed';
    $data['page_title'] = 'Payment Failed | Anaya Jewellery';
    $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
    $this->session->set_flashdata('error', 'Sorry, your payment failed');
    $this->load->view('anaya-template', $data);
} 

public function send_mail_payment_success($params){
        if($params['to_address']) {
            send_smtp($params['to_address'],$params['to_name'],$params['subject'],$params['body_message']);
        }
    }

    public function send_mail_payment_failed($params){
        if($params['to_address']) {
            send_smtp($params['to_address'],$params['to_name'],$params['subject'],$params['body_message']);
        }
    }


}