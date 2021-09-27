<!-- PAGE BODY : BEGIN -->
<main class="main-content">

  <section class="info bg-bright my-account">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-bright border-bottom">
              <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Home</a></li>
              <a class="breadcrumb-item" href="<?php echo base_url("myaccount") ?>">Myaccount</a>
              <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb_item;?></li>
              
            </ol>
        </nav>
      <div class="row">
        <div class="col-lg-3 side-bar" id="sidebar">
            <div class="card border-0">
                <div class="card-body px-0 pt-3">
                    <nav class="nav flex-column">

                        <li class="nav-item pt-0">
                          <a class="nav-link">
                            <h4 class="text-uppercase p-0 mb-4">My account</h4>
                            <div class="account-profile">
                              <div class="thumbnail">
                                <img src="<?php echo base_url();?>assets/img/android-icon-96x96.png" alt="">
                              </div>
                              <div class="profile-name"><b>Jayaraju vangapandu</b><br><span class="mail">test@gmail.com</span></div>
                            </div>
                          </a>
                        </li>

                        <li class="nav-item">
                          <ul class="list-style">
                            <li class="hrading"><i class="fas fa-file-alt mr-2 icon"></i> Orders</li>
                            <li><a href="./my-account.html">Orders</a></li>
                          </ul>
                        </li>

                        <li class="nav-item">
                          <ul class="list-style">
                            <li class="hrading"><i class="fas fa-user mr-2 icon"></i> Profile</li>
                            <li><a href="./my-address.html">Saved Addresses</a></li>
                            <li><a href="./my-cards.html">Saved Cards</a></li>
                            <li><a href="./my-change-password.html">Change Password</a></li>
                            <li><a href="./my-wishlist.html">Wishlist</a></li>
                          </ul>
                        </li>

                        <li class="nav-item">
                          <a class="nav-link" href="./login.html"><i class="fas fa-power-off mr-2"></i> Logout</a>
                        </li>

                    </nav>
                </div>
            </div>
        </div>
        <div id="sidebar-overlay" class="myaccount-toggler"></div>
        <div class="col-lg-8">
            <div class="d-flex border-bottom justify-content-between pt-3 pb-2">
                <h5 class="text-dark text-uppercase p-0 m-0">My Orders</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>

            <div class="my-account-info">

                <div class="card rounded-0 mt-3">
                    <div class="card-header row border-bottom bg-bright p-0 m-0">
                      <div class="col-12 col-md d-flex flex-row justify-content-between p-0">
                        <div class="bg-bright p-2 align-self-stretch">
                          <span class="text-dark">Order ID: 3254865577556 (1 Item)</span>
                          <br><span class="text-gray">Placed on 13 Oct, 2020</span>
                        </div>
                        <div class=" text-dark p-2">
                          SHIP TO<br>
                          <a href="#" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<div class='m-0 p-2 text-left'>
                            <p class='font-weight-bold mb-2'>Jayaraju vangapandu</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, laboriosam odio. Natus repudiandae earum nesciunt nam! Unde, minima excepturi aut ratione vero, neque illo numquam, itaque deleniti officiis ut adipisci.</p>
                          </div>">Jayaraju</a>
                        </div>
                      </div>
                      <div class="col-12 col-md d-flex flex-row justify-content-between p-0">
                          <div class="bg-bright p-2">
                          </div>
                          <div class=" align-self-stretch p-2">
                            <a href="#" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<div class='m-0 p-2 text-left'>
                              <ul class='p-0 m-0 list-unstyled'>
                                <li><a href='' class='text-bright'>P-slip/Warranty 1</a></li>
                                <li><a href='' class='text-bright'>Request Invoice</a></li>
                                <li><a href='' class='text-bright'>Printable Order Summary</a></li>
                              </ul>
                            </div>">Invoice</a>
                          </div>
                      </div>
                    </div>
                    <div class="card-body p-2 p-md-3">
                        <div class="order-summery border-0 mb-5">
                          <div class="order-list p-0">
                              <div class="thumbnail full">
                                  <img src="<?php echo base_url();?>assets/img/JR00319-YGP900_11_listfront.jpg" class="full" alt="">
                              </div>
                              <div class="order-details">
                                  <p class="title">Sphere Dome Jhumkas</p>
                                  <p class="sku">SKU: JE04237-YGP900</p>

                                  <div class="mt-2 mt-md-3 mb-0">
                                    <li class="d-block d-md-inline">
                                      <a href="./login.html" class="btn btn-sm btn-default default-gray m-0">Return / Replace</a>
                                    </li>
                                    <li class="d-block d-md-inline mt-1 mt-md-0">
                                      <a href="./my-order-details.html" class="btn btn-sm btn-brand m-0">Order Details</span></a>
                                    </li>
                                  </div>
                              </div>
                              <div class="order-price text-right">
                                  <p>₹61,761<br><del>₹65,352</del></p>
                              </div>
                          </div>
                        </div>

                        <div class="tracker">
                          <div class="tracker-header d-flex d-flex-row justify-content-between py-2 mb-4 border-bottom">
                            <p class="m-0 text-dark">Status: <span class="text-sucess">Delivered</span></p>
                            <p class="m-0 text-dark">Delivered: <span class="text-sucess">28 Oct, 2020</span></p>
                          </div>
                          <div class="tracker-body text-center">

                            <ul class="list-unstyled multi-steps">
                              <li>Confirmed</li>
                              <li>Packed</li>
                              <li class="is-active">Shipped</li>
                              <li>Out of Delivery</li>
                              <li>Delivered</li>
                            </ul>

                            <a href="./login.html" class="btn btn-sm btn-default default-gray">Track</a>

                          </div>

                        </div>
                    </div>
                    <div class="card-footer">
                      <ul class="m-0 pl-3">
                        <li>Lorem ipsum dolor sit amet consectetur</li>
                      </ul>
                    </div>
                </div>

            </div>

        </div>
      </div>
    </div>
  </section>
</main>