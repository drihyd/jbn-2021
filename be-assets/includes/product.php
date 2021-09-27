<script>

  
$(document).ready(function(){

      $("#pincode_form").validate({
               rules: {
                  pincode: {
                    required:true,
                    number:true,
                     minlength: 6,
                     maxlength: 6,
                  },                  
               },
               messages: {
                  pincode: {
                     number: "Please enter a valid 6 digit pincode",
                     minlength: "Please enter a valid 6 digit pincode",
                     maxlength: "Please enter a valid 6 digit pincode",
                  },   
               },
              errorElement : 'div',
              errorLabelContainer: '.errorTxt',
               submitHandler: function(form) {
                var url = "<?php echo base_url('product/check_availability') ?>";
    var picodeform = $('#pincode_form');
        $.ajax({
          url: url,
          type: 'POST',
          data: picodeform.serialize(),
          success : function (data) {
            // alert(data);
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
        });

              }
            });


    $("#customized").change(function(e) {

        e.preventDefault(); // avoid to execute the actual submit of the form.

        /*var form = $(this);
        var url = form.attr('action');
        
        $.ajax({
               type: "POST",
               url: url,
               data: form.serialize(), // serializes the form's elements.
               success: function(data)
               {
                   alert(data); // show response from the php script.
               }
             });
*/
        
    });
});
</script>