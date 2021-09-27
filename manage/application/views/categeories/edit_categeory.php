
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
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>categories">Back</a>
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
           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>categories/edit"  enctype="multipart/form-data" >
    <!-- <div class="row">
      <div class="col-md-3">
    <div class="form-group">
        <label ><span class="text-red" style="color: red;">*</span></label>
        <div >
          <div class="btn-group" data-toggle="buttons">
              <input type="checkbox" name="isparent" id="isparent" value="0" <?php if($categeoriesinfo->ParentID=="0") { ?> checked <?php } ?>> Parent &nbsp;
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-9">
      <div class="form-group" id="ParentID">
        <label for="ParentID">Parent Category<span class="text-red" style="color: red;">*</span></label>
        <select  class="form-control" name="ParentID" id="ParentID" >
          <option value="<?php echo set_select('ParentID'); ?>">--Pick one--</option>
              <?php
              if ($value->ParentID==$ParentID) {
              foreach ($this->parent_categeories as $key => $value) {
              echo '<option value="'.$value->CategoryID.'" selected>'.ucwords($value->CategoryName).'</option>';
              }
            }else{
              echo '<option value="'.$value->CategoryID.'">'.ucwords($value->CategoryName).'</option>';
            }
              ?>
        </select>
      </div>
      </div> 
    </div> -->
    <!-- <div class="form-group">
        <label ><span class="text-red" ></span></label>
        <div>
          <div class="btn-group" data-toggle="buttons">
              <input type="checkbox" name="isparent" id="isparent" value="0" <?php if($categeoriesinfo->ParentID=="0") { ?> checked <?php } ?>> Is Parent? &nbsp;
          </div>
        </div>
      </div> -->
    <div class="form-group" id="ParentID">
        <label for="ParentID">Parent Category<span class="text-red" style="color: red;">*</span></label>
        <select  class="form-control" name="ParentID" id="ParentID" required="required">
          
          <option value="0"<?php if(isset($categeoriesinfo->ParentID) && $categeoriesinfo->ParentID=="0") { ?> selected <?php } ?> >Parent Category</option>
              <?php
              foreach ($this->parent_categeories as $key => $value) {
              if ($categeoriesinfo->ParentID==$value->CategoryID) {
              echo '<option value="'.$value->CategoryID.'" selected>'.ucwords($value->CategoryName).'</option>';
              
            }else{
              echo '<option value="'.$value->CategoryID.'">'.ucwords($value->CategoryName).'</option>';
            }
          }
          ?>
        </select>
      </div>
              <div class="form-group">
        <label for="CategoryName">Name<span class="text-red" style="color: red;" >*</span></label>
        <input type="text" class="form-control nameForSlug" id="CategoryName" name="CategoryName" required="required" value="<?php echo isset($categeoriesinfo->CategoryName)?$categeoriesinfo->CategoryName:'';?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">Category Slug<span class="text-red" style="color: red;">*</span></label>
        <input type="text" class="form-control slugForName" id="CategorySlug" name="CategorySlug" required="required" value="<?php echo isset($categeoriesinfo->CategorySlug)?$categeoriesinfo->CategorySlug:'';?>" readonly>
      </div>
            <div class="form-group">
        <label for="CategoryDesc">Category Description<span class="text-red" style="color: red;">*</span></label>
        <textarea class="form-control" id="CategoryDesc" name="CategoryDesc" required="required" rows="2"><?php echo isset($categeoriesinfo->CategoryDesc)?$categeoriesinfo->CategoryDesc:'';?></textarea>
        <!-- <input type="text" class="form-control" id="CategoryDesc" name="CategoryDesc" required="required" value="<?php// echo isset($categeoriesinfo->CategoryDesc)?$categeoriesinfo->CategoryDesc:'';?>"> -->
      </div>
            
            <div class="form-group">
        <label for="SEOTitle">SEO Title</label>
        <input type="text" class="form-control" id="SEOTitle" name="SEOTitle"  value="<?php echo isset($categeoriesinfo->SEOTitle)?$categeoriesinfo->SEOTitle:'';?>">
      </div>
            <div class="form-group">
        <label for="SEODescription">SEO Description</label>
        <textarea class="form-control" id="SEODescription" name="SEODescription" rows="2"><?php echo isset($categeoriesinfo->SEODescription)?$categeoriesinfo->SEODescription:'';?></textarea>
        <!-- <input type="text" class="form-control" id="SEODescription" name="SEODescription"  value="<?php //echo isset($categeoriesinfo->SEODescription)?$categeoriesinfo->SEODescription:'';?>"> -->
      </div>
            <div class="form-group">
      <label for="SEOKeywords">SEO Keywords</label>
    <input type="text" class="form-control" id="SEOKeywords" name="SEOKeywords"  value="<?php echo isset($categeoriesinfo->SEOKeywords)?$categeoriesinfo->SEOKeywords:'';?>">
      </div>
      <div class="btn-group" data-toggle="buttons">
              Is customizable? <input type="checkbox" name="is_customizable" id="is_customizable" value="<?php echo isset($categeoriesinfo->is_customizable)?$categeoriesinfo->is_customizable:'';?>" <?php if($categeoriesinfo->is_customizable=="1") { ?> checked <?php } ?>>  
          </div>
        
      <div class="form-group" id="custom_size">
        <label for="custom_size">Size</label>
        <input type="text" class="form-control" id="custom_size" name="custom_size" value="<?php echo isset($categeoriesinfo->custom_size)?$categeoriesinfo->custom_size:'';?>" required="required"> ( Please Enter Details seperated with Comma ' , ' )
        <div class="form-group" id="custom_attributes">
        <label >Custom Attributes<span class="text-red"style="color: red;"></span></label>
        <div > 
          <?php $decode = $categeoriesinfo->custom_attributes;
      $json= json_decode($decode);
      ?>
       <?php if ($custom_attributes_info) { 
            foreach ($custom_attributes_info as $custom_attribute) { ?>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="<?php echo isset($custom_attribute->slug)?$custom_attribute->slug:'';?>" <?php if (is_array($json)) { if(in_array($custom_attribute->slug,$json)==$custom_attribute->slug) { ?> checked <?php } }?>> <?php echo $custom_attribute->name;?> 
          </div>
          <?php }}  ?>
          <!-- <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="diamonds" <?php if (is_array($json)) { if(in_array("diamonds",$json)=="diamonds") { ?> checked <?php } }?> > Diamonds 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="pearls" <?php if (is_array($json)) { if(in_array("pearls",$json)=="pearls") { ?> checked <?php } }?> > Pearls 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="gemstone" <?php if (is_array($json)) { if(in_array("gemstone",$json)=="gemstone") { ?> checked <?php }} ?>> Gemstone 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="beads" <?php if (is_array($json)) { if(in_array("beads",$json)=="beads") { ?> checked <?php }} ?>> Beads 
          </div> -->
          </div>
        </div>
      </div>
      
      
      <div class="row">
        <div class="col-md-8">
          <div class="form-group">
        <label for="CategoryImage">Category Image:</label>
        <input type="file" class="" id="CategoryImage" name="CategoryImage" value="<?php echo isset($categeoriesinfo->CategoryImage)?$categeoriesinfo->CategoryImage:'';?>" >
      </div>
          
        </div>
        <div class="col-md-4">
          <div class="border-top pt-2">
            <?php if (isset($categeoriesinfo) && isset($categeoriesinfo->CategoryImage) ): ?>
                <img src="<?php echo base_url($categeoriesinfo->CategoryImage);?>" alt="file" class="img-fluid" style="width: 60%; margin-left: 10px; margin-top: 10px;">
              <?php else: ?>
              
            <?php endif ?>
            </div>
      </div>
    </div>
          </div>
        </div>
      </div>
      
      
            <button type="submit" class="btn btn-primary">Submit</button>
            

            <input type="hidden" value="<?php echo $categeoriesinfo->CategoryID; ?>" name="CategoryID" id="CategoryID" />
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>


