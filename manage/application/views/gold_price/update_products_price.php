
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-6 col-sm-6 col-xs-6">
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

            <span class="label label-danger">Latest Gold price (1 Gram) :<?php echo $this->goldprice->price. ' (INR)';?></span>
            
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

  
    
  <div class="form-group row">
    <!-- <label for="inputEmail3" class="col-sm-5 col-form-label">24 Kt Gold (1 Gram)</label> -->
  
  </div>
  <div class="form-group row">
    <!-- <label for="inputEmail3" class="col-sm-5 col-form-label"></label> -->
    <div class="col-sm-8">
      <a href="<?php echo base_url(); ?>Products/update_product_prices" onclick="return confirm('Are you sure update prices?')">
      <button type="submit" class="btn btn-primary">Confirm to update</button>
    </a>
    </div>
  </div>

  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>
             
              
</div>
</div>

<!--  -->







