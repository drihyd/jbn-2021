<!-- PAGE BODY : BEGIN -->
<main class="main-content">

  <section class="info bg-bright my-account">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-bright border-bottom">
              <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Home</a></li>
              <li class="breadcrumb-item "><a href="<?php echo base_url();?>myaccount">My Account</a></li>
              <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb_item;?></li>
            </ol>
        </nav>
      <div class="row">
        <?php echo $myaccount_sidenav;?>
        <div id="sidebar-overlay" class="myaccount-toggler"></div>
        <div class="col-lg-9">
            <div class="d-flex border-bottom justify-content-between pt-3 pb-2">
                <h5 class="text-dark text-uppercase p-0 m-0">Change Password</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>

            <div class="my-account-info ">

                <div class="row mt-4">
                    <div class="col-lg-7">
                        <form method="post" role="form" class="needs-validation" novalidate action="<?php echo base_url();?>myaccount/change_password">
                            <div class="form-group row">
                              <label for="inputEmail3" class="col-sm-4 col-form-label">Old Password</label>
                              <div class="col-sm-8">
                                <input type="password" name="old_password" class="form-control" id="old_password" placeholder="Old Password" required="required">
                              </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">New Password</label>
                                <div class="col-sm-8">
                                  <input type="password" name="new_password" class="form-control" id="new_password" placeholder="New Password" required="required">
                                  <!-- <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback">Enter Old Password.</span> -->
                                </div>
                            </div>
                            <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-4 col-form-label">Confirm Password</label>
                                <div class="col-sm-8">
                                    <input type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="Confirm Password" required="required">
                                    <!-- <span class="valid-feedback">Looks good!</span>
                                    <span class="invalid-feedback">Enter Confirm Password.</span> -->
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-4"></div>
                              <div class="col-sm-8">
                                <button type="submit" class="btn btn-brand brn-wide">Change</button>
                              </div>
                            </div>
                          </form>
                    </div>
                </div>
            </div>

        </div>
      </div>
    </div>
  </section>
</main>