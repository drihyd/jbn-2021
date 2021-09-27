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
                      <?php if (!empty($shipping_charges_info)) { ?>
                        <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>shipping_charges/add">+Edit</a></i></li>
                      <?php }else{ ?>
                      <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>shipping_charges/add">+Add New</a></i>
                      </li>
                    <?php } ?>
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
                          <th>Type of Charges</th>
                          <th>From Price</th>
                          <th>To Price</th>
                          <th>Charges</th>
                        </tr>
                      </thead>
                      <tbody>
      <?php if($shipping_charges_info) { ?>
        <?php $i=1; foreach ($shipping_charges_info as $page) { ?>

<tr>
<td><?php echo $i; ?></td>
<?php if ($page->slug == 'shipping_charge_1' || $page->slug == 'shipping_charge_2') { ?>
  <td>Shipping Charges</td>
<?php }else{ ?>
  <td>Handling Charges</td>
<?php } ?>

<?php if ($page->from_price) { ?>
  <td><?php echo $page->from_price; ?></td>
<?php } else{ ?>
  <td>0</td>
<?php } ?>

<?php if ($page->to_price) { ?>
<td><?php echo $page->to_price; ?></td>
<?php } else{ ?>
  <td>0</td>
<?php } ?>
<td><?php echo $page->charges; ?></td>

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

