<!-- PAGE BODY : BEGIN -->
<main class="main-content">

    <section class="info sec-login">
        <div class="container">
          <form action="<?php echo base_url()?>login/forgot_password" class="needs-validation" novalidate method="post">
            <div class="form-container">
              <h2 class="form-title">
                <hr>
                <span>Forgot Password?</span>
              </h2>

              <div class="form-wrap mt-5">

                <label for="log-email">Enter Registered Email Address</label>
                <div class="form-group">
                  <input type="email" class="form-control" name="UserEmail" id="log-email" value="" placeholder="Email" required>
                  <!-- <span class="valid-feedback">Looks good!</span> -->
                  <span class="invalid-feedback">Please enter Email ID</span>
                </div>

                <button type="submit" class="btn btn-brand btn-block mt-5">Reset Password</button>
                </form>
                <div class="row m-0 justify-content-between mt-3">
                  <span><a href="<?php echo base_url()?>login" class="cta">LogIn!</a></span>
                  <span class="text-small text-right">New to Anaya? <a href="<?php echo base_url()?>login/register" class="cta">Create an Account</a></span>
                </div>

              </div>

            </div>
          
        </div>
    </section>

</main>