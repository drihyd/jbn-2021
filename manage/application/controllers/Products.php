<?php
class Products extends MY_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('products_model','products');
        $this->load->library('session');
     }
    public function index() {   
        $data['page_title'] = 'All Products';
        $data['page'] = 'product/manage-products';
        $data['include_files'][] = './assets/includes/products.php';         
        $data["productss"] = $this->products->getAll();
        // echo '<pre>'; print_r($data); exit();     
        $this->load->view('manage-template', $data);    
    }   
     public function seo_createorupdate($ProductID=False) { 

        $ProductID = decrypt_url($ProductID);
        $data['products'] = $this->products->getDataById($ProductID); 
        if($data['products']){
        $data['page_title'] = 'SEO Data for '.$data['products'][0]->Name;
        $data['page'] = 'product/form-create-update-seo';
        $data['include_files'][] = './assets/includes/products.php';         
        $data["productss"] = $this->products->getAll();
        // echo '<pre>'; print_r($data); exit();     
       

        }
        else{
            $data['page'] = 'httpcode/404';
            $data['page_title'] = '404 Page.';
        }
        
    $this->load->view('manage-template', $data); 
    } 
    public function attributes_createorupdate($ProductID=False) { 

        $ProductID = decrypt_url($ProductID);
        $data['products'] = $this->products->getDataById($ProductID); 
        if($data['products']){
        $data['page_title'] = 'Attribute Data for '.$data['products'][0]->Name;
        $data['page'] = 'product/form-create-update-attribute';
        $data['include_files'][] = './assets/includes/products.php';         
        $data["productss"] = $this->products->getAll();
        // echo '<pre>'; print_r($data); exit();     
       

        }
        else{
            $data['page'] = 'httpcode/404';
            $data['page_title'] = '404 Page.';
        }
        
    $this->load->view('manage-template', $data); 
    }



     public function prices_createorupdate($ProductID=False) { 

        $ProductID = decrypt_url($ProductID);
        $data['products'] = $this->products->getDataById($ProductID); 
        if($data['products']){
        $data['page_title'] = 'Prices for '.$data['products'][0]->Name;
        $data['page'] = 'product/form-create-update-prices';
        $data['include_files'][] = './assets/includes/products.php';         
        $data["productss"] = $this->products->getAll();
        // echo '<pre>'; print_r($data); exit();     
       

        }
        else{
            $data['page'] = 'httpcode/404';
            $data['page_title'] = '404 Page.';
        }
        
    $this->load->view('manage-template', $data); 
    } 


public function method_attributes_createorupdate(){
$post_fields = $this->security->xss_clean($this->input->post());


$products_id = $post_fields['ProductID'];
$product_info= $this->products->getDataById($products_id); 

if($product_info) {


if(isset($products_id) && !empty($products_id)) {
$result_product_pro=$this->add_product_properties($post_fields,"Add",$products_id,"");
$this->single_product_update_price($products_id); 
$this->session->set_flashdata('success', $product_info[0]->Name.' attributes are updated successfully');
redirect('products','refresh');    
}

}

else{
$this->session->set_flashdata('success', 'Product is not exist in the listing.');
redirect('products','refresh'); 

}

}


public function method_seo_createorupdate(){

$post_fields = $this->security->xss_clean($this->input->post());
$data=[];
$data['SEOTitle'] = $post_fields['SEOTitle'];
$data['SEODesc'] = $post_fields['SEODesc'];
$data['SEOKeywords'] = $post_fields['SEOKeywords'];
$products_id = $post_fields['ProductID'];
 $product_info= $this->products->getDataById($products_id); 

if(isset($products_id) && !empty($products_id)) {
$data['Modifiedon'] = isset($post_fields['Modifiedon'])?:date('Y-m-d h:i:s');
$this->products->update($products_id,$data);   
$this->session->set_flashdata('success', $product_info[0]->Name.' SEO Information Successfully Updated.');
redirect('products','refresh');         
}

}

