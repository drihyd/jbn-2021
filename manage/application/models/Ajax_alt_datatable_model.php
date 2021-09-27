<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Ajax_alt_datatable_model extends CI_Model {
 
    var $table;
    var $status;
    var $seller_id;
    var $column_order;//set column field database for datatable orderable
    var $column_search;
     //set column field database for datatable searchable 
    var $order ; // default order 
    var $blank_cases; // default order 
    var $user; // default order 
    var $authLevel; // default order 
    var $replacement;  // default order 
    var $market_place;  // default order 
    var $multi;  // default order 
    var $label_status='Approved';  // default label status 
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->user = $this->session->mec_user;
        $this->authLevel = $this->session->mec_authLevel;
    }

    public function _query_for_filtered_export()
    {
        /*$this->column_order = array(null, 'c.co_name','n.phone_name','m.ph_model_name','l.print_model_name','d.design_number', 'p.quantity');

        $this->db->select('*');
        $this->db->from('products p');
        $this->db->join('companies c', 'p.co_id = c.co_id');
        $this->db->join('phones n', 'p.phone_id = n.phone_id');
        $this->db->join('phone_models m', 'p.ph_model_id = m.ph_model_id');
        $this->db->join('print_models l', 'p.print_model_id = l.print_model_id');
        $this->db->where('n.phone_id = m.phone_id');*/
    }

    public function _query_for_products($sum)
    {        
        $this->column_order = array(null,'u.first_name','u.last_name','rg.application_number','u.email'); 
        $this->column_search = array('u.first_name','u.last_name','rg.application_number','u.email');
		$this->db->select('u.id userid,u.first_name,u.last_name,u.mobile,u.email,rg.application_number,pg.TXNAMOUNT fee,pg.CURRENCY currency,pg.TXNID txnid,pg.PAYMENTMODE pay_mode,pg.TXNDATE txn_date,pg.CREATED_ON created_date,pg.STATUS status');
        $this->db->from('payment_gateway_transactions pg');
        $this->db->join('users u', 'pg.STUDENT_ID = u.id');
		$this->db->join('registration rg', 'pg.STUDENT_ID = rg.user_id'); 	

    }
	
	 public function _query_for_dd_neft_payments($sum)
    {        
        $this->column_order = array(null,'u.first_name','u.last_name','u.email'); 
        $this->column_search = array('u.first_name','u.last_name','u.email');
		$this->db->select('u.id userid,u.first_name,u.last_name,u.mobile,u.email,pg.amount fee,pg.reference_no txnid,pg.payment_method pay_mode,pg.last_insert_action txn_date,pg.status status');
        $this->db->from('payment_instrument_details pg');
        $this->db->join('users u', 'pg.user_id = u.id');
    }
	public function _query_for_branch_preferences($sum)
    {        
        $this->column_order = array(null,'bp.app','bp.name','bp.jee'); 
        $this->column_search = array('bp.app','bp.name','bp.jee');
		$this->db->select('bp.id,bp.app,bp.name,bp.jee,bp.early_round_of_app,bp.pref1,bp.pref2,bp.pref3,bp.pref4,bp.pref5,bp.pref6,bp.pref7,bp.jee_score_card_doc,bp.first_activity_date,bp.last_activity_date');
        $this->db->from('branch_preferences bp');
        //$this->db->join('users u', 'pg.user_id = u.id');
    }

    public function _query_for_orders($sum=false)
    {
        //$label_status = $this->label_status;   
        /*if (!isset($this->label_status) && $this->status != 'Cancelled') {
            if ($this->user == 'print_manager' || $this->user == 'inventory_manager' || $this->labelled == true){
                $this->label_status = 'Labelled';             
            } 

            if (($this->status == 'ToBePrinted' &&  ($this->user !== 'print_manager' || $this->authLevel < 3))|| ($this->status == 'ToBeIssued' &&  $this->user !== 'inventory_manager' || $this->authLevel < 3) || $this->labelled == false){
                $this->label_status = 'ToBeLabelled';
            } 
                     
        }*/
        if ($this->user == 'print_manager' || $this->user == 'inventory_manager'){
            $this->label_status = 'Labelled';  
        }  
               
        $this->column_order = array(null,null,'c.co_name','o.order_id','n.phone_name','m.ph_model_name','l.print_model_code','d.design_number', 'o.quantity');
        $this->column_search = array('c.co_name','o.order_id','n.phone_name','m.ph_model_name','l.print_model_name','d.design_number', 'o.quantity');
       
        if ($sum != false) {
             $this->db->select('*');
        }elseif($sum ==true){
            $this->db->select("SUM(o.quantity) q");
        }

        $this->db->from('orders o');
        $this->db->join('companies c', 'o.co_id = c.co_id');        
        $this->db->join('phone_models m', 'o.ph_model_id = m.ph_model_id');
        $this->db->join('phones n', 'n.phone_id = m.phone_id');
        $this->db->join('print_models l', 'o.print_model_id = l.print_model_id');
        $this->db->join('designs d', 'o.design_number = d.design_number');  
        $this->db->join('sellers s', 's.seller_id = o.seller_id');  
        $this->db->where('o.co_id = d.co_id');  
        $this->db->where('o.print_model_id = d.print_model_id');

        if ($this->status == 'All') {
            $where_in = array('ToBePrinted', 'ToBeIssued');
            $this->db->where_in('o.status', $where_in);  
            /*if ($this->market_place == 'Flipkart' && !isset($this->label_status)) {
                $this->db->where('o.label_status', 'Approved');          
            }*/
            //$this->market_place
           // $label_status = 'Approved';
        }else{
             $this->db->where('o.status', $this->status);
             
             if ($this->status == 'Printed' || $this->status == 'Issued' || $this->status == 'Cancelled') {
                //die('cancelled');
                $this->db->where('YEAR(o.'.$this->status.'_on)', date('Y'));
                $this->db->where('MONTH(o.'.$this->status.'_on)', date('m'));
                $this->db->where('DAY(o.'.$this->status.'_on)', date('d'));
             }
            // $label_status='Labelled';
        }         
        
        if (isset($this->seller_id)) {
            $this->db->where('o.seller_id', $this->seller_id);     
        } 

        if ($this->authLevel < 3 || $this->user == 'order_manager') {
            if ($this->replacement === 'true') {
                $this->db->where('o.replacement', 1); 
                //die('auth true'); 
            }else{

                if ($this->label_status == 'Hold' || $this->label_status == 'ToBeLabelled') {
                    $this->db->where_in('o.replacement', array(0, 1));
                 // }else if($this->label_status == 'ToBeLabelled'){
                //     $this->db->where_in('o.replacement', array(0, 1));//
                 }else{
                   $this->db->where('o.replacement', 0); 
                }
                
                //die('auth false'); 
             }
        }elseif($this->user == 'print_manager' || $this->user == 'inventory_manager'){
            if ($this->replacement === 'true') {
                $this->db->where('o.replacement', 1); 
               //die('man true');    
            }else{
                $this->db->where_in('o.replacement', array(0, 1));
                //die('man false');
            }
        }              
           //if ($this->status != 'Cancelled') {
            if (isset($this->label_status) && $this->label_status != 'null') {                          
                $this->db->where('o.label_status', $this->label_status);  
                if ($this->label_status == 'Labelled') {
                    $this->db->where('o.labelled_on >', date('Y-m-d 00:00:00'));   
                }  
            }
        //} 
         if (isset($this->label_status) && $this->label_status == 'Approved') {
            if (isset($this->multi) && $this->multi == true) {
              $this->db->where('o.quantity >= 2');
              //die('here only');
            }else{
                $this->db->where('o.quantity', 1);
            }
        }
        
        $this->db->where('o.ecomm_platform', $this->market_place);

    }
 
    private function _get_datatables_query($sum = false, $export=false)
    {    
        
		$filter = $this->input->post();
       if($this->table == 'payment_gateway_transactions') {        
			//$this->order  = array('product_id' => 'desc');      
			 $this->_query_for_products($sum);			 
			if(isset($filter['applicationnumber']) && $filter['applicationnumber'] != '')
			{           
				$this->db->where('rg.application_number', $filter['applicationnumber']);
			}
			if(isset($filter['frm_date']) && $filter['frm_date'] != ''){           
				$this->db->where('pg.CREATED_ON >=', $filter['frm_date']);
			}
			if(isset($filter['to_date']) && $filter['to_date'] != ''){           
				$this->db->where('pg.CREATED_ON <=', $filter['to_date']);
			}
       }
	     else if($this->table == 'payment_instrument_details') {        
			//$this->order  = array('product_id' => 'desc');      
			 $this->_query_for_dd_neft_payments($sum);			 
			if(isset($filter['status']) && $filter['status'] != '')
			{           
				$this->db->where('pg.status', $filter['status']);
			}
			if(isset($filter['frm_date']) && $filter['frm_date'] != '')
			{           
				$this->db->where('pg.last_insert_action >=', $filter['frm_date']);
			}
			if(isset($filter['to_date']) && $filter['to_date'] != '')
			{           
				$this->db->where('pg.last_insert_action <=', $filter['to_date']);
			}
			
       }
	   
	    else if($this->table == 'branch_preferences') {        
			     
			 $this->_query_for_branch_preferences($sum);			 
			if(isset($filter['applicationnumber']) && $filter['applicationnumber'] != '')
			{           
				$this->db->where('bp.app', $filter['applicationnumber']);
			}
			if(isset($filter['frm_date']) && $filter['frm_date'] != '')
			{           
				$this->db->where('bp.last_activity_date >=', $filter['frm_date']);
			}
			if(isset($filter['to_date']) && $filter['to_date'] != '')
			{           
				$this->db->where('bp.last_activity_date <=', $filter['to_date']);
			}
			
			$this->order  = array('bp.last_activity_date' => 'desc'); 
			
       }
	   
	   
	   else if ($this->table == 'orders') {

         // $this->order  = array('ordered_on' => 'desc');         
         $this->order  = array('n.phone_name' => 'asc');         
         $this->_query_for_orders();

       }

       

      
        if($this->input->post('phone') && $filter['phone'] != 'select')
        {
           $this->db->where('n.phone_name', $this->input->post('phone'));
        } 
        if($this->input->post('phone_model') && $filter['phone_model'] != 'select')
        {
           $this->db->where('m.ph_model_name', $this->input->post('phone_model'));
        }
        if($this->input->post('print_model') && $filter['print_model'] != 'select')
        {
           $this->db->where('l.print_model_name', $this->input->post('print_model'));
        }
        if($this->input->post('design_number'))
        {
           $this->db->where('d.design_number', $this->input->post('design_number'));
        }
        if($this->input->post('order_status'))
        {
           $this->db->where('o.status', $this->input->post('order_status'));
        }
 
        $i = 0;
     
         if (isset($this->column_search)) {         
         
            foreach ($this->column_search as $item) // loop column 
            {
                if(isset($_POST['search']['value'])) // if datatable send POST for search
                {                 
                    if($i===0) // first loop
                    {
                        $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                        $this->db->like($item, $_POST['search']['value']);
                    }
                    else
                    {
                        $this->db->or_like($item, $_POST['search']['value']);
                    }
     
                    if(count($this->column_search) - 1 == $i) //last loop
                        $this->db->group_end(); //close bracket
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

     //$this->db->order_by('n.phone_name', 'asc');

    }

    public function get_filtered_data()
    {
        $this->table = 'products';
        $this->_get_datatables_query();
        $query = $this->db->get();

        return $query->result();
    }
 
    function get_datatables($t, $s_id=null, $s=null, $blank = false, $replacement= false, $label_status = null, $market_place=null, $multi=false)
    {
             
        $this->table = $t;       
        $this->status = $s;
        $this->seller_id = $s_id;
        $this->blank_cases = $blank;
        $this->replacement = $replacement;
        $this->market_place = $market_place;
        $this->label_status = $label_status;
        $this->multi = $multi;
        //$length = 10; $start = 0;
        // if ($this->replacement == true) {
        //     die('aT');
        // }else{
        //     die('f');
        // }
        $this->_get_datatables_query();
        // echo '<pre>'; print_r($this->market_place); exit();
        if(isset($_POST['length']) && $_POST['length'] != -1)       
        $this->db->limit($_POST['length'], $_POST['start']);

       // $this->db->limit($length, $start);
        $query = $this->db->get();

       // echo '<pre>'; print_r($query->result()); exit();
        return $query->result();
    }
 
    function count_filtered()
    {
        //$this->table= 'products';
        $this->_get_datatables_query();
        $query = $this->db->get();        
        $q = $query->row();    
        //return $q->q;SUM was taken
       //old
       return $query->num_rows();
    }    
 
    public function count_all()
    {
        $this->db->from($this->table);
          if ($this->table == 'orders') {
            if ($this->user == 'order_manager' || $this->authLevel <3 ) {
                $not_in = array('ToBePrinted', 'ToBeIssued');
                if ($this->market_place == 'Flipkart') {
                    if (isset($this->label_status) && $this->label_status == 'Hold') {
                        $this->db->where('label_status', 'Hold');                       
                    }else{
                        $this->db->where('label_status', 'Approved'); 
                    }
                  
                }else{
                    $this->db->where('label_status', 'ToBelabelled');
                }
                
                if (isset($this->status) && $this->status == 'Cancelled') {
                    $this->db->where_in('status', 'Cancelled');
                    $this->db->where('YEAR(Cancelled_on)', date('Y'));
                    $this->db->where('MONTH(Cancelled_on)', date('m'));
                    $this->db->where('DAY(Cancelled_on)', date('d'));
                }else{
                    $this->db->where_in('status', $not_in);
                }
                
            }else{

                if (isset($this->status)) {
                    $this->db->where('status', $this->status);  
                    if ($this->status == 'Printed' || $this->status == 'Issued' || $this->status == 'Cancelled') {
                        $this->db->where('YEAR('.$this->status.'_on)', date('Y'));
                        $this->db->where('MONTH('.$this->status.'_on)', date('m'));
                        $this->db->where('DAY('.$this->status.'_on)', date('d'));
                     }   
                }
            }
           /* if ($this->user == 'print_manager') {
               $this->db->where('label_status', 'Labelled');
               $this->db->where('status', 'ToBePrinted');
            }
            if ($this->user == 'inventory_manager') {
               $this->db->where('label_status', 'Labelled');
               $this->db->where('status', 'ToBeIssued');
            }*/
            
            $this->db->where('ecomm_platform', $this->market_place);            
            if (isset($this->seller_id)) {
                $this->db->where('seller_id', $this->seller_id);     
            }
            

            if ($this->replacement === 'true') {
                $this->db->where('replacement', 1); 
               //die('man true');    
            }else{
                $this->db->where_in('replacement', array(0, 1));
                //die('man false');
            }

            if (isset($this->label_status) && $this->label_status == 'Approved') {
               if (isset($this->multi) && $this->multi == true) {
                  $this->db->where('quantity >= 2');
                  //die('here only');
                }else{
                    $this->db->where('quantity', 1);
                } 
            }
            

            if (isset($this->label_status)){
              $this->db->where('label_status', $this->label_status);
            }
           
        }

        if ($this->table == 'products'){
             if ($this->blank_cases == true){
                $this->db->where('design_number', 0);
             } 
        }
        $result = $this->db->get();
        return $result->num_rows();
        //Original
        // $this->db->from($this->table);
        // return $this->db->count_all_results();
    }
 
}