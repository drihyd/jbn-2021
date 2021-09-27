<!-- PAGE BODY : BEGIN -->
<main class="main-content">

  <section class="info bg-bright my-account">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-bright border-bottom">
              <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Home</a></li>
              <li class="breadcrumb-item "><a href="<?php echo base_url();?>myaccount">My Aaccount</a></li>
              <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb_item;?></li>
            </ol>
        </nav>
      <div class="row">
        <?php echo $myaccount_sidenav;?>
        <div id="sidebar-overlay" class="myaccount-toggler"></div>
        <div class="col-lg-9">
            <div class="d-flex border-bottom justify-content-between pt-3 pb-2">
                <h5 class="text-dark text-uppercase p-0 m-0">Saved Addresses</h5>
                <a href="#" class="myaccount-toggler text-brand font-weight-bold text-uppercase menu pull-right d-block d-lg-none">menu</a>
            </div>

            <div class="my-account-info ">

               <div class="row mt-4">
                <?php if ($save_addresses) { ?>
                <?php foreach ($save_addresses as $key => $save_address) { ?>
                  <div class="col-md-4">
                    <div class="card card-ribbon my-2">
                      <?php if ($save_address->is_default == 1) { ?>
                        <span class="ribbon"><?php echo $save_address->addtype;?> -Default</span>
                     <?php }else {?>
                        <span class="ribbon"> </span>
                      <?php } ?>
                        <div class="card-body">
                            <address class="text-dark m-0">
                                <b><?php echo $save_address->Fullname;?></b><br>
                                <?php echo $save_address->Address1;?>,<br> <?php echo $save_address->Address2;?>,<?php if ($save_address->LandMark) { ?>
                                  <?php echo $save_address->LandMark;?>
                                 <?php } ?><br><?php echo $save_address->City;?><br><?php echo $save_address->State;?>,<?php echo $save_address->Country;?> - <?php echo $save_address->Pincode;?><br>
                                <span class="text-gray">Phone: </span><?php echo $save_address->Mobile;?>
                            </address>
                        </div>
                        <div class="card-footer bg-bright">
                            <a href="<?php echo site_url()?>myaccount/edit_address/<?php echo $save_address->AddressID; ?>" class="float-right text-gray"><i class="fas fa-pen"></i> Edit</a>
                            <a href="<?php echo site_url()?>myaccount/delete/<?php echo $save_address->AddressID; ?>" class="text-gray" onclick="return confirm('are you sure you want to delete')"><i class="fas fa-trash-alt"></i> Delete</a>
                        </div>
                        
                    </div>
                </div>
                <?php } }?>
               </div>
               <div class="text-center mt-4">
                    <a href="<?php echo base_url();?>myaccount/add_address" class="btn btn-brand btn-wide text-uppercase">Add New Address</a>
               </div>
            </div>

        </div>
      </div>
    </div>
  </section>
</main>