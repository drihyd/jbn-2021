<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Ajax_payments_model extends CI_Model {

    public $column_search = array();
    public $column_order = array();
    public function __construct()
    {
        $this->load->database();
    }
    public function _queries($table,$status=NULL,$value=NULL)
    {
        if($table=="payments")
        {
            $this->column_order = array(null,'p.ID','p.PaymentID','p.UserID','p.Order_ID','p.Order_Number','p.CartID','p.captured','p.created_at','p.fullname','p.emailid','p.contact_number','p.amount','p.PaymentStatus','p.Payment_method','p.invoice_number','p.success','p.merchant_total','o.PaymentID','o.OrderlD','o.UserlD','o.Order_Number','o.CartID','u.UserID','u.UserEmail','u.UserFirstName','u.UserLastName','u.UserPhone');        
            $this->column_search = array('p.ID','p.PaymentID','p.UserID','p.Order_ID','p.Order_Number','p.CartID','p.captured','p.created_at','p.fullname','p.emailid','p.contact_number','p.amount','p.PaymentStatus','p.Payment_method','p.invoice_number','p.success','p.merchant_total','o.PaymentID','o.OrderlD','o.UserlD','o.Order_Number','o.CartID','u.UserID','u.UserEmail','u.UserFirstName','u.UserLastName','u.UserPhone'); 
            $this->db->select('p.ID p_ID,p.PaymentID p_PaymentID,p.UserID p_UserID,p.Order_ID p_Order_ID,p.Order_Number p_Order_Number,p.CartID p_CartID,p.captured p_captured,p.created_at p_created_at,p.fullname p_fullname,p.emailid p_emailid,p.contact_number p_contact_number,p.amount p_amount,p.payment_date p_payment_date,p.currency p_currency,p.TransactionID p_TransactionID,p.PaymentStatus p_PaymentStatus,p.Payment_method p_Payment_method,p.invoice_number p_invoice_number,p.success p_success,p.merchant_total p_merchant_total,o.PaymentID o_PaymentID,o.OrderlD o_OrderlD,o.UserlD o_UserlD,o.Order_Number o_Order_Number,o.CartID o_CartID,u.UserID u_UserID,u.UserEmail u_UserEmail,u.UserFirstName u_UserFirstName,u.UserLastName u_UserLastName,u.UserPhone u_UserPhone');
            $this->db->from('payments p'); 
            $this->db->join('order o','o.PaymentID=p.PaymentID','left');
            $this->db->join('users u','u.UserID=p.UserID','left');
        }
      
        $date_filter=isset($_POST['dateval'])?$_POST['dateval']:'';
        $filter=$this->input->post();
        if ($date_filter=="all") {

            $date = date('Y-m-d 00:00:00');            
            
             $this->db->where('p.payment_date BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()');


        }

        elseif ($date_filter=="today") {
            $date = date('Y-m-d 00:00:00');            
            $this->db->where("p.payment_date BETWEEN CONCAT(CURDATE(), ' 00:00:00') AND CONCAT(CURDATE(), ' 23:59:59')");
        }
        elseif ($date_filter=="monthly") {
            $mon_val=(int)$filter['selected_month']; 
            if($mon_val){
                $mon_val=$mon_val;
            }
            else{
                $mon_val=date('m');
            }
            $date = new DateTime("now");
            $curr_date_f = $date->format("Y-$mon_val-01 00:00:00");
            $curr_date_t= $date->format("Y-$mon_val-31 23:59:59");
            $this->db->where('p.payment_date>=',$curr_date_f);
            $this->db->where('p.payment_date<=',$curr_date_t);
        }elseif ($date_filter=="datefilter") {

            if($filter['frm_date']=="" &&  $filter['to_date']=="") {    
                $one_week_day=date('Y-m-d 00:00:00', strtotime('-7 days'));
                $this->db->where('p.payment_date >=',$one_week_day);
                $this->db->where('p.payment_date <=', date('Y-m-d 23:59:59'));
           }
           else
           {   
                $this->db->where('p.payment_date >=', date('Y-m-d 00:00:00', strtotime($filter['frm_date'])));
                $this->db->where('p.payment_date <=', date('Y-m-d 23:59:59', strtotime($filter['to_date'])));
           }
        }
    }  
    public function _query_order_by($table)
    {    
        if($table=="payments")
        {
            $this->db->order_by('p.payment_date desc');
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