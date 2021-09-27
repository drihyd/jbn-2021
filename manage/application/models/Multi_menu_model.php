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
          /* $menu = '<li class="list-group-item" data-text="Home" data-icon="fa-home"
                                    data-href="'.$item->m_item_url.'">
              <div><i class="fa fa-home"></i> <span class="txt">'.$item->m_item_name.'</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>';
            $menu .= '<ul>'.$this->get_menu_list($menu_id, $item->m_item_id)."</ul>";
            $menu .= '</li>';
*/
            $menu .='<li class="list-group-item" data-text="'.$item->m_item_name.'" data-icon="fa-home"
                                    data-href="'.$item->m_item_url.'"> <div><i class="fa fa-home"></i> <span class="txt">'.$item->m_item_name.'</span><div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</i></a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div></div>';
                                    
            $menu .= '<ul>'.$this->get_menu_list($menu_id, $item->m_item_id)."</ul>"; //call  recursively
            $menu .= "</li>";
           
           }
       }

        return $menu;
    }
    
 
}