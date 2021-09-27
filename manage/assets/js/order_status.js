// $(document).ready(function(){
//     if ($( "#is_customizable" ).is(":selected")) { //check if checkbox is checked
//         $('#custom_size').show(); //hide if unchecked
//     } else {
//         $('#custom_size').hide(); //show if checked
//     }
//     $( "#is_customizable" ).on( "click", function() { //change click to hidden
//        $( "#is_customizable" ).attr(':selected');
//         if ($(this).is(":selected")) { //check if checkbox is checked
//             $('#custom_size').show(); //hide if unchecked
//         } else {
//             $('#custom_size').hide(); //show if checked
//         }
//     });
// <script type="text/javascript">
    // $(function () {
    //     $("#ddlPassport").change(function () {
    //         if ($(this).val() == "shipped to") {
    //             $("#dvPassport").show();
    //         } else {
    //             $("#dvPassport").hide();
    //         }
    //     });
    // });
// </script>

     $("form").validate({
      rules:{
        shipped_by_id:{  
          
          required:true,
        },
        CategoryDesc:{  
          
          required:true,
          minlength:3,
          maxlength:150
        }, custom_size:{  
          required:true,
          
        },      
        SEOTitle:{
          
          minlength:3,
          maxlength:250
        },
        SEODescription:{
          
          minlength:3,
          maxlength:250
        },
        SEOKeywords:{
          
          minlength:3,
          maxlength:250
        }
       }
    });

// });
function convertToSlug(Text) {
  return Text
    .toLowerCase()
    .replace(/[^\w ]+/g,'')
    .replace(/ +/g,'-');
}

function slugClean(Text) {
  return Text
    .toLowerCase()
    .replace(/[^\w -]+/g,'')
    .replace(/ +/g,'-')
    .replace(/-+/g,'-');
}

function codeClean(Text) {
  return Text
    .replace(/[^\w -]+/g,'')
    .replace(/ +/g,'-')
    .replace(/-+/g,'-');
}

$('.nameForSlug').on('keyup change', function() {
  $('.slugForName').val(convertToSlug($(this).val()));
});

$('.slugForName').on('change keyup', function() {
  $('.slugForName').val(slugClean($(this).val()));
});

$('.codeClean').on('change keyup', function() {
  $('.codeClean').val(codeClean($(this).val()));
});


// <!-- Modal -->
// <!-- <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
//   <div class="modal-dialog modal-dialog-centered" role="document">
//     <div class="modal-content">
//       <div class="modal-header">
//         <h4 class="modal-title" id="exampleModalCenterTitle">Shipped To</h4>
//         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
//           <span aria-hidden="true">&times;</span>
//         </button>
//       </div>
//       <div class="modal-body">
//         <form class="" role="form" id="myform" method="post" data-parsley-validate action="<?php //echo site_url()?>orders/update_shipping_status"  enctype="multipart/form-data" >
    
//       <div class="form-group">
//         <label for="CategorySlug">Shipped By<span class="text-red"style="color: red;">*</span></label>
//         <select  class="form-control" name="shipped_by_id" id="" required="required">
//           <option value="<?php //echo set_select('ParentID'); ?>">--Pick one--</option>
//           <option value="">--- Select ---</option>
//               <?php
//               //foreach ($this->delivery_partners as $key => $value) {
//               //echo '<option value="'.$value->id.'">'.ucwords($value->name).'</option>';
//               }
//               ?>
//         </select>
//       </div>
//       <div class="form-group">
//         <label for="CategorySlug">Shipping No<span class="text-red"style="color: red;">*</span></label>
//         <input type="text" class="form-control" id="shipped_traking_no" name="shipped_traking_no" required="required" value="<?php //echo set_value('shipped_traking_no'); ?>" >
//       </div>
      
            

//             <div class="form-group">
//         <label for="CategoryDesc">Shipping Date<span class="text-red"style="color: red;"></span></label>
//         <input type="date" class="form-control" id="shipping_to_date" name="shipping_to_date" required="required"  value="<?php// echo set_value('shipping_to_date');?>">
//       </div>
      
//             <button type="submit" class="btn btn-primary" name="submit">Save changes</button>
//       <input type="hidden" value="<?php //echo $Order_details->order_id; ?>" name="order_shipping_id" id="order_shipping_id" />
            
//     </form>
//       </div>
//       <div class="modal-footer">
//         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
//         <button type="submit" class="btn btn-primary">Save changes</button>
//         </form>
//       </div>

//     </div>
//   </div>
// </div> -->