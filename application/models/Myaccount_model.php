<?php
class Myaccount_model extends CI_Model{

	public function get_count_month()
	{
		$this->db->select('count(*)');
		$query = $this->db->get('order');
		$cnt = $query->row_array();
		return $cnt['count(*)'];
	}

	public function get_orders($id){

		$this->db->select('o.Order_status Order_status,o.OrderlD order_id,o.OrderAmount order_amount,o.OrderShipName order_shipname,o.OrderPhone order_phone,o.Shipping_Charges_Amount o_Shipping_Charges_Amount,o.Handling_Charges_Amount o_Handling_Charges_Amount,o.OrderShipping order_shipping,o.OrderTax order_tax,o.OrderEmall order_email,o.OrderDate order_date,o.OrderShipped order_shipped,o.OrderTrackingNumber order_trackingnumber,o.DeliveryDate order_DeliveryDate,o.Order_status order_status,o.billing_Fullname o_billing_Fullname,o.billing_Address1 o_billing_Address1,o.billing_Address2 o_billing_Address2,o.billing_LandMark o_billing_LandMark,o.billing_City o_billing_City,o.billing_Pincode o_billing_Pincode,o.billing_State o_billing_State,o.billing_Country o_billing_Country,o.billing_Mobile o_billing_Mobile,o.shipping_Fullname o_shipping_Fullname,o.shipping_Address1 o_shipping_Address1,o.shipping_Address2 o_shipping_Address2,o.shipping_LandMark o_shipping_LandMark,o.shipping_City o_shipping_City,o.shipping_State o_shipping_State,o.shipping_Pincode o_shipping_Pincode,o.shipping_Country o_shipping_Country,o.shipping_Mobile o_shipping_Mobile,o.CartID o_CartID,o.Order_Number o_Order_Number,o.shipped_by_id  o_shipped_by_id,o.shipped_traking_no o_shipped_traking_no,o.shipping_to_date o_shipping_to_date,o.cancelled_remarks o_cancelled_remarks,dp.name dp_name,u.UserID user_id ,u.UserFirstName u_first_name,u.UserLastName u_last_name,u.UserEmail u_user_email,u.UserGender user_gender,u.UserPhone user_phone,p.PaymentID p_PaymentID,p.Order_ID p_Order_ID,p.Order_Number p_Order_Number,p.captured p_captured,p.created_at p_created_at,p.fullname p_fullname,p.emailid p_emailid,p.contact_number p_contact_number,p.amount p_amount,p.payment_date p_payment_date,p.currency p_currency,p.TransactionID p_TransactionID,p.PaymentStatus p_PaymentStatus,p.Payment_method p_Payment_method,p.success p_success,p.merchant_total p_merchant_total,p.JsonData p_JsonData');
        $this->db->from('order as o');
        $this->db->join('users as u', 'u.UserID=o.UserlD','left');
        $this->db->join('payments as p', 'p.PaymentID=o.PaymentID','left');
        $this->db->join('delivery_partners as dp', 'dp.id=o.shipped_by_id','left');  
        $this->db->where('o.UserlD', $id);
        $this->db->order_by("o.OrderlD", "DESC");
        $query = $this->db->get();
        $orders = $query->result();

        $temp = array();

        foreach ($orders as $key => $order) {
        	 $order->items = $this->get_orderdetails($order->order_id);
        	 $temp[] = $order;
        }

        return $temp;
	}
	public function get_order_details_id($id){

		$this->db->select('o.Order_status Order_status,o.OrderlD order_id,o.OrderAmount order_amount,o.OrderShipName order_shipname,o.Shipping_Charges_Amount o_Shipping_Charges_Amount,o.Handling_Charges_Amount o_Handling_Charges_Amount,o.OrderPhone order_phone,o.OrderShipping order_shipping,o.OrderTax order_tax,o.OrderEmall order_email,o.OrderDate order_date,o.OrderShipped order_shipped,o.OrderTrackingNumber order_trackingnumber,o.DeliveryDate order_DeliveryDate,o.Order_status order_status,o.billing_Fullname o_billing_Fullname,o.billing_Address1 o_billing_Address1,o.billing_Address2 o_billing_Address2,o.billing_LandMark o_billing_LandMark,o.billing_City o_billing_City,o.billing_Pincode o_billing_Pincode,o.billing_State o_billing_State,o.billing_Country o_billing_Country,o.billing_Mobile o_billing_Mobile,o.shipping_Fullname o_shipping_Fullname,o.shipping_Address1 o_shipping_Address1,o.shipping_Address2 o_shipping_Address2,o.shipping_LandMark o_shipping_LandMark,o.shipping_City o_shipping_City,o.shipping_State o_shipping_State,o.shipping_Pincode o_shipping_Pincode,o.shipping_Country o_shipping_Country,o.shipping_Mobile o_shipping_Mobile,o.CartID o_CartID,o.Order_Number o_Order_Number,u.UserID user_id ,u.UserFirstName u_first_name,u.UserLastName u_last_name,u.UserEmail u_user_email,u.UserGender user_gender,u.UserPhone user_phone,p.PaymentID p_PaymentID,p.Order_ID p_Order_ID,p.Order_Number p_Order_Number,p.captured p_captured,p.created_at p_created_at,p.fullname p_fullname,p.emailid p_emailid,p.contact_number p_contact_number,p.amount p_amount,p.payment_date p_payment_date,p.currency p_currency,p.TransactionID p_TransactionID,p.PaymentStatus p_PaymentStatus,p.Payment_method p_Payment_method,p.success p_success,p.merchant_total p_merchant_total');
                $this->db->from('order as o');
                $this->db->join('users as u', 'u.UserID=o.UserlD','left');
                $this->db->join('payments as p', 'p.PaymentID=o.PaymentID','left'); 
                $this->db->join('order_details as d', 'p.Order_ID=o.OrderlD','left'); 
                $this->db->where('o.OrderlD', $id);
                $query = $this->db->get();
                $orders= $query->result();

                foreach ($orders as $key => $order) {
                        $order->items = $this->get_orderdetails($order->order_id);
                }
                return $order;
	}

