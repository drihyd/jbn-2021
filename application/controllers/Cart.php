<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cart extends MY_Controller {
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

    $data['page'] = 'cart';
    $data['page_title'] = 'Cart';

    if($this->loggedin){
       $p = $data['products'] = $this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
        $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
       
    }else{
     
        $p = $data['products'] = $this->purchase_cart->get_cart_items();
        $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
    }
  /*  echo "<pre>";
    print_r($data['products']);
    die();*/
    $data['coupons'] = $this->purchase_cart->get_coupons();
    $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
    $data['include_files'][] = './be-assets/includes/cart.php';    
    $this->load->view('anaya-template', $data);
}    


public function add()
{

$uniqueNumber = strftime("%Y%m%d%H%M%S");
$post_data=$this->input->post();
$where=$cart_data=array();
$cart_data['UserlD'] = MY_SESSION_ID;
if ($this->loggedin){  
$where['UserlD'] =  $this->customer->UserID;
if(!$this->core->update('cart_master', $cart_data, $where)) {
//$cart_data['customer_id'] = $this->customer->id;
}
$cart = $this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
}else{ 
    $cart_data['UserlD'] = MY_SESSION_ID;
    $cart = $this->core->get('cart_master', $cart_data);
}
if ($cart == false) {
    if ($this->loggedin) {
        $cart_data['UserlD'] =  $this->customer->UserID;
    }

    $cart_data['Order_Number']=$uniqueNumber;
    if($cart_id=$this->core->insert('cart_master', $cart_data)){


        $response=$this->add_item_to_cart($cart_id,$post_data);
        $this->session->set_userdata('cart_id', $cart_id);
    }else{
        //$this->session->set_flashdata('error', 'Failed to add to Cart');
        $response =  false;
    }
}
else{
    $cart_id = is_array($cart) ? $cart[0]->OrderlD : $cart->OrderlD;
    $response = $this->add_item_to_cart($cart_id, $post_data);
    $this->session->set_userdata('cart_id', $cart_id);
}
redirect('cart','refresh');
exit();


}

public function add_customized()
{

$uniqueNumber = strftime("%Y%m%d%H%M%S");
$post_data=$this->input->post();


$attribute_selected=array(
"size" => $this->input->post('custom_order_size'),
"polish" => $this->input->post('custom_order_polish'),
"size_of_the_metal" => $this->input->post('custom_order_size_metal'),
"color" => $this->input->post('custom_order_color'),
"clarity" => $this->input->post('custom_order_clarity'),
"cut" => $this->input->post('custom_order_cut'),
"daimond_color" => $this->input->post('daimond_color'),
"daimond_clartiy" => $this->input->post('daimond_clartiy'),
"daimond_shape" => $this->input->post('daimond_shape'),
"diamond_quantity" => $this->input->post('cust_diamond_quantity'),
"pearls" => $this->input->post('cust_pearls'),
"pearls_quantity" => $this->input->post('cust_pearls_quantity'),
"gemstone" => $this->input->post('cust_gemstone'),
"gemstone_quantity" => $this->input->post('cust_gemstone_quantity'),
"beads" => $this->input->post('cust_beads'),
"beads_quantity" => $this->input->post('cust_beads_quantity'),
);


/* Get Actual Values*/

$solitary_polish=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('custom_order_polish')));
$solitary_size_of_the_metal=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('custom_order_size_metal')));
$solitary_color=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('custom_order_color')));
$solitary_clarity=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('custom_order_clarity')));
$solitary_cut=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('custom_order_cut')));


$daimond_color=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('daimond_color')));
$daimond_clartiy=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('daimond_clartiy')));
$daimond_shape=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('daimond_shape')));

$cust_pearls=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('cust_pearls')));
$cust_gemstone=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('cust_gemstone')));
$cust_beads=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionID"=>$this->input->post('cust_beads')));


