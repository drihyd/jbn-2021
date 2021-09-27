<!-- PAGE HEADER : BEGIN -->
<header id="main-header">
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-white" id="main-nav">
      <div id="menu-overlay" class="main-menu-toggler"></div>
      <a href="<?php echo base_url();?>" class="navbar-brand"><img src="<?php echo base_url()?>assets/img/brand-logo.png" class="logo" alt="Brand Logo"></a>
      <button class="navbar-toggler main-menu-toggler">
        <span></span>
      </button>

      <div id="header-nav" class="collapse navbar-collapse">
        <div class="close-menu main-menu-toggler"></div>
        <ul class="navbar-nav">
          <?php $menu_item_info = $this->core->get('menu_items'); ?>


          <?php $dropdown = $this->core->menus(); ?>
          <?php if ($dropdown) { ?>
            <?php foreach ($dropdown as $key => $value) { ?>
          <li class="nav-item dropdown megamenu">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><?php echo $value->menu_name;?></a>
            <div class="dropdown-menu dropdown-megamenu" role="menu">
              <div class="dropdown-container">
                <?php if ($menu_item_info) { ?>
            <?php foreach ($menu_item_info as $key => $item) { ?>
              <?php if ($value->menu_id == $item->m_id) { ?>
                <div class="dropdown-column">
                  <h6 class="dropdown-column-title"><?php echo ucwords($item->m_item_name);?></h6>
                  <div class="dropdown-column-list" id="Goldmen">
                      <span class="menu-item nav-item">
                        <a href="./coming-soon.html" class="nav-link">Rings</a>
                      </span>
                      <span class="menu-item nav-item">
                        <a href="./coming-soon.html" class="nav-link">Bracelets</a>
                      </span> 
                  </div>
                </div>
                <?php
                } }
            } ?>
            </div>
          </li>
          <?php }
            } ?>
        </ul>
        <ul class="navbar-nav navbar-custom ml-auto">
          <li class="nav-item">
            <a href="<?php echo base_url();?>cart" class="nav-link">Cart</a>
          </li>
          <li class="nav-item dropdown">
            <a href="./coming-soon.html" class="nav-link dropdown-toggle arrow-right" data-toggle="dropdown">Login</a>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-shadow" role="menu">
              <div class="dropdown-menu-wrapper p-3">
                <h4 class="p-0 mb-2">Your Account</h4>
                    <p class="text-gray small">Access account & manage your orders.</p>
                    <ul class="list-inline mt-0 mt-md-3 mb-0 scrollEnable">
                      <li class="list-inline-item">
                        <a href="<?php echo base_url();?>login/register" class="btn btn-sm btn-brand m-0">Sign Up</span></a>
                      </li>
                      <li class="list-inline-item">
                        <a href="<?php echo base_url();?>login" class="btn btn-sm btn-default default-gray m-0">Log In</a>
                      </li>
                    </ul>
              </div>
            </div>
          </li>
          <li class="nav-item">
            <a href="./coming-soon.html" class="nav-link">Support</a>
          </li>
          <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-search"></i></a></li>
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