<!-- page content -->



<div class="right_col" role="main">
  <div class="">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <h2><?php echo $page_title;?> <?php echo '- '.'#';?><?php echo $Order_details->o_Order_Number ;?></h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
            </li>
            <li><a class="btn btn-round btn-success" href="<?php echo base_url();?>orders">Back to All Orders</a>
            </li>
          </ul>
          <div class="clearfix">
          </div>
        </div>
        <div class="x_content">
          <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="well" style="background: white;">


                <h4 class="brief"><strong>Customer Info</strong></h4>                    
                    <ul class="list-unstyled">
                      <li><b>Name:</b> <?php echo ucwords($Order_details->u_first_name);?><?php echo ' ';?><?php echo ucwords(isset($Order_details->u_last_name))?$Order_details->u_last_name:''?></li>
                      <!-- <li><b>Customer ID:</b> <?php echo $Order_details->user_id; ?></li> -->
                      <li><b>Email:</b> <?php echo ucwords($Order_details->u_user_email); ?></li>
                      <?php if ($Order_details->user_gender) { ?>
                       
                      <li><b>Gender:</b> <?php echo ucwords($Order_details->user_gender); ?></li>
                    <?php }?>
                    <?php if ($Order_details->user_phone) { ?>
                      <li><b>Mobile:</b> <?php echo ucwords($Order_details->user_phone); ?></li>
                      <?php }?>
                    </ul>
                    <h4 class="brief"><strong>Payment Info</strong></h4>                    
                
                    <ul class="list-unstyled">
                      <?php if ($Order_details->p_Payment_method) { ?>
                        <li><b>Payment Mode:</b> <?php echo $Order_details->p_Payment_method;?></li>
                     <?php } ?>
                      <?php if ($Order_details->p_PaymentStatus =="authorized") { ?>
                        <li><b>Payment Status:</b> <?php echo "Paid"; ?></li>
                     <?php } ?>
                      
                      <!-- <li>Transaction Message: p_success</li> -->
                      <li><b>Transaction NO:</b> <?php echo $Order_details->p_TransactionID;?> </li>
                      <li><b>Payment ID:</b> <?php echo $Order_details->p_PaymentID;?></li>
                      <li><b>Amount Paid:</b> <?php echo $Order_details->p_currency;?> <?php echo sprintf('%0.2f',$Order_details->p_amount);?></li>
                      </li>
                    </ul>
              </div>
            </div> 
            
            

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="well" style="background: white;">                  
                <h4 class="brief"><strong>Billing Address</strong></h4>                    
                
                    <ul class="list-unstyled">
                      <li><b>Name:</b> <?php echo ucwords($Order_details->o_billing_Fullname);?></li>
                      <li><b>Email:</b> <?php echo ucwords($Order_details->u_user_email); ?></li>
                      <li><b>Mobile:</b> <?php echo ucwords($Order_details->o_billing_Mobile); ?></li>
                      <h5><strong>Address:</strong></h5>
                      <li>                     
                      <?php echo $Order_details->o_billing_Address1;?>,
                      <?php if (!empty($Order_details->o_billing_Address2)) { ?>
                      <?php echo $Order_details->o_billing_Address2.',';?>
                      <?php } ?>
                      <?php if (!empty($Order_details->o_billing_LandMark)) { ?>
                        <?php echo $Order_details->o_billing_LandMark.',';?>
                      <?php } ?>
                        <?php echo $Order_details->o_billing_City;?>,
                        <?php echo $Order_details->o_billing_State;?>,
                        <?php echo $Order_details->o_billing_Country;?>,
                        <?php echo $Order_details->o_billing_Pincode;?>.
                      </li>
                    </ul>
              </div>
            </div> 
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="well" style="background: white;">
                <h4 class="brief"><strong>Shipping Address</strong></h4>                    
                
                    <ul class="list-unstyled">
                      <li><b>Name:</b> <?php echo ucwords($Order_details->o_shipping_Fullname);?></li>
                      <li><b>Email:</b> <?php echo ucwords($Order_details->u_user_email); ?></li>
                      <li><b>Mobile:</b> <?php echo ucwords($Order_details->o_shipping_Mobile); ?></li>
                      <h5><strong>Address:</strong></h5>
                      <li>                    
                      <?php echo $Order_details->o_shipping_Address1;?>,
                      <?php if (!empty($Order_details->o_shipping_Address2)) { ?>
                      <?php echo $Order_details->o_shipping_Address2.',';?>
                      <?php } ?>
                      <?php if (!empty($Order_details->o_shipping_LandMark)) { ?>
                        <?php echo $Order_details->o_shipping_LandMark.',';?>
                       <?php } ?>
                        <?php echo $Order_details->o_shipping_City;?>,
                        <?php echo $Order_details->o_billing_State;?>,
                        <?php echo $Order_details->o_shipping_Country;?>,
                        <?php echo $Order_details->o_shipping_Pincode;?>.
                      </li>
                    </ul>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="well" style="background: white;">
                <?php if(validation_errors()){ ?>
                <div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo validation_errors(); ?></strong>
                </div>
                  <?php } ?>
              <?php if($this->session->flashdata('status_success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('status_success'); ?></strong>
                </div>
                  <?php } ?>
                  <?php if($this->session->flashdata('status_error')){ ?>
                                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('status_error'); ?></strong>
                </div>
                  <?php } ?>

                <h4 class="brief"><strong>Order Status</strong></h4>                    
                    <ul class="list-unstyled">
                      <li><b>Order Ref.No:</b> <?php echo $Order_details->o_Order_Number;?></li>
                      <!-- <li><b>Cart ID:</b> <?php echo $Order_details->o_CartID; ?></li> -->
                      <li><b>Ordered On:</b> <?php echo date("d-m-Y", strtotime($Order_details->order_date)); ?></li>
                      <!-- <li>Delivered On: <?php// echo ucwords($Order_details->user_gender); ?></li> -->
                      <!-- <li>Cancelled On: <?php// echo ucwords($Order_details->user_phone); ?></li> -->
                      <li><b>Total Amount:</b> <?php echo $Order_details->p_currency.' ';?><?php echo sprintf('%0.2f',$Order_details->p_amount); ?></li>
                      <!-- <li>No.of Items : </li> -->
                      <form class="form" method="post" action="<?php echo base_url()?>orders/update_status">
                        <li><b>Order Status:</b> <select class="form-group" name="Order_status" style="height: 30px;" id="ddlPassport">
                          <option value="placed"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="placed") { ?> selected <?php } ?>>Placed</option>
                          <option value="confirmed"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="confirmed") { ?> selected <?php } ?>>Confirmed</option>
                          <option value="processing"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="processing") { ?> selected <?php } ?>>Processing</option>
                          <option value="dispatched"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="dispatched") { ?> selected <?php } ?>>Dispatched</option>
                 <!--          <option id="is_customizable"  value="shipped to"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="shipped to") { ?> selected <?php } ?>>Shipped To</option> -->
                          <!-- data-toggle="modal" data-target="#exampleModalCenter" -->
                          <option value="on Hold"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="on Hold") { ?> selected <?php } ?>>On Hold</option>
                          <option value="delivered"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="delivered") { ?> selected <?php } ?>>Delivered</option>
                          <option value="cancelled"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="cancelled") { ?> selected <?php } ?>>Cancelled</option>
                          <option value="cancelled-Refund pending"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="cancelled-Refund pending") { ?> selected <?php } ?>>Cancelled-Refund pending</option>
                          <option value="Cancelled-Refunded"<?php if(isset($Order_details->order_status) && $Order_details->order_status=="Cancelled-Refunded") { ?> selected <?php } ?>>Cancelled-Refunded</option>
                        </select>
                        <div id="dvcancelled">
                           <!-- style="display: none;" -->
                          <div class="form-group">
        <label for="CategorySlug">Remarks<span class="text-red"style="color: red;">*</span></label>
        
        <textarea rows="3" class="form-control" id="cancelled_remarks" name="cancelled_remarks" ><?php echo isset($Order_details->o_cancelled_remarks)?$Order_details->o_cancelled_remarks:'';?></textarea>
      </div>
                        </div>

                        <div id="dvPassport" >
                          <!-- style="display: none;" -->
      <div class="form-group" >
        <label for="CategorySlug">Shipped By<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control col-md-4" name="shipped_by_id" id="" required="required">
          <!-- <option value="<?php //echo set_select('ParentID'); ?>">--Pick one--</option> -->
          <option value="">-- Select --</option>
              <?php
              foreach ($this->delivery_partners as $key => $value) {
              
              }
              if ($Order_details->o_shipped_by_id==$value->id) {
              echo '<option value="'.$value->id.'" selected>'.ucwords($value->name).'</option>';
              
            }else{
              echo '<option value="'.$value->id.'">'.ucwords($value->name).'</option>';
            }
              ?>
        </select>
      </div>&nbsp;

      <div class="form-group">
        <label for="CategorySlug">AWB No<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="shipped_traking_no" name="shipped_traking_no" required="required" value="<?php echo isset($Order_details->o_shipped_traking_no)?$Order_details->o_shipped_traking_no:'';?>" >
      </div>
      
            

            <div class="form-group">
        <label for="CategoryDesc">Shipping Date<span class="text-red"style="color: red;"></span></label>
        <input type="date" class="form-control" id="shipping_to_date" name="shipping_to_date"   value="<?php echo isset($Order_details->o_shipping_to_date)?$Order_details->o_shipping_to_date:'';?>">
      </div>
      </div>
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                        <a  href="<?php echo base_url("orders/invoice/$Order_details->order_id"); ?>" class="btn btn-warning btn-sm">Generate Invoice</a>
                        <input type="hidden" value="<?php echo $Order_details->order_id; ?>" name="order_status_id" id="order_status_id" />
                      </li>
                      </form>

                      <!-- target="_blank" -->
                      
                    </ul>
              </div>
            </div> 
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="well" style="background: white;">
                <h4 class="brief"><strong>Dispatched info</strong></h4>                    
                
                    <ul class="list-unstyled">
                      <li><b>Shipped by:</b> <?php echo ucwords($Order_details->dp_name);?></li>
                      <li><b>AWB NO:</b> <?php echo ucwords($Order_details->o_shipped_traking_no); ?></li>
                      <li><b>Shipping date:</b> <?php echo date('d-m-Y',strtotime($Order_details->o_shipping_to_date)); ?></li>
                    </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Order Product Details</h2>
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
                    <table id="datatable-fixed-header" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>S.NO.</th>
                          <th>Product Name</th>
                          <th>Product SKU</th>
                          <th>Product Price</th>
                          <th>Quantity</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php if($Order_details->items) { 
                $total_sum=0; ?>
                
        <?php $sno=1; foreach ($Order_details->items as $order_items) { ?>
          <?php $total= $order_items->d_ProductPrice*$order_items->d_Quantity; ?>
                    <tr>
                    <td><?php echo $sno; ?></td>
                    <td><?php echo $order_items->d_ProductName; ?></td>
                    <td><?php echo $order_items->d_ProductSKU; ?></td>
                    <td><?php echo sprintf('%0.2f',$order_items->d_ProductPrice); ?></td>
                    <td><?php echo $order_items->d_Quantity;?></td>
                    <td><?php echo sprintf('%0.2f',$total);?></td>
                    </tr>
                     <?php  }
                     $sno++; 
                     $total_sum+=$total;  
                    } 
                    ?>
                      </tbody>
                      <tfoot>
                        <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><b>Grand Total</b></td>
                    <td><b><?php echo sprintf('%0.2f',$total_sum);?></b></td>
                    </tr>
                        
                      </tfoot>
                    </table>
                  </div>
                </div>
              </div>
              <?php if ($Order_details->coupons) { ?>
                
               <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Order Coupon Details</h2>
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
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>Coupon ID</th>
                          <th>Coupon Title</th>
                          <th>Coupon Code</th>
                          <th>Description</th>
                          <th>Discount Type</th>
                          <th>Discount Value</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php if($Order_details->coupons) { ?>
        <?php  foreach ($Order_details->coupons as $order_coupons) { ?>
                    <tr>
                    <td><?php echo $order_coupons->c_CouponID; ?></td>
                    <td><?php echo $order_coupons->c_Coupon_title; ?></td>
                    <td><?php echo $order_coupons->c_CouponCode; ?></td>
                    <td><?php echo $order_coupons->c_Description; ?></td>
                    <td><?php echo $order_coupons->c_DiscountType;?></td>
                    <td><?php echo $order_coupons->c_Discount_value;?></td>
                    </tr>
                     <?php  }   
                    } 
                    ?>
 
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <?php }else{ ?>

              <?php } ?>
            </div>
          </div>
  </div>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/additional-methods.min.js" ></script>
