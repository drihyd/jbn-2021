<?php
class User_model extends CI_Model{
 
  public function _Listing()
    {
        $this->db->select('au.AdminID  au_AdminID,au.RoleID as au_RoleID,au.FirstName as au_FirstName,au.LastName as au_LastName,au.Email au_EMail,au.Phone au_phone,r.name r_name');
        $this->db->from('admin_user as au');
        $this->db->join('role as r', 'au.RoleID=r.RoleID','left');
        $this->db->where(array('au.RoleID!='=>1));
        $query=$this->db->get();
        return $query->result();   
    }
 
}