$attribute_selected_names=array(

"size" => $this->input->post('custom_order_size'),
"polish" => isset($solitary_polish[0]->OptionName)?$solitary_polish[0]->OptionName:"",
"size_of_the_metal" => isset($solitary_size_of_the_metal[0]->OptionName)?$solitary_size_of_the_metal[0]->OptionName:"",
"color" => isset($solitary_color[0]->OptionName)?$solitary_color[0]->OptionName:"",
"clarity" => isset($solitary_clarity[0]->OptionName)?$solitary_clarity[0]->OptionName:"",
"cut" => isset($solitary_cut[0]->OptionName)?$solitary_cut[0]->OptionName:"",
"daimond_color" => isset($daimond_color[0]->OptionName)?$daimond_color[0]->OptionName:"",
"daimond_clartiy" => isset($daimond_clartiy[0]->OptionName)?$daimond_clartiy[0]->OptionName:"",
"daimond_shape" => isset($daimond_shape[0]->OptionName)?$daimond_shape[0]->OptionName:"",
"diamond_quantity" => $this->input->post('cust_diamond_quantity'),
"pearls" => isset($cust_pearls[0]->OptionName)?$cust_pearls[0]->OptionName:"",
"pearls_quantity" => $this->input->post('cust_pearls_quantity'),
"gemstone" => isset($cust_gemstone[0]->OptionName)?$cust_gemstone[0]->OptionName:"",
"gemstone_quantity" => $this->input->post('cust_gemstone_quantity'),
"beads" => isset($cust_beads[0]->OptionName)?$cust_beads[0]->OptionName:"",
"beads_quantity" => $this->input->post('cust_beads_quantity'),
);

/*End*/



$table_col_data=array(
    "product_size" => $this->input->post('product_size'),
    "product_metal" => $this->input->post('product_metal'),
    "product_diamond" => $this->input->post('product_diamond'),
    "product_chk_deli_date" =>$this->input->post('product_chk_deli_date'),
    "product_slug" => $this->input->post('product_slug'),
    "product_pk_ID" => $this->input->post('product_pk_ID'),
    "MRP_Amount" => $this->input->post('MRP_Amount'),
    "Quantity" => $this->input->post('Quantity'),
    "order_method" =>$this->input->post('order_method'),
    "custom_order_size" => $this->input->post('custom_order_size'),
    "custom_order_color" => $this->input->post('custom_order_color'),
    "customized_product_data" =>json_encode($attribute_selected_names),

);

$where=$cart_data=array();
$cart_data['UserlD'] = MY_SESSION_ID;
if ($this->loggedin){  
$where['UserlD'] =  $this->customer->UserID;
if(!$this->core->update('cart_master', $cart_data, $where)) {
//$cart_data['customer_id'] = $this->customer->id;
}
$cart = $this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
}else{ 
    $cart_data['UserlD'] = MY_SESSION_ID;
    $cart = $this->core->get('cart_master', $cart_data);
}

if ($cart == false) {
     if ($this->loggedin) {
        $cart_data['UserlD'] =  $this->customer->UserID;
    }

    $cart_data['Order_Number']=$uniqueNumber;
    if($cart_id=$this->core->insert('cart_master', $cart_data)){
        $response=$this->add_customized_item_to_cart($cart_id,$table_col_data,$attribute_selected);
        $this->session->set_userdata('cart_id', $cart_id);
        //$this->session->set_flashdata('success', 'Product successfully added to your cart');
    }else{
        //$this->session->set_flashdata('error', 'Failed to add to Cart');
        $response =  false;
    }
}
else{
    $cart_id = is_array($cart) ? $cart[0]->OrderlD : $cart->OrderlD;
    $response = $this->add_customized_item_to_cart($cart_id, $table_col_data,$attribute_selected);
    $this->session->set_userdata('cart_id', $cart_id);
}
redirect('cart','refresh');
exit();
}

