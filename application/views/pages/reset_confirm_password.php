<!-- PAGE BODY : BEGIN -->
<main class="main-content">

    <section class="info sec-login">
        <div class="container">
          <form action="<?php echo base_url('login/reset_password/token/'.$token)?>" class="needs-validation" novalidate method="post">
            <div class="form-container">
              <h2 class="form-title">
                <hr>
                <span>Reset Password</span>
              </h2>

              <div class="form-wrap mt-5">

                <label for="log-email">Enter New Password</label>
                <div class="form-group">
                  <input type="Password" class="form-control" name="password" id="log-email" value="" placeholder="New Password" required>
                  <!-- <span class="valid-feedback">Looks good!</span> -->
                  <span class="invalid-feedback">Please enter New Password</span>
                </div>
                <div class="form-group">
                  <input type="Password" class="form-control" name="passconf" id="log-email" value="" placeholder="Confirm sNew Password" required>
                  <span class="valid-feedback">Looks good!</span>
                  <span class="invalid-feedback">Please enter Confirm New Password</span>
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