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
                       <li class="dropdown">                     
                      <a href="<?php echo base_url('products'); ?>">Back to Products</a>
                      </li>
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>products/add">+Add Product</a></i>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <!-- <p class="text-muted font-13 m-b-30">
                      DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                    </p> -->
                   
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

        </div>
      </div>





           
<form role="form" method="post" id="add_edit_product" class="frm" action="<?php echo site_url()?>products/method_seo_createorupdate" enctype="multipart/form-data">
<div class="row">
<div class="col-md-6">
<div class="form-group">
<label for="SEOTitle">SEO Title:</label>
<input type="text" value="<?php echo $products[0]->SEOTitle ?>" class="form-control" id="SEOTitle" name="SEOTitle">
</div>
<div class="form-group">
<label for="SEODesc">SEO Description:</label>
<input type="text" value="<?php echo $products[0]->SEODesc ?>" class="form-control" id="SEODesc" name="SEODesc">
</div>
<div class="form-group">
<label for="SEOKeywords">SEO Keywords:</label>
<input type="text" value="<?php echo $products[0]->SEOKeywords ?>" class="form-control" id="SEOKeywords" name="SEOKeywords">
</div>

</div>
</div>
<button type="submit" class="btn btn-primary pull-left" id="form_submit">Submit</button>
<input type="hidden" id="ProductID" name="ProductID" value=<?php echo $products[0]->ProductID ?>>
</form>
  
  
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>




