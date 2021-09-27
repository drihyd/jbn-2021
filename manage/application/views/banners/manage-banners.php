
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
                   
				   
				   
<?php if($this->session->flashdata('success')){ ?>

<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>

<?php } ?>

<?php if(!empty($bannerss)) {?>
	<table id="datatable-fixed-header" class="table table-striped table-bordered" style="width:100%">
    <thead>
      <tr>
        <th>S.No.</th>
        <th>Heading One</th>
		<th>Heading Two</th>
		<th>Description</th>
		<th>Banner Image</th>
		<th>Sorting</th>
		<th>Panel Type</th>
       <th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <?php $i=1; foreach($bannerss as $banners) { ?>
      <tr>
        <td> <?php echo $i; ?> </td>
        <td> <a href="#" > <?php echo ucwords($banners->Heading_One) ?> </a> </td>
		<td> <a href="#" > <?php echo ucwords($banners->Heading_Two) ?> </a> </td>
		<td> <a href="#" > <?php echo $banners->Description ?> </a> </td>
		<td>
		<?php if(isset($banners->Banner_image) && !empty($banners->Banner_image)){ ?>
		<img src="<?php echo site_url()?><?php echo $banners->Banner_image ?>" class="img-responsive" width="40"/>
		<?php } ?>
		</td>
		<td><?php echo $banners->Order_By ?> </a> </td>
		<td><?php echo $banners->Panel_Type ?> </a> </td>
        <td>
        <a href="<?php echo site_url()?>change-status-banners/<?php echo $banners->id ?>" > <?php if($banners->status==0){ echo "<i class='fa fa-lock'></i>"; } else { echo "<i class='fa fa-unlock'></i>"; } ?></a>
        <a href="<?php echo site_url()?>edit-banners/<?php echo $banners->id?>" ><i class='fa fa-pencil-square-o'></i></a>
        <a href="<?php echo site_url()?>delete-banners/<?php echo $banners->id?>" onclick="return confirm('are you sure to delete')"><i class='fa fa-trash-o'></i></a>
        </td>

      </tr>
    <?php $i++; } ?>
    </tbody>
  </table>
  <?php } else {?>
  <div class="alert alert-info" role="alert">
                    <strong>No Bannerss Found!</strong>
                </div>
  <?php } ?>

                  </div>
                </div>
              </div>

  </div>
</div>




