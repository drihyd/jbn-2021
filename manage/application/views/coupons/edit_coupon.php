
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
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
				   <div class="col-md-5">
				   	<?php if(validation_errors()) { ?>
            <div class="alert alert-warning">
              <?php echo validation_errors(); ?>
            </div>
          <?php } ?>
          <?php if($this->session->flashdata('error')) { ?>
            <div class="alert alert-danger">
              <?php echo $this->session->flashdata('error'); ?>
            </div>
          <?php } ?>
          <?php if($this->session->flashdata('success')) { ?>
            <div class="alert alert-success">
              <?php echo $this->session->flashdata('success'); ?>
            </div>
          <?php } ?>
				   
	<form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>coupons/edit"  enctype="multipart/form-data" >
    
              <div class="form-group">
        <label for="Coupon_title">Coupon Title<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="Coupon_title" name="Coupon_title" required="required"  value="<?php echo isset($couponsinfo->Coupon_title)?$couponsinfo->Coupon_title:'';?>">
      </div>
      <div class="form-group">
        <label for="CouponCode">Coupon Code<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control slugForName" id="CouponCode" name="CouponCode" required="required" value="<?php echo isset($couponsinfo->CouponCode)?$couponsinfo->CouponCode:'';?>">
      </div>
            <div class="form-group">
        <label for="Description">Description<span class="text-red"style="color: red;">*</span></label>
      <textarea class="form-control" id="Description" name="Description" required="required" ><?php echo isset($couponsinfo->Description)?$couponsinfo->Description:'';?></textarea>
      </div>
      <div class="row">
    <div class="col-md-6">
    <div class="form-group" id="DiscountType">
        <label for="ParentID">Coupon Type<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="DiscountType" id="DiscountType" required="required">
          <option value="<?php echo set_select('DiscountType') ?>">-- Pick One --</option>
          <option value="fixed" <?php if(isset($couponsinfo->DiscountType) && $couponsinfo->DiscountType=="fixed") { ?> selected <?php } ?>>Fixed</option>
          <option value="percent" <?php if(isset($couponsinfo->DiscountType) && $couponsinfo->DiscountType=="percent") { ?> selected <?php } ?>>Percent</option>
        </select>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label for="Coupon_title">Coupon Value<span class="text-red"style="color: red;">*</span></label>
        <input type="number" class="form-control" id="Discount_value" name="Discount_value" required="required" value="<?php echo isset($couponsinfo->Discount_value)?$couponsinfo->Discount_value:'';?>">
      </div>
      </div>
    </div>
      <div class="form-group">
        <label for="CouponExpiryDate">Coupon Expiry Date<span class="text-red"style="color: red;">*</span></label>
        <input type="date" class="form-control" id="CouponExpiryDate" name="CouponExpiryDate" value="<?php echo isset($couponsinfo->CouponExpiryDate)?$couponsinfo->CouponExpiryDate:'';?>" required="required">
      </div>
      <div class="row">
    <div class="col-md-6">
    <div class="form-group">
  <label for="Productlive">IsActive?</label>
  <input type="radio" name="Is_Active" value="1" <?php if($couponsinfo->Is_Active=="1") { ?> checked <?php } ?>> Yes
  <input type="radio" name="Is_Active" value="0" <?php if($couponsinfo->Is_Active=="0") { ?> checked <?php } ?>  > No
  </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
  <!-- <label for="Productlive">Is Public?</label> -->
  <input type="radio" name="Is_public" value="public" <?php if($couponsinfo->Is_public=="public") { ?> checked <?php } ?>> Public
  <input type="radio" name="Is_public" value="private" <?php if($couponsinfo->Is_public=="private") { ?> checked <?php } ?>  > Private
  </div>
      </div>
    </div>
      
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" value="<?php echo $couponsinfo->CouponID; ?>" name="CouponID" id="CouponID" />
            <a href="<?php echo base_url()?>coupons" class="btn btn-default">Back</a>
    </form> 
	
	</div>
	</div>
                  </div>
                </div>
              </div>

  </div>
</div>







