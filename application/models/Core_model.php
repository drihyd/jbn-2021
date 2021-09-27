<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
* 
*/
class Core_model extends CI_Model
{	
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	public function insert($table = '', $set = NULL)
	{
		if ($table=='' || $set == NULL) return false;
		if ($this->db->insert($table, $set)) {
			return $this->db->insert_id();
		}
		return false;
	}
	public function update($table = '', $set = NULL, $where = NULL, $limit = NULL)
	{
		if ($table=='' || $set == NULL || $where == NULL) return false;
		if ($this->get($table, $where)) 
			return $this->db->update($table, $set, $where, $limit);	
		else return false;
	}
	public function delete($table = '', $where = '', $limit = NULL)
	{
		if ($table=='' || $where == NULL) return false;
		return $this->db->delete($table, $where, $limit);		
	}
	public function get($table='', $where=NULL, $limit=NULL, $offset=NULL)
	{
		if ($table=='') return false;
		$result = $this->db->get_where($table, $where, $limit, $offset);
		//echo '<pre>'; print_r($result->num_rows()); exit();
		if ($result->num_rows() >0) {
			return  $result->num_rows() >1 ? $result->result(): $result->row();
		}else{
			return  false;	
		}	
	}
	public function select($table='', $where=NULL, $limit=NULL, $offset=NULL)
	{ 
			if($where==true)
			$this->db->where($where);
			if($limit==true)
			$this->db->limit($limit);
			$query = $this->db->get_where($table);	
			//echo $this->db->last_query();		
			if($query->num_rows()>0)
			{		
				return $query->result();
			}
			else
			{
				return new stdClass();
			}
	}
	public function get_order_by($table='', $order_by=null, $where=null, $direction = 'ASC', $limit=NULL, $offset=NULL)
	{
		if ($table=='') return false;
		$this->db->from($table);
		if (isset($where) && is_array($where) && count($where) > 0) {
			$this->db->where($where);
		}
		$result = $this->db->order_by($order_by, $direction)->limit($limit, $offset)->get();
		//echo '<pre>'; print_r($result->num_rows()); exit();
		if ($result->num_rows() >0) {
			return $result->result();
		}else{
			return  false;	
		}	
	}
	public function get_join($table='', $joins=null, $where=null, $order_by=null,  $direction = 'ASC', $limit=NULL, $offset=NULL)
	{
		$tables_alias = $tables = $t = array();
		$table_keys = array_keys($joins);
		foreach ($table_keys as $ts) {
			$te = explode('.', $ts);
			$t[]= $te[0];
			$t[]= $te[1];
		}
		$tables = array_unique($t);
		$i=1;
		foreach ($tables as $value) {
		  $tables_alias[$value] = "t$i";
		  $i++;
		}
		$query = $this->db->from($table.' '.$tables_alias[$table]);
		foreach ($joins as $key => $value) {
		   $tables =  explode('.', $key);
		   $columns = explode('.', $value);
		   $table1 = $tables[0];
		   $table2 = $tables[1];
		   $column1 = $columns[0];
		   $column2 = $columns[1];
		    $this->db->join($table1.' '.$tables_alias[$table1], $tables_alias[$table1].'.'.$column1 = $tables_alias[$table2].'.'.$column2, 'left');
		}
		if (isset($where) && is_array($where) && count($where) > 0) {
			foreach ($where as $key=>$column) {
				$tc = explode('.', $key);
				$this->db->where($tables_alias[$tc[0]].'.'.$tc[1], $column);
			}
		}
		$this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result();
		}else{
			return false;
		}
	}
	public function where_in($table='', $key = NULL, $values = NULL, $escape = NULL)
	{
			$this->db->select('*');
			$this->db->from( $table);
			$this->db->where_in($key, $values);	
		if ($result->num_rows() >0) {
			return ($result->num_rows() == 1) ? $result->row() : $result->result();
		}else{
			return  false;	
		}
	}
	public function get_enum_values($table, $field )
	{
	    $type = $this->db->query( "SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'" )->row( 0 )->Type;
	    preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
	    $enum = explode("','", $matches[1]);
	    return $enum;	  
	}
    public function getWithId($table, $column, $id)
	{
		$where = array($column=>$id);
		$row = $this->db->get_where($table, $where);
		return  ($row->num_rows() == 1) ? $row->row() : false;
	}
	public function rmdir_recursive($dir, $deleteFolder=false) 
	{	
		if (file_exists($dir)) {
		    foreach(scandir($dir) as $file) {
		        if ('.' === $file || '..' === $file) continue;
		        if (is_dir("$dir/$file")) $this->rmdir_recursive("$dir/$file");
		        else unlink("$dir/$file");
		    }
		    if ($deleteFolder == true) rmdir($dir);
		    return TRUE;
		}else{
			return false;
		}
	}
public function getjoins($table,$condition=false,$limit=false)
{
		$this->db
		->select('*')
		->from($table)
		->join('artists',"artists.actor_id = $table.ArtistID $condition");
		if($limit!="")
		{
			$this->db->limit($limit, 0);
		}
		$query = $this->db->get();
		//echo $this->db->last_query();
		if ($query->num_rows() > 0) {
			return $query->result();
		}else{
			return new stdClass();
		}
}
	/*public function check_existance($)
	{
		$this->db->get()	
	}*/

	public function menus()
    {
        $this->db->select('*,menu.m_id menu_id,menu.m_name as menu_name, menu_items.m_id as menu_item_id');
        $this->db->from('menu');
        $this->db->join('menu_items', 'menu.m_id=menu_items.m_id','left');
        $this->db->group_by('menu_name');
        $this->db->order_by('menu_id');
        $query=$this->db->get();
        return $query->result();     
    }
    public function Main_menu(){
    	$this->db->where('parent_id','0');
    	return $this->db->get('menu')->result();
    }
    public function sub_menu($m_item_id){
    	$this->db->where('parent_id',$m_item_id);
    	return $this->db->get('menu')->result();
    }

}