public function method_prices_createorupdate(){

$post_fields = $this->security->xss_clean($this->input->post());
$data=[];
$data['Price'] = $post_fields['Price'];
$data['MRP_Price'] = $post_fields['MRP_Price'];
$data['included_handling_charge'] =(int)0;
$data['discount_percentage'] = $post_fields['discount_percentage'];
$data['Making_charges'] = $post_fields['Making_charges'];
$data['Making_chg_On_Grs_Net_Weight'] = $post_fields['Making_chg_On_Grs_Net_Weight'];
$data['Making_charges_unit'] = $post_fields['Making_charges_unit'];
$data['mould_availability'] = $post_fields['mould_availability'];
$data['cad_availability'] = $post_fields['cad_availability'];
$products_id = $post_fields['ProductID'];
$product_info= $this->products->getDataById($products_id); 

if(isset($products_id) && !empty($products_id)) {
$data['Modifiedon'] = isset($post_fields['Modifiedon'])?:date('Y-m-d h:i:s');
$this->products->update($products_id,$data);  
if($product_info[0]->product_type=="gift_cards"){

}
else{
    $this->single_product_update_price($products_id); 
}

$this->session->set_flashdata('success', $product_info[0]->Name.' Prices Successfully Updated.');
redirect('products','refresh');         
}

}


    public function get_stone_prices()
    {
        $phoneData = $this->input->post('phoneData');
        if(isset($phoneData) and !empty($phoneData)){
            $records = $this->products->get_search_phone($phoneData);




            $total_withour_gst = $records[0]->price_with_netweight+$records[0]->price_with_diamond_weight+$records[0]->price_with_gemstone_weight+$records[0]->price_with_pearl_weight+$records[0]->price_with_polki_weight+$records[0]->price_with_beads_weight+$records[0]->price_with_other_weight+$records[0]->price_with_handling+$records[0]->price_makingchrg_on_gw_nw;
            $total = $records[0]->price_with_netweight+$records[0]->price_with_diamond_weight+$records[0]->price_with_gemstone_weight+$records[0]->price_with_pearl_weight+$records[0]->price_with_polki_weight+$records[0]->price_with_beads_weight+$records[0]->price_with_other_weight+$records[0]->price_with_handling+$records[0]->price_makingchrg_on_gw_nw+$records[0]->price_on_cgst+$records[0]->price_on_sgst;
            


        $output= '<h4 class="text-center"><strong>'.ucwords($records[0]->Name).'</strong></h4><br>
         
          <table class="table table-bordered">
          <thead class="bg-dark">
          <tr>
          <th>Stone</th>
          <th style="text-align:right">Price</th>
          </tr>
            </thead>
           <tr>
            <td><b>>Price of Weight</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_netweight).'</td>
           </tr>
           <tr>
            <td><b>Price of Diamonds</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_diamond_weight).'</td>            
           </tr>            
           <tr>
            <td><b>Price of Gemstones</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_gemstone_weight).'</td>            
           </tr> 
           <tr>
            <td><b>Price of Pearls</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_pearl_weight).'</td>            
           </tr>
           <tr>
            <td><b>Price of Polki</b></td>
            <td align=right>'.sprintf("%.2f",$records[0]->price_with_polki_weight).'</td>            
           </tr>             
           <tr>
            <td><b>Price of Beads</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_beads_weight).'</td>            
           </tr>
           <tr>
            <td><b>Other Charges</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_other_weight).'</td>
           </tr> 
            <tr>
            <td><b>Making Charges</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_makingchrg_on_gw_nw).'</td>
           </tr>  
            <tr>
            <td><b>Handling Charges</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_with_handling).'</td>
           </tr> 
            <tr>
            <tr>
            <td><b>Sub Total</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$total_withour_gst).'</td>
           </tr> 
            <tr>
            <td><b>CGST</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_on_cgst).'</td>
           </tr>   
            <tr>
            <td><b>SGST</b></td>
            <td align=right>'.INRICON.' '.sprintf("%.2f",$records[0]->price_on_sgst).'</td>
           </tr>                       
           <tr>
            <td><b style="font-size: 16px;">Grand Total</b></td>
            <td align=right><b style="font-size: 16px;">'.INRICON.' '.sprintf("%.2f",$total).'/-</b></td>            
           </tr>                        
       </table>
      ';

            echo $output;

            exit();

        }


    }
    public function add() {
        //$slug = url_title(convert_accented_characters($string), 'dash', true);
        $data['page_title'] = 'Add Product';
        $data['page'] = 'product/add-products'; 
        $data['include_files'][] = './assets/includes/products.php';   
        $this->load->view('manage-template', $data);
        //$this->load->view('products/add-products');
    }
      /*
    function for edit Products get
    returns  Products by id.
    created by your name
    created at 12-08-20.
    */
    public function update($products_id) {

        $products_id = decrypt_url($products_id);
        $data['products_id'] = $products_id;
        $data['products'] = $this->products->getDataById($products_id);     
        $data['page_title'] = 'Edit Product for '.$data['products'][0]->Name;
        $data['page'] = 'product/edit-products';    
        $data['include_files'][] = './assets/includes/products.php';        
        $this->load->view('manage-template', $data);
    }
    
    public function add_product_properties($product_data_array=false,$action=false,$Product_ID=false,$delete_option=false)
    {
    

        if($action=="Add")
        {
            $ProductID=$Product_ID;
        }
        else{
            $ProductID=$product_data_array['products_id'];
        }

        if($delete_option=="import_product"){

        }
        else{
            $product_option_id=$this->core->delete("product_option",array("ProductID"=>$ProductID));
        }
                    
        $gold_data=$dp_data=$dp_data=$gsn_data=$diamon_shape_data=$pear_data=array();
        //$Mat_Pro_Weight=isset($product_data_array['Mat_Pro_Weight'])?$product_data_array['Mat_Pro_Weight']:0;
        $OptionGroupID=isset($product_data_array['OptionGroupID'])?$product_data_array['OptionGroupID']:0;
        if(isset($product_data_array['Karat']) && is_array($product_data_array['Karat'])){
        foreach($product_data_array['Karat'] AS $key=>$value)
        {

            if(!empty($product_data_array['Karat'][$key])){                     
                if(isset($product_data_array['Karat'])){
                $gold_data['Combination_OptionID']=$product_data_array['Karat'][$key];
                }
                if(isset($product_data_array['G_Colors']) && is_array($product_data_array['G_Colors'])){
                $gold_data['Combination_OptionID_Secnd']=$product_data_array['G_Colors'][$key];
                }
                $gold_data['OptionWeight']=isset($product_data_array['Mat_Pro_Weight'][$key])?$product_data_array['Mat_Pro_Weight'][$key]:0;
                $gold_data['OptionSize']=isset($product_data_array['size'][$key])?$product_data_array['size'][$key]:0;
                $gold_data['OptionPriceincrement']=0;
                $gold_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                $gold_data['ProductID']=$ProductID;
                $gold_data['attribute_type']='material';
                $gold_data['OptionID']=0;
                $product_option_id=$this->core->insert("product_option",$gold_data);
                
                /*Update Metal Karat 14/18/20/22/24*/
                if($puritykt_info=$this->products->get_Generic_Query("productoptions","","","",array("OptionID"=>$product_data_array['Karat'][$key])))
                {
                    $purity_kt=$puritykt_info[0]->OptionName;
                }
                $this->products->update($ProductID,array('purity_kt'=>$purity_kt));
            }
        }   
        }
        
        if(isset($product_data_array['Diamond_Shape'])){


            foreach($product_data_array['DP_Clarity'] AS $key=>$value)
            {
                if(!empty($product_data_array['Diamond_Shape'][$key])){
                    $dp_data['OptionID']=isset($product_data_array['DP_Clarity'][$key])?$product_data_array['DP_Clarity'][$key]:0;
                    if(isset($product_data_array['DP_Color']) && is_array($product_data_array['DP_Color'])){
                        $dp_data['Combination_OptionID']=isset($product_data_array['DP_Color'][$key])?$product_data_array['DP_Color'][$key]:0;
                    }   
                    if(isset($product_data_array['DP_Clarity_1']) && is_array($product_data_array['DP_Clarity_1'])){
                        $dp_data['Combination_OptionID_Secnd']=isset($product_data_array['DP_Clarity_1'][$key])?$product_data_array['DP_Clarity_1'][$key]:0;
                    } 
                     
                    if(isset($product_data_array['Diamond_Shape']) && is_array($product_data_array['Diamond_Shape'])){
                          $dp_data['Diamond_Shape_Id']=isset($product_data_array['Diamond_Shape'][$key])?$product_data_array['Diamond_Shape'][$key]:0;
                     }   

                    $dp_data['OptionWeight']=isset($product_data_array['DP_Weight'][$key])?$product_data_array['DP_Weight'][$key]:0;
                    $dp_data['OptionPriceincrement']=isset($product_data_array['DP_Rate'][$key])?$product_data_array['DP_Rate'][$key]:0;
                    $dp_data['Quantity']=isset($product_data_array['DP_No_of_Diamonds'][$key])?$product_data_array['DP_No_of_Diamonds'][$key]:0;
                    $dp_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $dp_data['ProductID']=$ProductID;
                    $dp_data['attribute_type']='diamond';  


                    $product_option_id=$this->core->insert("product_option",$dp_data);
                }
                
            }
        }



        if(isset($product_data_array['GSN_type'])){       
            foreach($product_data_array['GSN_type'] AS $key=>$value)
            {
                if(!empty($product_data_array['GSN_type'][$key])){
                    $gsn_data['OptionID']=$product_data_array['GSN_type'][$key];
                    $gsn_data['OptionWeight']=$product_data_array['GSN_Weight'][$key];
                    $gsn_data['OptionPriceincrement']=$product_data_array['GSN_Rate'][$key];
                    $gsn_data['Quantity']=$product_data_array['GSN_Quantity'][$key];
                    $gsn_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $gsn_data['ProductID']=$ProductID;
                    $gsn_data['Combination_OptionID']=0;
                    $gsn_data['Combination_OptionID_Secnd']=0;
                    $gsn_data['attribute_type']='gemstone';
                    $product_option_id=$this->core->insert("product_option",$gsn_data);
                }
                
            }
        }        
        /*if(isset($product_data_array['Diamond_Shape'])){       
            foreach($product_data_array['Diamond_Shape'] AS $key=>$value)
            {
                if(!empty($product_data_array['Diamond_Shape'][$key])){
                    $diamon_shape_data['OptionID']=$product_data_array['Diamond_Shape'][$key];
                    $diamon_shape_data['OptionWeight']=isset($product_data_array['DS_Weight'][$key])?$product_data_array['DS_Weight'][$key]:0;
                    $diamon_shape_data['OptionPriceincrement']=isset($product_data_array['DS_Rate'][$key])?$product_data_array['DS_Rate'][$key]:0;
                    $diamon_shape_data['Quantity']=isset($product_data_array['DS_no_diamonds'][$key])?$product_data_array['DS_no_diamonds'][$key]:0;
                    $diamon_shape_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $diamon_shape_data['ProductID']=$ProductID;
                    $diamon_shape_data['Combination_OptionID']=0;
                    $diamon_shape_data['Combination_OptionID_Secnd']=0;
                    $diamon_shape_data['attribute_type']='diamond_shape';
                     $product_option_id=$this->core->insert("product_option",$diamon_shape_data);
                }
                
            }
        }*/


        /*** Pearl Data ***/
        if(isset($product_data_array['Pearls'])){       
            foreach($product_data_array['Pearls'] AS $key=>$value)
            {
                if(!empty($product_data_array['Pearls'][$key])) {
                    $pear_data['Quantity']=$product_data_array['Pearls_quantity'][$key];
                    $pear_data['OptionWeight']=$product_data_array['Pearl_Weight'][$key];
                    $pear_data['OptionPriceincrement']=$product_data_array['Pearls_Rate'][$key];
                    $pear_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $pear_data['ProductID']=$ProductID;
                    $pear_data['attribute_type']='pearls';
                    $pear_data['Combination_OptionID']=0;
                    $pear_data['Combination_OptionID_Secnd']=0;
                    $pear_data['OptionID']=$product_data_array['Pearls'][$key];
                    $product_option_id=$this->core->insert("product_option",$pear_data);
                }                
            }
        }


        /*** Polki Data ***/
        if(isset($product_data_array['Polki'])){       
            foreach($product_data_array['Polki'] AS $key=>$value)
            {
                if(!empty($product_data_array['Polki'][$key])) {
                    $pear_data['Quantity']=$product_data_array['Polki_quantity'][$key];
                    $pear_data['OptionWeight']=$product_data_array['Polki_Weight'][$key];
                    $pear_data['OptionPriceincrement']=$product_data_array['Polki_Rate'][$key];
                    $pear_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $pear_data['ProductID']=$ProductID;
                    $pear_data['attribute_type']='polki';
                    $pear_data['Combination_OptionID']=0;
                    $pear_data['Combination_OptionID_Secnd']=0;
                    $pear_data['OptionID']=$product_data_array['Polki'][$key];
                    $product_option_id=$this->core->insert("product_option",$pear_data);
                }                
            }
        }

        /*** End ***/



        /*** beads Data ***/
        if(isset($product_data_array['beads'])){       
            foreach($product_data_array['beads'] AS $key=>$value)
            {
                if(!empty($product_data_array['beads'][$key])) {
                    $pear_data['Quantity']=$product_data_array['beads_quantity'][$key];
                    $pear_data['OptionWeight']=$product_data_array['beads_Weight'][$key];
                    $pear_data['OptionPriceincrement']=$product_data_array['beads_Rate'][$key];
                    $pear_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $pear_data['ProductID']=$ProductID;
                    $pear_data['attribute_type']='beads';
                    $pear_data['Combination_OptionID']=0;
                    $pear_data['Combination_OptionID_Secnd']=0;
                    $pear_data['OptionID']=$product_data_array['beads'][$key];
                    $product_option_id=$this->core->insert("product_option",$pear_data);
                }                
            }
        }

        /*** End ***/

                /*** other Data ***/
        if(isset($product_data_array['other'])){       
            foreach($product_data_array['other'] AS $key=>$value)
            {
                if(!empty($product_data_array['other'][$key])) {
                    $pear_data['Quantity']=$product_data_array['other_quantity'][$key];
                    $pear_data['OptionWeight']=$product_data_array['other_Weight'][$key];
                    $pear_data['OptionPriceincrement']=$product_data_array['other_Rate'][$key];
                    $pear_data['OptionGroupID']=isset($OptionGroupID)?$OptionGroupID:0;
                    $pear_data['ProductID']=$ProductID;
                    $pear_data['attribute_type']='other';
                    $pear_data['Combination_OptionID']=0;
                    $pear_data['Combination_OptionID_Secnd']=0;
                    $pear_data['OptionID']=$product_data_array['other'][$key];
                    $product_option_id=$this->core->insert("product_option",$pear_data);
                }                
            }
        }

        /*** End ***/


    }
    


    
    public function save() {




            $this->form_validation->set_rules('CategorylD', 'Category', 'required|trim|xss_clean');
            $this->form_validation->set_rules('Sub_CategorylD', 'Sub Category', 'trim|xss_clean');
            $this->form_validation->set_rules('Name', 'Product Name', 'required|trim|xss_clean');
            $this->form_validation->set_rules('SKU', 'Product SKU', 'required|trim|xss_clean');
            $this->form_validation->set_rules('Material_type', 'Material Type', 'required|trim|xss_clean');
            $this->form_validation->set_rules('Material_type', 'Material Type', 'required|trim|xss_clean');
            $this->form_validation->set_rules('No_of_pieces', 'No of pieces', 'required|trim|xss_clean|greater_than[0]');
            $this->form_validation->set_rules('Gross_weight', 'Gross Weight', 'required|trim|xss_clean|greater_than[0]');
            $this->form_validation->set_rules('Net_weight', 'Net Weight', 'required|trim|xss_clean|greater_than[0]');
            $this->form_validation->set_rules('Gender', 'Ornament For', 'required|trim|xss_clean');
            $this->form_validation->set_rules('ShortDesc', 'Product Description', 'required|trim|xss_clean');
            $this->form_validation->set_rules('Stock', 'Stock', 'required|trim|xss_clean|greater_than[0]');
            //$this->form_validation->set_rules('MRP_Price', 'MRP Price', 'required|trim|xss_clean|greater_than[0]');
            //$this->form_validation->set_rules('Price', 'Product Price', 'required|trim|xss_clean|greater_than[0]');
            //$this->form_validation->set_rules('Making_charges_unit', 'Making Charges Unit Type', 'required|trim|xss_clean');
            //$this->form_validation->set_rules('Making_chg_On_Grs_Net_Weight', 'On Gross/Net Weight', 'required|trim|xss_clean');
            //$this->form_validation->set_rules('Making_charges', 'Making Charges', 'required|trim|xss_clean|greater_than[0]');
            $this->form_validation->set_rules('product_type', 'Product Type', 'trim|xss_clean|required');
            $this->form_validation->set_rules('sub_product_type', 'Product Type', 'trim|xss_clean|required');
            //$this->form_validation->set_rules('mould_availability', 'Mould availability', 'trim|xss_clean');
            //$this->form_validation->set_rules('cad_availability', 'CAD availability', 'trim|xss_clean');
            //$this->form_validation->set_rules('certificate_number', 'Certificate number', 'trim|xss_clean');



            $post_fields = $this->security->xss_clean($this->input->post());
            
            $products_id = isset($post_fields['products_id'])?$post_fields['products_id']:"";
            if($this->form_validation->run() === FALSE) {
                    if(isset($products_id) && !empty($products_id)) {
                            $data['products_id'] = $products_id;
                            $data['products'] = $this->products->getDataById($products_id);     
                            $data['page_title'] = 'Edit Product';
                            $data['page'] = 'product/edit-products';    
                            $data['include_files'][] = './assets/includes/products.php';        
                            $this->load->view('manage-template', $data);         
                    }
                    else{
                            $data['page_title'] = 'Add Product';
                            $data['page'] = 'product/add-products'; 
                            $data['include_files'][] = './assets/includes/products.php';   
                            $this->load->view('manage-template', $data);
                    }              
        }else{




                $products = $this->products->getDataById($products_id);

                $data['OptionGroupID'] = $post_fields['OptionGroupID'];
                $data['SKU'] = $post_fields['SKU'];
                $data['Name'] = $post_fields['Name'];
                $data['slug'] = url_title(convert_accented_characters($post_fields['Name']), 'dash', true).'-'.url_title(convert_accented_characters($post_fields['SKU']),'dash', true);
                //$data['Price'] = $post_fields['Price'];
                //$data['MRP_Price'] = $post_fields['MRP_Price'];
				$data['included_handling_charge'] =(int)0;
                //$data['discount_percentage'] = $post_fields['discount_percentage'];
                //$data['Making_charges'] = $post_fields['Making_charges'];
                //$data['Making_chg_On_Grs_Net_Weight'] = $post_fields['Making_chg_On_Grs_Net_Weight'];
                //$data['Making_charges_unit'] = $post_fields['Making_charges_unit'];
                $data['No_of_pieces'] = $post_fields['No_of_pieces'];
                $data['Gross_weight'] = $post_fields['Gross_weight'];
                $data['Net_weight'] = $post_fields['Net_weight'];
                $data['Provision_for_opening'] = isset($post_fields['Provision_for_opening'])?$post_fields['Provision_for_opening']:'';
                $data['is_make_an_order'] = isset($post_fields['is_make_an_order'])?$post_fields['is_make_an_order']:'';
                $data['Polish_Details'] = $post_fields['Polish_Details'];
                $data['Width'] = $post_fields['Width'];
                $data['Height'] = $post_fields['Height'];
                $data['Length'] = $post_fields['Length'];
                $data['chain_length'] = $post_fields['chain_length'];
                $data['product_type'] = strtolower($post_fields['product_type']);


                if(empty($post_fields['sub_product_type'])){
                    $data['sub_product_type'] = strtolower($post_fields['product_type']);
                }
                else{
                    $data['sub_product_type'] = strtolower($post_fields['sub_product_type']);
                }
                
                //$data['mould_availability'] = $post_fields['mould_availability'];
                //$data['cad_availability'] = $post_fields['cad_availability'];
                $data['certificate_number'] = $post_fields['certificate_number'];
                $data['product_video_url'] = $post_fields['product_video_url'];
                $data['product_vimeo_url'] = $post_fields['product_vimeo_url'];
                $data['CartDesc'] = "";
                $data['ShortDesc'] = $post_fields['ShortDesc'];
                $data['LongDesc'] = isset($post_fields['LongDesc'])?$post_fields['LongDesc']:"";
                if (isset($_FILES['Thumbnail']['name'])) { 
                $path = '../uploads/products';
                $config['upload_path'] = $path;
                $config['allowed_types'] = 'jpg|png|jpeg|gif';
                $config['remove_spaces'] = TRUE;
                $this->load->library('upload', $config);
                $this->upload->initialize($config);   
                if (!$this->upload->do_upload('Thumbnail')) {
                $error = array('error' => $this->upload->display_errors());
                } else {
                $upload_data = array('upload_data' => $this->upload->data());
                $import_file = $upload_data['upload_data']['file_name'];
                $inputFileName = $path .'/'. $import_file;              
                $data['Thumbnail'] = $inputFileName;
                //unlink('./product_images/'.$products[0]->Thumbnail);
                }
                } 
                if(isset($_FILES['lmage']['name'])) { 
                $path = '../uploads/products';
                $config['upload_path'] = $path;
                $config['allowed_types'] = 'jpg|png|jpeg|gif';
                $config['remove_spaces'] = TRUE;
                $config['file_name'] = $post_fields['SKU']."_1.jpg";
                $config['overwrite'] = TRUE;
                $this->load->library('upload', $config);
                $this->upload->initialize($config);   
                if (!$this->upload->do_upload('lmage')) {
                $error = array('error' => $this->upload->display_errors());
                } else {
                $upload_data = array('upload_data' => $this->upload->data());
                $import_file = $upload_data['upload_data']['file_name'];
                $inputFileName = $path .'/'. $import_file;              
                $data['lmage'] = $inputFileName;
                }
                }

                $data['CategoryID'] = $post_fields['CategorylD'];
                $data['Sub_CategorylD'] = $post_fields['Sub_CategorylD'];
                $data['UpdateDate'] = isset($post_fields['UpdateDate'])?:date('Y-m-d h:i:s');
                $data['Stock'] = $post_fields['Stock'];
                $data['Productlive'] = $post_fields['Productlive'];
                $data['AddedBy'] = isset($post_fields['AddedBy'])?:"";
                $data['AddedByIP'] = isset($post_fields['AddedByIP'])?:"";
                //$data['SEOTitle'] = $post_fields['SEOTitle'];
                //$data['SEODesc'] = $post_fields['SEODesc'];
                //$data['SEOKeywords'] = $post_fields['SEOKeywords'];
                $data['Material_type'] = $post_fields['Material_type'];
                $data['Gender'] = $post_fields['Gender'];
           
                if(isset($products_id) && !empty($products_id)) {
                $data['Modifiedon'] = isset($post_fields['Modifiedon'])?:date('Y-m-d h:i:s');
                $edit = $this->products->update($products_id,$data);   


                //$result_product_pro=$this->add_product_properties($post_fields,"Edit","");
                $this->session->set_flashdata('success', $post_fields['Name']. ' updated successfully');
                $this->single_product_update_price($products_id);
                redirect('products','refresh');         
                }
                else{
                $data['Addedon'] = isset($post_fields['Modifiedon'])?:date('Y-m-d h:i:s');
                $ProductID=$this->products->insert($data);
                //$result_product_pro=$this->add_product_properties($post_fields,"Add",$ProductID);
                
                if($ProductID>0){
                $this->session->set_flashdata('success', $post_fields['Name'].' added successfully');
               $this->single_product_update_price($ProductID);
               redirect('products','refresh');
                }
                else{

                    if(isset($products_id) && !empty($products_id)) {
                            $data['products_id'] = $products_id;
                            $data['products'] = $this->products->getDataById($products_id);     
                            $data['page_title'] = 'Edit for '.$post_fields['Name'];
                            $data['page'] = 'product/edit-products';    
                            $data['include_files'][] = './assets/includes/products.php';        
                            $this->load->view('manage-template', $data);         
                    }
                    else{
                            $data['page_title'] = 'Add a Product';
                            $data['page'] = 'product/add-products'; 
                            $data['include_files'][] = './assets/includes/products.php';   
                            $this->load->view('manage-template', $data);
                    } 

                }

                }
    }

    }



