<!-- --PAGE HEADER : BEGIN  -->
<?php
if(is_array(count_cart())){  
  $cart_items=count_cart();
  $cart_items= $cart_items['total_items'];
}
else{
  $cart_items=0;
}

if(count_wishlists()){  
  $count_wishlists=count_wishlists();
}
else{
  $count_wishlists=0;
}


   
    ?>
<header id="main-header">
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-white" id="main-nav">
      <div id="menu-overlay" class="main-menu-toggler"></div>
      <a href="<?php echo base_url()?>" class="navbar-brand"><img src="<?php echo base_url()?>assets/img/anaya-logo-new.png" class="logo header-logo img-fluid" alt="Brand Logo"></a>
      <button class="navbar-toggler main-menu-toggler">
        <span></span>
      </button>

      <ul class="navbar-nav d-block d-lg-none d-xl-none ml-auto">
        <li>
          <a href="#" class="cart-icon">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count">0</span>
          </a>
        </li>
      </ul>

      <div id="header-nav" class="collapse navbar-collapse">
        <div class="close-menu main-menu-toggler"></div>
        <ul class="navbar-nav">          
          <?php if ($this->nav_jbn_menu) { ?>
            <?php 

$loopcount=1;
            foreach ($this->nav_jbn_menu as $key => $menu) { ?>
              <?php if($menu->parent_id == 0 && ($menu->is_display=="Yes" || $menu->is_display=="yes")) { ?>

          <li class="nav-item dropdown">
            <?php if($menu->is_nav_dropdown=="Yes" || $menu->is_nav_dropdown=="yes") { ?>
            <a class="nav-link dropdown-toggle" href="<?php echo $menu->m_item_url;?>" data-toggle="dropdown"><strong><?php echo $menu->m_item_name;?></strong></a>
            <?php } else { ?>
            <a class="nav-link" href="<?php echo $menu->m_item_url;?>"><strong><?php echo $menu->m_item_name;?></strong></a>
            <?php } ?>
  <?php if($menu->is_nav_dropdown=="Yes" || $menu->is_nav_dropdown=="yes") { ?>
            <div class="dropdown-menu megamenu">  
              <div class="dropdown-content">

                <ul class="nav nav-tabs tabs-megamenu">
                  <?php $k=1;foreach ($this->nav_jbn_menu as $key => $sub_menu) { 
                      if($k==1){
                         $active_status="active";
                      }else{                    
                          $active_status=" ";
                      }
                    ?>
                  <?php if($sub_menu->parent_id == $menu->m_item_id) { ?>
                  <li class="nav-item ">
                    <a class="nav-link <?php echo $active_status;?>" data-toggle="tab" href="#jbn-<?php echo $sub_menu->m_item_name;?>-<?php echo $loopcount;?>"><?php //echo ucwords($sub_menu->m_item_name);?></a>
                  </li> 
                  <?php $k++; }} ?>
                </ul>

                <div class="tab-content">
                  <?php 
                    $sno=1;
                  foreach ($this->nav_jbn_menu as $key => $sub_menu) { ?>
                    <?php if($sub_menu->parent_id == $menu->m_item_id) { 
                      if($sno==1){
                        $active_status="active";
                      }else{
                          $active_status=" ";
                      }
                      ?>
                  <div class="tab-pane tab-pane <?php echo $active_status;?>" id="jbn-<?php echo $sub_menu->m_item_name;?>-<?php echo $loopcount;?>">
                    <ul class="dropdown-menu-list">
                      <!-- list - 1 -->
                      <?php foreach ($this->nav_jbn_menu as $key => $sub_menu_1) { ?>
                    <?php if($sub_menu_1->parent_id == $sub_menu->m_item_id) { ?>
                      <li>
                        <span class="list-title"><?php echo ucwords($sub_menu_1->m_item_name);?></span>
                        <ul>
                          <?php foreach ($this->nav_jbn_menu as $key => $sub_menu_2) { ?>
                    <?php if($sub_menu_2->parent_id == $sub_menu_1->m_item_id) { ?>
                            <li><a href="<?php echo $sub_menu_2->m_item_url;?>"><?php echo ucwords($sub_menu_2->m_item_name);?> </a></li>
                            <?php }}?>
                        </ul>
                      </li>
                    <?php $sno++;}}?>
                      <!-- list - 2 -->
                    </ul>
                  </div>
                <?php } }?>
                </div>
              </div>
              <!-- <div class="dropdown-footer">
                <table class="table">
                  <tr>
                    <th>Refund Poliacy</th>
                    <td>You should not need those, but in case.</td>
                  </tr>
                  <tr>
                    <th>Site Privacy</th>
                    <td>We offer trial, you will love it.</td>
                  </tr>
                </table>
              </div> -->
            </div>

<?php } ?>


          </li>
        <?php }

$loopcount++;

      }

    } ?>
          <?php if ($this->primary_menu) { ?>
            <?php foreach ($this->primary_menu as $key => $menu) { ?>
              <?php if($menu->parent_id == 0) { ?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="<?php echo $menu->m_item_url;?>" data-toggle="dropdown"><?php echo $menu->m_item_name;?></a>
            <div class="dropdown-menu megamenu">
              <div class="dropdown-content">
                <ul class="dropdown-menu-list">
                  <!-- list - 1 -->
                <?php foreach ($this->primary_menu as $key => $sub_menu) { ?>
                  <?php if($sub_menu->parent_id == $menu->m_item_id) { ?>
                  <li>
                    <span class="list-title"><?php echo $sub_menu->m_item_name?></span>
                    <ul>
                      <?php foreach ($this->primary_menu as $key => $sub_menu_1) { ?>
                          <?php if($sub_menu_1->parent_id == $sub_menu->m_item_id) { ?>
                        <li><a href="<?php echo $sub_menu_1->m_item_url?>"><?php echo ucwords($sub_menu_1->m_item_name)?></a></li>
                      <?php }
                        } ?>
                    </ul>
                  </li>

                  <?php 
                      }
                      } ?>
                </ul>   
              </div>
              <!-- <div class="dropdown-footer">
                <table class="table">
                  <tr>
                    <th>Refund Poliacy</th>
                    <td>You should not need those, but in case.</td>
                  </tr>
                  <tr>
                    <th>Site Privacy</th>
                    <td>We offer trial, you will love it.</td>
                  </tr>
                </table>
              </div> -->
            </div>
          </li>
        <?php } 
            } } ?>
        </ul>
        <ul class="navbar-nav navbar-custom ml-auto">

  <!--<li class="nav-item">-->
  <!--  <a class="nav-link" target="_blank" href="https://api.whatsapp.com/send?phone=919949236006">-->
  <!--      <i class="fab fa-whatsapp fa-2x"></i>-->
  <!--  </a>-->
  <!--</li>-->

