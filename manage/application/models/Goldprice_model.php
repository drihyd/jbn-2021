<?php
class Goldprice_model extends CI_Model{
 
  public function tenData()
{
    $query = $this->db
            ->order_by('date' , 'desc')
            ->limit(10)
            ->get('material_price');
    return $query->result();
}
public function get_last_record(){
  $date = new DateTime("now");

 $curr_date = $date->format('Y-m-d');

 $this->db->select('*');
 $this->db->from('material_price'); 
 $this->db->order_by('date' , 'desc');
 $this->db->where('DATE(Date)',$curr_date);
 $this->db->limit(1);//use date function
 $query = $this->db->get();
    return $query->result();
}
public function lastData()
{
    $query = $this->db
            ->order_by('date' , 'desc')
            ->limit(1)
            ->get('material_price');
    return $query->result();
}
 
}