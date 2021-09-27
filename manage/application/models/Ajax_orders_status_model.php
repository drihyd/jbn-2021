<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Ajax_orders_status_model extends CI_Model {

    public $column_search = array();
    public $column_order = array();
    public function __construct()
    {
        $this->load->database();
    }
    public function _queries($table,$status=NULL,$value=NULL)
    {

        
        if($table=="order")
        {
            // $this->column_order = array(null,'o.OrderAmount','o.OrderShipName','o.OrderPhone','o.OrderShipping','o.OrderTax','o.OrderEmall','o.OrderDate','o.OrderShipped','o.OrderTrackingNumber','u.UserFirstName','u.UserEmail','u.UserPhone','o.BillingAddressID','o.ShippingAddressID','o.DeliveryDate',null);        
            $this->column_order = array(null,'o.OrderlD','o.Order_Number','u.UserEmail','u.UserPhone','p.amount','o.OrderDate','o.Order_status','o.OrderShipName');        
            // $this->column_search = array('o.OrderAmount','o.OrderShipName','o.OrderPhone','o.OrderShipping','o.OrderTax','o.OrderEmall','o.OrderDate','o.OrderShipped','o.OrderTrackingNumber','u.UserFirstName','u.UserEmail','u.UserPhone','o.BillingAddressID','o.ShippingAddressID','o.DeliveryDate'); 
            $this->column_search = array('o.OrderlD','o.Order_Number','u.UserEmail','u.UserPhone','p.amount','o.OrderDate','o.Order_status','o.OrderShipName'); 
            $this->db->select('o.OrderlD order_id,o.OrderAmount order_amount,o.OrderShipName order_shipname,o.OrderPhone order_phone,o.Shipping_Charges_Amount o_Shipping_Charges_Amount,o.Handling_Charges_Amount o_Handling_Charges_Amount,o.OrderShipping order_shipping,o.OrderTax order_tax,o.OrderEmall order_email,o.Order_Number o_Order_Number,o.OrderDate order_date,o.OrderShipped order_shipped,o.OrderTrackingNumber order_trackingnumber,o.DeliveryDate order_DeliveryDate,o.Order_status order_status,o.billing_Fullname o_billing_Fullname,o.billing_Address1 o_billing_Address1,o.billing_Address2 o_billing_Address2,o.billing_LandMark o_billing_LandMark,o.billing_City o_billing_City,o.billing_Pincode o_billing_Pincode,o.billing_State o_billing_State,o.billing_Country o_billing_Country,o.billing_Mobile o_billing_Mobile,o.shipping_Fullname o_shipping_Fullname,o.shipping_Address1 o_shipping_Address1,o.shipping_Address2 o_shipping_Address2,o.shipping_LandMark o_shipping_LandMark,o.shipping_City o_shipping_City,o.shipping_State o_shipping_State,o.shipping_Pincode o_shipping_Pincode,o.shipping_Country o_shipping_Country,o.shipping_Mobile o_shipping_Mobile,o.CartID o_CartID,o.Order_Number o_Order_Number,o.shipped_by_id  o_shipped_by_id,o.shipped_traking_no o_shipped_traking_no,o.shipping_to_date o_shipping_to_date,dp.name dp_name,u.UserID user_id ,u.UserFirstName u_first_name,u.UserLastName u_last_name,u.UserEmail u_user_email,u.UserGender user_gender,u.UserPhone user_phone,p.PaymentID p_PaymentID,p.Order_ID p_Order_ID,p.Order_Number p_Order_Number,p.captured p_captured,p.created_at p_created_at,p.fullname p_fullname,p.emailid p_emailid,p.contact_number p_contact_number,p.amount p_amount,p.payment_date p_payment_date,p.currency p_currency,p.TransactionID p_TransactionID,p.PaymentStatus p_PaymentStatus,p.Payment_method p_Payment_method,p.success p_success,p.merchant_total p_merchant_total');
            $this->db->from('order as o');
            $this->db->join('users as u', 'u.UserID=o.UserlD','left');
            $this->db->join('payments as p', 'p.Order_Number=o.Order_Number','left');   
            $this->db->join('delivery_partners as dp', 'dp.id=o.shipped_by_id','left'); 
            $this->db->where('o.Order_status',$status);
        }
    }  
    

    public function _query_order_by($table)
    {
        if($table=="product_category")
        {
            $this->db->order_by('CategoryName asc');
        }
        if($table=="order")
        {
            $this->db->order_by('o.OrderDate desc');
        }
        if($table=="coupons")
        {
            $this->db->order_by('Coupon_title asc');
        }
        
    }

    private function _get_datatables_query($table, $status='')
    {         
       $this->_queries($table,$status);

       
        $i = 0;     
         if (isset($this->column_search)) {         
         
            foreach ($this->column_search as $item) // loop column 
            {
                if(isset($_POST['search']['value']) && $_POST['search']['value'] != '') // if datatable send POST for search
                {                 
                    if($i===0) // first loop
                    {
                        // $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                        $this->db->like($item, $_POST['search']['value']);
                    }
                    else
                    {
                        $this->db->or_like($item, $_POST['search']['value']);
                    }
     
                    if(count($this->column_search) - 1 == $i) //last loop
                    {
                        // $this->db->group_end(); //close bracket
                    }
                }
                $i++;
            }
         }
         
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
            $this->_query_order_by($table);
    }
 
    function get_datatables($table=false, $status='')
    {        
        $this->_get_datatables_query($table,$status);
        if(isset($_POST['length']) && $_POST['length'] != -1)       
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();  
        return $query->result();
        // error_log("Query:".$this->db->last_query());
    }
    function count_filtered($table)
    {
        $this->_get_datatables_query($table);
        $query = $this->db->get();   
       return $query->num_rows();
    }    
 
    public function count_all($table)
    {   
        $this->db->from($table);        
        $result = $this->db->get();
        return $result->num_rows();  
    }    
}  