<div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<?php echo base_url(); ?>dashboard" class="site_title"><img src="<?php echo base_url()?>manage-assets/images/jbn-logo.png"></a>
            </div>
            <!-- <img src="<?php echo base_url();?>manage-assets/images/anaya-logo-side.jpg">  -->

            <div class="clearfix"></div>
           

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <?php if (isset($this->admin_user->profile_pic_path)): ?>
              <div class="profile_pic">
                <img src="<?php echo base_url($this->admin_user->profile_pic_path);?>" alt="Profile pic" class="img-circle profile_img">
              </div>
              <?php else: ?>
              <div class="profile_pic">
                <img src="<?php echo base_url(); ?>manage-assets/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <?php endif ?>
              <div class="profile_info">
                <?php
                    if (isset($_SESSION['Email'])) {
                      $email=$_SESSION['Email'];
                      $email=explode("@", $email);
                    }  
                  ?>
                <span>Welcome,</span>
                <h2><?php echo ucwords($this->admin_user->FirstName); ?></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <!-- <h3>General</h3> -->
                <ul class="nav side-menu">
                  <li><a href="<?php echo base_url(); ?>dashboard"><i class="fa fa-home"></i> Dashboard </a></li>
				  <!-- <li><a href="<?php echo base_url(); ?>manage-banners"><i class="fa fa-image"></i> Banners </a> -->
    
                  </li>
                  <li><a href="<?php echo base_url(); ?>categories"><i class="fa fa-shopping-bag"></i> Categories </a>
    
                  </li>
  
                  <li><a><i class="fa fa-product-hunt"></i> Products <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?php echo base_url(); ?>products">Products</a></li>
                      <li><a href="<?php echo base_url(); ?>products/import_products">Import Products</a></li>
                      <li><a href="<?php echo base_url(); ?>product_groups">Product Groups</a></li>
                      <li><a href="<?php echo base_url(); ?>images_upload">Bulk Images upload</a></li>
                      <li><a href="<?php echo base_url(); ?>videos_upload">Bulk Videos upload</a></li>
                    </ul>
                  </li>
     <li><a><i class="fa fa-money"></i>Gold Price<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
      
                      <li><a href="<?php echo base_url(); ?>gold_price">Today Price</a></li>
                      <li><a href="<?php echo base_url(); ?>gold_price/update_product_prices">Update Product Prices</a></li>
    
                      
                    </ul>
                  </li>

                  <li><a><i class="fa fa-first-order"></i> Orders <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?php echo base_url(); ?>orders">View Orders</a></li>
                      <li><a href="<?php echo base_url(); ?>orders/status/confirmed">Confirmed Orders</a></li>
                      <li><a href="<?php echo base_url(); ?>orders/status/processing">Processing Orders</a></li>
                      <li><a href="<?php echo base_url(); ?>orders/status/dispatched">Dispatched Orders</a></li>
                      <li><a href="<?php echo base_url(); ?>orders/status/delivered">Delivered Orders</a></li>
                      <li><a href="<?php echo base_url(); ?>orders/status/cancelled">Cancelled Orders</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-money"></i> Payments <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?php echo base_url(); ?>payments">View Payments</a></li>
                    </ul>
                  </li>
            



                  <li><a><i class="fa fa-ticket"></i> Coupons <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?php echo base_url(); ?>coupons">View  Coupons</a></li>
                      <!-- <li><a href="<?php// echo base_url(); ?>images_upload">Bulk Images upload</a></li> -->
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-file-text-o"></i> Content pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <!-- <li><a href="<?php //echo base_url(); ?>bulk_images_upload">Bulk Image upload</a></li> -->
                      <li><a href="<?php echo base_url(); ?>pages">Pages</a></li>
                      <li><a href="<?php echo base_url(); ?>manage-banners">Banners</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-cog"></i>Settings<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <!-- <li><a href="<?php echo base_url(); ?>bulk_images_upload">Bulk Image upload</a></li> -->
                      <li><a href="<?php echo base_url(); ?>users">Users</a></li>
                      <li><a href="<?php echo base_url(); ?>menu">Menu</a></li>
                      <li><a href="<?php echo base_url(); ?>shipping_charges">Applicable Charges</a></li>
                      <li><a href="<?php echo base_url(); ?>custom_attributes">Custom Attributes</a></li>
                      <li><a href="<?php echo base_url(); ?>delivery_partners">Delivery Partners</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-comments-o"></i>Leads<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
      
                      <li><a href="<?php echo base_url(); ?>support_leads">Support Leads</a></li>
                      <li><a href="<?php echo base_url(); ?>Contact_us_leads">Contact Us Leads</a></li>
                      <li><a href="<?php echo base_url(); ?>newsletter_leads">Newsletter Leads</a></li>
                      
                    </ul>
                  </li>
                  <!-- <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li> -->
                  <!-- <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li> -->
                  <!-- <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li> -->
                </ul>
              </div>
              <div class="menu_section">
                <!-- h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul> -->
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <!-- <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a> -->
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="<?php echo site_url()?>login/logout" class="pull-right" >
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

