
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-7 col-sm-7 col-xs-7">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-products">+Add Products</a>
                      </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
				   <div class="row">				   
				   <div class="col-md-12">
				   	
          <?php if($this->session->flashdata('error')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('error'); ?></strong>
</div>
  <?php } ?>
          <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>

	<form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>shipping_charges/add"  enctype="multipart/form-data" >
    
    
    <div class="row">
      <div class="col-md-4">
      <div class="form-group">
        <label for="CategorySlug">From Price<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="from_price" required="required"  value="<?php echo isset($shipping_charges_info_1[0]->from_price)?$shipping_charges_info_1[0]->from_price:'';?>">
      </div>
    </div>
    <div class="col-md-4">
      <div class="form-group">
        <label for="CategoryDesc">To Price<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="to_price" required="required"  value="<?php echo isset($shipping_charges_info_1[0]->to_price)?$shipping_charges_info_1[0]->to_price:'';?>">
      </div>
    </div>
      <div class="col-md-4">
      <div class="form-group">
      <label for="SEOKeywords">Charges<span class="text-red"style="color: red;">*</span></label>
    <input type="text" class="form-control" id="Password" name="charges" required="required" value="<?php echo isset($shipping_charges_info_1[0]->charges)?$shipping_charges_info_1[0]->charges:'';?>">
      </div>
    </div>
  </div>
  <div class="row">
      <div class="col-md-4">
      <div class="form-group">
        <label for="CategorySlug">From Price<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="from_price1" required="required"  value="<?php echo isset($shipping_charges_info_2[0]->from_price)?$shipping_charges_info_2[0]->from_price:'';?>">
      </div>
    </div>
    <div class="col-md-4">
      <div class="form-group">
        <label for="CategoryDesc">To Price<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="to_price1" required="required"  value="<?php echo isset($shipping_charges_info_2[0]->to_price)?$shipping_charges_info_2[0]->to_price:'';?>">
      </div>
    </div>
      <div class="col-md-4">
      <div class="form-group">
      <label for="SEOKeywords">Charges<span class="text-red"style="color: red;">*</span></label>
    <input type="text" class="form-control" id="Password" name="charges1" required="required" value="<?php echo isset($shipping_charges_info_2[0]->charges)?$shipping_charges_info_2[0]->charges:'';?>">
      </div>
    </div>
  </div>
  <!-- <div class="row">
      <div class="col-md-4">
      <div class="form-group">
        <label for="CategorySlug">From Price<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="from_price2" required="required"  value="<?php echo set_value('from_price');?>">
      </div>
    </div>
    <div class="col-md-4">
      <div class="form-group">
        <label for="CategoryDesc">To Price<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="to_price2" required="required"  value="<?php echo set_value('to_price');?>">
      </div>
    </div>
      <div class="col-md-4">
      <div class="form-group">
      <label for="SEOKeywords">Charges<span class="text-red"style="color: red;">*</span></label>
    <input type="text" class="form-control" id="Password" name="charges2" required="required" value="<?php echo set_value('charges');?>">
      </div>
    </div>
  </div> -->
  <!-- <div class="row">
      <div class="col-md-4">
      <div class="form-group">
        <label for="CategorySlug">From Price<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="FirstName" name="from_price3" required="required"  value="<?php echo set_value('from_price');?>">
      </div>
    </div>
    <div class="col-md-4">
      <div class="form-group">
        <label for="CategoryDesc">To Price<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="LastName" name="to_price3" required="required"  value="<?php echo set_value('to_price');?>">
      </div>
    </div>
      <div class="col-md-4">
      <div class="form-group">
      <label for="SEOKeywords">Charges<span class="text-red"style="color: red;">*</span></label>
    <input type="text" class="form-control" id="Password" name="charges3" required="required" value="<?php echo set_value('charges');?>">
      </div>
    </div>
  </div> -->
    <button type="submit" class="btn btn-primary">Submit</button>
    </form> 
	
	</div>
	</div>
					
					
					
                  </div>
                </div>
              </div>
              <div class="col-md-5 col-sm-5 col-xs-5">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Add Handling Charges</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-products">+Add Products</a>
                      </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
           <div class="row">           
           <div class="col-md-12">
            
          <?php if($this->session->flashdata('error1')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('error1'); ?></strong>
</div>
  <?php } ?>
          <?php if($this->session->flashdata('success1')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success1'); ?></strong>
</div>
  <?php } ?>
           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>shipping_charges/add_handling_charges"  enctype="multipart/form-data" >
    
      <div class="form-group" style="padding-bottom: 45px;">
        <label for="CategorySlug">Enter Amount<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="charges" name="charges" required="required"  value="<?php echo isset($handling_charges_info[0]->charges)?$handling_charges_info[0]->charges:'';?>"><br>
        <!-- <div class="btn-group" data-toggle="buttons">
            <input type="radio" name="is_enable" id="is_enable" value="enable" <?php if($handling_charges_info[0]->is_enable=="enable") { ?> checked <?php } ?>>Enable 
          </div>
          <div class="btn-group" data-toggle="buttons">
            <input type="radio" name="is_enable" id="is_enable" value="disable" <?php if($handling_charges_info[0]->is_enable=="disable") { ?> checked <?php } ?>>Disable 
          </div> -->
      </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    
      </div>
    </div>
  </div>

  </div>
</div>
</div>
</div>








