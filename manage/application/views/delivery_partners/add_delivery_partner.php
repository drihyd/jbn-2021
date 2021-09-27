
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
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-products">+Add Products</a>
                      </li> -->
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
				   
	<form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>delivery_partners/add"  enctype="multipart/form-data" >
    
      <div class="form-group">
        <label for="CategorySlug">Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="name" required="required"  value="<?php echo set_value('name');?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">API URL<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="CategorySlug" name="api_url" required="required" value="<?php echo set_value('api_url'); ?>" >
      </div>
      
            <div class="form-group">
        <label for="CategoryDesc">Address<span class="text-red"style="color: red;"></span></label>
        <textarea class="form-control" id="address" required="required" name="address" rows="3"><?php echo set_value('address');?></textarea>
      </div>

            <div class="form-group">
        <label for="CategoryDesc">Mobile<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="mobile" name="mobile" required="required"  value="<?php echo set_value('mobile');?>">
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







