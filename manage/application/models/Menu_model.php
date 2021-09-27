<?php
class Menu_model extends CI_Model{
 
  public function get_list()
    {
        $this->db->select('mi.m_item_id mitemid, mi.m_item_name mitemname, m.m_id mid,m.m_name menu_name,mi.parent_id mi_parenet_id,mi.is_nav_dropdown is_nav_dropdown,mi.is_display is_display');
        $this->db->from('menu_items as mi');
        $this->db->join('menu as m', 'm.m_id=mi.m_id','left');
        // $this->db->where(array('mi.m_id'=>$m_id));
        // $this->db->where(array('mi.parent_id!='=>0));
        $query=$this->db->get();
        return $query->result();   
    }

    public function get_menu_items($menu_id, $menu_item_id, $is_parent=false)
    {
        $this->db->select('mi.m_item_id mitemid, mi.m_item_name mitemname, m.m_id mid,m.m_name menu_name, mi.parent_id mi_parent_id,mi.is_nav_dropdown is_nav_dropdown,mi.is_display is_display');
        $this->db->from('menu_items as mi');
        $this->db->join('menu as m', 'm.m_id=mi.m_id','both');
        $this->db->where(array('m.m_id', $menu_id));
        $this->db->where(array('mi.m_item_id !='=>$menu_item_id));
        if ($is_parent) {
            $this->db->where(array('mi.parent_id ='=>0));
        }
        $query=$this->db->get();
        return $query->result();   
    }
    public function menus()
    {
        $this->db->select('menu.m_id menu_id, menu_items.m_id as menu_item_id');
        $this->db->from('menu');
        $this->db->join('menu_items', 'menu.m_id=menu_items.m_id','left');
        $this->db->group_by('m_name');
        $this->db->order_by('menu_id');
        $query=$this->db->get();
        return $query->result();   
    }

    public function get_menu($m_item_id,$parent_id){

        $this->db->select('*');
        $this->db->from('menu_items');
        $this->db->where(array('parent_id='=>$parent_id));
        $this->db->where(array('m_item_id='=>$m_item_id));
        $query=$this->db->get();
        return $query->result_array(); 
    }

 
}






