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
                      <li><a class="btn btn-round btn-success" style="color: white;" href="<?php echo base_url(); ?>coupons/add">+Add Coupon</a></i>
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
                    <table id="coupons_ajax" class="table table-striped table-bordered" style="width:100%">
                      <thead>


                        <tr>
                          <th>S.NO</th>
                          <th>Coupon Title</th>
                          <th>Coupon Code</th>
                          <th>Description</th>
                          <th>Coupon Added on</th>
                          <th>Coupon Expiry</th>
                          <th>Coupon Type</th>
                          <th>Coupon Value</th>
                          <th>Status</th>
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
   var table;
  table = $('#coupons_ajax').dataTable({ 
  // "dom": 'Blfrtip',
  "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
  'processing': true,
  'serverSide': true,
  'serverMethod': 'post',
  'searching':true,
  "order": [], 

  // Load data for the table's content from an Ajax source
  "ajax": {
  "url": "<?php echo site_url('coupons/ajax_list_coupon');?>",
  "type": "POST",
  "data": function ( data ) { 
    
  }
  },
"pageLength": 10, 
  columnDefs: [
        { targets: [0,1,2,3,4], visible: true},  
    ]     
    });
});
</script>

<script>
          
function trash_coupon_record(val){ 
  if (confirm('Are you sure you want to delete')) {
    // alert('Thanks for confirming');
    $.ajax({
              url: "<?php echo base_url();?>coupons/delete/"+val,
              type: 'POST',
              data: { post_id: ""},
              async: false,
              cache: false,
              success: function(response){ 
              location.reload();   
             
              }
           });
} else {
    alert('Why did you press cancel? You should have confirmed');
}

  return true;
}


      </script>

