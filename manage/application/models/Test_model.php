<?php
class Test_model extends CI_Model{
 
    public function get_menu_items()
    {
        $this->db->select('menu.m_id menu_id, menu_items.m_id as menu_item_id');
        $this->db->from('menu');
        $this->db->join('menu_items', 'menu.m_id=menu_items.m_id','left');
        $this->db->group_by('m_name');
        $this->db->order_by('menu_id');
        $query=$this->db->get();
        return $query->result();   
    }
 
}