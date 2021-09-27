<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <!--<li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>-->
                      <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li> -->
                      <!--<li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>products/add">+Add Product</a></i>-->
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <!-- <p class="text-muted font-13 m-b-30">
                      DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                    </p> -->
                   
				   

            <div class="row">           
           <div class="col-md-5">
           
       <?php if(validation_errors()) { ?>
            <div class="alert alert-warning">
              <?php echo validation_errors(); ?>
            </div>
          <?php } ?>
          <?php if($this->session->flashdata('error')) { ?>
            <div class="alert alert-danger">
              <?php echo $this->session->flashdata('error'); ?>
            </div>
          <?php } ?>
          <?php if($this->session->flashdata('success')) { ?>
            <div class="alert alert-success">
              <?php echo $this->session->flashdata('success'); ?>
            </div>
          <?php } ?>

        </div>
      </div>
				   <form id="add_edit_product" role="form" method="post" class="frm" action="<?php echo site_url()?>products/save"  enctype="multipart/form-data">
				   
				   
				   
				   
				   <div class="row">	
				   <div class="col-md-6">


    <div class="form-group">
    <label for="CategorylD">Category<span class="text red">*</span>:</label>
   <select class="form-control get_subcategory_ajax" id="CategorylD" name="CategorylD" required>	
	<option value="">-- Pick One --</option>
	<?php  foreach($this->products->categories_lists() as $Category) { ?>	
	<option <?php echo set_select('CategorylD', $Category->CategoryID); ?> value="<?php echo $Category->CategoryID;?>"><?php echo ucwords($Category->CategoryName);?></option>
	<?php } ?>
	</select>	
  </div>
  
    <div class="form-group">
    <label for="CategorylD">Sub Category<span class="text red">*</span>:</label>
   <select class="form-control" id="Sub_CategorylD" name="Sub_CategorylD" >	

	</select>	
  </div>

    <div class="form-group">
    <label for="Name">Product Name<span class="text red">*</span>:</label>
    <input type="text" value="<?php echo set_value('Name'); ?>" class="form-control" id="Name" name="Name"  required>
  </div>

    <div class="form-group">
    <label for="SKU">Product Code<span class="text red">*</span>:</label>
    <input type="text" value="<?php echo set_value('SKU'); ?>" class="form-control" id="SKU" name="SKU" required>
  </div>
  
	<div class="form-group">
	<label for="No_of_pieces">No.of pieces<span class="text red">*</span>:</label>
	<input type="number" min=1 value="<?php echo set_value('No_of_pieces'); ?>" class="form-control" id="No_of_pieces" name="No_of_pieces" required>
	</div>

