<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

    function __construct(){    	
        parent::__construct();
        
    }
    public function index()
    {	
		$Listof_Banners=$this->core->get_order_by("banners","id",array("Panel_Type"=>'Home_Banner_Panel','status'=>'1'), 'DESC');
		$Right_Image_Panel=$this->core->get_order_by("banners","Order_By",array("Panel_Type"=>'Right_Image_Panel'), 'ASC');
		$Left_Image_Panel=$this->core->get_order_by("banners","Order_By",array("Panel_Type"=>'Left_Image_Panel'), 'ASC');
		$Without_Image_Panel=$this->core->get_order_by("banners","Order_By",array("Panel_Type"=>'Without_Image_Panel'), 'ASC');
		$Listof_Products=$this->core->get_order_by("products","UpdateDate",array("Productlive"=>1),'ASC',20);
    	$data['page'] = 'Home';
    	$data['seo'] = $this->core->get('seo_content', array('page'=>'home'));    	
		$data['page_title'] = 'Home';
		$data['Listof_Banners'] = $this->Banner_layout($Listof_Banners);
		$data['Listof_Products'] = $this->Product_card_layout($Listof_Products);	
		$data['Without_Image_Panel'] = $this->Product_New_Arrivals_layout($Without_Image_Panel);		
		$data['Left_Image_Panel'] = $this->Home_Left_Image_Panel_layout($Left_Image_Panel);		
		$data['Right_Image_Panel'] = $this->Home_Right_Image_Panel_layout($Right_Image_Panel);		
		$this->load->view('anaya-template', $data);
    }
	public function Banner_layout($data=false)
    {
		$str='';
		if(isset($data)){
		foreach($data as $banners) {



		if($banners->is_full_width_banner=="Yes") {

		$str.='<div class="item">';
          $str.='<div class="row">';
            $str.='<div class="col-md-12">';
            $str.='<a  href="'.$banners->Call_to_action_URL.'">';
              $str.='<img src="'.site_url().'manage/'.$banners->Banner_image.'" class="img-fluid d-inline-block" alt="'.$banners->Heading_One.'">';
            $str.='</a>';
            $str.='</div>';
        $str.='</div>';
        $str.='</div>';

		}
		else {
		$str.='<div class="item">';
          $str.='<div class="row flex-row-desktop">';
            $str.='<div class="col-md-7 text-center  text-md-right text-lg-right text-xl-right">';
              $str.='<img src="'.site_url().'manage/'.$banners->Banner_image.'" class="img-fluid d-inline-block" alt="'.$banners->Heading_One.'">';
            $str.='</div>';
            $str.='<div class="col-md-5">';
              $str.='<div class="heading-content text-center text-md-center text-lg-left text-xl-left">';
                $str.='<small>'.$banners->Heading_One.'</small>';
                $str.='<h1>'.$banners->Heading_Two.'</h1>';
				if(isset($banners->Description)){
                $str.='<p>'.$banners->Description.'</p>';
				}
                $str.='<a  href="'.$banners->Call_to_action_URL.'" class="cta">'.$banners->Button_Name.'</a>';
              $str.='</div>';
            $str.='</div>';
          $str.='</div>';
        $str.='</div>';

    }



		}
		return $str;
    }
	}
	public function Product_New_Arrivals_layout($data=false)
    {
		$str='';
		if(isset($data)){
		$loop=1;
		foreach($data as $new_arrivals) {
			$str.='<h2 class="title">'.$new_arrivals->Heading_One.'</h2>';
			$str.='<p class="sub-text">'.$new_arrivals->Description.'</p>';
			$str.='<a href="'.$new_arrivals->Call_to_action_URL.'" class="cta" >'.$new_arrivals->Button_Name.'</a>';
			if($loop==1)
			{
				break;
			}
		$loop++;
		}
		}
		return $str;
    }
	public function Home_Left_Image_Panel_layout($data=false)
    {
		$str='';
		if(isset($data)){
		$loop=1;
		foreach($data as $home_left_panel_image) {			
			$str.='<div class="row m-0">';
			$str.='<div class="col-md-12 col-lg-8 col-xl-8 p-0">';
			$str.='<div class="card-banner">';
			$str.='<img src="'.site_url().'manage/'.$home_left_panel_image->Banner_image.'" alt="'.$home_left_panel_image->Heading_One.'" style="width:450px;">';
			$str.='</div>';
			$str.='</div>';
			$str.='<div class="col-md-12 col-lg-4 col-xl-4 p-0 d-flex align-items-center">  ';			
			$str.='<div class="card-content p-4 pl-lg-5 pl-xl-5 pr-lg-5 pr-xl-5 order-lg-1 order-xl-1">';			
			$str.='<span class="small text-uppercase text-brand">'.$home_left_panel_image->Heading_One.'</span>';
			$str.='<h2 class="title">'.$home_left_panel_image->Description.'</h2>';
			$str.='<a href="'.$home_left_panel_image->Call_to_action_URL.'" class="cta small"><u>'.$home_left_panel_image->Button_Name.'</u></a>';
			$str.='</div>';
			$str.='</div>';
			$str.='</div>';
			if($loop==1)
			{
				break;
			}
		$loop++;
		}
		}
		return $str;
    }
	
	public function Home_Right_Image_Panel_layout($data=false)
    {	
        /*
		$str='';
		if(isset($data)){
		$loop=1;
		foreach($data as $home_right_panel_image) {			
			$str.='<div class="row m-0">';
			$str.='<div class="col-md-12 col-lg-8 col-xl-8 p-0 order-lg-12 order-xl-12">';
			$str.='<div class="card-banner">';
			$str.='<img src="'.site_url().'manage/'.$home_right_panel_image->Banner_image.'" alt="'.$home_right_panel_image->Heading_One.'">';
			$str.='</div>';
			$str.='</div>';
			$str.='<div class="col-md-12 col-lg-4 col-xl-4 p-0 d-flex align-items-center">';
			$str.='<div class="card-content p-4 pl-lg-5 pl-xl-5 pr-lg-5 pr-xl-5 order-lg-1 order-xl-1">';
			$str.='<span class="small text-uppercase text-brand">'.$home_right_panel_image->Heading_One.'</span>';
			$str.='<h2 class="title">'.$home_right_panel_image->Description.'</h2>';
			$str.='<a href="'.$home_right_panel_image->Call_to_action_URL.'" class="cta small"><u>'.$home_right_panel_image->Button_Name.'</u></a>';
			$str.='</div>';
			$str.='</div>';
			$str.='</div>';
			if($loop==1)
			{
				break;
			}
		$loop++;
		}
		}
		return $str;
		*/
		
		
			$str='';
		if(isset($data)){
		$loop=1;
		foreach($data as $home_left_panel_image) {			
			$str.='<div class="row m-0">';
			$str.='<div class="col-md-12 col-lg-8 col-xl-8 p-0">';
			$str.='<div class="card-banner">';
			$str.='<img src="'.site_url().'manage/'.$home_left_panel_image->Banner_image.'" alt="'.$home_left_panel_image->Heading_One.'" style="width:450px;">';
			$str.='</div>';
			$str.='</div>';
			$str.='<div class="col-md-12 col-lg-4 col-xl-4 p-0 d-flex align-items-center">  ';			
			$str.='<div class="card-content p-4 pl-lg-5 pl-xl-5 pr-lg-5 pr-xl-5 order-lg-1 order-xl-1">';			
			$str.='<span class="small text-uppercase text-brand">'.$home_left_panel_image->Heading_One.'</span>';
			$str.='<h2 class="title">'.$home_left_panel_image->Description.'</h2>';
			$str.='<a href="'.$home_left_panel_image->Call_to_action_URL.'" class="cta small"><u>'.$home_left_panel_image->Button_Name.'</u></a>';
			$str.='</div>';
			$str.='</div>';
			$str.='</div>';
			if($loop==1)
			{
				break;
			}
		$loop++;
		}
		}
		return $str;
    }
	public function Product_card_layout($data=false)
    {
		$str='';
if(isset($data) && is_array($data)){
foreach($data as $product) {
$str.='<div class="product">';
 $str.='<div class="product-card shadow">';

$str.='<a class="product-wish" href="'.base_url().'cart/save_wishlist/'.$product->ProductID.'"><i class="fas fa-heart"></i></a>';

$str.='<a href="'.base_url().'product/'.$product->slug.'" class="product-img-wrapper">';
$path = 'uploads/products/';
              $image = str_replace(' ', '_', $product->SKU).'_thumbnail.jpg';

              $image_path = './'.$path.$image;

              if(!file_exists($image_path)){
                $image = str_replace(' ', '_', $product->SKU).'_dp.jpg';
                $image_path = './'.$path.$image;
                if (!file_exists($image_path)) {
                  $image = str_replace(' ', '_', $product->SKU).'_1.jpg';
                  $image_path = './'.$path.$image;
                  if (!file_exists($image_path)) {
                    $image = str_replace(' ', '_', $product->SKU).'.jpg';
                    $image_path = './'.$path.$image;
                     if (!file_exists($image_path)) {
                      $image = 'Not_Available.jpg';
                    }
                  }
                 
                }
              }

              $image_path = base_url("uploads/products/$image");
 $str.='<img class="product-img" src="'.$image_path.'" alt="'.ucwords($product->Name).'">';
$str.='</a>';
$str.='<div class="product-info">';
$str.='<div class="product-price">';
$str.='<span class="reg-price">₹ '.$this->purchase_cart->number_format($product->Price ).'</span>';
if ($product->Price < $product->MRP_Price) {
$str.='<span class="strike-price"><del>₹ '.$this->purchase_cart->number_format($product->MRP_Price ).'</del></span>';
}
$str.='</div>';
$str.='<a href="'.base_url().'product/'.$product->slug.'" class="product-name with-cart">'.ucwords($product->Name).'</a>';

$str.='<a href="'.base_url().'cart" class="product-cart"><img src="'.base_url().'assets/img/icon-cart.png" width="30" alt="'.ucwords($product->Name).'"></a>';

$str.='</div>';
 $str.='</div>';
$str.='</div>';
}
}
return $str;
    }
    
}