function update_product_prices()
{  
    $products=$this->products->getAll();
    foreach ($products as $key => $value) {
          $this->single_product_update_price($value->ProductID);
   }
    $this->session->set_flashdata('success', 'Product prices are updated.');
   redirect('products','refresh');

}


function single_product_update_price($product_ID=false)
{   
$product_data=$this->products->getDataById($product_ID); 
foreach ($product_data as $key => $value) {
$product_data[$key]->karat=$this->products->get_karat_in_product($product_ID);
$product_data[$key]->beads=$this->products->get_meterial_price_in_product($product_ID,'beads');
$product_data[$key]->polki=$this->products->get_meterial_price_in_product($product_ID,'polki');
$product_data[$key]->diamond=$this->products->get_meterial_price_in_product($product_ID,'diamond');
$product_data[$key]->pearls=$this->products->get_meterial_price_in_product($product_ID,'pearls');
$product_data[$key]->beads=$this->products->get_meterial_price_in_product($product_ID,'beads');
$product_data[$key]->polki=$this->products->get_meterial_price_in_product($product_ID,'polki');
$product_data[$key]->other=$this->products->get_meterial_price_in_product($product_ID,'other');
$product_data[$key]->gemstone=$this->products->get_meterial_price_in_product($product_ID,'gemstone');
}
$product_data[0]->todaygoldrate=$this->products->Get_Gold_Rates();
$total_diamond_charges=0;
foreach ($product_data[0]->diamond as $key => $value) {
    $total_diamond_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}
$total_pearl_charges=0;
foreach ($product_data[0]->pearls as $key => $value) {
    $total_pearl_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}

$total_beads_charges=0;
foreach ($product_data[0]->beads as $key => $value) {
    $total_beads_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}

$total_polki_charges=0;
foreach ($product_data[0]->polki as $key => $value) {
    $total_polki_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}

$total_other_charges=0;
foreach ($product_data[0]->other as $key => $value) {
    $total_other_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}

$total_gemstone_charges=0;
foreach ($product_data[0]->gemstone as $key => $value) {
    $total_gemstone_charges+=$value->OptionWeight*$value->OptionPriceincrement;
}

/*Today gold rate*/
$today_gold_rate=$product_data[0]->todaygoldrate[0]->price;
$gold_karat=$product_data[0]->karat[0]->OptionName;

if($gold_karat==24){
    $today_gold_rate=$today_gold_rate;
}
elseif($gold_karat==14){
    $today_gold_rate=(($today_gold_rate*60*1)/100);
}
elseif($gold_karat==18){
    $today_gold_rate=(($today_gold_rate*76*1)/100);
}
elseif($gold_karat==20){
    $today_gold_rate=(($today_gold_rate*85*1)/100);
}
elseif($gold_karat==22){
    $today_gold_rate=(($today_gold_rate*92*1)/100);
}


$Net_weight=$product_data[0]->Net_weight;
$Making_charges=$product_data[0]->Making_charges;

$Making_charges_on_weight=$product_data[0]->{ucfirst($product_data[0]->Making_chg_On_Grs_Net_Weight)};


$rate_on_netweight=$Net_weight*$today_gold_rate;

if($product_data[0]->Making_chg_On_Grs_Net_Weight=="fix"){
$total_making_charges=$Making_charges;
}
else{
   $total_making_charges=$Making_charges*$Making_charges_on_weight; 
}



$price_data=array(
"price_with_netweight"=>round($rate_on_netweight),
"price_makingchrg_on_gw_nw"=>round($total_making_charges),
"price_with_diamond_weight"=>round($total_diamond_charges),
"price_with_pearl_weight"=>round($total_pearl_charges),
"price_with_beads_weight"=>round($total_beads_charges),
"price_with_other_weight"=>round($total_other_charges),
"price_with_polki_weight"=>round($total_polki_charges),
"price_with_gemstone_weight"=>round($total_gemstone_charges),
"price_with_handling"=>2000
);
$arrSum = array_sum($price_data);

$gst_cgst=round(($arrSum*1.5/100));
$gst_sgst=round(($arrSum*1.5/100));

$prices_data=array(
"price_with_netweight"=>round($rate_on_netweight),
"price_makingchrg_on_gw_nw"=>round($total_making_charges),
"price_with_diamond_weight"=>round($total_diamond_charges),
"price_with_pearl_weight"=>round($total_pearl_charges),
"price_with_beads_weight"=>round($total_beads_charges),
"price_with_other_weight"=>round($total_other_charges),
"price_with_polki_weight"=>round($total_polki_charges),
"price_with_gemstone_weight"=>round($total_gemstone_charges),
"price_with_handling"=>2000,
"price_on_cgst"=>$gst_cgst,
"price_on_sgst"=>$gst_sgst,
"Price"=>$arrSum+$gst_cgst+$gst_sgst,
"MRP_Price"=>$arrSum+$gst_cgst+$gst_sgst,
"purity_kt"=>$gold_karat." Kt",
);
$this->products->update_pricein_product_table($product_ID,$prices_data);

}


    public function viewProducts($products_id) {
        $data['products_id'] = $products_id;
        $data['products'] = $this->products->getDataById($products_id);
        $this->load->view('product/view-products', $data);
    }
    /*
    function for delete Products    created by your name
    created at 12-08-20.
    */
    public function delete($products_id) {
        $delete = $this->products->delete($products_id);
        $this->session->set_flashdata('success', 'Product deleted.');
        redirect('products');
    } 

       public function deletetempproducts() {

            $ids=$this->security->xss_clean($this->input->post('product_ids'));
            $ids =implode(",", $ids);
            $table="temp_product_import_table";
            $truncate_sql = "delete from {$table} where ID in ($ids)";
            $this->db->query($truncate_sql);
            echo json_encode(['success'=>"Item Deleted successfully."]);
            exit();      
    }

    /*
    function for activation and deactivation of Products.
    created by your name
    created at 12-08-20.
    */
