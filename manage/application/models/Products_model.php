<?php
class Products_model extends CI_Model {
    public function getAll() {
        $this->db->select('a.*,b.*,c.*,a.slug as productslug'); 
        $this->db->from('products a');
        $this->db->join('product_category b', 'b.CategoryID = a.CategoryID', 'left'); 
        $this->db->join('options_group c', 'c.OptionGroupID = a.OptionGroupID', 'left'); 
        $this->db->order_by('ProductID', 'desc');
        $query = $this->db->get();
        return $query->result();        
    }
    /*
    function for create Products.
    return Products inserted id.
    created by your name
    created at 12-08-20.
    */
    public function insert($data) {
        $this->db->insert('products', $data);
        return $this->db->insert_id();
    }
    /*
    return Products by id.
    created by your name
    created at 12-08-20.
    */
    public function getDataById($id) {
        $this->db->where('ProductID', $id);
        return $this->db->get('products')->result();
    }

    public function get_search_phone($phoneData)
 {
  // $this->db->select('*');
  $this->db->where('ProductID',$phoneData);
  $res2 = $this->db->get('products')->result();
  return $res2;
 }
    /*
    function for update Products.
    return true.
    created by your name
    created at 12-08-20.
    */
    public function update($id,$data) {
        $this->db->where('ProductID', $id);
        $this->db->update('products', $data);
        return true;
    }
    public function update_price_temp_table($id,$data) {
        $this->db->where('ID', $id);
        $this->db->update('temp_product_import_table', $data);
        return true;
    }

     public function update_pricein_product_table($ProductID,$data) {
        $this->db->where('ProductID', $ProductID);
        $this->db->update('products', $data);
      
    }
    /*
    function for delete Products.
    return true.
    created by your name
    created at 12-08-20.
    */
    public function delete($id) {
        $this->db->where('ProductID', $id);
        $this->db->delete('products');
        return true;
    }
    /*
    function for change status of Products.
    return activated of deactivated.
    created by your name
    created at 12-08-20.
    */
    public function changeStatus($id) {
        $table=$this->getDataById($id);
             if($table[0]->Productlive==0)
             {
                $this->update($id,array('Productlive' => 1));
                return "Activated";
             }else{
                $this->update($id,array('Productlive' => 0));
                return "Deactivated";
             }
    }
	
	
		  public function categories_lists() {  
		  $this->db->where('ParentID', 0);
		  $this->db->order_by('CategoryName', 'asc');
        return $this->db->get('product_category')->result();
    }			 
	public function SubCategories($id=false) {  
		  $this->db->where_not_in('ParentID', 0);
		  if(isset($id) && $id>0){
			  $this->db->where('ParentID',$id);
		  }
		  $this->db->order_by('CategoryName', 'asc');
        return $this->db->get('product_category')->result();
    }		   

