<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
* 
*/
class Products_model extends CI_Model
{	
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	public function get_products($CategoryID=NULL, $is_parent=FALSE,$product_type=false,$subproducatype=false,$gendar=false)
	{
		

		$products = array();
		$category_type = 'Sub_CategorylD';
		if ($is_parent) {
			$category_type = 'CategoryID';
		}
		$this->product_select_fields($category_type);
		$this->db->where('p.Productlive', 1);
        if (isset($CategoryID)) {
        	$this->db->where("c.CategoryID",$CategoryID);
        }
        if (isset($product_type)) {
        	$this->db->where("p.product_type",$product_type);
        }    
         if (isset($subproducatype)) {
        	$this->db->where("p.sub_product_type",$subproducatype);
        }      
          if (isset($gendar)) {
        	$this->db->where("p.Gender",$gendar);
        }
         
        if (!empty($_REQUEST)) {

        	$this->apply_filters();
        }
        $this->db->group_by('p.ProductID');

        $query = $this->db->get();
        if ($query->num_rows() > 0) {
        	$products = $query->result();
        }

        return $products;
	}
	
	public function get_products_by_search($headersearch=NULL)
	{
		

		$products = array();
		$category_type = 'Sub_CategorylD';
		if ($is_parent) {
			$category_type = 'CategoryID';
		}
		$this->product_select_fields($category_type);
		$this->db->where('p.Productlive', 1);
		$this->db->like('c.CategoryName', $headersearch); 	
		$this->db->or_like('p.SKU', $headersearch); 		
		$this->db->or_like('p.Name', $headersearch); 		
		$this->db->or_like('p.ShortDesc', $headersearch);		
		$this->db->or_like('p.product_type', $headersearch); 	
        $this->db->or_like('p.Gender', $headersearch);		
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
        	$products = $query->result();
        }