public function customized_price()
{

    
}
public function add_customized_item_to_cart($cart_id=false, $post_data=false,$attribute_selected=false)
{
    $ProductID=$post_data['product_pk_ID'];   
    $order_method=$post_data['order_method'];
    $customized_product_data=$post_data['customized_product_data'];
    $custom_attribute_selected=$attribute_selected;
    $custom_order_size=$post_data['custom_order_size'];
    $custom_order_polish=$post_data['custom_order_polish'];
    $custom_order_weight=$post_data['custom_order_weight'];
    $custom_order_color=$post_data['custom_order_color'];
    $custom_order_clarity=$post_data['custom_order_clarity'];
    $custom_order_cut=$post_data['custom_order_cut'];
    
    $cart_items = $where = array();
    $where = array('ProductID'=>$ProductID);
    $product = $this->core->get('products', $where);


    /*Allow Only 60% amount for customization order*/
    $percent_amount=($product->Price*40/100);
    $after_discount_amount=($product->Price*1-$percent_amount*1);
    /*End*/
  
        $cart_items['OrderID'] = $cart_id;
        $cart_items['ProductID'] = $ProductID;
        $cart_items['ProductName'] = $product->Name;
        $cart_items['ProductSKU'] = $product->SKU;
        $cart_items['ProductPrice'] = $product->Price;
        $cart_items['Amount'] = $after_discount_amount;
        $cart_items['MRP_Price'] = $product->MRP_Price;
        $cart_items['MRP_Amount'] = $product->MRP_Price;
        $cart_items['Quantity'] = 1;
        $cart_items['order_method'] = $order_method;
        $cart_items['customized_product_data'] = $customized_product_data;
            if(!$this->core->get('cart_details', array("OrderID"=>$cart_id,"ProductID"=>$ProductID))) {
                 $last_insert_ID=$this->core->insert('cart_details', $cart_items);
                if ($last_insert_ID){ 
                    
                    $order_material_data=array(
                        "size"=>$custom_attribute_selected['size'],
                        "polish"=>$custom_attribute_selected['polish'],
                        "size_of_the_metal"=>$custom_attribute_selected['size_of_the_metal'],
                        "color"=>$custom_attribute_selected['color'],
                        "clarity"=>$custom_attribute_selected['clarity'],
                        "cut"=>$custom_attribute_selected['cut'],
                        "cart_item_id"=>$last_insert_ID,
                        "product_id"=>$ProductID,
                        "product_price"=>$product->Price,
                        "estimated_price"=>$product->Price,
                        "payable_price"=>$after_discount_amount,
                        "paid"=>0,
                        "product_type"=>$order_method,
                        "cutoff_discount"=>"40%",
                    );
                    $this->core->insert('order_customization', $order_material_data);
                   
                    /*
                    $this->core->insert('product_custom_option', $order_material_data);
                    $d_cl_co_explode=explode("-", $custom_order_color);       
                        $diamond_color_d=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($d_cl_co_explode[0])));
                        $diamond_color_ID=$diamond_color_d[0]->OptionID;
                        $diamond_clarity_d=$this->purchase_cart->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($d_cl_co_explode[1])));
                        $diamond_clarity_ID=$diamond_clarity_d[0]->OptionID;
                        $diamond_customized_data=array(
                        "Cart_DetailsID"=>$last_insert_ID,
                        "OptionID"=>$diamond_color_ID,
                        "Combination_OptionID"=>$diamond_clarity_ID,
                        "OptionSize"=>0,
                        "OptionWeight"=>0,
                        "OptionPriceincrement"=>0,
                        "attribute_type"=>"diamond",
                        );
                        $this->core->insert('product_custom_option', $diamond_customized_data);
                    */
                $this->session->set_flashdata('success', 'Product successfully added to your cart');
                $this->order_summary_amount($cart_id); 
                }else{
                return true;
            }
        }else{   
            $this->session->set_flashdata('error', 'Product aready exists in cart');
            return false;
        }     
}
public function add_item_to_cart($cart_id=false, $post_data=false)
{
    $ProductID=$post_data['product_pk_ID'];   
    $cart_items = $where = array();
    $where = array('ProductID'=>$ProductID);
    $product = $this->core->get('products', $where);

    if ($product->Productlive == 1 && $product->Stock>0) {
        $cart_items['OrderID'] = $cart_id;
        $cart_items['ProductID'] = $ProductID;
        $cart_items['ProductName'] = $product->Name;
        $cart_items['ProductSKU'] = $product->SKU;
        $cart_items['ProductPrice'] = $product->Price;
        $cart_items['Amount'] = $product->Price;
        $cart_items['MRP_Price'] = $product->MRP_Price;
        $cart_items['MRP_Amount'] = $product->MRP_Price;
        $cart_items['product_type'] = $product->product_type;
        $cart_items['sub_product_type'] = $product->sub_product_type;
        $cart_items['voucher_code'] = isset($post_data['voucher_code'])?$post_data['voucher_code']:'';
        $cart_items['Quantity'] = 1;

            if (!$this->core->get('cart_details', array("OrderID"=>$cart_id,"ProductID"=>$ProductID))) {
            if (!$this->core->insert('cart_details', $cart_items)) {
            $this->session->set_flashdata('error', 'Falied to add to Cart');
            }else{        

                $this->order_summary_amount($cart_id);                 
                $this->session->set_flashdata('success', 'Product successfully added to your cart');
                return true;
            }
        }else{   
            $this->session->set_flashdata('error', 'Product aready exists in cart');
            return false;
        }

    }else{
        $this->session->set_flashdata('error', 'Product not available');
        return false;
    }      
}

