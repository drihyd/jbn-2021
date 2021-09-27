<?php
class Multi_menu_model extends CI_Model{
 
    public function get_menu_tree($menu_id, $parent_id=0)
    {

       $menu = array();
       $query = $this->db->get_where('menu_items', array('m_id'=>$menu_id, 'parent_id'=>$parent_id));

       if ($query->num_rows() > 0) {
           $list = $query->result();       
           foreach ($list as $item) {
               $menu[$item->m_item_id] = $item;
               $menu[$item->m_item_id]->sub_items= $this->get_menu_tree($menu_id, $item->m_item_id);
           }
       }
        return $menu;
    }

    public function get_menu_list($menu_id, $parent_id=0)
    {
       $menu = '';
       $query = $this->db->get_where('menu_items', array('m_id'=>$menu_id, 'parent_id'=>$parent_id));

       if ($query->num_rows() > 0) {
           $list = $query->result();  
           $prev= '';
           foreach ($list as $item) {
            $name = "name[$parent_id][$item->m_item_id]";
            $id = "id_{$parent_id}_{$item->m_item_id}";

            $menu .='<li id="'.$id.'"><input type="text" name="'.$name.'" value="'.$item->m_item_name.'">';
            $prev=$item->m_item_id;
            $menu .= '<ul>'.$this->get_menu_list($menu_id, $item->m_item_id)."</ul>"; //call  recursively
            $menu .= "</li>";

            /*$menu .='<div class="drop-div" ondrop="drop(event)" ondragover="allowDrop(event)"><li draggable="true"  id="'.$id.'" ondragstart="drag(event)"><input type="text" name="'.$name.'" value="'.$item->m_item_name.'">';
            $prev=$item->m_item_id;
            $menu .= '<ul>'.$this->get_menu_list($menu_id, $item->m_item_id)."</ul>"; //call  recursively
            $menu .= "</li></div>";*/
           }
       }

        return $menu;
    }
    
 
}