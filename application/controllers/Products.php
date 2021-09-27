<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends MY_Controller {

    public $category_slug="";

    function __construct(){
        parent::__construct();
        $this->load->model('Products_model','products',TRUE);
       $this->category_slug=$this->uri->segment('3');
       

    }
    public function index()
    {       
        $this->category('new-arrivals');  
    }
    public function jbn()
    {       
        $this->category(NULL, NULL, NULL,'jbn');  
    }
    public function regular()
    {       
        $this->category(NULL, NULL, NULL,'anaya');  
    }
    public function solitaire()
    {       
        $this->category(NULL, NULL, NULL,'solitaire');  
    }
    public function collection($slug)
    {       
        $this->category(NULL, NULL, NULL,NULL,$slug);  
    }
    
    public function category($cat_slug=NULL, $material=NULL, $gender=NULL, $product_type=NULL, $collection=NULL)
    { 



if($cat_slug){
	if($cat_slug=="gift-cards") {
	$producatype="gift_cards";
	$subproducatype="gift_cards";
	$gendar="";
	$catname=$cat_slug;
	}
	else{
	$catslug=explode("-", $cat_slug);	
	$catname=array_slice($catslug,2);
	$catname=implode("-",$catname);
	$producatype=$catslug[0];
	$gendar=$catslug[1];
	$catname=$catname;
	$subproducatype=$producatype;
	}
}
else{
	$producatype="";
	$subproducatype="";
	$gendar="";
	$catname="";
}
$category =  $this->core->get('product_category', array('CategorySlug'=>$catname));
        $data['category'] =$category;
        if (isset($_REQUEST['q'])) {
           $cat_slug = $_REQUEST['q'];
            $data['products'] = $this->products->get_products_by_search($_REQUEST['q']);

         }elseif($cat_slug){         
            $is_parent = TRUE;
            $CategoryID = NULL;
            if (!empty($category)) {                
                // if (!isset($_REQUEST['categories'])) {
                    if ($category->ParentID != 0) {
                        $is_parent = FALSE;
                    }
                   $CategoryID = $category->CategoryID;
                // }
            }
            $_REQUEST['sub_product_type'] = $material;
            // $_REQUEST['material'] = $material;
            $_REQUEST['gender'] = $gender;
            $_REQUEST['collection'] = $collection;
            $_REQUEST['product_type'] = $product_type;

                if($cat_slug=="gift-cards") {
                 $data['products'] = $this->products->gift_cards($CategoryID);
                }
                else{
                 $data['products'] = $this->products->get_products($CategoryID,$is_parent,$producatype,$subproducatype,$gendar);
                }
            }
            else{
                $data['products'] = $this->products->get_new_arrivals();
            }

       if($category || isset($_REQUEST['q'])) {
        $data['page'] = 'products-list';
        $data['ajax_link'] = base_url('products/ajax_filtered_products');
        $data['page_title'] = "Products - ".ucwords($cat_slug);
        $data['No_of_Products'] =count((array)($data['products']));
        $data['include_files'][] = './be-assets/includes/category.php';
        $data['include_js'][] = './assets/js/custom-select.js';
        $data['categories']=$this->core->get('product_category');
        $data['material_types']=$this->core->get('material_type');
        $data['diamond_colors']=$this->products->get_options('diamond-color');
        $data['diamond_clarities']=$this->products->get_options('diamond-clarity');
        $data['gold_colors']=$this->products->get_options('gold-color');
        $data['metals']=$this->products->get_options('metal');
        $data['gemstones']=$this->products->get_options('gemstone');
        $this->load->view('anaya-template', $data);
    }
    else{
        $data['page'] = 'errors/html/error_404';
        $data['heading'] = $data['page_title']='404 Page Not Found';
        $data['message'] = 'Something went wrong while displaying this webpage';
        $this->load->view('anaya-template-error', $data);
    }

    }
    public function ajax_filtered_products()
    {

        $products = $data['products'] = $this->products->get_products(NULL, TRUE);
        ob_start();
        $this->load->view('pages/ajax-products-list', $data);
        $page = ob_get_contents();
        ob_end_clean();
        echo json_encode(['html'=>$page, 'products_count'=>count($products)]);
        exit();
    }
	
	public function comingsoon()
	{ 
		$data['page'] = 'errors/html/error_coming_soon';
		$data['heading'] = $data['page_title']='COMING SOON';
		$data['message'] = 'COMING SOON';
		$this->load->view('anaya-template-error', $data);
	}
    
}