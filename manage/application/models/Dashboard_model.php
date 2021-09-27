<?php
class Dashboard_model extends CI_Model{

    function __construct(){
        // Call the Model constructor
        parent::__construct();        
        
    }

 
 public function get_order_summary($from=NULL, $to=NULL)
 {
    if (!$from) {
          $from=date('Y-m-d 00:00:00');
    }else{
        $from = date('Y-m-d 00:00:00', strtotime($from));
    }
    if(!$to)
        $to=date('Y-m-d 23:59:59');
    else
       $to = date('Y-m-d 23:59:59', strtotime($to));

    $this->db->select('COUNT(*) as total, SUM(amount) AS amount');
    $this->db->from('order');
    $this->db->join('payments', 'payments.UserID=order.UserlD','left');
    $this->db->where('OrderDate >=', $from);
    $this->db->where('OrderDate <=', $to);
    $query = $this->db->get();

    if ($query->num_rows() > 0) {
        return $query->row();
    }else{
        return (object)['total'=>0, 'amount'=>0]; 
    }
    
 }
  
 
}