public function change_status($products_id) {
    $edit = $this->products->changeStatus($products_id);
    $this->session->set_flashdata('success', 'Product '.$edit.' Successfully.');
    redirect('products');
}
/*
function for upload files
return uploaded file name.
created by your name
created at 12-08-20.
*/
public function doUpload($file) {
$config['upload_path'] = './uploads/products';
$config['allowed_types'] = '*';
$this->load->library('upload', $config);
    if ( ! $this->upload->do_upload($file))
    {
      $error = array('error' => $this->upload->display_errors());
      $this->load->view('upload_form', $error);
    }
    else
    {
      $data = array('upload_data' => $this->upload->data());
      return $data['upload_data']['file_name'];
    }
}
        
public function get_subcategory_ajax($id=false)
{           
    $results=$this->products->SubCategories($id);
    echo json_encode($results);
    exit();
}

public function import_products($error=false){
	
 
    if($cellmismath=$this->input->get('error', TRUE)){
        $cellmismath="Excel cell are mismath";
    }
    else{
        $cellmismath="";
   }
  
        $data['page_title'] = 'Import Products';
        $data['page'] = 'product/import-products'; 
        $table="temp_product_import_table";
		
		

        if($this->db->table_exists($table) )
        {        
            $this->error_checking();
            //$this->update_prices();
            $data["importing_products"] = $this->products->Importing_getAll();
        }
        $data['include_files'][] = './assets/includes/products.php';
        $data['cellmismath'] = $cellmismath;
        $this->load->view('manage-template', $data);



}   
public function importdata()
{

    require_once APPPATH . "/libraries/third_party/PHPExcel.php";         
    $path = "product_excel_files/";
    $config['upload_path'] = $path;
    $config['allowed_types'] = 'xlsx|xls';
    $config['remove_spaces'] = TRUE;
    $this->upload->initialize($config);
    $this->load->library('upload', $config);
    if (!$this->upload->do_upload('userfile')) {
    $error = array('error' => $this->upload->display_errors());
    } else {
    $data = array('upload_data' => $this->upload->data());
    }


    if (!empty($data['upload_data']['file_name'])) {
    $import_xls_file = $data['upload_data']['file_name'];
    } else {
    $import_xls_file = 0;
    }
    $inputFileName = $path . $import_xls_file;
    try {
    $inputFileType = PHPExcel_IOFactory::identify($inputFileName);
    $objReader = PHPExcel_IOFactory::createReader($inputFileType);
    $objPHPExcel = $objReader->load($inputFileName);
    } catch (Exception $e) {
    die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME)
    . '": ' . $e->getMessage());
    }


$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
$sheet = $objPHPExcel->getActiveSheet(); 
$highestRow = $sheet->getHighestRow(); 
$highestColumn = $sheet->getHighestColumn();




   $worksheetData = $objReader->listWorksheetInfo($inputFileName);
   $totalRows     = $worksheetData[0]['totalRows'];
   $totalColumns  = $worksheetData[0]['totalColumns'];


if($totalColumns==165) {


    //$arrayCount = count($allDataInSheet);
    $arrayCount = $totalRows;
    $excel_rows_data=array_splice($allDataInSheet,1,$arrayCount);



  //  Loop through each row of the worksheet in turn
$actul_data=array();
$i=0;
for ($row = 2; $row <= $totalRows; $row++){ 
    //  Read a row of data into an array
    $rowData = $sheet->rangeToArray('A'.$row.':FI'.$row,
                                    NULL,
                                    TRUE,
                                    FALSE);
    $actul_data[$i]=$rowData;
    //  Use foreach loop and insert data into Query
    $i++;
     
}


 $rowData=array_splice($actul_data,0,$arrayCount);





    $headers = $objPHPExcel->getActiveSheet()
    ->rangeToArray(
    'A1:FI1',
    null,
    false,
    false,
    true
    );


   
    $headers = $headers[1];



    
    /*Create Table */
    $table="temp_product_import_table";
    if($this->db->table_exists($table) )
    {
        $drop_sql = "DROP TABLE {$table}";
      // $this->db->query($drop_sql);

    }
    else {
   $prd_import_fields=implode(' VARCHAR(100) NOT NULL,', array_map(create_function('$k,$v', 'return url_title(trim(convert_accented_characters("($v)")), "underscore", true);'), array_keys($headers),array_values($headers))). " VARCHAR(100) NOT NULL";
    $prd_import_fields_insert=implode(',', array_map(create_function('$k,$v', 'return url_title(trim(convert_accented_characters("($v)")), "underscore", true);'), array_keys($headers),array_values($headers))). "";
    //$import_sql = "CREATE TABLE {$table} ($prd_import_fields);";
}


    /*End*/
 


if($this->db->table_exists($table) )
{
  $truncate_sql = "TRUNCATE TABLE {$table}";
//$this->db->query($truncate_sql);
}
else
{
  // table does not exist

}
      foreach ($rowData as $key=>$dataInSheet) {

        $this->core->delete("temp_product_import_table",array("product_code"=>$dataInSheet[0][3]));
       
        $insert_sql="insert into {$table} values ('','','".implode("','",$dataInSheet[0])."');";
        $this->db->query($insert_sql);

    

    /*Error Validation*/    
    }
    $idno++; 
redirect("products/import_products");
}
else{
redirect("products/import_products/?error=cellmismath");
}


}

function alpha_dash_space($str)
{
    return ( ! preg_match("/^([-a-z0-9_ ])+$/i", $str)) ? FALSE : TRUE;
} 


function update_prices()
{   
$importing_products= $this->products->Importing_getAll();
$no=1;
foreach ($importing_products as $key => $value) {
$purity_kt=isset($value->purity_kt)?$value->purity_kt:0;
if($purity_kt>0){
    $gold_rates= $this->products->Get_Gold_Rates($purity_kt);
    $kt_rate=isset($gold_rates[0]->price)?$gold_rates[0]->price:0;
}
else{
     $kt_rate=0;
}

$rate_net_weight=$kt_rate*$value->net_weight;

$all_attribute_rates=((int)$value->diamond_rate_1*(int)$diamond_weight_1+(int)$value->diamond_rate_2*(int)$diamond_weight_2+(int)$value->diamond_rate_3*(int)$diamond_weight_3+(int)$value->diamond_rate_4*(int)$diamond_weight_4+(int)$value->diamond_rate_5*(int)$diamond_weight_5)+((int)$value->gemstone_rate_1*(int)$gemstone_weight_1+(int)$value->gemstone_rate_2*(int)$gemstone_weight_2+(int)$value->gemstone_rate_3*(int)$gemstone_weight_3+(int)$value->gemstone_rate_4*(int)$gemstone_weight_4+(int)$value->gemstone_rate_5*(int)$gemstone_weight_5)+((int)$value->pearls_rate_1*(int)$pearl_weight_1+(int)$value->pearls_rate_2*(int)$pearl_weight_2+(int)$value->pearls_rate_3*(int)$pearl_weight_3+(int)$value->pearls_rate_4*(int)$pearl_weight_4+(int)$value->pearls_rate_5*(int)$pearl_weight_5)+((int)$value->polki_rate_1*(int)$polki_weight_1+(int)$value->polki_rate_2*(int)$polki_weight_2+(int)$value->polki_rate_3*(int)$polki_weight_3+(int)$value->polki_rate_4*(int)$polki_weight_4+(int)$value->polki_rate_5*(int)$polki_weight_5)+((int)$value->beads_rate_1*(int)$beads_weight_1+(int)$value->beads_rate_2*(int)$beads_weight_2+(int)$value->beads_rate_3*(int)$beads_weight_3+(int)$value->beads_rate_4*(int)$beads_weight_4+(int)$value->beads_rate_5*(int)$beads_weight_5)+((int)$value->other_rate_1*(int)$other_weight_1+(int)$value->other_rate_2*(int)$other_weight_2+(int)$value->other_rate_3*(int)$other_weight_3+(int)$value->other_rate_4*(int)$other_weight_4+(int)$value->other_rate_5*(int)$other_weight_5);

if($all_attribute_rates>0){
    $all_attribute_rates=$all_attribute_rates;
}
else{
    $all_attribute_rates=0;
}

if($value->making_charges_on_gross_weightnet_weight=="fixed" || $value->making_charges_on_gross_weightnet_weight=="Fixed" || $value->making_charges_on_gross_weightnet_weight=="FIXED"){
    $making_charges=$value->making_charges*1;
}
else{
    $making_charges=($value->gross_weight*$value->making_charges);
}

    $grand_total=$rate_net_weight+$all_attribute_rates+$making_charges;
	$handling_charge=(int)0;
    $data=array("actual_price"=>$grand_total+$handling_charge);

    $this->products->update_price_temp_table($value->ID,$data);
$no++;

    }
    
    
}



