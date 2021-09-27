<script type="text/javascript">
$(document).ready(function(){
   $(".addtowishlist").on('click', function(evt) {
       var link_data = $(this).data('data');
       var url="<?php echo base_url();?>cart/save_wishlist";
       $.ajax({
          type: "POST",
          url: url,
          data: ({product_id: link_data}),
          success: function(data) { 
               if(data == 200)
               {
                  alert("successfully added to wishlist");
               }
                else if(data == 401)
               {
                  alert("Already added to wishlist");
               }
               else{
                   alert("Something went is wrong. Please try again.");
               }
          }   
       });   
    }); 

   function setBillingAddress(){
  if ($("#homepostalcheck").is(":checked")) {
    $('input[name=bill_Fullname]').val($('input[name=shp_Fullname]').val());
    $('input[name=bill_Fullname]').attr('readonly', 'readonly');

    $('input[name=bill_street_house]').val($('input[name=shp_street_house]').val());
    $('input[name=bill_street_house]').attr('readonly', 'readonly');

    $('input[name=bill_address]').val($('input[name=shp_address]').val());
    $('input[name=bill_address]').attr('readonly', 'readonly');

    $('input[name=bill_pincode]').val($('input[name=shp_pincode]').val());
    $('input[name=bill_pincode]').attr('readonly', 'readonly');

    $('input[name=bill_city]').val($('input[name=shp_city]').val());
    $('input[name=bill_city]').attr('readonly', 'readonly');

    $('input[name=bill_county]').val($('input[name=shp_county]').val());
    $('input[name=bill_county]').attr('readonly', 'readonly');

    $('input[name=bill_state]').val($('input[name=shp_state]').val());
    $('input[name=bill_state]').attr('readonly', 'readonly');

    $('input[name=bill_mobile_numer]').val($('input[name=shp_mobile_numer]').val());
    $('input[name=bill_mobile_numer]').attr('readonly', 'readonly');


  } else {
    $('input[name=bill_Fullname]').removeAttr('readonly');
    $('input[name=bill_street_house]').removeAttr('readonly');
    $('input[name=bill_address]').removeAttr('readonly');
    $('input[name=bill_pincode]').removeAttr('readonly');
    $('input[name=bill_city]').removeAttr('readonly');
    $('input[name=bill_county]').removeAttr('readonly');
    $('input[name=bill_state]').removeAttr('readonly');
    $('input[name=bill_mobile_numer]').removeAttr('readonly');
  }
}

$('#homepostalcheck').click(function(){
  setBillingAddress();
})
});



  function updateItemQty(quantity_no,cartid) {

 

$url = "<?php echo base_url('cart/updateItemQty') ?>";
  $.post($url, {'quantity_no': quantity_no, 'cartid': cartid }, function(data, textStatus, xhr) {
    var router_class="<?php echo $this->router->class;?>"
    var router_method="<?php echo $this->router->method;?>"
  
  window.location.href = "<?php echo base_url()?>"+router_class;   

  });

  }

$("body").on('submit', '.coupon_form', function(e) {
  e.preventDefault();

  var form = $(this);
  var url = "<?php echo base_url('cart/apply_coupon') ?>";

  $.ajax({
    url: url,
    type: 'POST',
    data: form.serialize(),
    success : function (data) {
      var obj = JSON.parse(data);
      if (obj.status == 'failed') {
        error_alert(obj.message);
      }
      if (obj.status == 'success') {
        success_alert(obj.message);
      }
    }
  })
  .fail(function() {
    error_alert("Connection Failed");
  })
  .always(function() {
    $("#applyCuponModal").modal('hide');
      window.location.reload();
  });
  
});

$("body").on('submit', '.remove_coupon_form', function(e) {
  e.preventDefault();
  var form = $(this);
  var url = "<?php echo base_url('cart/remove_coupon') ?>";

  $.ajax({
    url: url,
    type: 'POST',
    data: form.serialize(),
    success : function (data) {
      var obj = JSON.parse(data);
      if (obj.status == 'failed') {
        error_alert(obj.message);
      }
      if (obj.status == 'success') {
        success_alert(obj.message);
      }
    }
  })
  .fail(function() {
    error_alert("Connection Failed");
  })
  .always(function() {
      $("#applyCuponModal").modal('hide');
      window.location.reload();
  });
  
});
</script>


