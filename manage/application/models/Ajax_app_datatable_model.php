<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Ajax_app_datatable_model extends CI_Model {
 
    var $table;
    var $status;
    var $institute_id;
    var $column_order;//set column field database for datatable orderable
    var $column_search;
     //set column field database for datatable searchable 
    var $order ; // default order 
    var $blank_cases; // default order 
    var $user; // default order 
    var $authLevel; // default order 
    
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        // $this->user = $this->session->mec_user;
        // $this->authLevel = $this->session->mec_authLevel;
    }

    public function _query_for_filtered_export()
    {
        /*$this->column_order = array(null, 'c.co_name','u.first_name','m.ph_model_name','l.print_model_name','d.design_number', 'p.quantity');

        $this->db->select('*');
        $this->db->from('products p');
        $this->db->join('companies c', 'p.co_id = c.co_id');
        $this->db->join('phones n', 'p.phone_id = n.phone_id');
        $this->db->join('phone_models m', 'p.ph_model_id = m.ph_model_id');
        $this->db->join('print_models l', 'p.print_model_id = l.print_model_id');
        $this->db->where('n.phone_id = m.phone_id');*/
    }

    public function _query_for_students()
    {        
        $this->column_order = array(null,null,'r.application_number','r.ind_nri_status','u.first_name','u.email','u.mobile','u.alt_mobile', 'u.gender','r.category','u.dob','u.nationality','r.preferred_loc', 'u.pob','a.address_1', 'a.district', 's.name', 'c.name', 'u.blood_group', 'r.source', 'r.phc','r.co_curricular');
        $this->column_search = array('r.application_number','r.ind_nri_status','u.first_name','u.email','u.mobile','u.alt_mobile', 'u.gender','r.category','u.dob','u.nationality','r.preferred_loc', 'u.pob','a.address_1', 'a.district', 's.name', 'c.name', 'u.blood_group', 'r.source', 'r.phc','r.co_curricular');
       
        $this->db->select('u.id as user_pk_id,u.first_name,u.last_name,u.mobile,u.alt_mobile,u.dob,u.pob,u.email,u.gender,u.nationality,u.blood_group,u.religion,u.created,u.addresses_id, u.fath_fname,u.fath_lname,u.moth_fname,u.moth_lname, a.address_1,a.address_2,a.city,a.pincode,a.district,s.id as state,s.name as state_name,c.id as country,c.name as country_name,r.ind_nri_status,r.category,r.other_source,r.source,r.co_curricular,r.preferred_loc,r.phc,r.application_number,d.file_location, d.doc_name, d.document_type,d.document_no, p.email,p.mobile,p.alt_mobile,p.occupation, e.x_inst_name,e.x_board,e.x_board_other,e.x_passed_year,e.x_grade,e.x_percentage,e.xi_inst_name,e.xi_branch_name,e.xi_board,e.xi_board_other,e.xi_passed_year,e.xi_grade,e.xi_percentage,e.xii_inst_name,e.xii_branch_name,e.xii_board,e.xii_board_other,e.xii_passed_year,e.xii_grade,e.xii_percentage,n.name as entrance_exam_name,n.score,n.percentile,n.exam_date,n.hall_ticket,n.rank,f.notyetdecided,f.selected_early_round,f.entrance_percentile,')
        ->from('users u')
        ->join('addresses a', 'u.addresses_id = a.id','left')        
        ->join('state s', 's.id = a.state_id','left')      
        ->join('country c', 'c.id = s.country_id','left')
        ->join('registration r', 'u.id = r.user_id','left')
        ->join('document d', 'd.user_id = u.id','left')
        ->join('document d', 'd.user_id = u.id','left')
        ->join('education e', 'e.user_id = u.id','left')
        ->join('entrance_exam n', 'n.user_id = u.id','left')
        ->join('course_preference f', 'f.user_id = u.id','left');
        // ->where('d.document_type = "photo"');        
        /*if (isset($this->seller_id)) {
            $this->db->where('o.seller_id', $this->seller_id);     
        } */
    }
 
    private function _get_datatables_query()
    {    
       $this->_query_for_students();
       
       /*$filter = $this->input->post();
       if(isset($filter['company']) && $filter['company'] != 'select')
        {           
            $this->db->where('c.co_name', $filter['company']);
        } 
        if($this->input->post('phone') && $filter['phone'] != 'select')
        {
           $this->db->where('u.first_name', $this->input->post('phone'));
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
        }*/
 
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
    }

    public function get_filtered_data()
    {
        $this->_query_for_students();
        $query = $this->db->get();

        return $query->result();
    }
 
    // function get_datatables($t, $s_id=null, $s=null, $blank = false, $replacement= false, $label_status = null, $market_place=null, $multi=false)
    function get_datatables($institute_id=1, $status='All' )
    {
             
        $this->status = $status;
        $this->institute_id = $institute_id;       
        
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
        $this->_get_datatables_query();          
        $result = $this->db->get();
        return $result->num_rows();
        //Original
        // $this->db->from($this->table);
        // return $this->db->count_all_results();
    }
 
}