public function remove($cart_id,$ProductID,$OrderID)
{

    $cart_data = array();
    if($this->remove_item_from_cart($cart_id, $ProductID)){
        $this->session->set_flashdata('success', 'Product removed from cart');
        $this->order_summary_amount($OrderID);
    }else{
        $this->session->set_flashdata('error', 'Failed to remove from cart');
    }
    $cart_items['Order_DetailsID '] = $cart_id;
    $items = $this->core->get('cart_details', $cart_items);

     redirect('cart','refresh');
 
}

public function remove_item_from_cart($cart_id, $ProductID)
{
    $cart_items = $where = array(); 
    $cart_items['Order_DetailsID '] = $cart_id;
    $cart_items['ProductID'] = $ProductID;
    $cart = $this->core->get('cart_details', $cart_items);
    if($cart!=false){

        $OrderID=$cart->OrderID;
        $del_cart_master = $this->core->select('cart_details', array("OrderID"=>$OrderID));
        $count_cart_items=count((array)$del_cart_master );


    if($this->core->delete('cart_details', $cart_items)){
    //$this->core->delete('order_customization', array("cart_item_id"=>$cart_id));

    if($count_cart_items==1){
         $this->core->delete('cart_master', array("OrderlD"=>$OrderID));
    }

    $this->session->set_flashdata('success', 'Cart item removed successfully');
    return true;
    }
    return false;
    }else{
         $this->session->set_flashdata('error', 'Cart item not removed.');
    return false;
    }   
}

