<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
* 
*/
class Product_model extends CI_Model
{	
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	public function get_product($slug)
	{
		$product = NULL;
		$this->product_with_category();
		$this->db->where('p.Productlive', 1);
        $this->db->where('p.slug', $slug);
        // $query = $this->db->get();
       // $product = $this->return_result(TRUE);

       if($product = $this->return_result(TRUE)){
       		$product->material = $this->get_properities($product->ProductID, 'material');
            $product->diamonds = $this->get_properities($product->ProductID, 'diamond');
            $product->pearls = $this->get_properities($product->ProductID, 'pearls');
            $product->gemstones = $this->get_properities($product->ProductID, 'gemstone');
            $product->diamond_shapes = $this->get_properities($product->ProductID, 'diamond_shape');
            $product->sizes = $this->get_distinct_properities('OptionSize', $product->ProductID, 'material');
            $product->metals_options = $this->get_combination_option_distinct_properities('Combination_OptionID', $product->ProductID, 'material');
            $product->pearls_options = $this->get_distinct_properities('OptionName', $product->ProductID, 'pearls');
            $product->gemstone_options = $this->get_distinct_properities('OptionName', $product->ProductID, 'gemstone');
       }

       return $product;
	}

    /*public function diamond_distinct_properities($ProductID)
    {   
        $field =   'OptionName';
        $this->db->distinct($field)
        ->select($field)
        ->from('product_option o')
        ->join('productoptions t', "o.OptionID = t.OptionID", 'left')
        ->join('options_group g', 'g.OptionGroupID = t.OptionGroupID', 'left')
        ->where('o.ProductID', $ProductID)
        ->where('o.attribute_type', 'diamond');
        return $this->db->get()->result();

    }*/

    public function get_properities($ProductID, $attribute)
    { 
         $this->db->from('product_option o')
        ->join('productoptions t', "o.OptionID = t.OptionID", 'left')
        ->join('options_group g', 'g.OptionGroupID = t.OptionGroupID', 'left')
        ->where('o.ProductID', $ProductID)
        ->where('o.attribute_type', $attribute);

        $result = $this->db->get()->result();
        foreach ($result as $key => $prop) {
            if (!isset($prop->Combination_OptionID)) {
                continue;
            }
            $result[$key]->Combination_Option_Name = $this->get_combination_details($prop->Combination_OptionID);
        }
        return $result;

    }
    
    public function get_combination_details($Combination_OptionID)
    {
       $arr_criteria = array('OptionID' => $Combination_OptionID);
       $query = $this->db->get_where('productoptions', $arr_criteria); 
       if ($result = $query->row()) {
           return $result->OptionName;
       }
       return false;
    }


	public function product_fields()
	{
		$this->db->select('p.screw_type,p.cad_availability,p.mould_availability,p.certificate_number,p.Polish_Details,p.Provision_for_opening,p.No_of_pieces,p.Gender,p.sub_product_type,p.ProductID ,p.CategoryID ,p.SKU,p.Net_weight,p.slug,p.Width,p.Height,p.Length,p.Making_charges,p.Productlive,p.Length,p.Name,p.CartDesc,p.ShortDesc,p.LongDesc,p.Thumbnail,p.product_video_url,p.product_vimeo_url,p.Stock,p.MRP_Price,p.Price,p.SEOTitle,p.SEODesc,p.SEOKeywords,p.is_make_an_order')
		->from('products p');
	}

	public function product_with_category()
	{
		$this->db->select('p.screw_type,p.cad_availability,p.mould_availability,p.certificate_number,p.Polish_Details,p.Provision_for_opening,p.No_of_pieces,p.Gender,p.sub_product_type,p.ProductID ,p.CategoryID,p.product_type ,p.SKU,p.Net_weight,p.slug,p.Width,p.Height,p.Length,p.Making_charges,p.Productlive,p.Length,p.Name,p.CartDesc,p.ShortDesc,p.LongDesc,p.Thumbnail,p.product_video_url,p.product_vimeo_url,p.Stock,p.MRP_Price,p.Price,p.SEOTitle,p.SEODesc,p.SEOKeywords,p.is_make_an_order,c.CategoryID,c.CategoryName,c.CategoryImage,c.CategoryDesc,c.CategorySlug, c.is_customizable')
        ->from('products p')
        ->join('product_category c', 'c.CategoryID = p.CategoryID', 'left');
	}

