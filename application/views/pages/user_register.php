<!-- PAGE BODY : BEGIN -->
<main class="main-content">

    <section class="info sec-login">
        <div class="container" >
          <!-- <form action="" class="needs-validation" novalidate> -->
            <div class="form-container">
              <h2 class="form-title">
                <hr>
                <span>Sign Up with Anaya</span>
              </h2>

              <div class="form-title-small"><span>Using</span></div>

              <div class="form-social-wrap">


            <a href="JavaScript:void(0)" onclick="fblogin();">
            <button class="btn btn-default default-facebook btn-block with-icon"><i class="fab fa-facebook-square icon facebook"></i>Facebook</button>
            </a>
            <a href="<?php echo base_url('userLogin/login/Google'); ?>">
            <button href="" class="btn btn-default default-google btn-block mt-4 with-icon"><i class="fab fa-google icon google"></i>Gmail</button>
            </a>
              </div>

              <div class="form-title-small"><hr><span>OR</span></div>
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
              <form method="post" role="form" class="needs-validation" novalidate action="<?php echo site_url()?>login/register" >
            <div class="form-wrap">
              <label for="log-email">Enter FullName <span style="color: red">*</span></label>
              <div class="form-group">
                <input type="text" class="form-control" id="log-email" name="UserFirstName" value="" placeholder="FullName" required pattern="[a-zA-Z0-9\s]+">
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback"> Name is Required.</span>
              </div>

              <label for="log-email">Enter Email <span style="color: red">*</span></label>
              <div class="form-group">
                <input type="email" class="form-control" id="log-email" name="UserEmail" value="" placeholder="Email" required>
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback"> choose a username.</span>
              </div>

              <label for="log-email">Enter Password <span style="color: red">*</span></label>
              <div class="form-group pass_show">
                <input type="password" class="form-control" id="log-password" name="UserPassword" value="" placeholder="Password" required>
              </div>

              <label for="log-email">Confirm Password <span style="color: red">*</span></label>
              <div class="form-group pass_show">
                <input type="password" class="form-control" id="log-password" name="confirm_password" value="" placeholder="Password" required>
              </div>

              <div class="row">
                  <div class="col">
                      <label for="log-email">Select Gender <span style="color: red">*</span></label>
                      <div class="form-group">
                          <select class="form-control custom-select" name="UserGender" id="" required>
                              <option value="" selected disabled>Gender</option>
                              <option value="male">Male</option>
                              <option value="female">Female</option>
                          </select>
                        </div>
                  </div>
                  <div class="col">
                      <label for="log-email">Mobile number <span style="color: red">*</span></label>
                      <div class="form-group">
                          <input type="text" class="form-control" id="phone" name="UserPhone" value="" placeholder="Phone" required pattern="[6-9]{1}[0-9]{9}">
                        </div>
                  </div>
              </div>

              <button type="submit" class="btn btn-brand btn-block mt-5">Register</button>
              </form>
              <div class="row m-0 justify-content-center mt-3">
                <span class="text-small text-right">Already have an account?
                  <a href="<?php echo base_url()?>login" class="cta">Login!</a></span>
              </div>
            </div>
            

            </div>
          <!-- </form> -->
        </div>
    </section>

</main>