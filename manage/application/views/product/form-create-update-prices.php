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
                       <li class="dropdown">                     
                      <a href="<?php echo base_url('products'); ?>">Back to Products</a>
                      </li>
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





           
<form role="form" method="post" id="add_edit_product" class="frm" action="<?php echo site_url()?>products/method_prices_createorupdate" enctype="multipart/form-data">

<div class="row">



<?php

if($products[0]->discount_percentage==0 || $products[0]->discount_percentage=="")
{
  $discount_percentage="";
}
else
{
  $discount_percentage=$products[0]->discount_percentage;
}
  ?>
  <div class="row making_charges">



  <div class="col-md-2">
   <div class="form-group-sm">
    <label for="Making_charges_unit">Making charges unit<span class="text red">*</span>:</label>
           <select class="form-control" name="Making_charges_unit" id="Making_charges_unit" >
        <option value="">-- Pick one --</option>
        <option value="gram" <?php if($products[0]->Making_charges_unit == 'gram'){ echo "selected"; } ?>>Gram</option>
     <option value="fix" <?php if($products[0]->Making_charges_unit == 'fix'){ echo "selected"; } ?>>Fix</option>
     </select>
  </div>
  </div>
      <div class="col-md-3">
  <div class="form-group-sm">  
 <label for="Price">On gross weight/net weight<span class="text red">*</span>:</label>  
          <select class="form-control" name="Making_chg_On_Grs_Net_Weight" id="Making_chg_On_Grs_Net_Weight" >
       <option value="">-- Pick one --</option>
        <option value="gross_weight" <?php if($products[0]->Making_chg_On_Grs_Net_Weight == 'gross_weight'){ echo "selected"; } ?>>Gross weight</option>
     <option value="net_weight" <?php if($products[0]->Making_chg_On_Grs_Net_Weight == 'net_weight'){ echo "selected"; } ?>>Net weight</option>
     <option value="fix" <?php if($products[0]->Making_chg_On_Grs_Net_Weight == 'fix'){ echo "selected"; } ?>>Fix</option>
     </select>
  </div>
  </div>
  
    <div class="col-md-2">
  <div class="form-group-sm">    
  <label for="Making_charges">Making Charges<span class="text red">*</span>:</label>
    <input type="number"  min=0 class="form-control" id="Making_charges" name="Making_charges"   value="<?php echo $products[0]->Making_charges;?>">
  </div>
  </div>

  
   </div>
  <br>

<div class="row">
  <div class="col-md-2">
  <div class="form-group-sm">
  <label for="discount_percentage">Discount Percentage:</label>
  <div class="input-group">
  <div class="input-group-addon">₹</div>
  <input type="number"  min=1 class="form-control" id="discount_percentage" name="discount_percentage"   value="<?php echo $discount_percentage;?>" >
  <div class="input-group-addon">%</div>
  </div>
  </div>
  </div>

<div class="col-md-2">
<div class="form-group">
<label for="Stock">MRP<span class="text red">*</span> :</label>
<input type="number"  value="<?php echo $products[0]->MRP_Price ?>" class="form-control" id="MRP_Price" name="MRP_Price" >
</div>  
</div>

<div class="col-md-4">
<div class="form-group">
<label for="Stock">Actual Price(Included handling charges)<span class="text red">*</span>:</label>
<input type="number"  value="<?php echo $products[0]->Price ?>" class="form-control" id="Price" name="Price" >
</div>  
</div>

 </div>

 

<div class="row">
  <div class="col-md-3">
  <div class="form-group">
  <label for="mould_availability">Is Mould availability?</label>
  <label class="radio-inline">
  <input type="radio" name="mould_availability" value="1"  <?php if($products[0]->mould_availability == 1){ echo "checked"; } ?> > Yes
  </label>
  <label class="radio-inline">
  <input type="radio" name="mould_availability" value="0"  <?php if($products[0]->mould_availability == 0){ echo "checked"; } ?> > No
  </label>
  </div>
  </div>

  <div class="col-md-3">
  <div class="form-group">
  <label for="cad_availability">Is CAD availability?</label>
  <label class="radio-inline">
  <input type="radio" name="cad_availability" value="1"  <?php if($products[0]->cad_availability == 1){ echo "checked"; } ?> > Yes
  </label>
  <label class="radio-inline">
  <input type="radio" name="cad_availability" value="0"  <?php if($products[0]->cad_availability == 0){ echo "checked"; } ?> > No
  </label>
  </div>
  </div>

</div>  

<button type="submit" class="btn btn-primary pull-left" id="form_submit">Update Price</button>
</div>


<input type="hidden" id="ProductID" name="ProductID" value=<?php echo $products[0]->ProductID ?>>
</form>
  
  
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>




