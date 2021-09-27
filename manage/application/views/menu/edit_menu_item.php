
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
           
  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url("menu_items/edit/$m_id/$menu_item->m_item_id")?>"  enctype="multipart/form-data" >
    
    <div class="form-group" id="ParentID">
        <label for="m_position">Menu Items List<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="parent_id" id="parent_id" required="required" >
          <option value="0">-- Create/Select Submenu --</option>
          <?php
            foreach ($menu_items as  $item) {
              if ($item->mi_parent_id == $item->mitemid) {
                echo '<option value="'.$item->mitemid.'" selected>'.ucwords($item->mitemname).'</option>';
              }
            else{
              echo '<option value="'.$item->mitemid.'">'.ucwords($item->mitemname).'</option>';
            }
          }
              ?>   
        </select>
      </div>
    <div class="form-group">
        <label for="m_name">Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control " id="m_item_name" name="m_item_name" required="required" value="<?php echo isset($menu_item->m_item_name)?$menu_item->m_item_name:'';?>">
      </div>
   
      <div class="form-group">
        <label for="m_url">MenuItem URL<span class="text-red"style="color: red;"></span></label>
        <input type="text" class="form-control" id="m_item_url" name="m_item_url" value="<?php echo isset($menu_item->m_item_url)?$menu_item->m_item_url:'';?>">
      </div>
      <div class="form-group">
        <label for="CategorySlug">Description<span class="text-red"style="color: red;"></span></label>
        <textarea type="text" class="form-control" id="m_item_desc" name="m_item_desc" rows="2"><?php echo isset($menu_item->m_item_desc)?$menu_item->m_item_desc:'';?></textarea>
      </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          <input type="hidden" name="menu_ItemID" id="menu_ItemID" value="<?php echo isset($menu_item->m_item_id); ?>"> 
          <input type="hidden" name="m_id" value="<?php echo $menu_item->m_id ?>"> 
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>

  </div>
</div>