        return $products;
	}
	
	public function apply_filters()
	{	

		if(isset($_REQUEST['gemstone']) || isset($_REQUEST['color']) || isset($_REQUEST['purity']) )
		{	
			$purity = $color = $gemstone = $options = array();	
			if(isset($_REQUEST['gemstone'])){
				$gemstone = explode(',', $_REQUEST['gemstone']);	
			}
			if(isset($_REQUEST['color'])){
				$color = explode(',', $_REQUEST['color']);
			}
			if(isset($_REQUEST['purity']))
			{	
				$purity = explode(',', $_REQUEST['purity']);
			}
			$options = array_merge($purity, $gemstone, $color);
			$this->db->where_in('s.OptionName', $options);
		}
		if(isset($_REQUEST['q']))
		{
			// $this->db->where('p.Name SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.SKU SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.ShortDesc SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.LongDesc SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.CartDesc SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.product_type SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.Polish_Details SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.Collection SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('m.MaterialName SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('p.Gender SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	
			// $this->db->or_where('s.OptionName SOUNDS LIKE ', $_REQUEST['q'], NULL, false); 	


			$this->db->like('c.CategoryName', $_REQUEST['q'], 'both'); 	
			//$this->db->or_like('s.OptionName', $_REQUEST['q'], 'both'); 
			$this->db->or_like('p.SKU', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.Name', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.ShortDesc', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.LongDesc', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.CartDesc', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.product_type', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.Collection', $_REQUEST['q'], 'both'); 		
			//$this->db->or_like('m.MaterialName', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.Gender', $_REQUEST['q'], 'both'); 		
			$this->db->or_like('p.Polish_Details', $_REQUEST['q'], 'both'); 		
		}
		
		if(isset($_REQUEST['gender']))
		{	
			$this->db->where_in('p.Gender', $_REQUEST['gender']);
		}
		if(isset($_REQUEST['collection']))
		{	
			$this->db->where_in('p.Collection', $_REQUEST['collection']);
		}
		if(isset($_REQUEST['product_type']))
		{	
			$this->db->where_in('p.product_type', $_REQUEST['product_type']);
		}
		if(isset($_REQUEST['material']))
		{
			$this->db->where_in('m.slug', explode(',', $_REQUEST['material']));
		}
		if(isset($_REQUEST['sub_product_type']))
		{
			$this->db->where_in('p.sub_product_type', explode(',', $_REQUEST['sub_product_type']));
		}
		if(isset($_REQUEST['min_weight']))
		{		
			$this->db->where('p.Net_weight >=', $_REQUEST['min_weight']);		       
			$this->db->where('p.Net_weight <=', $_REQUEST['max_weight']);
		}
		if(isset($_REQUEST['min_price']))
		{	
			$this->db->where('p.Price >=', $_REQUEST['min_price']);		       
			$this->db->where('p.Price <=', $_REQUEST['max_price']);
		}
		if(isset($_REQUEST['categories']))
		{	
			$this->db->where_in('c.CategorySlug', explode(',', $_REQUEST['categories']));
		}
		if(isset($_REQUEST['sorting']))
		{	
			$sorting = $_REQUEST['sorting'][0];
			if ($sorting == 'price-asc') {
				$this->db->order_by('p.Price', 'asc');
			}
			if ($sorting == 'price-desc') {
				$this->db->order_by('p.Price', 'desc');
			}
			if ($sorting == 'weight-asc') {
				$this->db->order_by('p.Net_weight', 'asc');
			}
			if ($sorting == 'weight-desc') {
				$this->db->order_by('p.Net_weight', 'desc');
			}
		}

	}
	

	public function product_select_fields($category_type)
	{
		$this->db->select('p.screw_type,p.cad_availability,p.mould_availability,p.certificate_number,p.Polish_Details,p.Provision_for_opening,p.No_of_pieces,p.ProductID,p.SKU,p.CategoryID,p.product_type ,p.Gender,p.Sub_CategorylD,p.Productlive,p.Name,p.lmage,p.Stock,p.Price,p.MRP_Price,p.Net_weight,p.Gross_weight,p.Material_type, p.slug, p.is_make_an_order') 
		->select('c.CategoryID,c.CategoryName,c.CategoryDesc,c.CategorySlug')
		//->select('m.MaterialID, m.slug as material_slug, m.MaterialName') 
		//->select('s.OptionID, s.OptionGroupID, s.OptionName') 
		//->select('g.OptionGroupID, g.OptionGroupName, g.slug as option_group_slug')		
        ->from('products p')
        ->join('product_category c', "c.CategoryID = p.$category_type", 'left');
        //->join('material_type m', 'p.Material_type = m.MaterialID', 'left')
        //->join('product_option o', 'p.ProductID = o.ProductID', 'left')

       //->join('productoptions s', 's.OptionID = o.OptionID OR o.Combination_OptionID = s.OptionID OR o.Combination_OptionID_Secnd = s.OptionID', 'left')
     
        //->join('options_group g', 'g.OptionGroupID = s.OptionGroupID', 'left');

	}
	
		public function product_select_fields_backupfromvenkat($category_type)
	{
		$this->db->select('p.screw_type,p.cad_availability,p.mould_availability,p.certificate_number,p.Polish_Details,p.Provision_for_opening,p.No_of_pieces,p.ProductID,p.SKU,p.CategoryID,p.product_type ,p.Gender,p.Sub_CategorylD,p.Productlive,p.Name,p.lmage,p.Stock,p.Price,p.MRP_Price,p.Net_weight,p.Gross_weight,p.Material_type, p.slug, p.is_make_an_order') 
		->select('c.CategoryID,c.CategoryName,c.CategoryDesc,c.CategorySlug')
		->select('m.MaterialID, m.slug as material_slug, m.MaterialName') 
		->select('s.OptionID, s.OptionGroupID, s.OptionName') 
		->select('g.OptionGroupID, g.OptionGroupName, g.slug as option_group_slug')		
        ->from('products p')
        ->join('product_category c', "c.CategoryID = p.$category_type", 'left')
        ->join('material_type m', 'p.Material_type = m.MaterialID', 'left')
        ->join('product_option o', 'p.ProductID = o.ProductID', 'left')
        // ->join('productoptions s', 's.OptionID = o.OptionID')
        // ->join('productoptions q', 'o.Combination_OptionID = q.OptionID')
        // ->join('productoptions r', 'o.Combination_OptionID_Secnd = r.OptionID')
        ->join('productoptions s', 's.OptionID = o.OptionID OR o.Combination_OptionID = s.OptionID OR o.Combination_OptionID_Secnd = s.OptionID', 'left')
        // ->join('productoptions s', 's.OptionID = o.OptionID AND o.Combination_OptionID = s.OptionID OR o.Combination_OptionID_Secnd = s.OptionID')
        ->join('options_group g', 'g.OptionGroupID = s.OptionGroupID', 'left');

	}

	public function get_new_arrivals()
	{
		$products = array();

		$category_type = 'CategoryID';
			$this->product_select_fields($category_type);
		$this->db->where('p.Productlive', 1);
		$this->db->where('p.Stock >', 0);
         
        if (!empty($filters)) {
        	$this->apply_filters($filters);
        }
        $this->db->order_by('Addedon', 'desc');
        $this->db->limit(50);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
        	$products = $query->result();
        }

        return $products;
	}

	public function get_options($slug='')
	{
		$query = $this->db->select('p.OptionID, p.OptionName, g.OptionGroupID, g.slug')
		->from('productoptions p')
		->join('options_group g', 'p.OptionGroupID = g.OptionGroupID')
		->where('g.slug', $slug)
		->get();

		if ($query->num_rows() > 0) {
			return $query->result();
		}
		return false;
	}


public function gift_cards($category)
	{

		$products = array();
		$this->db->select('p.screw_type,p.cad_availability,p.mould_availability,p.certificate_number,p.Polish_Details,p.Provision_for_opening,p.No_of_pieces,p.ProductID,p.SKU,p.CategoryID,p.product_type ,p.Gender,p.Sub_CategorylD,p.Productlive,p.Name,p.lmage,p.Stock,p.Price,p.MRP_Price,p.Net_weight,p.Gross_weight,p.Material_type, p.slug, p.is_make_an_order') 
		->select('c.CategoryID,c.CategoryName,c.CategoryDesc,c.CategorySlug')		
        ->from('products p')       

         ->join('product_category c', "c.CategoryID = p.CategoryID");

        $this->db->where('p.Productlive', 1);

        if (isset($category)) {
        	$this->db->where("c.CategoryID",$category);
        }           
  
        $this->db->group_by('p.ProductID');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
        	$products = $query->result();
        }

        return $products;
	}
	
	
}