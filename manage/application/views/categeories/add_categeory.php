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
           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>categories/add"  enctype="multipart/form-data" >
    
    <div class="form-group" id="ParentID">
        <label for="ParentID">Parent Category<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="ParentID" id="ParentID" required="required">
          <!-- <option value="<?php //echo set_select('ParentID'); ?>">--Pick one--</option> -->
          <option value="0">Create as Parent Category</option>
              <?php
              foreach ($this->parent_categeories as $key => $value) {
              echo '<option value="'.$value->CategoryID.'">'.ucwords($value->CategoryName).'</option>';
              }
              ?>
        </select>
      </div>
              <div class="form-group">
        <label for="CategoryName">Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control nameForSlug" id="CategoryName" name="CategoryName" required="required"  value="<?php echo set_value('CategoryName'); ?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">Category Slug<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control slugForName" id="CategorySlug" name="CategorySlug" required="required" value="<?php echo set_value('CategorySlug'); ?>" readonly>
      </div>
            <div class="form-group">
        <label for="CategoryDesc">Category Description<span class="text-red"style="color: red;">*</span></label>
        <textarea class="form-control" id="CategoryDesc" name="CategoryDesc" required="required" rows="2"><?php echo set_value('CategoryDesc'); ?></textarea>
        <!-- <input type="text" class="form-control" id="CategoryDesc" name="CategoryDesc" required="required" value="<?php// echo set_value('CategoryDesc'); ?>">  -->
      </div>
      
       
            <div class="form-group">
        <label for="SEOTitle">SEO Title</label>
        <input type="text" class="form-control" id="SEOTitle" name="SEOTitle" value="<?php echo set_value('SEOTitle'); ?>">
      </div>
            <div class="form-group">
        <label for="SEODescription">SEO Description</label>
        <textarea class="form-control" id="SEODescription" name="SEODescription" rows="2"><?php echo set_value('SEODescription'); ?></textarea>
        <!-- <input type="text" class="form-control" id="SEODescription" name="SEODescription" value="<?php //echo set_value('SEODescription'); ?>"> -->
      </div>
            <div class="form-group">
      <label for="SEOKeywords">SEO Keywords</label>
    <input type="text" class="form-control" id="SEOKeywords" name="SEOKeywords" value="<?php echo set_value('SEOKeywords'); ?>">
      </div>
      <div class="form-group">
        <label ><span class="text-red"style="color: red;"></span></label>
        <div >
          <div class="btn-group" data-toggle="buttons">
              Is customizable? <input type="checkbox" name="is_customizable" id="is_customizable" value="">  
          </div>
        </div>
      </div>
      <div class="form-group" id="custom_size">
        <label for="custom_size">Size</label>
        <input type="text" class="form-control" id="custom_size" name="custom_size" value="<?php echo set_value('custom_size'); ?>" required="required"> ( Please Enter Details seperated with Comma ' , ' )
        <div class="form-group">
        <label >Custom Attributes<span class="text-red"style="color: red;"></span></label>
        <div >
          <?php if ($custom_attributes_info) { 
            foreach ($custom_attributes_info as $custom_attribute) { ?>
               <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="<?php echo $custom_attribute->slug; ?>"> <?php echo ucwords($custom_attribute->name);?> 
          </div>
              
            
          <?php }}  ?>
          <!-- <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="polish"> Polish details 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="diamonds"> Diamonds 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="pearls"> Pearls 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="gemstone"> Gemstone 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="checkbox" name="custom_attributes[]" id="custom_attributes" value="beads"> Beads 
          </div> -->
        </div>
      </div>
      </div>
      <div class="form-group">
        <label for="CategoryImage">Category Image:</label>
        <input type="file" class="" id="CategoryImage" name="CategoryImage" value="<?php echo set_value('CategoryImage'); ?>">
      </div>
      
            <button type="submit" class="btn btn-primary">Submit</button>
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>