<?php 
if(isset($_SESSION['anaya_user_data']) && $_SESSION['anaya_user_data'] != '') {  ?>
    <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle arrow-right" data-toggle="dropdown">My Account <?php //echo ucwords($_SESSION['anaya_user_data']->UserFirstName);?> <?php //echo ucwords($_SESSION['anaya_user_data']->UserLastName);?><i class="fas fa-user"></i><!-- <?php if(isset($email1[0])) echo ucfirst($email1[0]) ?> --></a>
            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-shadow" role="menu">
              <li class="nav-item p-3 bg-bright">
                <h4 class="p-0 mb-0"><?php echo $_SESSION['anaya_user_data']->UserFirstName;?> <?php echo $_SESSION['anaya_user_data']->UserLastName;?></h4>
                 <!--    <p class="text-gray small mb-0"></p> -->
              </li>
              <hr class="m-0">
              <li class="nav-item px-3 py-2">
                <a href="<?php echo base_url()?>myaccount" class="nav-link p-0">My Dashboard</a>
              </li>
              <li class="nav-item px-3 py-2">
                <a href="<?php echo base_url()?>login/logout" class="nav-link p-0">Logout</a>
              </li>
            </ul>
          </li>
  <?php }else{ ?>
        <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle arrow-right" data-toggle="dropdown">Login</a>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-shadow" role="menu">
              <div class="dropdown-menu-wrapper p-3">
                <h4 class="p-0 mb-2">Your Account</h4>
                    <p class="text-gray small">Access account & manage your orders.</p>
                    <ul class="list-inline mt-0 mt-md-3 mb-0 scrollEnable">
                      <li class="list-inline-item">
                        <a href="<?php echo base_url();?>login/register" class="btn btn-sm btn-brand m-0">Sign Up</span></a>
                      </li>
                      <li class="list-inline-item">
                        <a href="<?php echo base_url();?>login" class="btn btn-sm btn-default default-gray m-0">Login</a>
                      </li>
                    </ul>
              </div>
            </div>
          </li>
 <?php } ?>

          
          <li class="nav-item">
            <a href="<?php echo base_url();?>support" class="nav-link">Support</a>
          </li>
          <li class="nav-item align-items-center d-none d-lg-flex d-xl-flex">
            <form action="<?php echo base_url('products') ?>" method="get" id="search-form">
              <div class="form-group has-search m-0">
                <span class="fa fa-search form-control-feedback"></span>
                <input name="q" type="search" class="form-control" placeholder="Search">
              </div>
            </form>
          </li>
          <li class="nav-item d-none d-lg-flex d-xl-block ml-2">
            <span class="nav-link">
              <a href="<?php echo base_url();?>cart/wishlist" class="cart-icon"><i class="fas fa-heart"></i>
			  
			  <?php if(isset($count_wishlists) && $count_wishlists>0) {?>
			  
                <span class="cart-count"><?php echo $count_wishlists;?></span>
			  <?php } ?>
			  
			  </a>
            </span>
          </li>
          <li class="nav-item d-none d-lg-flex d-xl-block">
            <span class="nav-link">
              <a href="<?php echo base_url();?>cart" class="cart-icon"> <i class="fas fa-shopping-cart"></i>
			  
			  <?php if(isset($cart_items) && $cart_items>0) {?>			 
                <span class="cart-count"><?php echo $cart_items;?></span>
				<?php } ?>
				</a>
            </span>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</header>
<!-- PAGE HEADER : END -->

<!-- PAGE ACTIVE SCRIPT : BEGIN -->
<script>
  var activePage    = "link-home";
  var activeSubPage = null;
</script>
 <!-- PAGE ACTIVE SCRIPT : END -->