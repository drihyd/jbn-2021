
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
				   
	<form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>menu/edit_menu"  enctype="multipart/form-data" >
    <div class="form-group">
        <label for="m_name">Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control nameForSlug" id="m_name" name="m_name" required="required" value="<?php echo isset($menuinfo->m_name)?$menuinfo->m_name:'';?>">
      </div>
      <div class="form-group">
        <label for="m_name">Slug<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control slugForName" id="m_slug" name="m_slug" required="required" value="<?php echo isset($menuinfo->m_slug)?$menuinfo->m_slug:'';?>" readonly>
      </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" value="<?php echo $menuinfo->m_id; ?>" name="MenuID" id="MenuID" />
    </form> 
	
	</div>
	</div>
                  </div>
                </div>
              </div>

  </div>
</div>







