<!-- page content -->
<div class="right_col" role="main">
  <div class="">


  

<!-- page content -->
<!-- <div class="right_col" role="main">
  <div class=""> -->
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>

                  </div>
                  <div class="x_content">
                    <div class="x_content">
                    
                    </div>

                    <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>
                    <table id="orders_ajax" class="table table-striped table-bordered" style="width:100%">
                      <thead>


                        <tr>
                          <th>S.No.</th>
                          <th>Order Ref.No.</th> 
                          <th>Customer Name</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Order Date</th>
                          <th>Order Status</th>
                          <th>Order Amount</th>
                          <th>Actions</th>
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

    // alert('hello');
   var table;

 table = $('#orders_ajax').dataTable({ 
  // "dom": 'Blfrtip',
  "lengthMenu": [[50, 100, 150, -1], [50, 100, 150, "All"]],
  'processing': true,
  'serverSide': true,
  'serverMethod': 'post',
  'searching':true,
  "order": [], 

  // Load data for the table's content from an Ajax source
  "ajax": {
  "url": "<?php echo site_url('orders/ajax_orders_status_list/'.$status);?>",
  "type": "POST",
  "data": function ( data ) { 
    // console.log(data);
    // alert('hello');
    // data= "$status";

  }
  },
"pageLength": 50, 
  columnDefs: [
        { targets: [0,1,2,3,4], visible: true},  
    ]     
    });
   // $('.payment_filters').on('click', function () {   

   //  table.api().ajax.reload();

   //    });
});
</script>

