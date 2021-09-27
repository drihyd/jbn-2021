<?php
class Mega_menu_model extends CI_Model{
 
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

            $menu .='<li class="list-group-item" data-text="'.$item->m_item_name.'" data-icon="fa-home"
                                    data-href="'.$item->m_item_url.'"> <div><i class="fa fa-home"></i> <span class="txt">'.$item->m_item_name.'</span><div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div></div>';
                                    
            $menu .= '<ul>'.$this->get_menu_list($menu_id, $item->m_item_id)."</ul>"; //call  recursively
            $menu .= "</li>";
           
           }
       }

        return $menu;
    }

    public function get_nav_menu($menu_id, $parent_id=0, $level = 1)
    {
       $menu = '';
       $query = $this->db->get_where('menu_items', array('m_id'=>$menu_id, 'parent_id'=>$parent_id));

       if ($query->num_rows() > 0) {
           $list = $query->result();  
           $prev= '';
           foreach ($list as $item) {
          
            $menu .= '<li>'.$item->m_item_name;
          
            $menu .= '<ul >'.$this->get_nav_menu($menu_id, $item->m_item_id, $level)."</ul>";

            $menu .= "</li>";
           
           }
       }

        return $menu;
    }
    public function get_nav_menu_dropdown($menu_id, $parent_id=0, $level = 1)
    {
       $menu = '';
       $query = $this->db->get_where('menu_items', array('m_id'=>$menu_id, 'parent_id'=>$parent_id));

       if ($query->num_rows() > 0) {
           $list = $query->result();  
           $prev= '';
           foreach ($list as $item) {
          
            if ($parent_id == 0) {
              $menu .= '<li class="nav-item dropdown">';
              $menu .='<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">'.$item->m_item_name;
              $menu .='</a>';
              $menu .='<div class="dropdown-menu megamenu"><div class="dropdown-content">';
            }else{
              $menu .= '<li class="nav-item">';
              $menu .= '<span class="list-title">';
              $menu .= '<a href="'.$item->m_item_url.'">'.$item->m_item_name;
              $menu .= '</a></span>';
            }
            
            $level++;
            if ($parent_id == 0) {
               $menu .= '<ul class="dropdown-menu-list">'.$this->get_nav_menu($menu_id, $item->m_item_id, $level)."</ul>";
            }else{
             $menu .= '<ul >'.$this->get_nav_menu($menu_id, $item->m_item_id, $level)."</ul>";
            }
            
             //call  recursively
            if ($parent_id == 0) {
              $menu .= '</div>';
            }

            $menu .= '<div class="dropdown-footer"><table class="table"><tr>
                    <th>Refund Poliacy</th><td>You should not need those, but in case.</td></tr><tr>
                    <th>Site Privacy</th><td>We offer trial, you will love it.</td></tr></table></div>';
           }
           if ($parent_id == 0) {
              $menu .= '</div>';
            }
            $menu .= '</li>';
       }

        return $menu;
    }
    public function get_nav_menu_level($menu_id, $parent_id=0, $level = 0)
    {
       $menu = '';
       $prevlevel = $level;
       $level++;
       $query = $this->db->get_where('menu_items', array('m_id'=>$menu_id, 'parent_id'=>$parent_id));

       if ($query->num_rows() > 0) {
           $list = $query->result();  
           $prev= '';
           foreach ($list as $item) {
           
              if ($parent_id == 0) {
                $menu .= '<li class="nav-item dropdown">';
                $menu .='<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">'.$item->m_item_name .'-prev-level-'.$prevlevel.'-level-'.$level;
                $menu .='</a>';
                $menu .='<div class="dropdown-menu megamenu"><div class="dropdown-content">';
              }else{
                $menu .= '<li class="nav-item">';
                $menu .= '<span class="list-title">';
                $menu .= '<a href="'.$item->m_item_url.'">'.$item->m_item_name.'-prevlevel-'.$prevlevel.'-level-'.$level;
                $menu .= '</a></span>';
              }
              $ul_class = '';
              if ($parent_id == 0) {
                $ul_class = 'dropdown-menu-list';
              }
               $menu .= '<ul class="'.$ul_class.'">'.$this->get_nav_menu_level($menu_id, $item->m_item_id, $level)."</ul>";
                          
               //call  recursively
              if ($parent_id == 0) {
                $menu .= '</div></div>';
              }

              $menu .= "</li>";
           }

            
       }

        return $menu;
    }
    
 
}