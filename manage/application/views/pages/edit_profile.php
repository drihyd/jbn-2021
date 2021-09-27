
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

           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>users/edit_profile"  enctype="multipart/form-data" >
    
      <div class="form-group">
        <label for="Email">Email<span class="text-red"style="color: red;">*</span></label>
        <input type="email" class="form-control" id="Email" name="Email" required="required" value="<?php echo isset($profileinfo->Email)?$profileinfo->Email:'';?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">First Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="FirstName" required="required" value="<?php echo isset($profileinfo->FirstName)?$profileinfo->FirstName:'';?>">
      </div>
            <div class="form-group">
        <label for="CategoryDesc">Last Name<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="LastName" required="required" value="<?php echo isset($profileinfo->LastName)?$profileinfo->LastName:'';?>">
      </div>
      
            <div class="form-group">
        <label for="SEOTitle">Phone<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="Phone" name="Phone" required="required" value="<?php echo isset($profileinfo->Phone)?$profileinfo->Phone:'';?>" >
      </div>
      <div class="form-group">
        <label for="SEODescription">Address</label>
        <textarea class="form-control" id="Address" name="Address" rows="3"><?php echo isset($profileinfo->Address)?$profileinfo->Address:'';?></textarea>
      </div>
      <div class="form-group">
        <label for="CategoryImage">Profile Pic:</label>
        <input type="file" class="" id="CategoryImage" name="profile_pic_path" value="<?php echo isset($profileinfo->profile_pic_path)?$profileinfo->profile_pic_path:'';?>" >
      </div>
      <div class="border-top pt-2">
            <?php if (isset($profileinfo->profile_pic_path)): ?>
                <img src="<?php echo base_url($profileinfo->profile_pic_path);?>" alt="file" class="img-fluid" style="width: 10%; margin-left: 10px; margin-top: 10px; margin-bottom: 10px;">
              <?php else: ?>
              
            <?php endif ?>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" value="<?php echo $profileinfo->AdminID; ?>" name="AdminID" id="AdminID" />
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
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







