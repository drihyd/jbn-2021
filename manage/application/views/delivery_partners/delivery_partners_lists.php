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
                      
                      <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>delivery_partners/add">+Add New</a></i>
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
                    <table id="datatable-fixed-header" class="table table-striped table-bordered" style="width:100%">
                      <thead>


                        <tr>
                          <th>S.NO</th>
                          <th>Name</th>
                          <th>API URL</th>
                          <th>Address</th>
                          <th>Mobile</th>
                          <th>Actions</th>
                          
                        </tr>
                      </thead>
                      <tbody>
      <?php if($delivery_partners_info) { ?>
        <?php $i=1; foreach ($delivery_partners_info as $page) { ?>

<tr>
<td><?php echo $i; ?></td>
<td><?php echo ucwords($page->name); ?></td>
<td><?php echo $page->api_url; ?></td>
<td><?php echo $page->address; ?></td>
<td><?php echo $page->mobile; ?></td>
<td>
<a href="<?php echo site_url()?>delivery_partners/edit/<?php echo $page->id; ?>" data-toggle="tooltip" data-placement="top" title="edit"><i class='fa fa-pencil-square-o'></i></a>
<a href="<?php echo site_url()?>delivery_partners/delete/<?php echo $page->id; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>

</td>
</tr>
<?php $i++; }
} 
?> 
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
  </div>
</div>