	public function return_result($row=FALSE)
	{
		$products = FALSE;
		$query = $this->db->get();
        if ($query->num_rows() > 0 && $row==FALSE) {
        	$products = $query->result();
        }elseif($row==TRUE && $query->num_rows() == 1){
        	$products = $query->row();
        }
        return $products;
	}

    public function get_distinct_properities($field, $ProductID, $attribute)
    {
        $this->db->distinct($field);
        $this->db->select($field);
        $this->db->from('product_option o')
        ->join('productoptions t', "o.OptionID = t.OptionID", 'left')
        ->join('options_group g', 'g.OptionGroupID = t.OptionGroupID', 'left')
        ->where('o.ProductID', $ProductID)
        ->where('o.attribute_type', $attribute);
        return $this->db->get()->result();      
    }
    public function get_combination_option_distinct_properities($field, $ProductID, $attribute)
    {
        $this->db->distinct($field);
        $this->db->select($field);
        $this->db->from('product_option o')
        ->join('productoptions t', "o.OptionID = t.OptionID", 'left')
        ->join('options_group g', 'g.OptionGroupID = t.OptionGroupID', 'left')
        ->where('o.ProductID', $ProductID)
        ->where('o.attribute_type', $attribute);
        $result = $this->db->get()->result(); 
        if (!empty($result)) {
            foreach ($result as $key => $prop) {
                if (!isset($prop->Combination_OptionID)) {
                    continue;
                }
                $result[$key]->Combination_Option_Name = $this->get_combination_details($prop->Combination_OptionID);
            }
        }
        return $result;
    }

    

    public function option_product_diamond_clarity($id=false) {  
        $this->db->where('OptionGroupName', 'Diamond Color');
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
    

	
   
    public function get_related_products($product_id, $CategoryID)
	{
		$fetched = $products = array();
		$this->db->where('Productlive', 1);
		$this->db->where('ProductID !=', $product_id);
        if (isset($CategorySlug)) {
        	$this->db->where('CategoryID = '.$CategoryID);
        }
        $this->db->limit(10);
        $query = $this->db->get('products');
        $temp = $query->result();

        if ($query->num_rows() < 10) {
        	$fetched[] = $product_id;
        	foreach ($temp as $key => $t) {
	        	$fetched[] = $t->ProductID;
	        }
	        $remaining = 10 - $query->num_rows();

        	$this->db->where('Productlive', 1);
        	$this->db->where('ProductID !=', $product_id);
        	$this->db->limit($remaining);
        	$this->db->order_by('UpdateDate', 'asc');
        	$this->db->where_not_in('ProductID', $fetched);
        	$query = $this->db->get('products');
	        $products = $query->result();
        }
       $products = array_merge($products, $temp);
       
       return $products;
	}





function getVimeoInfo($vimeo)
{
    $url = parse_url($vimeo);
    if($url['host'] !== 'vimeo.com' &&
            $url['host'] !== 'www.vimeo.com')
        return false;
   if (preg_match('~^http://(?:www\.)?vimeo\.com/(?:clip:)?(\d+)~', $vimeo, $match)) 
   {
       $id = $match[1];
   }
   else
   {
       $id = substr($link,10,strlen($link));
   }

   if (!function_exists('curl_init')) die('CURL is not installed!');
   $ch = curl_init();
   curl_setopt($ch, CURLOPT_URL, "http://vimeo.com/api/v2/video/$id.php");
   curl_setopt($ch, CURLOPT_HEADER, 0);
   curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
   curl_setopt($ch, CURLOPT_TIMEOUT, 10);
   $output = unserialize(curl_exec($ch));
   $output = $output[0];
   curl_close($ch);
   return $output['id'];
}


}