<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li> -->
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>products/add">+Add Product</a></i>
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





           
      <form role="form" method="post" id="add_edit_product" class="frm" action="<?php echo site_url()?>products/save" enctype="multipart/form-data">


<div class="row"> 
<div class="col-md-6">
<input type="hidden" value="<?php echo $products[0]->ProductID ?>"   name="products_id">

    <div class="form-group">
    <label for="CategorylD">Category<span class="text red">*</span>:</label>
   <select class="form-control get_subcategory_ajax" id="CategorylD" name="CategorylD" required>  
  <option value="">-- Pick One --</option>
  <?php  foreach($this->products->categories_lists() as $Category) { ?> 
  <option <?php echo set_select('CategorylD', $Category->CategoryID); ?> value="<?php echo $Category->CategoryID;?>" <?php if($products[0]->CategoryID == $Category->CategoryID){ echo "selected"; } ?>><?php echo ucwords($Category->CategoryName);?></option>
  <?php } ?>
  </select> 
  </div>
  
    <div class="form-group">
    <label for="CategorylD">Sub Category<span class="text red">*</span>:</label>
   <select class="form-control" id="Sub_CategorylD" name="Sub_CategorylD" > 
  <option value="">-- Pick One --</option>
  <?php  foreach($this->products->SubCategories($products[0]->CategoryID) as $Category) { ?>  
  <option <?php echo set_select('Sub_CategorylD', $Category->CategoryID); ?> value="<?php echo $Category->CategoryID;?>" <?php if($products[0]->Sub_CategorylD == $Category->CategoryID){ echo "selected"; } ?>><?php echo ucwords($Category->CategoryName);?></option>
  <?php } ?>
  </select> 
  </div>

    <div class="form-group">
    <label for="Name">Product Name<span class="text red">*</span>:</label>
    <input type="text" value="<?php echo set_value('Name', $products[0]->Name); ?>" class="form-control" id="Name" name="Name" required>
  </div>

    <div class="form-group">
    <label for="SKU">Product Code<span class="text red">*</span>:</label>
    <input type="text" value="<?php echo set_value('SKU', $products[0]->SKU); ?>" class="form-control" id="SKU" name="SKU" required>
  </div>
  
  <div class="form-group">
  <label for="No_of_pieces">No.of pieces<span class="text red">*</span>:</label>
  <input type="number" min=1 value="<?php echo $products[0]->No_of_pieces ?>" class="form-control" id="No_of_pieces" name="No_of_pieces" required>
  </div>

