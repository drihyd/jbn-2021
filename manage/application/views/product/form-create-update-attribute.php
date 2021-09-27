<style type="text/css">
  
  h4{
    margin-top: 25px!important;
}
</style>
<?php
$material_Properities=$this->products->material_properities($products[0]->ProductID);
$diamond_Properities=$this->products->diamond_properities($products[0]->ProductID);
?>
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



<form role="form" method="post" id="add_edit_product" class="frm" action="<?php echo site_url()?>products/method_attributes_createorupdate" enctype="multipart/form-data">
<!-- Material Properities -->
<div class="row">
<div class="col-md-12"> 

<span class="label label-danger text-right">Latest 24Kt Gold price (1 Gram) :<?php echo $this->goldprice->price. ' (INR)';?></span>  
<h4>Material Properities</h4>  
<hr>
<?php 

$mat_prop=$material_Properities;

?>

<div class="form-group-sm" >
<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
<span class="input-group-btn" >   
<input type="text" class="form-control" id="size[]" name="size[]" value="<?php echo isset($mat_prop[0]->OptionSize)?$mat_prop[0]->OptionSize:'';?>" placeholder="Size">
</span>
<span class="input-group-btn">
<select class="form-control" name="Karat[]" id="karat">
<option value="">-- Pick Karat --</option>
<?php 

