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
                      
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>support_leads/add">+Add New Page</a></i>
                      </li> -->
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
                          <th>Issue</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Mobile</th>
                          <th>Comments</th>
                          <th>Reply</th>
                          <th>Status</th>
                          <th>Actions</th>
                        </tr>
                      </thead>
                      <tbody>
      <?php if($support_leads) { ?>
        <?php $i=1; foreach ($support_leads as $support_lead) { ?>

<tr>
<td><?php echo $i; ?></td>
<td><?php echo ucfirst($support_lead->issue_type); ?></td>
<td><?php echo ucfirst($support_lead->name); ?></td>
<td><?php echo $support_lead->email; ?></td>
<td><?php echo $support_lead->phone; ?></td>
<td><?php echo $support_lead->comments; ?></td>
<td><?php echo $support_lead->reply; ?></td>
<td><?php echo $support_lead->status; ?></td>

<td>
<a href="<?php echo site_url()?>support_leads/view/<?php echo $support_lead->id; ?>"data-toggle="tooltip" data-placement="top" title="view" ><i class='fa fa-eye'></i></a>

<a href="<?php echo site_url()?>support_leads/delete/<?php echo $support_lead->id; ?>" onclick="return confirm('are you sure you want to delete?')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>

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

