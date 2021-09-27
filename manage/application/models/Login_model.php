<?php
class Login_model extends CI_Model{
 
  function validate($Email,$Password){
    $this->db->where('Email',$Email);
    $this->db->where('Password',$Password);
    $result = $this->db->get('admin_user');
    return $result;
  }
 
}