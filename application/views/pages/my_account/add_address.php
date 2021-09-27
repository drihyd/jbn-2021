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
                <h5 class="text-dark text-uppercase p-0 m-0">Enter Your Address</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>

            <div class="my-account-info ">
                <div class="row mt-4">
                    <div class="col-lg-7">
                        <form method="post" role="form" class="needs-validation" novalidate action="<?php echo base_url()?>myaccount/add_address">
                            <div class="form-group row">
                              <label for="inputEmail3" class="col-sm-4 col-form-label">Pincode</label>
                              <div class="col-sm-8">
                                <input type="text" name="Pincode" class="form-control" id="Pincode" placeholder="Pincode" required="required" pattern="[0-9]{6}">
                                <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback">Enter Valid Pincode.</span>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label for="inputPassword3" class="col-sm-4 col-form-label">Name</label>
                              <div class="col-sm-8">
                                <input type="text" name="Fullname" class="form-control" id="Fullname" placeholder="Name" required="required" pattern="[a-zA-Z0-9\s]+">
                                <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback"> Name is Required.</span>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label for="inputPassword3" class="col-sm-4 col-form-label">DR.No/Flat.No</label>
                              <div class="col-sm-8">
                                <input type="text" name="Address1" class="form-control" id="Address1" placeholder="Name" required="required">
                                <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback"> Filed is Required.</span>
                              </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Address</label>
                                <div class="col-sm-8">
                                  <textarea name="Address2" class="form-control" id="Address2" cols="30" rows="3" required="required"></textarea>
                                  <span class="valid-feedback">Looks good!</span>
                                  <span class="invalid-feedback"> Address is Required.</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Locality / Landmark</label>
                                <div class="col-sm-8">
                                  <input type="text" name="LandMark" class="form-control" id="LandMark" placeholder="Locality/Landmark" required="required" pattern="[a-zA-Z0-9\s]+">
                                  <span class="valid-feedback">Looks good!</span>
                                  <span class="invalid-feedback"> LandMark is Required.</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">City</label>
                                <div class="col-sm-8">
                                    <input type="text" name="City" class="form-control" id="City" placeholder="City" required="required" pattern="[a-zA-Z0-9\s]+">
                                    <span class="valid-feedback">Looks good!</span>
                                    <span class="invalid-feedback"> City is Required.</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">State</label>
                                <div class="col-sm-8">
                                    <input type="text" name="State" class="form-control" id="State" placeholder="State" required="required" pattern="[a-zA-Z0-9\s]+">
                                    <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback"> State is Required.</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Country</label>
                                <div class="col-sm-8">
                                    <input type="text" name="Country" class="form-control" id="Country" placeholder="Country" required="required" value="india" pattern="[a-zA-Z0-9\s]+">
                                    <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback"> Country is Required.</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Mobile Number</label>
                                <div class="col-sm-8">
                                    <input type="text" name="Mobile" class="form-control" id="Mobile" placeholder="Phone" required="required" pattern="[6-9]{1}[0-9]{9}">
                                    <span class="valid-feedback">Looks good!</span>
                                <span class="invalid-feedback"> Please enter valid mobile Number.</span>
                                </div>
                            </div>
                            <!-- <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Alternate Mobile No.</label>
                                <div class="col-sm-8">
                                    <input type="text" name="alt-phone" class="form-control" id="alt-phone" placeholder="Alternate Mobile" required="required">
                                </div>
                            </div> -->
                            <fieldset class="form-group">
                              <div class="row">
                                <label class="col-form-label col-sm-4 pt-0">Address Type</label>
                                <div class="col-sm-8">
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="addtype" id="gridRadios2" value="shipping" checked="checked">
                                    <label class="form-check-label" for="gridRadios2">
                                      Shipping Address
                                    </label>&nbsp;
                                    <input class="form-check-input" type="radio" name="addtype" id="gridRadios2" value="billing">
                                    <label class="form-check-label" for="gridRadios2">
                                      Billing Address
                                    </label>

                                  </div>
                                  <!-- <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="addtype" id="gridRadios2" value="">
                                    <label class="form-check-label" for="gridRadios2">
                                      Billing Address
                                    </label>
                                  </div> -->
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck1" name="is_default">
                                    <label class="form-check-label" for="gridCheck1">
                                      Make this my default address
                                    </label>
                                  </div>
                                </div>
                              </div>
                            </fieldset>
                            <div class="form-group row">
                                <div class="col-sm-4"></div>
                              <div class="col-sm-8">
                                <button type="submit" class="btn btn-dark brn-wide">Save</button>
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