function error_checking()
{


    $importing_products= $this->products->Importing_getAll();

    foreach ($importing_products as $key => $value) {

        $orderlist="";
        $status="";
        $product_code=$this->alpha_dash_space($value->product_code); 
        if($product_code!=1) {
                $status.="<li>Product code is not valid.</li>";
            }       
     
        $cat_response=$this->is_categoryname_valid($value->category_name,$value->ID); 
        if(isset($cat_response) && !empty($cat_response)){
            $status.="<li>".$cat_response."</li>";
        }
        $subcat_response=$this->is_sub_categoryname_valid($value->sub_category_name,$value->ID);
        if(isset($subcat_response) && !empty($subcat_response)){
        $status.="<li>".$subcat_response."</li>";
        }
        $I_material=$this->is_material_valid($value->material,$value->ID);
        if(isset($I_material) && !empty($I_material)){
        $status.="<li>".$I_material."</li>";
        }
        $O_purity_kt=$this->is_purity_in_kt_valid($value->purity_kt,$value->ID);
        if(isset($O_purity_kt) && !empty($O_purity_kt)){
        $status.="<li>".$O_purity_kt."</li>";
        }

        $P_metal_types=$this->is_color_in_kt_valid($value->metal_types,$value->ID);
        if(isset($P_metal_types) && !empty($P_metal_types)){
        $status.="<li>".$P_metal_types."</li>";
        }


    /*Check Diamond Color and Purity is valid*/
    if($value->diamond_color_purity_1){
        $color_clarity_1=explode("-", $value->diamond_color_purity_1);
        $d_color_1_vld=$this->is_error_true_false($color_clarity_1[0],$value->ID,"productoptions","OptionName","dia_clor_error");
        if(isset($d_color_1_vld) && !empty($d_color_1_vld)){
            $status.="<li>".$d_color_1_vld."</li>";
        }
        $d_clartiy_1_vld=$this->is_error_true_false($color_clarity_1[1],$value->ID,"productoptions","OptionName","dia_clarity_error");
            if(isset($d_clartiy_1_vld) && !empty($d_clartiy_1_vld)){
            $status.="<li>".$d_clartiy_1_vld."</li>";
        }
    }

    if($value->diamond_color_purity_2){
        $color_clarity_2=explode("-", $value->diamond_color_purity_2);
        $d_color_2_vld=$this->is_error_true_false($color_clarity_2[0],$value->ID,"productoptions","OptionName","dia_clor_error");
        if(isset($d_color_2_vld) && !empty($d_color_2_vld)){
            $status.="<li>".$d_color_2_vld."</li>";
        }

        $d_clartiy_2_vld=$this->is_error_true_false($color_clarity_2[1],$value->ID,"productoptions","OptionName","dia_clarity_error");
            if(isset($d_clartiy_2_vld) && !empty($d_clartiy_2_vld)){
            $status.="<li>".$d_clartiy_2_vld."</li>";
        }
    }
    if($value->diamond_color_purity_3){
        $color_clarity_3=explode("-", $value->diamond_color_purity_3);
        $d_color_3_vld=$this->is_error_true_false($color_clarity_3[0],$value->ID,"productoptions","OptionName","dia_clor_error");
        if(isset($d_color_3_vld) && !empty($d_color_3_vld)){
            $status.="<li>".$d_color_3_vld."</li>";
        }
        $d_clartiy_3_vld=$this->is_error_true_false($color_clarity_3[1],$value->ID,"productoptions","OptionName","dia_clarity_error");
            if(isset($d_clartiy_3_vld) && !empty($d_clartiy_3_vld)){
            $status.="<li>".$d_clartiy_3_vld."</li>";
        }
    }
    if($value->diamond_color_purity_4){
        $color_clarity_4=explode("-", $value->diamond_color_purity_4);
        $d_color_4_vld=$this->is_error_true_false($color_clarity_4[0],$value->ID,"productoptions","OptionName","dia_clor_error");
        if(isset($d_color_4_vld) && !empty($d_color_4_vld)){
            $status.="<li>".$d_color_4_vld."</li>";
        }
        $d_clartiy_4_vld=$this->is_error_true_false($color_clarity_4[1],$value->ID,"productoptions","OptionName","dia_clarity_error");
            if(isset($d_clartiy_4_vld) && !empty($d_clartiy_4_vld)){
            $status.="<li>".$d_clartiy_4_vld."</li>";
        }
    }
    if($value->diamond_color_purity_5){
        $color_clarity_5=explode("-", $value->diamond_color_purity_5);
        $d_color_5_vld=$this->is_error_true_false($color_clarity_5[0],$value->ID,"productoptions","OptionName","dia_clor_error");
        if(isset($d_color_5_vld) && !empty($d_color_5_vld)){
            $status.="<li>".$d_color_5_vld."</li>";
        }
        $d_clartiy_5_vld=$this->is_error_true_false($color_clarity_5[1],$value->ID,"productoptions","OptionName","dia_clarity_error");
            if(isset($d_clartiy_5_vld) && !empty($d_clartiy_5_vld)){
            $status.="<li>".$d_clartiy_5_vld."</li>";
        }
    }

    /*Diamond Shape Validation*/

    if(isset($value->diamond_shape_1)){
    $diamond_shp_1=$this->is_error_true_false($value->diamond_shape_1,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($diamond_shp_1) && !empty($diamond_shp_1)){
    $status.="<li>".$diamond_shp_1."</li>";
    }
    }

    if(isset($value->diamond_shape_2)){
    $diamond_shp_2=$this->is_error_true_false($value->diamond_shape_2,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($diamond_shp_2) && !empty($diamond_shp_2)){
    $status.="<li>".$diamond_shp_2."</li>";
    }
    }

    if(isset($value->diamond_shape_3)){
    $diamond_shp_3=$this->is_error_true_false($value->diamond_shape_3,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($diamond_shp_3) && !empty($diamond_shp_3)){
    $status.="<li>".$diamond_shp_3."</li>";
    }
    }

    if(isset($value->diamond_shape_4)){
    $diamond_shp_4=$this->is_error_true_false($value->diamond_shape_4,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($diamond_shp_4) && !empty($diamond_shp_4)){
    $status.="<li>".$diamond_shp_4."</li>";
    }
    }
    if(isset($value->diamond_shape_5)){
    $diamond_shp_5=$this->is_error_true_false($value->diamond_shape_5,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($diamond_shp_5) && !empty($diamond_shp_5)){
    $status.="<li>".$diamond_shp_5."</li>";
    }
    }







    /*Certificate Validation*/

    if(isset($value->certified_by_1)){
    $dia_cert_shp_1=$this->is_error_true_false($value->certified_by_1,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($dia_cert_shp_1) && !empty($dia_cert_shp_1)){
    $status.="<li>".$dia_cert_shp_1."</li>";
    }
    }

    if(isset($value->certified_by_2)){
    $dia_cert_shp_2=$this->is_error_true_false($value->certified_by_2,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($dia_cert_shp_2) && !empty($dia_cert_shp_2)){
    $status.="<li>".$dia_cert_shp_2."</li>";
    }
    }

    if(isset($value->certified_by_3)){
    $dia_cert_shp_3=$this->is_error_true_false($value->certified_by_3,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($dia_cert_shp_3) && !empty($dia_cert_shp_3)){
    $status.="<li>".$dia_cert_shp_3."</li>";
    }
    }

    if(isset($value->certified_by_4)){
    $dia_cert_shp_4=$this->is_error_true_false($value->certified_by_4,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($dia_cert_shp_4) && !empty($dia_cert_shp_4)){
    $status.="<li>".$dia_cert_shp_4."</li>";
    }
    }

    if(isset($value->certified_by_5)){
    $dia_cert_shp_5=$this->is_error_true_false($value->certified_by_5,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
    if(isset($dia_cert_shp_5) && !empty($dia_cert_shp_5)){
    $status.="<li>".$dia_cert_shp_5."</li>";
    }
    }
    /* End Diamond colors */

    /* Gemstone Verify data */

    $gemstone_1=$this->is_error_true_false($value->gemstone_type_1,$value->ID,"productoptions","OptionName","gemstone_err_chk");
    if(isset($gemstone_1) && !empty($gemstone_1)){
        $status.="<li>".$gemstone_1."</li>";
    }
    $gemstone_2=$this->is_error_true_false($value->gemstone_type_2,$value->ID,"productoptions","OptionName","gemstone_err_chk");
    if(isset($gemstone_2) && !empty($gemstone_2)){
     $status.="<li>".$gemstone_2."</li>";
    }
    $gemstone_3=$this->is_error_true_false($value->gemstone_type_3,$value->ID,"productoptions","OptionName","gemstone_err_chk");
    if(isset($gemstone_3) && !empty($gemstone_3)){
        $status.="<li>".$gemstone_3."</li>";
    }
    $gemstone_4=$this->is_error_true_false($value->gemstone_type_4,$value->ID,"productoptions","OptionName","gemstone_err_chk");
    if(isset($gemstone_4) && !empty($gemstone_4)){
     $status.="<li>".$gemstone_4."</li>";
    }
    $gemstone_5=$this->is_error_true_false($value->gemstone_type_5,$value->ID,"productoptions","OptionName","gemstone_err_chk");
    if(isset($gemstone_5) && !empty($gemstone_5)){
        $status.="<li>".$gemstone_5."</li>";
    }
    /* End */

    /* Pearl Verify data */
    $pearl_1=$this->is_error_true_false($value->pearls_1,$value->ID,"productoptions","OptionName","pearls_err_chk");
    if(isset($pearl_1) && !empty($pearl_1)){
        $status.="<li>".$pearl_1."</li>";
    }
    $pearl_2=$this->is_error_true_false($value->pearls_2,$value->ID,"productoptions","OptionName","pearls_err_chk");
    if(isset($pearl_2) && !empty($pearl_2)){
     $status.="<li>".$pearl_2."</li>";
    }

    $pearl_3=$this->is_error_true_false($value->pearls_3,$value->ID,"productoptions","OptionName","pearls_err_chk");
    if(isset($pearl_3) && !empty($pearl_3)){
     $status.="<li>".$pearl_3."</li>";
    }

    $pearl_4=$this->is_error_true_false($value->pearls_4,$value->ID,"productoptions","OptionName","pearls_err_chk");
    if(isset($pearl_4) && !empty($pearl_4)){
      $status.="<li>".$pearl_4."</li>";
    }
    $pearl_5=$this->is_error_true_false($value->pearls_5,$value->ID,"productoptions","OptionName","pearls_err_chk");
    if(isset($pearl_5) && !empty($pearl_5)){
     $status.="<li>".$pearl_5."</li>";
    }
    /* End */




    /* Polki Verify data */
    $polki_1=$this->is_error_true_false($value->polki_1,$value->ID,"productoptions","OptionName","polki_err_chk");
    if(isset($polki_1) && !empty($polki_1)){
        $status.="<li>".$polki_1."</li>";
    }
    $polki_2=$this->is_error_true_false($value->polki_2,$value->ID,"productoptions","OptionName","polki_err_chk");
    if(isset($polki_2) && !empty($polki_2)){
     $status.="<li>".$polki_2."</li>";
    }

    $polki_3=$this->is_error_true_false($value->polki_3,$value->ID,"productoptions","OptionName","polki_err_chk");
    if(isset($polki_3) && !empty($polki_3)){
     $status.="<li>".$polki_3."</li>";
    }

    $polki_4=$this->is_error_true_false($value->polki_4,$value->ID,"productoptions","OptionName","polki_err_chk");
    if(isset($polki_4) && !empty($polki_4)){
      $status.="<li>".$polki_4."</li>";
    }
    $polki_5=$this->is_error_true_false($value->polki_5,$value->ID,"productoptions","OptionName","polki_err_chk");
    if(isset($polki_5) && !empty($polki_5)){
     $status.="<li>".$polki_5."</li>";
    }
    /* End */




     /* beads Verify data */
    $beads_1=$this->is_error_true_false($value->beads_1,$value->ID,"productoptions","OptionName","beads_err_chk");
    if(isset($beads_1) && !empty($beads_1)){
        $status.="<li>".$beads_1."</li>";
    }
    $beads_2=$this->is_error_true_false($value->beads_2,$value->ID,"productoptions","OptionName","beads_err_chk");
    if(isset($beads_2) && !empty($beads_2)){
     $status.="<li>".$beads_2."</li>";
    }

    $beads_3=$this->is_error_true_false($value->beads_3,$value->ID,"productoptions","OptionName","beads_err_chk");
    if(isset($beads_3) && !empty($beads_3)){
     $status.="<li>".$beads_3."</li>";
    }

    $beads_4=$this->is_error_true_false($value->beads_4,$value->ID,"productoptions","OptionName","beads_err_chk");
    if(isset($beads_4) && !empty($beads_4)){
      $status.="<li>".$beads_4."</li>";
    }
    $beads_5=$this->is_error_true_false($value->beads_5,$value->ID,"productoptions","OptionName","beads_err_chk");
    if(isset($beads_5) && !empty($beads_5)){
     $status.="<li>".$beads_5."</li>";
    }
    /* End */

     /* other Verify data */

     $other_1=$this->is_error_true_false($value->other_1,$value->ID,"productoptions","OptionName","other_err_chk");
    if(isset($other_1) && !empty($other_1)){
        $status.="<li>".$other_1."</li>";
    }
    $other_2=$this->is_error_true_false($value->other_2,$value->ID,"productoptions","OptionName","other_err_chk");
    if(isset($other_2) && !empty($other_2)){
     $status.="<li>".$other_2."</li>";
    }

    $other_3=$this->is_error_true_false($value->other_3,$value->ID,"productoptions","OptionName","other_err_chk");
    if(isset($other_3) && !empty($other_3)){
     $status.="<li>".$other_3."</li>";
    }

    $other_4=$this->is_error_true_false($value->other_4,$value->ID,"productoptions","OptionName","other_err_chk");
    if(isset($other_4) && !empty($other_4)){
      $status.="<li>".$other_4."</li>";
    }
    $other_5=$this->is_error_true_false($value->other_5,$value->ID,"productoptions","OptionName","other_err_chk");
    if(isset($other_5) && !empty($other_5)){
     $status.="<li>".$other_5."</li>";
    }

     /*End*/



    /*AE_gemstone_type att.*/
    //$this->is_error_true_false($value->BD_gemstone_type_1,$value->ID,"productoptions","OptionName","gemstone_err_chk");
       


        if(!empty($status)) {            
            $orderlist.="<ol>";
            $orderlist.=$status;
            $orderlist.="</ol>";
            $set=array('is_error' =>$orderlist);
            $this->core->update('temp_product_import_table',$set, array("ID"=>$value->ID));
        }
        else{
            $set=array('is_error' =>"");
            $this->core->update('temp_product_import_table',$set, array("ID"=>$value->ID));
        }

          

    }



    /*AE_gemstone_type att.*/
    //$this->is_error_true_false($value->AE_gemstone_type,$value->ID,"productoptions","OptionName","gemstone_err_chk");

    /*Diamond shape 1 att.*/
    //$this->is_error_true_false($value->V_diamond_shape,$value->ID,"productoptions","OptionName","diam_shape_err_chk");
     /*Diamond shape 2 att.*/
    //$this->is_error_true_false($value->Z_diamond_shape,$value->ID,"productoptions","OptionName","diam_shape_2_err_chk");
     /*Diamond shape 3 att.*/
    //$this->is_error_true_false($value->AD_diamond_shape,$value->ID,"productoptions","OptionName","diam_shape_3_err_chk");

}



function is_categoryname_valid($category_name=false,$table_Pk_ID=false)
{
    $results=$this->products->get_Generic_Query("product_category","","","",array("CategoryName"=>trim($category_name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){

        $json_encode_data=array(
            "status"=>'yes',
            "ID"=>0
        );

  

        //$set=array("is_cat_error"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
        return $status="This category [$category_name] does not exist.";
    }
    else{
        $json_encode_data=array(
            "status"=>'no',
            "ID"=>$results[0]->CategoryID
        );
        //$set=array("is_cat_error"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
       return "";
    }
    //$set=array("is_cat_error"=>$status);
    //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
  
  
}
function is_sub_categoryname_valid($category_name=false,$table_Pk_ID=false)
{
    $results=$this->products->get_Generic_Query("product_category","","","",array("CategoryName"=>trim($category_name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){
        $json_encode_data=array(
            "status"=>'yes',            
            "ID"=>0
        );
        //$set=array("is_subcat_error"=>"yes");
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
     return $status="This sub category [$category_name] does not exist.";
    }
    else{
        $json_encode_data=array(
            "status"=>'no',
            "ID"=>$results[0]->CategoryID
        );
        return "";
        //$set=array("is_subcat_error"=>"no");
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
    }
}
function is_material_valid($name=false,$table_Pk_ID=false)
{
    $results=$this->products->get_Generic_Query("material_type","","","",array("MaterialName"=>trim($name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){
/*        $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        $set=array("material_error_checking"=>json_encode($json_encode_data));
        $this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');*/

        return $status="This material [$name] does not exist.";
    }
    else{
        return "";
        /*$json_encode_data=array(
            "status"=>'success',
            "ID"=>$results[0]->MaterialID
        );
        $set=array("material_error_checking"=>json_encode($json_encode_data));
        $this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');*/
    }
}
function is_purity_in_kt_valid($name=false,$table_Pk_ID=false)
{
    $name="$name Kt";
    $results=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){
        $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        //$set=array("purity_error_checking"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
         return $status="This purity (Kt) [$name] does not exist.";
    }
    else{
        $json_encode_data=array(
            "status"=>'success',
            "ID"=>$results[0]->OptionID
        );
        //$set=array("purity_error_checking"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
        return "";
    }
}

function is_color_in_kt_valid($name=false,$table_Pk_ID=false)
{
    $results=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){

        $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        //$set=array("color_metal_err_chk"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
         return $status="This metal color [$name] does not exist.";
    }
    else{
        $json_encode_data=array(
            "status"=>'success',
            "ID"=>$results[0]->OptionID
        );
        //$set=array("color_metal_err_chk"=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
        return "";
    }
}
function is_diamond_certified_valid($name=false,$table_Pk_ID=false)
{
    $results=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){
        $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        $set=array("diam_certi_err_chk"=>json_encode($json_encode_data));
        $this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
    }
    else{
        $json_encode_data=array(
            "status"=>'success',
            "ID"=>$results[0]->OptionID
        );
        $set=array("diam_certi_err_chk"=>json_encode($json_encode_data));
        $this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
    }
}

function is_error_true_false($name=false,$table_Pk_ID=false,$table=false,$coloumn_name=false,$update_tb_column=false)
{
    if(!empty(trim($name))){
    $results=$this->products->get_Generic_Query($table,"","","",array($coloumn_name=>trim($name)));
    $A_category_name_count=count((array)$results);
    if($A_category_name_count==0){
        $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        //$set=array($update_tb_column=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
         return $status="This $coloumn_name [$name] does not exist.";
    }
    else{
        $json_encode_data=array(
            "status"=>'success',
            "ID"=>$results[0]->OptionID
        );
        //$set=array($update_tb_column=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
        return "";
    }
}
else{
      $json_encode_data=array(
            "status"=>'failed',            
            "ID"=>0
        );
        //$set=array($update_tb_column=>json_encode($json_encode_data));
        //$this->core->update('temp_product_import_table',$set, array("ID"=>$table_Pk_ID),'');
        return "";
}
}


public function move_temp_imported_data($data=false) {

        $ids=$this->security->xss_clean($this->input->post('product_ids'));
        $ids =implode(",", $ids);
        $this->product_general_information($ids); 
        exit();
}


public function split_json_data($data=false)
{
    $CategoryID=json_decode($data,true);
    if(is_array($CategoryID)){
    $ID=$CategoryID['ID'];
    }
    else{
    $ID=0;
    }
    return $ID;
}
public function product_general_information($selectedids=false)
{
        $selectedids=explode(",",$selectedids);
        if (isset($_SESSION['Email'])) {
        $email=$_SESSION['Email'];
        $email=explode("@", $email);
        }  
    
        $delete_array=array();
        $data["importing_products"] = $this->products->Importing_getAll(array('is_error' =>""),$selectedids);
		

     

        $total_records=sizeof($data["importing_products"]);
        if($total_records==0){
            //echo "notfetch";
            exit();
        }
        else{
            //echo "fetch";           
        }

        foreach ($data["importing_products"] as $single_product) {        

            if(empty(trim($single_product->product_name)))
            {
                $product_name=$single_product->product_code;
                
            }
            else{
                 $product_name=$single_product->product_name;
            }

            if($cat_info=$this->products->get_Generic_Query("product_category","","","",array("CategoryName"=>trim($single_product->category_name))))
            {
             $CategoryID=$cat_info[0]->CategoryID;
            }
            if($subcat_info=$this->products->get_Generic_Query("product_category","","","",array("CategoryName"=>trim($single_product->sub_category_name))))
            {
             $Sub_CategorylD=$subcat_info[0]->CategoryID;
            }



            if($metal_info=$this->products->get_Generic_Query("material_type","","","",array("MaterialName"=>trim($single_product->material))))
            {
             $material=$metal_info[0]->MaterialID;
             
            }

            if($puritykt_info=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>"$single_product->purity_kt Kt")))
            {
             $purity_kt=$puritykt_info[0]->OptionID;
            }

            if($this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$single_product->diamond_shape_1)))
            {
                $subproducttype="diamonds";
            }
            else
            {
                $subproducttype=strtolower($single_product->material);
            } 



          
            if($metaltype_info=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>trim($single_product->metal_types))))
            {
                $metal_types=$metaltype_info[0]->OptionID;
            }


            if($single_product->gender=="Female")
            {
                $Gender="Women";
            }
            else
            {
                $Gender="Men";
            }


        $product_array=
        array(     
              
                'CategoryID'=>isset($CategoryID)?$CategoryID:0,
                'Sub_CategorylD'=>isset($Sub_CategorylD)?$Sub_CategorylD:0,
                'slug'=>url_title(convert_accented_characters($product_name),'dash', true).'-'.url_title(convert_accented_characters($single_product->product_code),'dash', true),
                'OptionGroupID'=>0,
                'SKU'=>$single_product->product_code,
                'Name'=>$product_name,                
                'Price'=>$single_product->actual_price,
                'MRP_Price'=>$single_product->actual_price,                
                'included_handling_charge'=>(int)0,                
                'discount_percentage'=>$single_product->discount_percentage,
                'Width'=>$this->get_integer_from_string($single_product->widthmm),
                'Height'=>$this->get_integer_from_string($single_product->heightmm),
                'Length'=>$this->get_integer_from_string($single_product->lengthmm),
                'chain_length'=>$this->get_integer_from_string($single_product->chain_length),
                'CartDesc'=>'',
                'ShortDesc'=>$single_product->product_description,
                'Stock'=>$single_product->stock,                
                'Provision_for_opening'=>$single_product->provision_for_opening,                
                'Polish_Details'=>$single_product->polish_details,
                'No_of_pieces'=>$single_product->no_of_pieces,
                'AddedBy'=>isset($email[0])?$email[0]:"Admin",
                'AddedByIP'=>$this->input->ip_address(),
                'SEOTitle'=>"",
                'SEODesc'=>"",
                'SEOKeywords'=>"",     
                'Productlive'=>1,
                'Gender'=>$Gender,
                'Making_charges'=>$single_product->making_charges,
                'Making_charges_unit'=>strtolower(trim(str_replace("per "," ",$single_product->making_charges_unit))),
                'Making_chg_On_Grs_Net_Weight'=>strtolower(str_replace(" ","_",trim(str_replace("on ","",$single_product->making_charges_on_gross_weightnet_weight)))),
                'Gross_weight'=>$this->get_integer_from_string($single_product->gross_weight),
                'Net_weight'=>$this->get_integer_from_string($single_product->net_weight),
                'Material_type'=>isset($material)?$material:0,
                'sub_product_type'=>strtolower($single_product->sub_product_type)?strtolower($single_product->sub_product_type):strtolower($single_product->product_type),
                'is_make_an_order'=>strtolower($single_product->is_make_an_order),
                'Modifiedon'=>date('Y-m-d h:i:s'),
                'product_type'=>strtolower($single_product->product_type),
                'certificate_number'=>$single_product->certificate_number,
                'mould_availability'=>isset($single_product->mould_availability)?$single_product->mould_availability:'no',
                'screw_type'=>isset($single_product->screw_type)?$single_product->screw_type:'',
                'cad_availability'=>isset($single_product->cad_availability)?$single_product->cad_availability:'no',
                'Collection'=>isset($single_product->collection)?$single_product->collection:'',
        );

        $sku_array=array("SKU"=>trim($single_product->product_code));






        if($exist_product=$this->core->get("products",$sku_array)) {
            $delete_array=array("ProductID"=>$exist_product[0]->ProductID);
            $this->core->delete("product_option",$delete_array);

            $ProductID=$exist_product[0]->ProductID;

            $this->products->update($ProductID,$product_array);  

        
              
        }
        else{
           $ProductID=$this->products->insert($product_array); 

        }

       



        if($single_product->size){
            $single_product->size=$single_product->size;
        }
        else{
            $single_product->size=0;
        }
        if($purity_kt){
            $purity_kt=$purity_kt;
        }
        else{
            $purity_kt=0;
        }

        if($metal_types){
            $metal_types=$metal_types;
        }
        else{
            $metal_types=0;
        }

      
        /*Gold Material Attribute*/ 
        if($ProductID>0){ 
            $gold_att=array(
            "size"=>array($single_product->size),
            "Karat"=>array($purity_kt),
            "G_Colors"=>array($metal_types),
            "Mat_Pro_Weight"=>array($this->get_integer_from_string($single_product->net_weight)),
            "products_id"=>$ProductID,
            );
            $this->add_product_properties($gold_att,"","","import_product");
        }
    

        /*End*/

        /*Diamond Clarity,Color,Certified Attribute*/

            for ($i=1; $i <=5; $i++) { 
            $col_name="diamond_color_purity_{$i}";
            $certify_name="certified_by_{$i}";
            $diamond_shape="diamond_shape_{$i}"; 
            $no_of_diamonds="no_of_diamonds_{$i}"; 
            $diamond_weight="diamond_weight_{$i}"; 
            $diamond_rate="diamond_rate_{$i}"; 


            $colorpurity=$single_product->$col_name;
            $certifyname=$single_product->$certify_name;
            $diamondshape=$single_product->$diamond_shape;

            $no_of_diamonds=isset($single_product->$no_of_diamonds)?$single_product->$no_of_diamonds:0;
            $diamond_weight=isset($single_product->$diamond_weight)?$single_product->$diamond_weight:0;
            $diamond_rate=isset($single_product->$diamond_rate)?$single_product->$diamond_rate:0;

           
      if(!empty($diamondshape)){

        $color_clarity=explode("-", $colorpurity);

        if($d_color_vld=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$color_clarity[0]),1))
        {
            $dcolor=$d_color_vld[0]->OptionID;
        }
        else
        {
            $dcolor=0;
        }
 
        if($d_clartiy_vld=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$color_clarity[1]),5))
        {
            $dclarity=$d_clartiy_vld[0]->OptionID;
        }
        else
        {
            $dclarity=0;
        }

        if($certifyname=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$certifyname),10))
        {
            $certifyname=$certifyname[0]->OptionID;
        }
        else
        {
            $certifyname=0;
        }

        if($diamondshape=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$diamondshape),9))
        {
            $diamondshape=$diamondshape[0]->OptionID;
        }
        else
        {
            $diamondshape=0;
        } 

        if($diamond_rate)
        {
            $diamond_rate=$diamond_rate;
        }
        else
        {
            $diamond_rate=0;
        }
        if($no_of_diamonds)
        {
            $no_of_diamonds=$no_of_diamonds;
        }
        else
        {
            $no_of_diamonds=0;
        }

        if($diamond_weight)
        {
            $diamond_weight=$diamond_weight;
        }
        else
        {
            $diamond_weight=0;
        }

           $attribute1= array(
            "DP_Clarity"=>array($dclarity),
            "DP_Clarity_1"=>array($certifyname),
            "Diamond_Shape"=>array($diamondshape),
            "DP_Color"=>array($dcolor),
            "DP_Weight"=>array($diamond_weight),
            "DP_Rate"=>array($diamond_rate),
            "DP_No_of_Diamonds"=>array($no_of_diamonds),
            "products_id"=>$ProductID,
            );

           if(!empty($diamondshape)) {
                $this->add_product_properties($attribute1,"","","import_product");
        }

    }
}