$Combination_OptionID=isset($mat_prop[0]->Combination_OptionID)?$mat_prop[0]->Combination_OptionID:'';

 foreach($this->products->option_product_karet() as $option_group) { 

  ?>
<option value="<?php echo $option_group->OptionID;?>" <?php if($Combination_OptionID == $option_group->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
<?php } ?>
</select>
</span> 
<span class="input-group-btn">
<select class="form-control" name="G_Colors[]" id="G_Colors">
<option value="">-- Pick Color --</option>
<?php  

$Combination_OptionID_Secnd=isset($mat_prop[0]->Combination_OptionID_Secnd)?$mat_prop[0]->Combination_OptionID_Secnd:'';
foreach($this->products->option_gold_colors() as $option_group) { ?>
<option value="<?php echo $option_group->OptionID;?>" <?php if($Combination_OptionID_Secnd == $option_group->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
<?php } ?>
</select>
</span>
<span class="input-group-btn">
<input type="text" class="form-control"  id="Mat_Pro_Weight" name="Mat_Pro_Weight[]" placeholder="Weight"  value="<?php echo isset($mat_prop[0]->OptionWeight)?$mat_prop[0]->OptionWeight:'';?>" >
</span>
</div>  
</div>
</div>
</div>

<!-- End -->


  
<!--  Diamond Type Properities -->
  
  <div class="row">
  <div class="col-md-12"> 
  <div class="diamond_properties">
   <h4>Diamond Type Properities </h4>  
   <hr>   
    <div style="text-align: end;" >
        <span class="diamond_add"><i class="fa fa-plus-square"></i></span>
    </div>
  
   
   <div class="row-fluid diamond_cloneDefault newrow" id="diamond_prop"> 
  
  
  <?php 
  
  $count_diamond_prop=count((array)$diamond_Properities);
  

  if($count_diamond_prop>0){
    $count_diamond_prop=$count_diamond_prop;

  
  $i=1; foreach($diamond_Properities as $diamond_prop) { 
  
  ?>
  <br>
   <div class="form-group-sm"> 
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  
      <span class="input-group-btn">
      <select class="form-control db-list-3 select" name="DP_Color[]" id="">
        <option value="">-- Pick Color --</option>
    <?php  foreach($this->products->option_product_diamond_color() as $option_group_1) { ?>
    <option value="<?php echo $option_group_1->OptionID;?>" <?php if($diamond_prop->Combination_OptionID == $option_group_1->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group_1->OptionName);?></option>
    <?php } ?>
      </select>
    </span>

    <span class="input-group-btn">
      <select class="form-control db-list-4 select" name="DP_Clarity[]" id="" >
        <option value="">-- Pick Clarity --</option>
    <?php  foreach($this->products->option_product_diamond_clarity() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" <?php if($diamond_prop->OptionID == $option_group->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
      </select>
    </span>



    <span class="input-group-btn">
        <select class="form-control" name="Diamond_Shape[]" id="">
          <option value="">-- Pick Diamond Shape --</option>
    <?php  foreach($this->products->option_product_dia_shapes() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" <?php if($diamond_prop->Diamond_Shape_Id == $option_group->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
        </select>
    </span>

      <span class="input-group-btn">
      <select class="form-control db-list-4 select" name="DP_Clarity_1[]" id="" >
        <option value="">-- Pick Certified --</option>
    <?php  foreach($this->products->option_product_Diamond_Certified() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" <?php if($diamond_prop->Combination_OptionID_Secnd == $option_group->OptionID){ echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
      </select>
    </span>
  
      <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="DP_No_of_Diamonds[]" placeholder="No Of Diamonds" value="<?php echo $diamond_prop->Quantity;?>" >
    </span>   
  <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="DP_Weight[]" placeholder="Diamond Weight " value="<?php echo $diamond_prop->OptionWeight;?>" >
    </span>

      <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="DP_Rate[]" placeholder="Price" value="<?php echo $diamond_prop->OptionPriceincrement;?>" >
    </span>
    </div>  
  
  <?php if($i>1) { ?>
  
  <span class="diamond_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> 
  <?php } else { ?>
  <span class="diamond_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span> 
  
  <?php } ?>
  
  </div>  
  
  <?php 
  $i++;
  } 
  
    }
  else
  {
    ?>
    
<div class="form-group-sm"> 
<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">

<span class="input-group-btn">
<select class="form-control" name="DP_Color[]" id="">
<option value="">-- Pick Color --</option>
<?php  foreach($this->products->option_product_Diamond_Color() as $option_group) { ?>
<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>
<?php } ?>
</select>
</span>



<span class="input-group-btn">
<select class="form-control" name="DP_Clarity[]" id="DP_Clarity" >
<option value="">-- Pick Clarity --</option>
<?php  foreach($this->products->option_product_Diamond_Clarity() as $option_group) { ?>
<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>
<?php } ?>
</select>
</span>

 <span class="input-group-btn">
    <select class="form-control" name="Diamond_Shape[]" id="Diamond_Shape">
      <option value="">-- Pick Diamond Shape --</option>
      <?php  foreach($this->products->option_product_dia_shapes() as $option_group) { ?>
       <option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>
      <?php } ?>
    </select>
    </span>
     
      <span class="input-group-btn">
      <select class="form-control db-list-4 select" name="DP_Clarity_1[]" id="" >
        <option value="">-- Pick Certified --</option>
    <?php  foreach($this->products->option_product_Diamond_Certified() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
      </select>
    </span>
      <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="DP_No_of_Diamonds[]" placeholder="No Of Diamonds" value="" >
    </span>   
<span class="input-group-btn">
<input type="text" class="form-control" id="" name="DP_Weight[]" placeholder="Weight" value="" >
</span>
      <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="DP_Rate[]" placeholder="Price" value="" >
    </span>
</div>  

</div>  
    
    <?php
  
  }
  
  
  ?>
     
</div>

<div id="extra_diamond_prop"></div>
</div>
  
  </div>
  
  
  </div>

  <!-- End -->
  


  <!--  Diamond Type Properities -->

  <div class="row"> 
  <div class="col-md-12">  
  <h4>Gemstone Properities</h4>
  <hr>
   
    <div style="text-align: end;" >
        <span class="gemstone_add"><i class="fa fa-plus-square"></i></span>
    </div>
   
   <div class="row-fluid gemstone_cloneDefault" id="gemstone_prop">
  
  <?php 
  
   $gemstone_properities=$this->products->gemstone_properities($products[0]->ProductID);
   
  if(count((array)$gemstone_properities)>0){
  
  $i=1; foreach($gemstone_properities as $gemstone_prop) { 
  
  ?>
  <br>
   <div class="form-group-sm"> 
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  
      <span class="input-group-btn">
           <select class="form-control" name="GSN_type[]" id="">
        <option value="">-- Pick Gemstone --</option>
    <?php  foreach($this->products->option_product_gemstone() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" <?php if($gemstone_prop->OptionID== $option_group->OptionID) { echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
      </select>
    </span>
  
     <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Quantity[]" placeholder="Quantity" value="<?php echo $gemstone_prop->Quantity;?>">
    </span>
       <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Weight[]" placeholder="Weight" value="<?php echo $gemstone_prop->OptionWeight;?>">
    </span>
       <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Rate[]" placeholder="Price" value="<?php echo $gemstone_prop->OptionPriceincrement;?>">
    </span>


    </div>  
  
  <?php if($i>1) { ?>
  
  <span class="gemstone_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span>
  <?php } else { ?>
  <span class="gemstone_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span>
  
  <?php } ?>
  
  </div>  
  
  <?php 
  $i++;
  } 
  
    }
  else
  {
    
    ?>
    

<div class="form-group-sm"> 
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  
      <span class="input-group-btn">
           <select class="form-control" name="GSN_type[]" id="">
        <option value="">-- Pick Gemstone --</option>
    <?php  foreach($this->products->option_product_gemstone() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
      </select>
    </span>
  
     <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Quantity[]" placeholder="Quantity" value="">
    </span>
       <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Weight[]" placeholder="Weight" value="">
    </span>
       <span class="input-group-btn">
      <input type="text" class="form-control" id="" name="GSN_Rate[]" placeholder="Rate" value="">
    </span>


    </div>  
  

  
  </div>  
    
    <?php
  
  }
  
  
  ?>
     
</div>

<div id="extra_gemstone_prop"></div>

  
  </div>
  </div>

  <!-- End -->


<!--  Pearl Properities -->

  <div class="row"> 
  <div class="col-md-12">  

   <h4> Pearl Properities</h4>  
   <hr>
       <div style="text-align: end;" >
        <span class="pearl_add"><i class="fa fa-plus-square"></i></span>
    </div>
   <div class="row-fluid">
<?php 
$pearls_properities=$this->products->pearls_properities($products[0]->ProductID);

if(count((array)$pearls_properities)>0){  
$i=1;
foreach($pearls_properities as $pearls_prop) { 
?>
<br>
  <div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
  <select class="form-control" name="Pearls[]" id="Pearls">
  <option value="">-- Pick Pearl --</option>
  <?php  foreach($this->products->option_product_pearls() as $option_group) { ?>
  <option value="<?php echo $option_group->OptionID;?>" <?php if($pearls_prop->OptionID==$option_group->OptionID) { echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
  <?php } ?>
  </select>
  </span>   
  <span class="input-group-btn">      
  <input type="text" class="form-control"  placeholder="Quantity" id="Pearls_quantity" name="Pearls_quantity[]"   value="<?php echo $pearls_prop->Quantity;?>" >
  </span>

  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="Pearl_Weight[]" placeholder="Weight"  value="<?php echo $pearls_prop->OptionWeight;?>">
  </span>
  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="Pearls_Rate[]" placeholder="Rate" value="<?php echo $pearls_prop->OptionPriceincrement;?>" >
  </span>
  </div>  

    <?php if($i>1) { ?>
  
  <span class="pearl_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span>
  <?php } else { ?>
  <span class="pearl_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span>
  
  <?php } ?>
  
  </div>  
<?php
$i++;
 } }
else { ?>
<div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
    <select class="form-control" name="Pearls[]" id="Pearls">
    <option value="">-- Pick Pearl --</option>
    <?php  foreach($this->products->option_product_pearls() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
    </select>
    </span> 
    
      <span class="input-group-btn">     
      
      <input type="text" class="form-control"  placeholder="Quantity" id="Pearls_quantity" name="Pearls_quantity[]"   value="" >
    </span>
    
      <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="Pearl_Weight[]" placeholder="Weight"  value="" >
    </span>
  <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="Pearls_Rate[]" placeholder="Price" value="" >
    </span>
    </div>    
  </div>

<?php } ?>
  


</div>  
   
     
  
  <div id="extra_pearl_prop"></div>  

    
  </div>
  </div>
  

  <!-- End -->


<!--  Polki Properities -->


  <div class="row"> 
  <div class="col-md-12">  

   <h4> Polki Properities</h4>  
   <hr>

       <div style="text-align: end;" >
        <span class="polki_add"><i class="fa fa-plus-square"></i></span>
      </div>

   <div class="row-fluid">
<?php 
$polki_properities=$this->products->polki_properities($products[0]->ProductID);

if(count((array)$polki_properities)>0){  
$i=1;
foreach($polki_properities as $polki_prop) { 
?>
<br>
  <div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
  <select class="form-control" name="Polki[]" id="Polki">
  <option value="">-- Pick Polki --</option>
  <?php  foreach($this->products->option_product_polki() as $option_group) { ?>
  <option value="<?php echo $option_group->OptionID;?>" <?php if($polki_prop->OptionID==$option_group->OptionID) { echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
  <?php } ?>
  </select>
  </span>   
  <span class="input-group-btn">      
  <input type="text" class="form-control"  placeholder="Quantity" id="Polki_quantity" name="Polki_quantity[]"   value="<?php echo $polki_prop->Quantity;?>" >
  </span>

  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="Polki_Weight[]" placeholder="Weight"  value="<?php echo $polki_prop->OptionWeight;?>">
  </span>
  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="Polki_Rate[]" placeholder="Rate" value="<?php echo $polki_prop->OptionPriceincrement;?>" >
  </span>
  </div>  

    <?php if($i>1) { ?>
  
  <span class="polki_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span>
  <?php } else { ?>
  <span class="polki_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span>
  
  <?php } ?>
  
  </div>  
<?php
$i++;
 } }
else { ?>
<div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
    <select class="form-control" name="Polki[]" id="Polki">
    <option value="">-- Pick Polki --</option>
    <?php  foreach($this->products->option_product_polki() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
    </select>
    </span> 
    
      <span class="input-group-btn">     
      
      <input type="text" class="form-control"  placeholder="Quantity" id="Polki_quantity" name="Polki_quantity[]"   value="" >
    </span>
    
      <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="Polki_Weight[]" placeholder="Weight"  value="" >
    </span>
  <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="Polki_Rate[]" placeholder="Price" value="" >
    </span>
    </div>    
  </div>

<?php } ?>
</div>  
<div id="extra_polki_prop"></div>  

</div>
</div>
<!-- End -->


<!--  Pearl Properities -->
  <div class="row"> 
  <div class="col-md-12">  

   <h4> Beads Properities</h4>  
       <div style="text-align: end;" >
        <span class="beads_add"><i class="fa fa-plus-square"></i></span>
    </div>
   <div class="row-fluid">
<?php 
$beads_properities=$this->products->beads_properities($products[0]->ProductID);

if(count((array)$beads_properities)>0){  
$i=1;
foreach($beads_properities as $beads_prop) { 
?>
<br>
  <div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
  <select class="form-control" name="beads[]" id="beads">
  <option value="">-- Pick beads --</option>
  <?php  foreach($this->products->option_product_beads() as $option_group) { ?>
  <option value="<?php echo $option_group->OptionID;?>" <?php if($beads_prop->OptionID==$option_group->OptionID) { echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
  <?php } ?>
  </select>
  </span>   
  <span class="input-group-btn">      
  <input type="text" class="form-control"  placeholder="Quantity" id="beads_quantity" name="beads_quantity[]"   value="<?php echo $beads_prop->Quantity;?>" >
  </span>

  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="beads_Weight[]" placeholder="Weight"  value="<?php echo $beads_prop->OptionWeight;?>">
  </span>
  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="beads_Rate[]" placeholder="Rate" value="<?php echo $beads_prop->OptionPriceincrement;?>" >
  </span>
  </div>  

    <?php if($i>1) { ?>
  
  <span class="beads_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span>
  <?php } else { ?>
  <span class="beads_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span>
  
  <?php } ?>
  
  </div>  
<?php
$i++;
 } }
else { ?>
<div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
    <select class="form-control" name="beads[]" id="beads">
    <option value="">-- Pick beads --</option>
    <?php  foreach($this->products->option_product_beads() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
    </select>
    </span> 
    
      <span class="input-group-btn">     
      
      <input type="text" class="form-control"  placeholder="Quantity" id="beads_quantity" name="beads_quantity[]"   value="" >
    </span>
    
      <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="beads_Weight[]" placeholder="Weight"  value="" >
    </span>
  <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="beads_Rate[]" placeholder="Price" value="" >
    </span>
    </div>    
  </div>

<?php } ?>
</div>  
<div id="extra_beads_prop"></div>  
</div>
</div>
<!-- End -->


<!--  Other Properities -->


  <div class="row"> 
  <div class="col-md-12">  

   <h4> Other Properities</h4>  
       <div style="text-align: end;" >
        <span class="other_add"><i class="fa fa-plus-square"></i></span>
    </div>
   <div class="row-fluid">
<?php 
$other_properities=$this->products->other_properities($products[0]->ProductID);

if(count((array)$other_properities)>0){  
$i=1;
foreach($other_properities as $other_prop) { 
?>
<br>
  <div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
  <select class="form-control" name="other[]" id="other">
  <option value="">-- Pick other --</option>
  <?php  foreach($this->products->option_product_other() as $option_group) { ?>
  <option value="<?php echo $option_group->OptionID;?>" <?php if($other_prop->OptionID==$option_group->OptionID) { echo "selected"; } ?>><?php echo ucwords($option_group->OptionName);?></option>
  <?php } ?>
  </select>
  </span>   
  <span class="input-group-btn">      
  <input type="text" class="form-control"  placeholder="Quantity" id="other_quantity" name="other_quantity[]"   value="<?php echo $other_prop->Quantity;?>" >
  </span>

  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="other_Weight[]" placeholder="Weight"  value="<?php echo $other_prop->OptionWeight;?>">
  </span>
  <span class="input-group-btn">
  <input type="text" class="form-control"  id="" name="other_Rate[]" placeholder="Rate" value="<?php echo $other_prop->OptionPriceincrement;?>" >
  </span>
  </div>  

    <?php if($i>1) { ?>
  
  <span class="other_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span>
  <?php } else { ?>
  <span class="other_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;">&nbsp;&nbsp;</span>
  
  <?php } ?>
  
  </div>  
<?php
$i++;
 } }
else { ?>
<div class="form-group-sm" >
  <div class="input-group" style="margin-bottom:0px!important;width: fit-content;">
  <span class="input-group-btn">
    <select class="form-control" name="other[]" id="other">
    <option value="">-- Pick other --</option>
    <?php  foreach($this->products->option_product_other() as $option_group) { ?>
    <option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>
    <?php } ?>
    </select>
    </span> 
    
      <span class="input-group-btn">     
      
      <input type="text" class="form-control"  placeholder="Quantity" id="other_quantity" name="other_quantity[]"   value="" >
    </span>
    
      <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="other_Weight[]" placeholder="Weight"  value="" >
    </span>
  <span class="input-group-btn">
      <input type="text" class="form-control"  id="" name="other_Rate[]" placeholder="Price" value="" >
    </span>
    </div>    
  </div>

<?php } ?>
</div>  
<div id="extra_other_prop"></div>  

</div>
</div>

<!-- End -->

<div class="row">
<div class="col-md-4">
<small><strong>*Prices also will update accordingly attribute prices.</strong></small>
</div>
</div>


<br>

<button type="submit" class="btn btn-primary pull-left" id="form_submit">Submit</button>
<input type="hidden" id="ProductID" name="ProductID" value=<?php echo $products[0]->ProductID ?>>

</form>
  
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>




