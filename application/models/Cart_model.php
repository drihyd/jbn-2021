<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cart_model extends CI_Model {
	public $variable;
	public $cart_master;
	public $cart_detatils;


	public function __construct()
	{
		parent::__construct();

		


	}



	public function get_cart_items()
	{
		$query = $this->db->from("cart_master c")->join("cart_details i", 'c.OrderlD = i.OrderID')->join('products p', 'i.ProductID = p.ProductID')->where('c.UserlD',MY_SESSION_ID)->where('c.Order_status','on Hold')->get();
		if ($query->num_rows() > 0) {
			return $query->result();
		}else{
			return false;
		}
	}



	public function get_cart_items_with_cart_id($cart_id)

	{

		$query = $this->db->from('cart_master c')->join('cart_details i', 'c.OrderlD = i.OrderlD')->join('products p', 'i.ProductID = p.ProductID')->where('c.OrderlD',$cart_id)->get();

		if ($query->num_rows() > 0) {

			return $query->result();

		}else{

			return false;

		}

	}

	public function get_cart_with_customer_id($customer_id)

	{

		$query = $this->db->from('cart_master c')->join('cart_details i', 'c.OrderlD = i.OrderID')->join('products p', 'i.ProductID = p.ProductID')->where('c.UserlD',$customer_id)->where('c.Order_status','on Hold')->get();



		if ($query->num_rows() > 0) {

			return $query->result();

		}else{

			return false;

		}

	}



public function get_customer_with_cart_id($cart_id)
{
	$query = $this->db->select('OrderlD')->from('cart_master')->where('OrderlD', $cart_id, FALSE)->get();
	if ($query->num_rows() > 0) {
		return $query->row()->OrderlD;
	}else{
		return false;
	}
}





	public function change_cart_customer_id($customer_id)
	{


		$data = array('UserlD'=>$customer_id);
		$where = array('OrderlD'=>$this->session->cart_id);
		// echo '<pre> '. print_r($where, true ); exit();
		if ($response = $this->db->get_where('cart_master', array('OrderlD'=>$this->session->cart_id))) {	
			if ($response->num_rows() ==  1) {
				$cart = $response->row();
				if (isset($this->session->cart_id)) {		
					if ($this->db->update('cart_details', array('OrderID'=>$cart->OrderlD), array('OrderID'=>$this->session->cart_id))) {
						/*if($this->db->delete('cart_master', $where)) {
							//delete

						}*/
						$this->db->update('cart_master', array('UserlD'=>$customer_id), array('OrderlD'=>$this->session->cart_id));

					}

				}else{

				// exit('else isset');

				}			



			}else{



			if (isset($this->session->cart_id)) {
				if ($this->db->update('cart_master', $data, $where)) {	

					// exit('updated');

				}

			}	

		

		}

			

		}



		//$this->remove_duplicates($customer_id);	

	}



	public function remove_duplicates($customer_id)
	{

		$cart  = $this->get_cart_with_customer_id($customer_id);

		$products = array();
		if (count($cart) > 1) {
			foreach ($cart as $item) {
				if (!in_array($item->ProductID, $products)) {
					$products[] = $item->ProductID;

				}else{
					$condition = array('Order_DetailsID'=>$item->Order_DetailsID);
					$this->db->delete('cart_details', $condition);
				}				

			}
		}
	}




public function update_cart_shipping_charges($charges=false)
{
	$data =  array('Shipping_Charges_Amount'=>$charges);
	$where = array('OrderlD'=>$this->session->cart_id);

	if (isset($this->session->cart_id)) {
		if ($this->db->update('cart_master', $data, $where)) {

		}
	}
}

public function update_cart_handling_charges($charges=false)
{
	$data =  array('Handling_Charges_Amount'=>$charges);
	$where = array('OrderlD'=>$this->session->cart_id);

	if (isset($this->session->cart_id)) {
		if ($this->db->update('cart_master', $data, $where)) {

		}
	}
}


public function get_summary_prices($products=false)
{
	$mrp=$ac_price=$save_price=$total_items=$coupon_discount_price=$prodcut_price=$shipping_charges=$handling_charges=0;
	if (is_array($products)) {
	$total_items=count((array)$products);
	foreach ($products as $key => $value) {
	$mrp=$mrp+$value->MRP_Amount;
	$coupon_discount_price=$coupon_discount_price+$value->discounted_amount;
	$ac_price=$ac_price+($value->Amount*1-$value->discounted_amount*1);
	$save_price=$save_price+($value->MRP_Amount-$value->Amount);
	$prodcut_price=$prodcut_price+($value->Amount);
	$handling_charges=$handling_charges+($value->included_handling_charge);

			if($value->product_type!="gift_cards") {
				if($ac_price<100000){
				$shipping_charges=1500;
				$this->update_cart_shipping_charges($shipping_charges);

				}
				else{
				$shipping_charges=0;
				$this->update_cart_shipping_charges($shipping_charges);
				}
			}
			else{
				$shipping_charges=0;
				$this->update_cart_shipping_charges($shipping_charges);
			}
	//$handling_charges=2000;
	//$this->update_cart_handling_charges($handling_charges);





	}
		$sub_total_data=array('prodcut_price'=>$prodcut_price,'mrp'=>$mrp,'ac_price'=>$ac_price,'save_price'=>$save_price,'total_items'=>$total_items,'coupon_discount'=>$coupon_discount_price,"shipping_charges"=>$shipping_charges,"handling_charges"=>$handling_charges);
	}
	else{
		$sub_total_data=array('prodcut_price'=>$prodcut_price,'mrp'=>$mrp,'ac_price'=>$ac_price,'save_price'=>$save_price,'total_items'=>$total_items,'coupon_discount'=>$coupon_discount_price,"shipping_charges"=>$shipping_charges,"handling_charges"=>$handling_charges);
	}
	return $sub_total_data;
}




public function get_wishlists($customer_id=false)
{
	$query = $this->db->from("wish_lists i")->join('products p', 'i.ProductID = p.ProductID')->where('i.UserID',$customer_id)->get();
	if ($query->num_rows()> 0) {
		return $query->result();
	}else{
		return false;
	}
}


public function _order_summary_amount($order_id)
{

	$query = $this->db->select('ROUND(sum(Amount-discounted_amount),2) as total_amount')->from('cart_details')->where('OrderID',$order_id)->get();
	if($query->num_rows()>0) {
		return $query->row()->total_amount;
	}else{
		return 0;
	}
}


   public function get_Generic_Query($table=NULL,$limit = NULL, $offset = NULL, $sort = NULL, $search = NULL)
    {
        if ($limit !== NULL) $limit = (int) $limit;
        if ($offset !== NULL) $offset = (int) $offset;
        if (is_array($sort)) {
            foreach ($sort as $field => $order) {
                $this->db->order_by($field, $order);
            }
        }
        if (is_array($search)) {
            foreach ($search as $field => $match) {
                $this->db->like($field, $match);
            }
        }
        $this->db->select();
       $query=$this->db->get($table, $limit, $offset);
        return $query->result();
    }
public function number_format($value=false)
{

	return number_format(round($value));
}

public function get_coupons($coupon_id = NULL)
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


public function add_shipping_charges($subtotal=false)
{


/*
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
       }*/

if($subtotal<100000){

   return $this->purchase_cart->number_format(1500);
}
else {
	return 0;
}



}


function get_youtube_video_id($url)
{
    $url =$url;
    preg_match('/(?:\/|=)(.{11})(?:$|&|\?)/', $url, $matches);
    return  $matches[1];
}
}



/* End of file Cart_model.php */

/* Location: ./application/models/Cart_model.php */