public function checkout($form_type=false)
{

    $expand_form=$this->input->get('page');
    if($this->loggedin){
     $expand_form=isset($expand_form)?$expand_form:"addagift";
    }
    else{
     $expand_form=isset($expand_form)?$expand_form:"";
    }
    $Actual_UserID=isset($this->customer->UserID)?$this->customer->UserID:0;
    $data['form_type']=$this->input->get('form');
    $data['login_form'] = $this->load->view('layouts/login',"",true);
    $data['page'] = 'checkout';
    $data['expand_form'] = $expand_form;
    $data['page_title'] = 'Checkout | Anaya Jewellery';
    $data['return_url'] = site_url().'razorpay/callback';
    $data['surl'] = site_url().'razorpay/success';
    $data['furl'] = site_url().'razorpay/failed';
    if($this->loggedin){
    $data['products'] = $this->purchase_cart->get_cart_with_customer_id($Actual_UserID);
    $this->count_cart_item=$this->purchase_cart->get_cart_with_customer_id($Actual_UserID);
    $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
    }else{
    $data['products'] = $this->purchase_cart->get_cart_items();
    $data['sub_total_data']=$this->purchase_cart->get_summary_prices($data['products']);
    }




    $data['order_gift_messages'] = $this->core->get_order_by('order_gift_messages', "ID", array("UserID"=>$Actual_UserID), "DESC", 1, "");

    $data['gift_special_message']=isset($data['order_gift_messages'][0]->gift_special_message)?$data['order_gift_messages'][0]->gift_special_message:"";
    $data['gift_email']=isset($data['order_gift_messages'][0]->gift_email)?$data['order_gift_messages'][0]->gift_email:"";
    $data['gift_for']=isset($data['order_gift_messages'][0]->gift_for)?$data['order_gift_messages'][0]->gift_for:"";
    $data['get_for_updates']=isset($data['order_gift_messages'][0]->get_for_updates)?$data['order_gift_messages'][0]->get_for_updates:"";
    $data['gift_message_packaging']=isset($data['order_gift_messages'][0]->gift_message_packaging)?$data['order_gift_messages'][0]->gift_message_packaging:"";
   

    $data['shipping_address'] = $this->core->get_order_by('address_master', "AddressID", array("addtype"=>'shipping',"UserID"=>$Actual_UserID), "DESC", 1, "");
    $data['ship_Fullname']=isset($data['shipping_address'][0]->Fullname)?$data['shipping_address'][0]->Fullname:"";
    $data['ship_Address1']=isset($data['shipping_address'][0]->Address1)?$data['shipping_address'][0]->Address1:"";
    $data['ship_Address2']=isset($data['shipping_address'][0]->Address2)?$data['shipping_address'][0]->Address2:"";
    $data['ship_Pincode']=isset($data['shipping_address'][0]->Pincode)?$data['shipping_address'][0]->Pincode:"";
    $data['ship_City']=isset($data['shipping_address'][0]->City)?$data['shipping_address'][0]->City:"";
    $data['ship_State']=isset($data['shipping_address'][0]->State)?$data['shipping_address'][0]->State:"";
    $data['ship_Country']=isset($data['shipping_address'][0]->Country)?$data['shipping_address'][0]->Country:"";
    $data['ship_Mobile']=isset($data['shipping_address'][0]->Mobile)?$data['shipping_address'][0]->Mobile:"";


    $data['billing_address'] = $this->core->get_order_by('address_master', "AddressID", array("addtype"=>'billing',"UserID"=>$Actual_UserID), "DESC", 1, "");
    $data['bill_Fullname']=isset($data['billing_address'][0]->Fullname)?$data['billing_address'][0]->Fullname:"";
    $data['bill_Address1']=isset($data['billing_address'][0]->Address1)?$data['billing_address'][0]->Address1:"";
    $data['bill_Address2']=isset($data['billing_address'][0]->Address2)?$data['billing_address'][0]->Address2:"";
    $data['bill_Pincode']=isset($data['billing_address'][0]->Pincode)?$data['billing_address'][0]->Pincode:"";
    $data['bill_City']=isset($data['billing_address'][0]->City)?$data['billing_address'][0]->City:"";
    $data['bill_State']=isset($data['billing_address'][0]->State)?$data['billing_address'][0]->State:"";
    $data['bill_Country']=isset($data['billing_address'][0]->Country)?$data['billing_address'][0]->Country:"";
    $data['bill_Mobile']=isset($data['billing_address'][0]->Mobile)?$data['billing_address'][0]->Mobile:"";
    $data['billing_same_as_shipping']=isset($data['billing_address'][0]->billing_same_as_shipping)?$data['billing_address'][0]->billing_same_as_shipping:"";
    

    $shipping_charges=isset($data['sub_total_data']['shipping_charges'])?$data['sub_total_data']['shipping_charges']:0;
    $handling_charges=isset($data['sub_total_data']['handling_charges'])?$data['sub_total_data']['handling_charges']:0;
    $data['order_total'] = ($data['sub_total_data']['ac_price']+$shipping_charges+$handling_charges)*1;



    $cart_master_data=$this->core->getWithId("cart_master", "OrderlD",$this->session->userdata('cart_id'));
    $data['cart_master_data']=$cart_master_data;

    $data['order_summary_data'] = $this->load->view('layouts/order_summary',$data,true);
    $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
    $data['include_files'][] = './be-assets/includes/cart.php';    
    $this->load->view('anaya-template', $data);

}