<div class="form-group">
<label for="product_vimeo_url">Vimeo URL:</label> <small>(Ex: https://vimeo.com/555029178)</small>
<input type="text" class="form-control" id="product_vimeo_url" name="product_vimeo_url" value="<?php echo $products[0]->product_vimeo_url; ?>">
</div>


<div class="form-group">
<label for="videourl">Youtube Video URL:</label> <small>Accept Embed URl</small>
<input type="text" class="form-control" id="product_video_url" name="product_video_url" value="<?php echo $products[0]->product_video_url; ?>">
</div>

  <input type="hidden" class="form-control" id="Thumbnail" name="Thumbnail">

<div class="form-group">

  <label for="Gender">Ornament For<span class="text red">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
  <label class="radio-inline">   
  <input type="radio" name="Gender" value="Women" <?php if($products[0]->Gender == "Women"){ echo "checked"; } ?> required> Women 
  </label>
  <label class="radio-inline">   
  <input type="radio" name="Gender" value="Men" <?php if($products[0]->Gender == "Men"){ echo "checked"; } ?> required> Men   
  </label>    
  </div>


  <div class="form-group">
  <label for="Productlive">Is Product Active?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
  <label class="radio-inline">
  <input type="radio" name="Productlive" value="1"  <?php if($products[0]->Productlive == 1){ echo "checked"; } ?> > Yes
</label>
<label class="radio-inline">
  <input type="radio" name="Productlive" value="0"  <?php if($products[0]->Productlive == 0){ echo "checked"; } ?> > No
</label>
  </div>
  
  <div class="form-group">
    <label for="Provision_for_opening">Provision for opening?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
    <label class="radio-inline">   
    <input type="radio" name="Provision_for_opening" value="Yes" <?php if($products[0]->Provision_for_opening == 'Yes'){ echo "checked"; } ?>> Yes    
  </label>
  <label class="radio-inline">
    <input type="radio" name="Provision_for_opening" value="No" <?php if($products[0]->Provision_for_opening == 'No'){ echo "checked"; } ?>> No      
    </label> 
  </div>

    <div class="form-group">
    <label for="is_make_an_order">Is Make An Order?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>  
    <label class="radio-inline">  
    <input type="radio" name="is_make_an_order" value="yes" <?php if($products[0]->is_make_an_order == 'yes'){ echo "checked"; } ?>> Yes 
    </label>
    <label class="radio-inline">   
    <input type="radio" name="is_make_an_order" value="no" <?php if($products[0]->is_make_an_order == 'no'){ echo "checked"; } ?>> No  
    </label>     
  </div>




<div class="row"> 
<div class="col-md-3">
<div class="form-group-sm">
<label for="CouponID">Material<span class="text red">*</span>:</label>
<select class="form-control " id="Material_type" name="Material_type" required >
<option value="">-- Pick Material --</option>  
<?php  foreach($this->products->material_types() as $option_group) { ?>
<option value="<?php echo $option_group->MaterialID;?>" <?php if($products[0]->Material_type == $option_group->MaterialID){ echo "selected"; } ?>><?php echo ucwords($option_group->MaterialName);?></option>
<?php } ?>
</select>
</div> 
</div>
<div class="col-md-3">
<div class="form-group">
<label for="Polish_Details">Polish Details<span class="text red">*</span>:</label>
<input type="text" value="<?php echo $products[0]->Polish_Details ?>" class="form-control" id="Polish_Details" name="Polish_Details">
</div>  
</div>


<div class="col-md-3">
<div class="form-group">
<label for="producttype">Product Type<span class="text red">*</span>:</label>
<select class="form-control" id="product_type" name="product_type" required>  
<option value="">-- Pick One --</option>
<option value="anaya" <?php if($products[0]->product_type=="anaya"){ echo "selected"; } ?> >Anaya</option>
<option value="solitory" <?php if($products[0]->product_type=="solitory"){ echo "selected"; } ?> >Solitaires</option>
<option value="jbn" <?php if($products[0]->product_type=="jbn"){ echo "selected"; } ?> >JBN Exclusive</option>
<option value="gift_cards" <?php if($products[0]->product_type=="gift_cards"){ echo "selected"; } ?> >Gift Cards</option>
<option value="gold" <?php if($products[0]->product_type=="gold"){ echo "selected"; } ?> >Golds</option>
<option value="diamond" <?php if($products[0]->product_type=="diamond"){ echo "selected"; } ?> >Diamonds</option>

</select> 
</div>
</div>

<div class="col-md-3">
<div class="form-group">
<label for="sub_product_type">Subproduct Type<span class="text red">*</span>:</label>
<select class="form-control" id="sub_product_type" name="sub_product_type" required>  
<option value="">-- Pick One --</option>
<option value="gold" <?php if($products[0]->sub_product_type=="gold"){ echo "selected"; } ?> >Gold</option>
<option value="diamond" <?php if($products[0]->sub_product_type=="diamond"){ echo "selected"; } ?> >Diamonds</option>
<option value="polki" <?php if($products[0]->sub_product_type=="polki"){ echo "selected"; } ?> >Polki</option>
<option value="gift_cards" <?php if($products[0]->sub_product_type=="gift_cards"){ echo "selected"; } ?> >Gift Cards</option>

</select> 
</div>
</div>
</div>


  <div class="form-group">
<label for="certificate_number">Certificate number</label>
<input type="text" value="<?php echo $products[0]->certificate_number ?>" class="form-control" id="certificate_number" name="certificate_number">
</div> 


  <div class="row">
  <div class="col-md-2">
  <div class="form-group">
<label for="Stock">Stock<span class="text red">*</span>:</label>
<input type="number" min=1 value="<?php echo $products[0]->Stock ?>" class="form-control" id="Stock" name="Stock" required>
</div> 
</div> 
</div> 


  </div>
<div class="col-md-6">
 

<div class="form-group">
    <label for="Gross_weight">Gross weight<span class="text red">*</span>:</label>
    <input type="text" step="any" value="<?php echo $products[0]->Gross_weight ?>" class="form-control" id="Gross_weight" name="Gross_weight" required>
  </div>
  
      <div class="form-group">
    <label for="Net_weight">Net weight<span class="text red">*</span>:</label>
    <input type="text" step="any" value="<?php echo $products[0]->Net_weight ?>" class="form-control" id="Net_weight" name="Net_weight" required>
  </div>


    <div class="form-group">
    <label for="Weight">Width(mm):</label>
    <input type="number" min=1 step="any" value="<?php echo $products[0]->Width ?>" class="form-control" id="Width" name="Width">
  </div>
<?php
  if($products[0]->Height==0 || $products[0]->Height=="")
  {
  $Height="";
  }
  else
  {
  $Height=$products[0]->Height;
  }
  ?>
  <div class="form-group">
  <label for="Height">Height(mm):</label>
  <input type="number" min=1 step="any" value="<?php echo $Height; ?>" class="form-control" id="Height" name="Height">
  </div>      
  <div class="form-group">
    <label for="Length">Length(mm):</label>
    <input type="number" min=0 step="any" value="<?php echo $products[0]->Length ?>" class="form-control" id="Length" name="Length">
  </div>

<?php
if($products[0]->chain_length==0 || $products[0]->chain_length=="")
{
  $chain_length="";
}
else
{
  $chain_length=$products[0]->chain_length;
}
?>

    <div class="form-group">
    <label for="chain_length">Chain Length:</label>
    <input type="number" min=1 step="any" value="<?php echo $chain_length ?>" class="form-control" id="chain_length" name="chain_length">
  </div>








      <div class="form-group">
    <label for="ShortDesc">Product Description<span class="text red">*</span>:</label>
    <textarea class="form-control" id="ShortDesc" name="ShortDesc" required><?php echo $products[0]->ShortDesc ?></textarea>
  </div>


<div class="form-group">
<label for="lmage">Product Thumbnail Image<span class="text red">*</span>:</label> <small>Upload jpg,jpeg,png Only<br>
[Please file name it should be SKU_Number.jpg(NPB_45_1.jpg)]

</small>
<input type="file" class="form-control" id="lmage" name="lmage">
<?php if(file_exists($products[0]->lmage)) { ?>
<img src="<?php echo base_url();?><?php echo $products[0]->lmage; ?>" class="img-responsive" width="50"/>
<?php } ?>
</div>
</div>
</div>
<button type="submit" class="btn btn-primary pull-left" id="form_submit">Submit</button>
<input type="hidden" id="OptionGroupID" name="OptionGroupID" value=0>
</form>
  
  
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>




