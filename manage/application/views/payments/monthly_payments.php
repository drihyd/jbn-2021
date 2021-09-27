<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>All Payments</h2>
                    <!-- <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
            
                    </ul> -->
                    <div class="clearfix"></div>

                  </div>
                      <div class="tabbable-panel">
        <div class="tabbable-line">
          <ul class="nav nav-tabs ">
            <li >
              <a href="<?php echo base_url()?>payments">
              Recent Payments</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>payments/today">
              Today Payments</a>
            </li>
            <li class="active">
              <a href="<?php echo base_url()?>payments/month">
              Monthly Payments</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>payments/from_to">
              From - To Payments</a>
            </li>
          </ul>
        </div>
      </div>
                </div>
              </div>


<!-- page content -->
<!-- <div class="right_col" role="main">
  <div class=""> -->
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?> - <?php echo $month_name.','.$Year?></h2>
                    <!-- .' '.'('.$order.')' -->
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>

                  </div>

                  
                  <div class="x_content">
                    <div class="row">
                    <div class="col-md-3">
                      <!-- <label>Month</label> -->
                  <form class="" action="#" method="post">
                    <select class="form-control" name="month"  id="month">
                      <option value="">--Month--</option>
                      <option value="01">January</option>
                      <option value="02">February</option>
                      <option value="03">March</option>
                      <option value="04">April</option>
                      <option value="05">May</option>
                      <option value="06">June</option>
                      <option value="07">July</option>
                      <option value="08">August</option>
                      <option value="09">September</option>
                      <option value="10">October</option>
                      <option value="11">November</option>
                      <option value="12">December</option>
                  </select>
                </div>
                <div class="col-md-2">
                <button type="button" class="btn btn-primary month_filters">Go</button>
                </div>
              </form>
              </div>
              <div class="">
                <!-- <h5 style="color: black;"><strong>Order placed in:</strong> </h5> -->
              </div>

                    <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>
                    <table id="payment_ajax" class="table table-striped table-bordered" style="width:100%" id="datatable-buttons">
                      <thead>


                        <tr>
                          <th>S.No.</th>
                          <th>Order Ref.No</th>
                          <th>Payment ID</th>
                          <th>Customer Name</th>
                          
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Payment Date</th>
                          <th>Payment Status</th>
                          <th>Amount</th>
                        </tr>
                      </thead>
                      <tbody>
      
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<script type="text/javascript">
  $(document).ready( function() {
   var table;
  table = $('#payment_ajax').dataTable({ 
  // "dom": 'Blfrtip',
  "lengthMenu": [[50, 100, 150, -1], [50, 100, 150, "All"]],
  'processing': true,
  'serverSide': true,
  'serverMethod': 'post',
  'searching':true,
  "order": [], 

  // Load data for the table's content from an Ajax source
  "ajax": {
  "url": "<?php echo site_url('payments/ajax_list');?>",
  "type": "POST",
  "data": function ( data ) { 
   data.dateval = "monthly";
   data.selected_month = $( "#month option:selected" ).val();
  

  }
  },
"pageLength": 50, 
  columnDefs: [
        { targets: [0,1,2,3,4], visible: true},  
    ]     
    });
  $('.month_filters').on('click', function () { 

 
    table.api().ajax.reload();

      });
});
</script>