public function wishlist()
{
    $Actual_UserID=isset($this->customer->UserID)?$this->customer->UserID:0;
    $data['page'] = 'wishlist';
    $data['page_title'] = 'wishlist';
    $wish_lists=array();    
    if($this->loggedin){
    $wish_lists=array("UserlD"=> $Actual_UserID);
    $data['wishlists']=$this->purchase_cart->get_wishlists($Actual_UserID);
    }else{
    $wish_lists=array();
    $data['wishlists']=$this->purchase_cart->get_wishlists($Actual_UserID);
    }
    $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
    $data['wishlists_html'] = $this->load->view('layouts/wishlists',$data,true);
    $data['include_files'][] = './be-assets/includes/cart.php';    
    $this->load->view('anaya-template', $data);    
}
public function save_wishlist($get_ProductID=false,$cart_id=false,$OrderID=false){

  


    if(isset($_SESSION['anaya_user_data']) && $_SESSION['anaya_user_data'] != '') {  
        
    }
    else {
        redirect('login');
    }


    $Actual_UserID=isset($this->customer->UserID)?$this->customer->UserID:0;
    if(!empty($get_ProductID)){
         $product_ID=$get_ProductID;
    }
    else{
         $product_ID=$this->input->post('product_id');
    }
   
  
    $wish_lists=array("ProductID"=>$product_ID,"UserID"=>$Actual_UserID);
    if(!$this->core->get('wish_lists', $wish_lists)){
        $params=array(
            "UserID"=>$Actual_UserID,
            "ProductID"=>$product_ID
        );  
        $last_insert_ID=$this->core->insert('wish_lists',$params);
        if($last_insert_ID>0) {
        $this->session->set_flashdata('success', 'Successfully moved to whislist.');
        if(!empty($cart_id) && !empty($OrderID)) {
         $this->remove($cart_id,$get_ProductID,$OrderID);
        }

    }
    else{
        $this->session->set_flashdata('error', 'Something went wrong.');
    }

    }
    else{
         $this->session->set_flashdata('error', 'Already exists.');
    }   


   


    redirect("cart/wishlist","refresh");
  exit();
}

public function remove_wishlist($WishlistID=false)
{
    $wish_lists=array();  
    $wish_lists=array("WishlistID"=>$WishlistID);
    //$data['wishlists']=$this->core->delete('wish_lists', $wish_lists); 
    if($this->core->delete('wish_lists', $wish_lists)){
     $this->session->set_flashdata('success', 'Successfully removed from whislist.');
    }
    else{
    $this->session->set_flashdata('error', 'Something went wrong.');
    }


    redirect('cart/wishlist','refresh');   
}

