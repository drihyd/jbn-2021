<?php
class Common_model extends CI_Model {
  
    function __construct(){
        // Call the Model constructor
        parent::__construct();        
        
    }

    public function _get_state_lists() {  
        $this->db->select('*');
        $this->db->from('state');
        $this->db->order_by('name', 'asc');
        $query = $this->db->get();
        if ( $query->num_rows() > 0 )
        {
        $row = $query->result();
        return $row;
        }
    }
    public function _get_country_lists() {  
        $this->db->select('*');
        $this->db->from('country');
        $this->db->order_by('name', 'asc');
        $query = $this->db->get();
        if ( $query->num_rows() > 0 )
        {
        $row = $query->result();
        return $row;
        }
    }
    public function changeStatus($id) {
        $table=$this->getDataById($id);
             if($table[0]->status==0)
             {
                $this->update($id,array('status' => '1'));
                return "Activated";
             }else{
                $this->update($id,array('status' => '0'));
                return "Deactivated";
             }
    }
}
?>