<div class="form-group">
<label for="product_vimeo_url">Product Vimeo URL:</label> <small>(Ex: https://vimeo.com/555029178)</small>
<input type="text" class="form-control" id="product_vimeo_url" name="product_vimeo_url">
</div>


<div class="form-group">
<label for="videourl">Youtube Video URL:</label> <small>Accept Embed URl</small>
<input type="text" class="form-control" id="product_video_url" name="product_video_url">
</div>

    

  <input type="hidden" class="form-control" id="Thumbnail" name="Thumbnail">

<div class="form-group">
	<label for="Gender">Ornament For<span class="text red">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>    
	<input type="radio" name="Gender" value="Women" required <?php echo set_radio('Gender','Women') == 'Women' ? "checked" : ""; ?> > Women    
	<input type="radio" name="Gender" value="Men" required  <?php echo set_radio('Gender','Men') == 'Men' ? "checked" : ""; ?>> Men       
	</div>


	<div class="form-group">
	<label for="Productlive">Is Product Active?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	<input type="radio" name="Productlive" value="1"   checked <?php echo set_radio('Productlive','1') == '1' ? "checked" : ""; ?>> Yes
	<input type="radio" name="Productlive" value="0"   <?php echo set_radio('Productlive','0') == '0' ? "checked" : ""; ?>> No
	</div>
	
	<div class="form-group">
    <label for="Provision_for_opening">Provision for opening?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>    
    <input type="radio" name="Provision_for_opening" value="Yes" <?php echo set_radio('Provision_for_opening','Yes') == 'Yes' ? "checked" : ""; ?>> Yes    
    <input type="radio" name="Provision_for_opening" value="No" <?php echo set_radio('Provision_for_opening','No') == 'No' ? "checked" : ""; ?>> No       
	</div> 


  <div class="form-group">
    <label for="is_make_an_order">Is Make An Order?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>    
    <input type="radio" name="is_make_an_order" value="yes" <?php echo set_radio('is_make_an_order','yes') == 'yes' ? "checked" : ""; ?>> Yes    
    <input type="radio" name="is_make_an_order" value="no" <?php echo set_radio('is_make_an_order','no') == 'no' ? "checked" : ""; ?>> No       
  </div>
	
	
	
		<div class="row">	
	<div class="col-md-3">	
	
			<div class="form-group-sm">
			<label for="CouponID">Material<span class="text red">*</span>:</label>
			<select class="form-control " id="Material_type" name="Material_type" required >
			<option value="">-- Pick Material --</option>	
			<?php  foreach($this->products->material_types() as $option_group) { ?>
			<option <?php echo set_select('Material_type', $option_group->MaterialID); ?> value="<?php echo $option_group->MaterialID;?>" ><?php echo ucwords($option_group->MaterialName);?></option>
			<?php } ?>
			
			</select>
			</div> 
			<br>
	</div>
	  <div class="col-md-3">
<div class="form-group">
<label for="Polish_Details">Polish Details:</label>
<input type="text" value="" class="form-control" id="Polish_Details" name="Polish_Details">
</div>  
</div>


 <div class="col-md-3">

<div class="form-group">
<label for="producttype">Product Type<span class="text red">*</span>:</label>
<select class="form-control" id="product_type" name="product_type" required>  
<option value="">-- Pick One --</option>
<option value="anaya" <?php echo set_select('product_type', 'anaya'); ?>>Anaya</option>
<option value="solitory" <?php echo set_select('product_type', 'solitory'); ?>>Solitaires</option>
<option value="jbn" <?php echo set_select('product_type', 'jbn'); ?>>JBN Exclusive</option>
<option value="gift_cards" <?php echo set_select('product_type', 'gift_cards'); ?>>Gift Cards</option>
<option value="gold" <?php echo set_select('product_type', 'gold'); ?>>Golds</option>
<option value="diamond" <?php echo set_select('product_type', 'diamond'); ?>>Diamonds</option>


</select> 
</div>
  </div>

   <div class="col-md-3">
<div class="form-group">
<label for="sub_product_type">Subproduct Type<span class="text red">*</span>:</label>
<select class="form-control" id=" sub_product_type" name="sub_product_type" required>  
<option value="">-- Pick One --</option>
<option value="gold" <?php echo set_select('sub_product_type', 'gold'); ?>>Gold</option>
<option value="diamond" <?php echo set_select('sub_product_type', 'diamond'); ?>>Diamonds</option>
<option value="polki" <?php echo set_select('sub_product_type', 'polki'); ?>>Polki</option>
<option value="gift_cards" <?php echo set_select('sub_product_type', 'gift_cards'); ?>>Gift Cards</option>
</select> 
</div>
  </div>
	</div>


    <div class="form-group">
<label for="certificate_number">Certificate number</label>
<input type="text" value="" class="form-control" id="certificate_number" name="certificate_number">
</div> 


  <div class="row">
  <div class="col-md-2">
  <div class="form-group">
<label for="Stock">Stock<span class="text red">*</span>:</label>
<input type="number" min=1 value="<?php echo set_value('Stock'); ?>" class="form-control" id="Stock" name="Stock" required>
</div>  
  </div>
  </div>
	
		  <button type="submit" class="btn btn-primary pull-left" id="form_submit">Submit</button>
  
  </div>
<div class="col-md-6">

  <div class="form-group">
    <label for="Gross_weight">Gross weight (gms)<span class="text red">*</span>:</label>
    <input type="text" step="any" value="<?php echo set_value('Gross_weight'); ?>" class="form-control" id="Gross_weight" name="Gross_weight" required>
  </div>
  
      <div class="form-group">
    <label for="Net_weight">Net weight (gms)<span class="text red">*</span>:</label>
    <input type="text" step="any" value="<?php echo set_value('Net_weight'); ?>" class="form-control" id="Net_weight" name="Net_weight" required>
  </div>


    <div class="form-group">
    <label for="Weight">Width (mm):</label>
    <input type="number" min=1 step="any" value="<?php echo set_value('Width'); ?>" class="form-control" id="Width" name="Width">
  </div>
      <div class="form-group">
    <label for="Height">Height (mm):</label>
    <input type="number" min=1 step="any" value="<?php echo set_value('Height'); ?>" class="form-control" id="Height" name="Height">
  </div>      
  <div class="form-group">
    <label for="Length">Length (mm):</label>
    <input type="number" min=0 step="any" value="<?php echo set_value('Length'); ?>" class="form-control" id="Length" name="Length">
  </div>

      <div class="form-group">
    <label for="chain_length">Chain Length:</label>
    <input type="number" min=1 step="any" value="<?php echo set_value('chain_length'); ?>" class="form-control" id="chain_length" name="chain_length">
  </div>
		
    <div class="form-group">
    <label for="ShortDesc">Product Description<span class="text red">*</span>:</label>
    <textarea class="form-control" id="ShortDesc" name="ShortDesc" required><?php echo set_value('ShortDesc'); ?></textarea>
  </div>
  <!--
          <div class="form-group">
  <label for="LongDesc">Product Long Desc:</label>
<textarea  class="form-control" id="LongDesc" name="LongDesc"></textarea>
 </div>
 -->

  


<div class="form-group">
<label for="lmage">Product Thumbnail Image<span class="text red">*</span>:</label> <small>Upload jpg,jpeg,png format<br>
 [Please file name it should be SKU_Number.jpg(NPB_45_1.jpg)]
</small>
<input type="file" class="form-control" id="lmage" name="lmage" required>
</div>




 
  

</div>
	

	
  





	

	<input type="hidden" id="OptionGroupID" name="OptionGroupID" value=0>
				   
				   
	
	
    </form> 
	
	
					
					
					
                  </div>
                </div>
              </div>

  </div>
</div>