	public function get_orderdetails($order_id)
	{
		$this->db->select('o.Order_status Order_status,o.OrderlD,d.OrderID d_OrderID,d.ProductID d_ProductID,d.ProductName d_ProductName,d.MRP_Price d_MRP_Price,d.ProductPrice d_ProductPrice,d.ProductSKU d_ProductSKU,d.Quantity d_Quantity,d.Amount d_Amount,d.MRP_Amount d_MRP_Amount,p.ProductID p_ProductID,p.SKU p_SKU,p.Name p_Name,p.slug p_slug,p.MRP_Price p_MRP_Price,p.Price p_Price,p.Making_charges_unit p_Making_charges_unit,p.Making_charges p_Making_charges,p.Making_chg_On_Grs_Net_Weight p_Making_chg_On_Grs_Net_Weight,p.discount_percentage p_discount_percentage,p.Width p_Width,p.Length p_Length,p.Height p_Height,p.CartDesc p_CartDesc,p.ShortDesc p_ShortDesc,p.LongDesc p_LongDesc,p.Thumbnail p_Thumbnail,p.lmage p_lmage,p.CategoryID p_CategoryID,p.Sub_CategorylD p_Sub_CategorylD,p.UpdateDate p_UpdateDate,p.Stock p_Stock,p.Gender p_Gender,p.Collection p_Collection,p.OptionGroupID p_OptionGroupID,p.Material_type p_Material_type,p.No_of_pieces p_No_of_pieces,p.Gross_weight p_Gross_weight,p.Net_weight p_Net_weight,p.Polish_Details p_Polish_Details,pos.OptionName as pos_OptionName');
                $this->db->from('order_details d');
                $this->db->join('order as o', 'o.OrderlD=d.OrderID','left');
                $this->db->join('products as p', 'p.ProductID=d.ProductID','left');
                // $this->db->join('material_type as m', 'm.MaterialID=p.Material_type','left');
                $this->db->join('product_option as po', 'po.ProductID=p.ProductID','left');

                  $this->db->join('productoptions as pos', 'pos.OptionID=po.Combination_OptionID','left');
                  $this->db->where('po.attribute_type', "material");
                $this->db->where('d.OrderID', $order_id);
                $query = $this->db->get();
                return $query->result();
	}
        
        
        public function get_wishlistetails($user_id)
        {
                $this->db->select('w.WishlistID w_WishlistID,u.UserID u_UserID,p.ProductID p_ProductID,p.SKU p_SKU,p.Name p_Name,p.slug p_slug,p.MRP_Price p_MRP_Price,p.Price p_Price');
                $this->db->from('wish_lists w');
                $this->db->join('users as u', 'u.UserID=w.UserID','left');
                $this->db->join('products as p', 'p.ProductID=w.ProductID','left');
                $this->db->where('w.UserID', $user_id);
                $query = $this->db->get();
                return $query->result();
        }
        public function get_order_details($id){
        // echo $id;
        $order = NULL;
        $this->db->select('o.Order_status Order_status,o.OrderlD order_id,o.OrderAmount order_amount,o.OrderShipName order_shipname,o.OrderPhone order_phone,o.Shipping_Charges_Amount o_Shipping_Charges_Amount,o.Handling_Charges_Amount o_Handling_Charges_Amount,o.OrderShipping order_shipping,o.OrderTax order_tax,o.OrderEmall order_email,o.OrderDate order_date,o.OrderShipped order_shipped,o.OrderTrackingNumber order_trackingnumber,o.DeliveryDate order_DeliveryDate,o.Order_status order_status,o.billing_Fullname o_billing_Fullname,o.billing_Address1 o_billing_Address1,o.billing_Address2 o_billing_Address2,o.billing_LandMark o_billing_LandMark,o.billing_City o_billing_City,o.billing_Pincode o_billing_Pincode,o.billing_State o_billing_State,o.billing_Country o_billing_Country,o.billing_Mobile o_billing_Mobile,o.shipping_Fullname o_shipping_Fullname,o.shipping_Address1 o_shipping_Address1,o.shipping_Address2 o_shipping_Address2,o.shipping_LandMark o_shipping_LandMark,o.shipping_City o_shipping_City,o.shipping_State o_shipping_State,o.shipping_Pincode o_shipping_Pincode,o.shipping_Country o_shipping_Country,o.shipping_Mobile o_shipping_Mobile,o.CartID o_CartID,o.Order_Number o_Order_Number,u.UserID user_id ,u.UserFirstName u_first_name,u.UserLastName u_last_name,u.UserEmail u_user_email,u.UserGender user_gender,u.UserPhone user_phone,p.PaymentID p_PaymentID,p.Order_ID p_Order_ID,p.Order_Number p_Order_Number,p.captured p_captured,p.created_at p_created_at,p.fullname p_fullname,p.emailid p_emailid,p.contact_number p_contact_number,p.amount p_amount,p.payment_date p_payment_date,p.currency p_currency,p.TransactionID p_TransactionID,p.PaymentStatus p_PaymentStatus,p.Payment_method p_Payment_method,p.success p_success,p.merchant_total p_merchant_total');
        $this->db->from('order as o');
        $this->db->join('users as u', 'u.UserID=o.UserlD','left');
        $this->db->join('payments as p', 'p.UserID=o.UserlD','left');   
        $this->db->where('o.OrderlD', $id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $order=$query->row();
            //Query for details
            $this->db->select('o.Order_status Order_status,o.OrderlD,d.OrderID d_OrderID,d.ProductID d_ProductID,d.ProductName d_ProductName,d.MRP_Price d_MRP_Price,d.ProductPrice d_ProductPrice,d.ProductSKU d_ProductSKU,d.Quantity d_Quantity,d.Amount d_Amount,d.MRP_Amount d_MRP_Amount,p.ProductID p_ProductID,p.SKU p_SKU,p.Name p_Name,p.slug p_slug,p.MRP_Price p_MRP_Price,p.Price p_Price,p.Making_charges_unit p_Making_charges_unit,p.Making_charges p_Making_charges,p.Making_chg_On_Grs_Net_Weight p_Making_chg_On_Grs_Net_Weight,p.discount_percentage p_discount_percentage,p.Width p_Width,p.Length p_Length,p.Height p_Height,p.CartDesc p_CartDesc,p.ShortDesc p_ShortDesc,p.LongDesc p_LongDesc,p.Thumbnail p_Thumbnail,p.lmage p_lmage,p.CategoryID p_CategoryID,p.Sub_CategorylD p_Sub_CategorylD,p.UpdateDate p_UpdateDate,p.Stock p_Stock,p.Gender p_Gender,p.Collection p_Collection,p.OptionGroupID p_OptionGroupID,p.Material_type p_Material_type,p.No_of_pieces p_No_of_pieces,p.Gross_weight p_Gross_weight,p.Net_weight p_Net_weight,p.Polish_Details p_Polish_Details,pos.OptionName as pos_OptionName');
            $this->db->from('order_details d');
                $this->db->join('order as o', 'o.OrderlD=d.OrderID','left');
                $this->db->join('products as p', 'p.ProductID=d.ProductID','left');
                // $this->db->join('material_type as m', 'm.MaterialID=p.Material_type','left');
                $this->db->join('product_option as po', 'po.ProductID=p.ProductID','left');

                  $this->db->join('productoptions as pos', 'pos.OptionID=po.Combination_OptionID','left');
                  $this->db->where('po.attribute_type', "material");
                $this->db->where('d.OrderID', $id);
            $query = $this->db->get();


            $order->items= $query->result();

            //Query for Coupons
            $this->db->select('o.Order_status Order_status,c.CouponID c_CouponID,c.Coupon_title c_Coupon_title,c.CouponCode c_CouponCode,c.CouponExpiryDate c_CouponExpiryDate,c.CouponAddedon c_CouponAddedon,c.Description c_Description,c.DiscountType c_DiscountType,c.Discount_value c_Discount_value,c.Cartamount c_Cartamount,c.Couponamount c_Couponamount');
            $this->db->from('coupons c');
            $this->db->join('order as o', 'o.CouponID=c.CouponID','left');            
            $this->db->where('o.OrderlD', $id);
            $query = $this->db->get();
            $order->coupons= $query->result();
       }
       return $order;
        
       // echo '<pre>'; print_r($order); exit();
    }


    public function order_track($docket_number=false)
    {



$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => 'http://test.sequel247.com/api/track',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'
    {    
        "docket": "$docket_number",
        "token": "ad11cd9004e9993942c5ccd6c1cfc6b2"
    }

',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json',
  
  ),
));

$response = curl_exec($curl);
curl_close($curl);
//echo $response;
$response=json_decode($response);
$status=isset($response->status)?$response->status:'AWB Number is wrong';
if($status){
    return $status;
}
else{
   
    return $shipment_status=isset($response->shipment_status)?$response->shipment_status:'AWB Number is wrong'; 

}
exit();
}
}