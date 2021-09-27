<style type="text/css">
body{
  background-color: #000000 !important;
}
.btn.btn-block {
    padding: 5px 5px;
    background-color: #4E4949;
    border-radius: 10px;
    color: #fff;
    font-size: 16px;
    }
</style>

<div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <div>
              <img src="<?php echo base_url(); ?>manage-assets/images/anaya-logo.png" alt="Anaya-logo" class="header-logo" width="40%">
            </div>
            <?php if($this->session->flashdata('msg')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('msg'); ?></strong>
                 </div>
            <?php }?>
            <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>Login/auth">
              
              <h1>Login</h1>
              <div>
                <input type="email" class="form-control" name="Email" placeholder="Enter Email" required="required" />
              </div>
              <div>
                <input type="password" class="form-control" name="Password" placeholder="Enter Password" required="required" />
              </div>
              <div class="align-left" style="text-align:left; ">
                <button type="submit" class="btn btn-block"><strong>Login</strong></button>
                <!-- <a class="reset_pass" href="#">Lost your password?</a> -->
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <!-- <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p> -->

                <!-- <div class="clearfix"></div> -->
                <br />

                <!-- <div>
                  <h1><i class="fa fa-paw"></i> Anaya Jewellery</h1>
                  <p>©2020 All Rights Reserved. Anaya Jewellery. Privacy and Terms</p>
                </div> -->
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Login </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                  <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
