
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
                      <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li> -->
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-banners">+Add Banners</a></i>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <!-- <p class="text-muted font-13 m-b-30">
                      DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                    </p> -->
                   


				  <form role="form" method="post" action="<?php echo site_url()?>edit-banners-post"  class="col-md-4" enctype="multipart/form-data">
				   <input type="hidden" value="<?php echo $banners[0]->id ?>"   name="banners_id">
            <div class="form-group">
            <label for="Banner_image">Banner:</label>
            <input <?php if(isset($banners[0]->Banner_image) && !empty($banners[0]->Banner_image)){ echo "" ; } else { echo "required=required"; } ?> type="file" class="form-control" id="Banner_image" name="Banner_image" >
            <?php if(isset($banners[0]->Banner_image) && !empty($banners[0]->Banner_image)){ ?>
            <img src="<?php echo base_url();?><?php echo $banners[0]->Banner_image; ?>" class="img-responsive" width="50"/>
            <?php } ?>
            </div>     

            <div class="form-group">
        <label for="Heading_One">Is Fullwidth Banner?:</label>
        <input type="radio" value="Yes" class="" id="is_full_width_banner" name="is_full_width_banner" required <?php if($banners[0]->is_full_width_banner == 'Yes'){ echo "checked"; } ?>> Yes
        <input type="radio" value="No" class="" id="is_full_width_banner" name="is_full_width_banner" required <?php if($banners[0]->is_full_width_banner == 'No'){ echo "checked"; } ?>> No
      </div> 
	  
	  <div class="form-group">
        <label for="Heading_One">Heading One:</label>
        <input type="text" value="<?php echo $banners[0]->Heading_One ?>" class="form-control" id="Heading_One" name="Heading_One">
      </div>
      <div class="form-group">
        <label for="Heading_Two">Heading Two:</label>
        <input type="text" value="<?php echo $banners[0]->Heading_Two ?>" class="form-control" id="Heading_Two" name="Heading_Two" >
      </div>
	 <div class="form-group">
        <label for="Heading_Two">Description:</label>
        <input type="text" value="<?php echo $banners[0]->Description ?>" class="form-control" id="Description" name="Description">
      </div>
            <div class="form-group">
        <label for="Button_Name">Button Name:</label>
        <input type="text" value="<?php echo $banners[0]->Button_Name ?>" class="form-control" id="Button_Name" name="Button_Name" >
      </div>
            <div class="form-group">
        <label for="Call_to_action_URL">Call to action URL:</label>
        <input type="text" value="<?php echo $banners[0]->Call_to_action_URL ?>" class="form-control" id="Call_to_action_URL" name="Call_to_action_URL" required>
      </div>
	  <div class="form-group">
        <label for="Order_By">Panel Type:</label>
			<select class="form-control" id="Panel_Type" name="Panel_Type" required>
			<option value="Home_Banner_Panel" <?php if($banners[0]->Panel_Type == 'Home_Banner_Panel'){ echo "selected"; } ?>>Home Banner Panel</option>
			<option value="Right_Image_Panel" <?php if($banners[0]->Panel_Type == 'Right_Image_Panel'){ echo "selected"; } ?>>Right Image Panel</option>
			<option value="Left_Image_Panel" <?php if($banners[0]->Panel_Type == 'Left_Image_Panel'){ echo "selected"; } ?>>Left Image Panel</option>
			<option value="Without_Image_Panel"   <?php if($banners[0]->Panel_Type == 'Without_Image_Panel'){ echo "selected"; } ?>>New Arrivals Panel</option>
			</select>
      </div>
	  <!--
		<div class="form-group">
        <label for="Order_By">Order By:</label>
        <input type="number" value="<?php echo $banners[0]->Order_By ?>" class="form-control" id="Order_By" name="Order_By" required>
      </div>
	  -->
	  <input type="hidden" value="1" id="Order_By" name="Order_By">

            <button type="submit" class="btn btn-primary">Submit</button>
    </form>
	
	
					
					
					
                  </div>
                </div>
              </div>

  </div>
</div>