<script type="text/javascript">
    $(document).ready(function(){
      $("#dvPassport").hide();
          $("#dvcancelled").hide();
        $("#ddlPassport").on("load",function () {
          
            if ($(this).val() == "dispatched") {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
            if ($(this).val() == "cancelled") {
                $("#dvcancelled").show();
            } else {
                $("#dvcancelled").hide();
            }
      
        });
        $( "#ddlPassport" ).on( "change", function() { 

  
       $( "#ddlPassport" ).attr(':checked');
        if($("option[value='dispatched']").is(":checked")){
          $("#dvPassport").show();
        } else {
            $("#dvPassport").hide();
        }
        if($("option[value='cancelled']").is(":checked")){
          $("#dvcancelled").show();
        } else {
            $("#dvcancelled").hide();
        }
    });

    });
    
//     $(function() {
//     $('#row_dim').hide(); 
//     $('#type').change(function(){
//         if($('#type').val() == 'parcel') {
//             $('#row_dim').show(); 
//         } else {
//             $('#row_dim').hide(); 
//         } 
//     });
// });

     $("form").validate({
      rules:{
        shipped_by_id:{  
          
          required:true,
        },
        shipped_traking_no:{  
          
          required:true,
          
        }, shipping_to_date:{  
          required:true,
          
        },      
        
       }
    });
</script>

<script type="text/javascript">
//   function openPopup() {
//     $("#exampleModalCenter").modal();

// }
$("#type").on("change", function () {        
    $modal = $('#exampleModalCenter');
    if($(this).val() === 'dispatched'){
        $modal.modal('show');
    }
});
</script>

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
      <!-- <script type="text/javascript">
    $(document).on('submit', '#myform', function(e) {
        e.preventDefault();


       var title = $("input[name='title']").val();
       var description = $("textarea[name='description']").val();


        $.ajax({
           url: '<?php echo site_url('orders/update_shipping_status');?>',
           type: 'POST',
           data: {shipped_by_id: shipped_by_id, shipped_traking_no: shipped_traking_no, shipping_to_date:shipping_to_date},
           error: function() {
              alert('Something is wrong');
           },
           success: function(data) {
                // $("tbody").append("<tr><td>"+title+"</td><td>"+description+"</td></tr>");
                alert("Shipping Details added successfully");  
           }
        });


    });


</script> -->