	public function option_group() {  
		 $this->db->where('Display', "Yes");
        return $this->db->get('options_group')->result();
    }		
	public function material_types() {  
		 $this->db->order_by('MaterialName', "ASC");
        return $this->db->get('material_type')->result();
    }	
	public function option_product_options($id=false) {  
		$this->db->where('OptionGroupID', 3);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
		public function option_product_colors($id=false) {  
		$this->db->where('OptionGroupID', 4);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
		public function option_product_karet($id=false) {  
		$this->db->where('OptionGroupID', 2);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }	
			public function option_gold_colors($id=false) {  
		$this->db->where('OptionGroupID', 6);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
    public function option_product_pearls($id=false) {  
        $this->db->where('OptionGroupID', 7);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }

     public function option_product_polki($id=false) {  
        $this->db->where('OptionGroupID', 15);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }   

        public function option_product_beads($id=false) {  
        $this->db->where('OptionGroupID', 16);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }  

        public function option_product_other($id=false) {  
        $this->db->where('OptionGroupID', 17);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }  



    public function option_product_gemstone($id=false) {  
        $this->db->where('OptionGroupID', 8);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
	    public function option_product_dia_shapes($id=false) {  
        $this->db->where('OptionGroupID', 9);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
	public function option_product_diamond_clarity($id=false) {  
		$this->db->where('OptionGroupID', 5);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }	
    public function option_product_Diamond_Certified($id=false) {  
        $this->db->where('OptionGroupID', 10);
        $this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }   
	public function option_product_diamond_color($id=false) {  
		$this->db->where('OptionGroupID', 1);
		$this->db->order_by('OptionName', 'asc');
        return $this->db->get('productoptions')->result();
    }
	public function material_properities($ProductID=false) {  
		$this->db->where('ProductID', $ProductID);
		 $this->db->where('attribute_type', 'material');
		//$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }
	public function diamond_properities($ProductID=false) {  
		$this->db->where('ProductID', $ProductID);
		$this->db->where('attribute_type', 'diamond');
		//$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }
    public function pearls_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'pearls');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }
    public function polki_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'polki');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }

        public function beads_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'beads');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }

            public function other_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'other');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }

    public function gemstone_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'gemstone');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }
	    public function diamond_shape_properities($ProductID=false) {  
        $this->db->where('ProductID', $ProductID);
        $this->db->where('attribute_type', 'diamond_shape');
        //$this->db->order_by('OptionName', 'asc');
        return $this->db->get('product_option')->result();
    }

 public function Importing_getAll($error_chk=false,$selectedids=false) {
    $this->db->select('*'); 
    $this->db->from('temp_product_import_table');
    if(is_array($error_chk)) {
     $this->db->where('is_error','');
    }
    if($selectedids) {
     $this->db->where_in('ID', $selectedids);
    }
    $query = $this->db->get();
    return $query->result();
        
    }

    public function get_Generic_Query($table=NULL,$limit = NULL, $offset = NULL, $sort = NULL, $search = NULL,$option_group_id=NULL)
    {
        if ($limit !== NULL) $limit = (int) $limit;
        if ($offset !== NULL) $offset = (int) $offset;
        if (is_array($sort)) {
            foreach ($sort as $field => $order) {
                $this->db->order_by($field, $order);
            }
        }
        if (is_array($search)) {
            foreach ($search as $field => $match) {
                $this->db->like($field, $match);
            }
        }
        $this->db->select();

        if($option_group_id){
            $this->db->where('OptionGroupID',$option_group_id);
        }
       $query=$this->db->get($table, $limit, $offset);
        return $query->result();
    }


public function Get_Gold_Rates($purity=false) {
    $this->db->select('price'); 
    $this->db->from('material_price');  
    //$this->db->where('metal_clar_purity', $purity);
    $this->db->order_by('id', 'desc'); 
    $this->db->order_by('date', 'desc'); 
    $this->db->limit(1); 
    $query = $this->db->get();
    return $query->result();     
}


    public function get_karat_in_product($ProductID=false) {
		$this->db->select('LEFT(po.OptionName,2) as OptionName');
		$this->db->from('product_option p_o');
		$this->db->join('productoptions po', 'po.OptionID = p_o.Combination_OptionID ', 'left'); 
		$this->db->where('p_o.ProductID', $ProductID);
		$this->db->where('p_o.attribute_type','material');
		$this->db->order_by('ProductID', 'desc');
		$query = $this->db->get();
		return $query->result();        
    }

    public function get_meterial_price_in_product($ProductID=false,$meterial_type=false) {
        $this->db->select('p_o.OptionPriceincrement,p_o.OptionWeight'); 
        $this->db->from('product_option p_o');
        $this->db->where('p_o.ProductID', $ProductID);
        $this->db->where('p_o.attribute_type',$meterial_type);
        $this->db->order_by('p_o.ProductID', 'desc');
        $query = $this->db->get();
        return $query->result();        
    }



}