/*End*/



/* Gemstone verification*/


       for ($i=1; $i <=5; $i++) { 

            $gemstone_type="gemstone_type_{$i}";
            $gemstone_type=$single_product->$gemstone_type;

            if(!empty($gemstone_type)) {

                if($gemstone_type=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$gemstone_type),8))
                {
                    $gemstone_type_id=$gemstone_type[0]->OptionID;
                }
                else{
                    $gemstone_type_id=0;
                } 
            }
            else
            {
               $gemstone_type_id=0; 
            }

            $gemstone_quantity="gemstone_quantity_{$i}";
            $gemstone_quantity=$single_product->$gemstone_quantity;

            $gemstone_weight="gemstone_weight_{$i}"; 
            $gemstone_weight=$single_product->$gemstone_weight;

            $gemstone_rate="gemstone_rate_{$i}";
            $gemstone_rate=$single_product->$gemstone_rate;
    
            if($gemstone_quantity){
                $gemstone_quantity=$gemstone_quantity;
            }
            else{
                $gemstone_quantity=0;
            }

            if($gemstone_weight){
                $gemstone_weight=$gemstone_weight;
            }
            else{
                $gemstone_weight=0;
            }
            if($gemstone_rate){
                $gemstone_rate=$gemstone_rate;
            }
            else{
                $gemstone_rate=0;
            }


            $attribute2= array(
            "GSN_type"=>array($gemstone_type_id),
            "GSN_Quantity"=>array($gemstone_quantity),
            "GSN_Weight"=>array($gemstone_weight),
            "GSN_Rate"=>array($gemstone_rate),
            "products_id"=>$ProductID,
            "OptionGroupID"=>0,
            );

            if($gemstone_type_id>0) {
            $this->add_product_properties($attribute2,"","","import_product");
        }
            
 
}

