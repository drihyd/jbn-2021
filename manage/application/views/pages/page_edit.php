
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
             <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>pages/edit"  enctype="multipart/form-data">       
				   <div class="row">				   
				   <div class="col-md-6">
      <div class="form-group">
        <label for="CategoryName">Name</label>
        <input type="text" class="form-control nameForSlug" id="pageName" name="name" required="required"  value="<?php echo isset($pageinfo->name)?$pageinfo->name:'';?>">
      </div>
    </div>
    <div class="col-md-6">
            <div class="form-group">
        <label for="pageSlug">Slug</label>
        <input type="text" class="form-control slugForName" id="pageSlug" name="slug" required="required" value="<?php echo isset($pageinfo->slug)?$pageinfo->slug:'';?>" readonly>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label for="pageTitle">Title</label>
        <input type="text" class="form-control" id="pageTitle" name="title" required="required"  value="<?php echo isset($pageinfo->title)?$pageinfo->title:'';?>">
      </div>
    </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="pageKeywords">Keywords</label>
          <textarea class="form-control input-sm" id="pageKeywords" name="keywords" rows="2"><?php echo isset($pageinfo->keywords)?$pageinfo->keywords:'';?></textarea>
        </div>
      </div>
        
	
  <div class="col-md-12">
    <div class="form-group">
      <label for="pageContent">Content</label>
      <textarea class="form-control mce" id="page_editor" name="content" required="required"><?php echo isset($pageinfo->content)?$pageinfo->content:'';?></textarea>
    </div>
  </div>
  <div class="col-md-3">
  <div class="form-group">
        <label for="FeaturedImage">Featured Image (optional)</label>
        <input type="file"  id="FeaturedImage" name="FeaturedImage">
      </div>
            <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  <div class="col-md-3">
      <div class="form-group">
        <label for="order_logic">Order by</label>
        <input type="number" class="form-control" id="order_logic" name="order_logic"required="required" value="<?php echo isset($pageinfo->order_logic)?$pageinfo->order_logic:'';?>">
      </div>
      </div>
  <input type="hidden" value="<?php echo $pageinfo->id; ?>" name="pageID" id="pageID" />
  </form> 
	</div>

    </div>
  </div>
</div>
  </div>
</div>