public function address_pick(){


    $Actual_UserID=isset($this->customer->UserID)?$this->customer->UserID:0;

    $shipping_address=array(
        "Fullname"=>$this->input->post('shp_Fullname'),
        "Address1"=>$this->input->post('shp_street_house'),
        "Address2"=>$this->input->post('shp_address'),
        "Pincode"=>$this->input->post('shp_pincode'),
        "City"=>$this->input->post('shp_city'),
        "Country"=>$this->input->post('shp_county'),
        "State"=>$this->input->post('shp_state'),
        "Mobile"=>$this->input->post('shp_mobile_numer'),
        "UserID"=>$Actual_UserID,
        "addtype"=>'shipping',
        "is_default"=>true
    );
    $billing_address=array(
        "Fullname"=>$this->input->post('bill_Fullname'),
        "Address1"=>$this->input->post('bill_street_house'),
        "Address2"=>$this->input->post('bill_address'),
        "Pincode"=>$this->input->post('bill_pincode'),
        "City"=>$this->input->post('bill_city'),
        "Country"=>$this->input->post('bill_county'),
        "State"=>$this->input->post('bill_state'),
        "Mobile"=>$this->input->post('bill_mobile_numer'),
        "billing_same_as_shipping"=>$this->input->post('homepostalcheck'),
        "UserID"=>$Actual_UserID,
        "addtype"=>"billing",
        "is_default"=>true
    );

    $shipping_billing_address=array(
        "shipping_Fullname"=>$this->input->post('shp_Fullname'),
        "shipping_Address1"=>$this->input->post('shp_street_house'),
        "shipping_Address2"=>$this->input->post('shp_address'),
        "shipping_Pincode"=>$this->input->post('shp_pincode'),
        "shipping_City"=>$this->input->post('shp_city'),
        "shipping_Country"=>$this->input->post('shp_county'),
        "shipping_State"=>$this->input->post('shp_state'),        
        "shipping_Mobile"=>$this->input->post('shp_mobile_numer'),

        "billing_Fullname"=>$this->input->post('bill_Fullname'),
        "billing_Address1"=>$this->input->post('bill_street_house'),
        "billing_Address2"=>$this->input->post('bill_address'),
        "billing_Pincode"=>$this->input->post('bill_pincode'),
        "billing_City"=>$this->input->post('bill_city'),
        "billing_Country"=>$this->input->post('bill_county'),
        "billing_State"=>$this->input->post('bill_state'),
        "billing_Mobile"=>$this->input->post('bill_mobile_numer'),
        "Delivery_Mode"=>$this->input->post('customRadioInline1'),
        "OrderShipName"=>$_SESSION['anaya_user_data']->UserFirstName." ".$_SESSION['anaya_user_data']->UserLastName,
        "OrderPhone"=>$_SESSION['anaya_user_data']->UserPhone,
        "OrderEmall"=>$_SESSION['anaya_user_data']->UserEmail,
 
    );



$where_shipping=array("UserID"=>$Actual_UserID,"is_default"=>true,"addtype"=>"shipping");
$is_default_ad_s=$this->core->select('address_master',$where_shipping);
$shipping_count=count((array)$is_default_ad_s);

$where_billing=array("UserID"=>$Actual_UserID,"is_default"=>true,"addtype"=>"billing");
$is_default_ad_b=$this->core->select('address_master',$where_billing);
$billing_count=count((array)$is_default_ad_b);


if($shipping_count==0){
    $this->core->insert("address_master",$shipping_address);
}
else{
    $this->core->update("address_master",$shipping_address,$where_shipping);
}

if($billing_count==0){
    $this->core->insert("address_master",$billing_address);
}
else{
    $this->core->update("address_master",$billing_address,$where_billing);
}

    $where_address = array("OrderlD"=>$this->session->userdata('cart_id'));
    $update = $this->core->update("cart_master", $shipping_billing_address,$where_address); 
     $this->session->set_flashdata('success', 'Address successfully added.');
    redirect('cart/checkout/?page=payment','refresh');
    exit();
}
public function order_gift_messages(){
      $Actual_UserID=isset($this->customer->UserID)?$this->customer->UserID:0;
       $gift_message=array(
        "gift_special_message"=>$this->input->post('gift_special_message'),
        "gift_message_packaging"=>$this->input->post('gift_message_packaging'),
        "gift_email"=>$this->input->post('gift_email'),
        "gift_for"=>$this->input->post('gift_for'),
        "get_for_updates"=>$this->input->post('get_for_updates'),
        "UserID"=>$Actual_UserID,
    );

    if(!empty($this->input->post('gift_for'))){
     $this->core->insert("order_gift_messages",$gift_message);
     $this->session->set_flashdata('success', 'Gift message successfully added.');
    }
     
    redirect('cart/checkout/?page=delivery_pickup_address','refresh');
    exit();
}