/*End*/



/* Pearl verification*/

       for ($i=1; $i <=5; $i++) { 
            $pearls="pearls_{$i}";
            $pearls=$single_product->$pearls;

            if(!empty($pearls)) {

                if($pearls_type=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$pearls),7))
                {
                    $pearls_id=$pearls_type[0]->OptionID;
                }
                else{
                    $pearls_id=0;
                } 
            }
            else{
                $pearls_id=0;
            }
            $pearls_quantity="pearls_quantity_{$i}";
            $pearls_quantity=$single_product->$pearls_quantity;

            if($pearls_quantity){
                $pearls_quantity=$pearls_quantity;
            }
            else{
                $pearls_quantity=0;
            }
            $pearl_weight="pearl_weight_{$i}"; 
            $pearl_weight=$single_product->$pearl_weight;
            if($pearl_weight){
                $pearl_weight=$pearl_weight;
            }
            else{
                $pearl_weight=0;
            }
            $pearls_rate="pearls_rate_{$i}";
            $pearls_rate=$single_product->$pearls_rate;       
            if($pearls_rate){
                $pearls_rate=$pearls_rate;
            }
            else{
                $pearls_rate=0;
            }       
            $attribute3= array(
            "Pearls"=>array($pearls_id),
            "Pearls_quantity"=>array($pearls_quantity),
            "Pearl_Weight"=>array($pearl_weight),
            "Pearls_Rate"=>array($pearls_rate),
            "products_id"=>$ProductID,
            "OptionGroupID"=>0,
            );
             if($pearls_id>0) {         
             $this->add_product_properties($attribute3,"","","import_product"); 
             }
}
/*End*/




