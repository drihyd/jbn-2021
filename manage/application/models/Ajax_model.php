<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Ajax_model extends CI_Model {

    public $column_search = array();
    public $column_order = array();
    public function __construct()
    {
        $this->load->database();
    }
    public function _queries($table,$status=NULL,$value=NULL)
    {

        if($table=="product_category")
        {
            $this->column_order = array(null,'CategoryName','CategoryDesc');        
            $this->column_search = array('CategoryName','CategoryDesc'); 
            $this->db->select('CategoryID ,CategoryName,ParentID,CategoryImage,CategoryDesc,CategorySlug,SEOTitle,SEODescription,SEOKeywords');
        	$this->db->from('product_category');
        	// $this->db->join('country as c', 's.country_id=c.id','left');    
        }
        if($table=="coupons")
        {
            $this->column_order = array(null,'Coupon_title','CouponCode','Description','DiscountType','Discount_value','CouponAddedon','CouponExpiryDate','Is_Active');        
            $this->column_search = array('Coupon_title','CouponCode','Description','DiscountType','Discount_value','CouponAddedon','CouponExpiryDate','Is_Active'); 
            $this->db->select('CouponID,Coupon_title,CouponCode,Description,DiscountType,Discount_value,CouponAddedon,CouponExpiryDate,Is_Active,Is_public');
            $this->db->from('coupons');  
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
            $this->db->order_by('Addedon asc');
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