public function updateItemQty(){
      $post_values=$this->input->post(); 
             
        // Get cart item info
        $quantity_no = $this->input->post('quantity_no');
        $cartid = $this->input->post('cartid');   
        $where_cart=array('Order_DetailsID' =>$cartid);    
        // Update item in the cart
        if(!empty($quantity_no) && !empty($cartid)){
            $data = array(    
                'Quantity'   => $quantity_no,
             
            );
            $update = $this->core->update("cart_details",$data,$where_cart);
        }
        

  
    $items = $this->core->get('cart_details', $where_cart);
    if($items) {
        $grand_total=$items->Quantity*$items->ProductPrice;
        $mrp_grand_total=$items->Quantity*$items->MRP_Price;
             $data_c = array(      
                'Amount'   => $grand_total,
                'MRP_Amount'   => $mrp_grand_total
            );            
            $update = $this->core->update("cart_details", $data_c,$where_cart); 
            $this->order_summary_amount($items->OrderID);
            $this->session->set_flashdata('success', 'Quantity successfully added.');
        

    }else{
     $this->session->set_flashdata('error', 'Quantity not update.');
    }



        // Return response
        //echo $update?'ok':'err';
    }

    public function order_summary_amount($OrderID=false)
    {       
        $grand_total = $this->purchase_cart->_order_summary_amount($OrderID); 
        if($grand_total){       
            $where = array("OrderlD"=>$OrderID);
            $order_items = $this->core->get('cart_master', $where);
            if($order_items){            
            $data_params = array(      
                'OrderAmount'   => $grand_total,   
            );           
                $update=$this->core->update("cart_master",$data_params, $where);
            }else{

            }

        }else{

        }

    }

    public function remove_coupon()
    {
        $coupon_id = $this->input->post('coupon_id', TRUE);
        $response = ['status'=>'', 'message'=>""];
        $coupon = $this->purchase_cart->get_coupons($coupon_id);
        if(!$coupon){
            $response = ['status'=>'failed', 'message'=>"Coupon does not exist"];
            echo json_encode($response);
            exit();
        }
        $items = $this->purchase_cart->get_cart_items();
        
        foreach ($items as $key => $item) {
               $set = array(
                'CouponID'=>'', 
               'CouponCode'=> '', 
               'discounted_amount'=>'');
                $where = array('OrderID'=>$item->OrderID,);

            if(!$this->core->update('cart_details',$set,$where)){
                
                $this->core->update('cart_details',$set,$where);                
                $response = ['status'=>'failed', 'message'=>"Coupon removing failed"];
                break;
            }
            $this->order_summary_amount($item->OrderID);
            $response = ['status'=>'success', 'message'=>"Coupon Removed"];
            break;
        }
        echo json_encode($response);
        exit();
    }

    public function apply_coupon()
    {   
        $coupon_id = $this->input->post('coupon_id', TRUE);
        $response = ['status'=>'', 'message'=>""];
        $coupon = $this->purchase_cart->get_coupons($coupon_id);

        if(!$coupon){
            $response = ['status'=>'failed', 'message'=>"Coupon does not exist"];
            echo json_encode($response);
            exit();
        }
        $items = $this->purchase_cart->get_cart_items();


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
                $discounted_amount =  $making_charges * ($coupon->Discount_value)/100;
            else{
                $discounted_amount =  $coupon->Discount_value;
            }  

            if ($discounted_amount > $item->Amount) {
                $response = ['status'=>'failed', 'message'=>"Discount amount can not be more than cart amount"];
                echo json_encode($response);
                exit();            
            }             

                // echo '<pre>making_charges'; print_r($making_charges); 
                // echo '<pre>Discount_value'; print_r($coupon->Discount_value); 
                // echo '<pre>'; print_r($discounted_amount); 
                // exit();
             
             $set = array(
                'CouponID'=>$coupon->CouponID, 
               'CouponCode'=> $coupon->CouponCode, 
               'discounted_amount'=>$discounted_amount);
             $where = array('Order_DetailsID'=>$item->Order_DetailsID);


            if(!$this->core->update('cart_details',$set,$where)){
                $set = array(
                'CouponID'=>'', 
               'CouponCode'=> '', 
               'discounted_amount'=>'');
                $where = array('OrderID'=>$item->OrderID);
                $this->core->update('cart_details',$set,$where);   

                           
                $response = ['status'=>'failed', 'message'=>"Coupon application failed"];
                break;
            }
            $this->order_summary_amount($item->OrderID);  
            $response = ['status'=>'success', 'message'=>"Coupon applied"];
        }
        echo json_encode($response);
        exit();
    }

}