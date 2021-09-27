
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
           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>users/edit"  enctype="multipart/form-data" >
    <div class="form-group" id="ParentID">
        <label for="Role">Role<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="RoleID" id="RoleID" required="required">
          <option value="<?php echo set_select('RoleID'); ?>">--Pick one--</option>   
          <?php 
          foreach ($this->users as $key => $value) {
            if ($value->RoleID==$userinfo->RoleID) {
             echo '<option value="'.$value->RoleID.'" selected>'.ucwords($value->Name).'</option>';
            }else{
             echo '<option value="'.$value->RoleID.'">'.ucwords($value->Name).'</option>';
            }
          }
          ?>
        </select>
      </div>
      <div class="form-group">
        <label for="Email">Email<span class="text-red"style="color: red;">*</span></label>
        <input type="email" class="form-control" id="Email" name="Email" required="required" value="<?php echo isset($userinfo->Email)?$userinfo->Email:'';?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">First Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="FirstName" required="required" pattern="[a-zA-Z0-9\s]+" value="<?php echo isset($userinfo->FirstName)?$userinfo->FirstName:'';?>">
      </div>
            <div class="form-group">
        <label for="CategoryDesc">Last Name<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="LastName" required="required" pattern="[a-zA-Z0-9\s]+" value="<?php echo isset($userinfo->LastName)?$userinfo->LastName:'';?>">
      </div>
      <div class="form-group">
      <label for="SEOKeywords">Password<span class="text-red"style="color: red;">*</span></label>
    <input type="password" class="form-control" id="Password" name="Password" required="required" value="<?php echo isset($userinfo->Password)?$userinfo->Password:'';?>" >
      </div>
            <div class="form-group">
        <label for="SEOTitle">Phone<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="Phone" name="Phone" required="required" pattern="[6-9]{1}[0-9]{9}" value="<?php echo isset($userinfo->Phone)?$userinfo->Phone:'';?>" >
      </div>
            <div class="form-group">
        <label for="SEODescription">Address</label>
        <textarea class="form-control" id="Address" name="Address" rows="3"><?php echo isset($userinfo->Address)?$userinfo->Address:'';?></textarea>
      </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" value="<?php echo $userinfo->AdminID; ?>" name="AdminID" id="AdminID" />
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>







