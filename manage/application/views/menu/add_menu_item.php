
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
				   
	<form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>menu_items/add/<?php echo $m_id ?>"  enctype="multipart/form-data" >
    <input type="hidden" name="m_id" value="<?php echo $m_id ?>">
    <div class="form-group" id="ParentID">
        <label for="m_position">Menu Items List<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="parent_id" id="parent_id" required="required" >
          <option value="0">-- Create/Select Submenu --</option>

          <?php
          if (!empty($menu_items)) {
            foreach ($menu_items as  $item) {
              echo '<option value="'.$item->m_item_id.'">'.ucwords($item->m_item_name).'</option>';
            }
          }
              ?>   
        </select>
      </div>
    <div class="form-group">
        <label for="m_name">Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control " id="m_item_name" name="m_item_name" required="required">
      </div>
   
      <div class="form-group">
        <label for="m_url">MenuItem URL<span class="text-red"style="color: red;"></span></label>
        <input type="url" class="form-control" id="m_item_url" name="m_item_url">
      </div>
      <div class="form-group">
        <label for="CategorySlug">Description<span class="text-red"style="color: red;"></span></label>
        <textarea type="text" class="form-control" id="m_item_desc" name="m_item_desc" rows="2"></textarea>
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







