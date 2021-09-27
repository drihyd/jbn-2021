
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <?php
              if (isset($_SESSION['Email'])) {
                $email=$_SESSION['Email'];
                $email=explode("@", $email);
              }  
            ?>
          <h2><?php echo ucwords($this->admin_user->FirstName); ?> <?php echo $page_title;?></h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
            </li>
          </ul>
          <div class="clearfix"></div>
          </div>
          <div class="x_content">        
            <div class="row">           
              <div class="col-md-12">
                <table>
                  <tr>
                    <td><h5>First Name</h5></td><td>:</td>
                    <td><b style="margin-left: 30px;"><?php echo ucwords(isset($profileinfo->FirstName)?$profileinfo->FirstName:'');?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Last Name</h5></td><td>:</td>
                    <td><b style="margin-left: 30px;"><?php echo ucwords(isset($profileinfo->LastName)?$profileinfo->LastName:'');?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Email</h5></td><td>:</td>
                    <td><b style="margin-left: 30px;"><?php echo isset($profileinfo->Email)?$profileinfo->Email:'';?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Phone</h5></td><td>:</td>
                    <td><b style="margin-left: 30px;"><?php echo isset($profileinfo->Phone)?$profileinfo->Phone:'';?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Address</h5></td><td>:</td>
                    <td><b style="margin-left: 30px;"><?php echo ucwords(isset($profileinfo->Address)?$profileinfo->Address:'');?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Profile Photo</h5></td><td>:</td>
                    <?php if (isset($profileinfo->profile_pic_path)): ?>
                    <td><img src="<?php echo base_url($profileinfo->profile_pic_path);?>" alt="file" class="img-fluid" style="width: 30%; margin-left: 30px; margin-top: 10px; margin-bottom: 10px;"></td>
              <?php else: ?>
                <td><span style="margin-left: 30px;"><?php  echo 'No Profile Photo'; ?></span></td>
            <?php endif ?>
                  </tr>

                </table>
                <a href="<?php echo base_url();?>users/edit_profile" class="btn btn btn-primary" style="margin-top: 10px;" >Edit</a>
                <a href="<?php echo base_url();?>dashboard" class="btn btn btn-default" style="margin-top: 10px;" >Back</a>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>







