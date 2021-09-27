<?php 

if(isset($_SESSION['anaya_user_data']) && $_SESSION['anaya_user_data'] != '') {  ?>

  <?php
  $user_id     = $_SESSION['anaya_user_data']->UserID;
  $user_f_name = $_SESSION['anaya_user_data']->UserFirstName;
  $user_l_name = $_SESSION['anaya_user_data']->UserLastName;
  $user_email  = $_SESSION['anaya_user_data']->UserEmail;
  ?>
<?php } ?>
<!--  -->

<div class="col-lg-3 side-bar" id="sidebar">
            <div class="card border-0">
                <div class="card-body px-0 pt-3">
                    <nav class="nav flex-column">

                        <li class="nav-item pt-0">
                          <a class="nav-link">
                            <h4 class="text-uppercase p-0 mb-4">My account</h4>
                            <div class="account-profile">
                              <!-- <div class="thumbnail">
                                <img src="<?php //echo base_url();?>assets/img/android-icon-96x96.png" alt="">
                              </div> -->
                              <?php
                              if ($user_f_name) {
                               $firstname=  $user_f_name[0];
                              }else{

                              }
                              ?>
                              <div class="profile-letter">
                                <h2><?php echo ucwords($firstname);?></h2>
                              </div>
                              <div class="profile-name"><b><?php echo ucwords($user_f_name);?> <?php echo ucwords($user_l_name);?></b><br><span class="mail"><?php echo $user_email;?></span></div>
                            </div>
                          </a>
                        </li>

                        <li class="nav-item">
                          <ul class="list-style">
                            <li class="hrading"><i class="fas fa-file-alt mr-2 icon"></i> Orders</li>
                            <li><a href="<?php echo base_url()?>myaccount/orders">Orders</a></li>
                          </ul>
                        </li>
                        <li class="nav-item">
                          <ul class="list-style">
                            <li class="hrading"><i class="fas fa-user mr-2 icon"></i> Profile</li>
                            <li><a href="<?php echo base_url();?>myaccount/saved_addresses">Saved Addresses</a></li>
                            <!-- <li><a href="./my-cards.html">Saved Cards</a></li> -->
                            <li><a href="<?php echo base_url()?>myaccount/change_password">Change Password</a></li>
                            <li><a href="<?php echo base_url();?>myaccount/my_wishlist">Wishlist</a></li>
                          </ul>
                        </li>

                        <li class="nav-item">
                          <a class="nav-link" href="<?php echo base_url()?>login/logout"><i class="fas fa-power-off mr-2"></i> Logout</a>
                        </li>

                    </nav>
                </div>
            </div>
        </div>