/* Polki verification*/

       for ($i=1; $i <=5; $i++) { 
            $polki="polki_{$i}";
            $polki=$single_product->$polki;

            if(!empty($polki)) {
                if($polki_type=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$polki),15))
                {
                    $polki_id=$polki_type[0]->OptionID;
                }
                else{
                    $polki_id=0;
                } 
            }
            else{
                $polki_id=0;
            }

            $polki_quantity="polki_quantity_{$i}";
            $polki_quantity=$single_product->$polki_quantity;

            if($polki_quantity){
                $polki_quantity=$polki_quantity;
            }
            else{
                $polki_quantity=0;
            }
            $polki_weight="polki_weight_{$i}"; 
            $polki_weight=$single_product->$polki_weight;
            if($polki_weight){
                $polki_weight=$polki_weight;
            }
            else{
                $polki_weight=0;
            }
            $polki_rate="polki_rate_{$i}";
            $polki_rate=$single_product->$polki_rate;       
            if($polki_rate){
                $polki_rate=$polki_rate;
            }
            else{
                $polki_rate=0;
            }       
            $attribute4= array(
            "Polki"=>array($polki_id),
            "Polki_quantity"=>array($polki_quantity),
            "Polki_Weight"=>array($polki_weight),
            "Polki_Rate"=>array($polki_rate),
            "products_id"=>$ProductID,
            "OptionGroupID"=>0,
            );
             if($polki_id>0) {         
             $this->add_product_properties($attribute4,"","","import_product"); 
             }
}
/*End*/




/* Beads verification*/


       for ($i=1; $i <=5; $i++) { 
            $beads="beads_{$i}";
            $beads=$single_product->$beads;

            if(!empty($beads)) {
                if($beads_type=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$beads),16))
                {
                    $beads_id=$beads_type[0]->OptionID;
                }
                else{
                    $beads_id=0;
                } 
            }
            else
            {
               $beads_id=0; 
            }
            $beads_quantity="beads_quantity_{$i}";
            $beads_quantity=$single_product->$beads_quantity;

            if($beads_quantity){
                $beads_quantity=$beads_quantity;
            }
            else{
                $beads_quantity=0;
            }
            $beads_weight="beads_weight_{$i}"; 
            $beads_weight=$single_product->$beads_weight;
            if($beads_weight){
                $beads_weight=$beads_weight;
            }
            else{
                $beads_weight=0;
            }
            $beads_rate="beads_rate_{$i}";
            $beads_rate=$single_product->$beads_rate;       
            if($beads_rate){
                $beads_rate=$beads_rate;
            }
            else{
                $beads_rate=0;
            }       
            $attribute5= array(
            "beads"=>array($beads_id),
            "beads_quantity"=>array($beads_quantity),
            "beads_Weight"=>array($beads_weight),
            "beads_Rate"=>array($beads_rate),
            "products_id"=>$ProductID,
            "OptionGroupID"=>0,
            );
             if($beads_id>0) {         
             $this->add_product_properties($attribute5,"","","import_product"); 
             }
}
/*End*/


/* other verification*/

       for ($i=1; $i <=5; $i++) { 
            $other="other_{$i}";
            $other=$single_product->$other;

            if(!empty($other)) {
                if($other_type=$this->products->get_Generic_Query("productoptions","","","",array("OptionName"=>$other),17))
                {
                $other_id=$other_type[0]->OptionID;
                }
                else{
                $other_id=0;
                }
            }
            else
            {
               $other_id=0; 
            }






            $other_quantity="other_quantity_{$i}";
            $other_quantity=$single_product->$other_quantity;

            if($other_quantity){
                $other_quantity=$other_quantity;
            }
            else{
                $other_quantity=0;
            }
            $other_weight="other_weight_{$i}"; 
            $other_weight=$single_product->$other_weight;
            if($other_weight){
                $other_weight=$other_weight;
            }
            else{
                $other_weight=0;
            }
            $other_rate="other_rate_{$i}";
            $other_rate=$single_product->$other_rate;       
            if($other_rate){
                $other_rate=$other_rate;
            }
            else{
                $other_rate=0;
            }       
            $attribute6= array(
            "other"=>array($other_id),
            "other_quantity"=>array($other_quantity),
            "other_Weight"=>array($other_weight),
            "other_Rate"=>array($other_rate),
            "products_id"=>$ProductID,
            "OptionGroupID"=>0,
            );
             if($other_id>0) {        
             $this->add_product_properties($attribute6,"","","import_product"); 
             }




}



/*Price update*/
$this->single_product_update_price($ProductID);
$table="temp_product_import_table";
$truncate_sql = "delete from {$table} where is_error='' and ID in ($single_product->ID)";
$this->db->query($truncate_sql);
}
redirect('products');
}
public  function Gemstone_attri_array($data_val=false)
{
    //if(!empty($data_val['gemstone_err_chk'])) {
        $GSN_type_ID=$this->split_json_data($data_val['gemstone_err_chk']);
        $attribute= array(
        "GSN_type"=>array($GSN_type_ID),
        "GSN_Quantity"=>array(isset($data_val['Quantity'])?$data_val['Quantity']:0),
        "GSN_Weight"=>array(isset($data_val['OptionWeight'])?$data_val['OptionWeight']:0),
        "GSN_Rate"=>array(isset($data_val['Price'])?$data_val['Price']:0),
        "products_id"=>isset($data_val['ProductID'])?$data_val['ProductID']:0,
        "OptionGroupID"=>0,
        );
        $this->add_product_properties($attribute,"","","import_product");
    //}
}

public  function Pearl_attri_attri_array($data_val=false)
{
    //if(!empty($data_val['pearls_err_chk'])) {
        $Pearl_ID=$this->split_json_data($data_val['pearls_err_chk']);
        $attribute= array(
        "Pearls"=>array($Pearl_ID),
        "Pearls_quantity"=>array(isset($data_val['Quantity'])?$data_val['Quantity']:0),
        "Pearl_Weight"=>array(isset($data_val['OptionWeight'])?$data_val['OptionWeight']:0),
        "Pearls_Rate"=>array(isset($data_val['Price'])?$data_val['Price']:0),
        "products_id"=>isset($data_val['ProductID'])?$data_val['ProductID']:0,
        "OptionGroupID"=>0,
        );
        $this->add_product_properties($attribute,"","","import_product");
    //}
}



public  function product_gold_attribute($data_val=false)
{


  // if(!empty($data_val['O_sizeringbraceletbangles'])) {

    $karat=$this->split_json_data($data_val['purity_error_checking']);
    $G_Colors=$this->split_json_data($data_val['color_metal_err_chk']);

    $gold_att=array(
    "size"=>array($data_val['O_sizeringbraceletbangles']),
    "Karat"=>array($karat),
    "G_Colors"=>array($G_Colors),
    "Mat_Pro_Weight"=>array(0),
    "products_id"=>isset($data_val['ProductID'])?$data_val['ProductID']:0,
    );

    $this->add_product_properties($gold_att,"","","import_product");

//}


}

public  function product_diamond_color_clarity_attribute($data_val=false)
{
    //if(!empty($data_val['dia_clarity_err_chk'])) {
        $DP_Clarity=$this->split_json_data($data_val['dia_clarity_err_chk']);
        $DP_Color=$this->split_json_data($data_val['dia_color_err_chk']);
        $DP_Clarity_1=$this->split_json_data($data_val['dia_certified_err_chk']);
        $attribute= array(
        "DP_Clarity"=>array($DP_Clarity),
        "DP_Clarity_1"=>array($DP_Clarity_1),
        "DP_Color"=>array($DP_Color),
        "DP_Weight"=>array(isset($data_val['OptionWeight'])?$data_val['OptionWeight']:0),
        "DP_Rate"=>array(isset($data_val['Price'])?$data_val['Price']:0),
        "DP_No_of_Diamonds"=>array(isset($data_val['Quantity'])?$data_val['Quantity']:0),
        "products_id"=>isset($data_val['ProductID'])?$data_val['ProductID']:0,
        );
        $this->add_product_properties($attribute,"","","import_product");
    //}
}

public  function diamond_shape_attri_array($data_val=false)
{
    //if(!empty($data_val['diam_shape_err_chk'])) {
        $DSP1_Clarity=$this->split_json_data($data_val['diam_shape_err_chk']);
        $attribute= array(
        "Diamond_Shape"=>array($DSP1_Clarity),
        "DS_Weight"=>array(isset($data_val['OptionWeight'])?$data_val['OptionWeight']:0),
        "DS_Rate"=>array(isset($data_val['Price'])?$data_val['Price']:0),
        "DS_no_diamonds"=>array(isset($data_val['W_no_of_diamonds'])?$data_val['W_no_of_diamonds']:0),
        "products_id"=>isset($data_val['ProductID'])?$data_val['ProductID']:0,
        "OptionGroupID"=>0,
        "Mat_Pro_Weight"=>array(0),
        );
        $this->add_product_properties($attribute,"","","import_product");
    //}

}

function check_gender_name($gender=false)
{
   if(strtolower($gender) === "female"){
    $value="Women";
   }
   else  if(strtolower($gender) === "male"){
    $value="Men";
   }
   else{
    $value="NA";
   }
   return $value;
}
function get_integer_from_string($data=false){
   $value=preg_replace("/[^0-9\.]/", '', $data);
   if(empty($value)){
    $value=0;
   }
   else{
    $value=$value;
   }
   return $value;
}

function clear_temp_product_data() {
    $truncate_sql = "TRUNCATE TABLE temp_product_import_table";
    $this->db->query($truncate_sql);
    redirect("products/import_products");
}

}