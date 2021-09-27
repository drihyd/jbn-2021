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
            <li class="active">
              <a href="<?php echo base_url()?>payments">
              Recent Payments</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>payments/today">
              Today Payments</a>
            </li>
            <li>
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
                    <table id="payment_ajax" class="table table-striped table-bordered" style="width:100%">
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
    console.log(data);
    data.dateval= "all";

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

<script>
            

function trash_smtp_record(val=false){ 

$.confirm({
title: '!Alert',
content: 'Are you sure delete this record.',
type: 'red',
typeAnimated: true,
buttons: {
tryAgain: {
text: 'Ok',
btnClass: 'btn-red',
action: function(){

    
 $.ajax({
              url: "<?php echo base_url();?>cms/settings/smtp/delete/"+val,
              type: 'POST',
              data: { post_id: ""},
              async: false,
              cache: false,
              success: function(response){       
             
              }
           });
          
         $.confirm({
        title: '!Success',
        content: 'Record deleted successfully',
        type: 'success',
        typeAnimated: true,
        buttons: {
        tryAgain: {
        text: 'Ok',
        btnClass: 'btn-success',
        action: function(){
           location.href = "<?php echo base_url(); ?>cms/settings/smtp";
        }
        },
        close: function () {
        }
        }
        });

}
},
close: function () {
}
}
});

}
      </script>