            

<?php $class_router=$this->router->class;?>
<?php $class_method=$this->router->method;?>
              <h2 class="form-title">
                <hr>
                <span>Login to Anaya</span>
              </h2>
              <div class="form-title-small"><span>Using</span></div>
              <div class="form-social-wrap">
                <a href="JavaScript:void(0)" onclick="fblogin();">
                <button class="btn btn-default default-facebook btn-block with-icon"><i class="fab fa-facebook-square icon facebook"></i>Facebook</button>
                </a>                 
                <a href="<?php echo base_url('userLogin/login/Google/'.$class_method); ?>">
                <button   class="btn btn-default default-google btn-block mt-4 with-icon"><i class="fab fa-google icon google"></i>Gmail</button>
                </a>              
              </div>



              <div class="form-title-small"><hr><span>OR</span></div>
              <?php if(validation_errors()) { ?>
            <div class="alert alert-warning">
              <?php echo validation_errors(); ?>
            </div>
          <?php } ?>
              <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>
  <?php if($this->session->flashdata('flash_message')){ ?>
                <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('flash_message'); ?></strong>
</div>
  <?php } ?>
  <?php if($this->session->flashdata('error')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('error'); ?></strong>
</div>
  <?php } ?>
            <form id="form" class="needs-validation" novalidate method="post" action="<?php echo base_url()?>login/auth">
             
              <!-- <div class="form-wrap"> -->
                <label for="log-email">Enter Email <span style="color: red">*</span></label>
                <div class="form-group">
                  <input type="email" class="form-control" id="log-email" name="UserEmail" value="" placeholder="Email" required >
                  <!-- <span class="valid-feedback">Looks good!</span> -->
                  <span class="invalid-feedback">Please enter Email ID</span>
                </div>

                <label for="log-email">Enter Password <span style="color: red">*</span></label>
                <div class="form-group pass_show">
                  <input type="password" class="form-control" id="log-password" name="UserPassword" value="" placeholder="Password" required>
                </div>

                <button type="submit" class="btn btn-brand btn-block mt-5">Login to Continue</button>
            </form>
                <div class="row m-0 justify-content-between mt-3">
                  <span><a href="<?php echo base_url()?>login/forgot_password" class="cta">Forgot Password?</a></span>
                  <span class="text-small text-right">New to Anaya? <a href="<?php echo base_url()?>login/register" class="cta">Create an Account</a></span>
                </div>
              <!-- </div> -->
       

  