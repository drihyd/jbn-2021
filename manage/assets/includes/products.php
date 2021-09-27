<script>
            jQuery(document).ready(function () {
                var iconPickerOpt = {cols: 5,  footer: false};
                var options = {
                    hintCss: {'border': '1px dashed #13981D'},
                    placeholderCss: {'background-color': 'gray'},
                    ignoreClass: 'btn',
                    opener: {
                        active: true,
                        as: 'html',
                        close: '<i class="fa fa-minus"></i>',
                        open: '<i class="fa fa-plus"></i>',
                        openerCss: {'margin-right': '10px'},
                        openerClass: 'btn btn-success btn-xs'
                    }
                };
                menuEditor('myList', {listOptions: options, iconPicker: iconPickerOpt, labelEdit: 'Edit', labelRemove: 'X'});
            });

        </script>

        <script>  


          $(document).ready(function() {

var h2 = '<div style="padding-top:15px;">';
h2 += '<div class="form-group-sm">';
h2 += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';

h2 += '<span class="input-group-btn">';
h2 += '<select class="form-control" name="Diamond_Shape[]" id="">';
h2 += '<option value="">-- Pick Diamond Shape --</option>';
<?php  foreach($this->products->option_product_dia_shapes() as $option_group) { ?>
h2 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>

h2 += '</select>';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_no_diamonds[]" placeholder="No Of Diamonds" >';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_Weight[]" placeholder="Weight" >';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_Rate[]" placeholder="Price" >';
h2 += '</span>';
h2 += '</div> ';
h2 += '<span class="diamond_shape_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h2 += '</div>';
h2 += '</div>';



    $(".diamond_shape_add").click(function() {
        //$(".diamond_shape_cloneDefault").clone(true).insertBefore(".frm .making_charges");
        $("#extra_diamond_shpae_prop").append(h2);
        //$(".frm > .diamond_shape_cloneDefault").removeClass("diamond_shape_cloneDefault");
    
    });

    $(document).on('click', '.diamond_shape_remove', function() {
        $(this).parent().remove();
    });
});

</script>
<script>  

$(document).ready(function() {
var h3 = '<div style="padding-top:15px;">';
h3 += '<div class="form-group-sm">';
h3 += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';

h3 += '<span class="input-group-btn">';
h3 += '<select class="form-control" name="GSN_type[]" id="">';
h3 += '<option value="">-- Pick Gemstone --</option>';
    <?php  foreach($this->products->option_product_gemstone() as $option_group) { ?>
h3 += '<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>';
    <?php } ?>
h3 += '</select>';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Quantity[]" placeholder="Quantity" >';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Weight[]" placeholder="Weight" >';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Rate[]" placeholder="Price" >';
h3 += '</span>';
h3 += '</div> ';
h3 += '<span class="gemstone_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h3 += '</div>';
h3 += '</div>';



    $(".gemstone_add").click(function() {
        $("#gemstone_prop").append(h3);
   
    });

    $(document).on('click', '.gemstone_remove', function() {
        $(this).parent().remove();
    });
});

</script>

<script>
  
 $(document).ready(function() {
  var h = '<div style="padding-top:15px;">';
  h += '<div class="form-group-sm" style="width: 100%;">';
  h += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';
  h += ' <span class="input-group-btn">';
  h += '<input type="text" class="form-control" id="size[]" name="size[]"  placeholder="Size">';
  h += ' </span>';
  h += ' <span class="input-group-btn">';
  h += ' <select class="form-control" name="Karat[]" id="karat">';
  h += '  <option value="">-- Pick Karat --</option>';
  <?php  foreach($this->products->option_product_karet() as $option_group) { ?>
  h += '<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>';
  <?php } ?>
  h += ' </select>';
  h += '</span>';
    h += ' <span class="input-group-btn">';
  h += ' <select class="form-control" name="G_Colors[]" id="G_Colors">';
  h += '  <option value="">-- Pick Color --</option>';
  <?php  foreach($this->products->option_gold_colors() as $option_group) { ?>
  h += '<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>';
  <?php } ?>
  h += ' </select>';
  h += '</span>';
  h += ' <span class="input-group-btn">';
  h += ' <input type="text" class="form-control" id="" name="Mat_Pro_Weight[]" placeholder="Weight"  value="0">';
  h += '</span>';
  h += ' </div>'; 
  h += '<span class="remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';  
  h += '</div>';
  h += '</div>';



 /* 
  var selected_MeterialType=$("#Material_type").val();
  
    if(selected_MeterialType!=1 && selected_MeterialType!=""){
    $('select#karat').attr('disabled', 'disabled');
    $('select#G_Colors').attr('disabled', 'disabled');
    }
    else
    {
    $('select#karat').attr('disabled', false);
    $('select#G_Colors').attr('disabled', false);
    }*/
  
  
  
    $(".add").click(function() {
        //$(".cloneDefault").clone(true).insertBefore(".frm .diamond_properties");
       // $("#material_prop").html();
        $("#extra_mat_prop").append(h);
    
    //alert("Hello"+$("#Material_type").val());
    var selectedMeterialType=$("#Material_type").val();
    if(selectedMeterialType!=1){
    $('select#karat').attr('disabled', 'disabled');
    $('select#G_Colors').attr('disabled', 'disabled');
    }
    else
    {
    $('select#karat').attr('disabled', false);
    $('select#G_Colors').attr('disabled', false);
    }
    
        //$(".frm > .cloneDefault").removeClass("cloneDefault");
       
    });

    $(document).on('click', '.remove', function() {
        $(this).parent().remove();
    });
});

</script>

<script>  
$(document).ready(function() {
var h1 = '<div style="padding-top:15px;">';
h1 += '<div class="form-group-sm">';
h1 += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';

h1 += '<span class="input-group-btn">';
h1 += '<select class="form-control db-list-3" name="DP_Color[]" id="DP_Color">';
h1 += '<option value="">-- Pick Color --</option>';
<?php  foreach($this->products->option_product_Diamond_Color() as $option_group) { ?>
h1 += '<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
h1 += '</select>';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<select class="form-control" name="DP_Clarity[]" id="DP_Clarity" >';
h1 += '<option value="">-- Pick Clarity --</option>';
<?php  foreach($this->products->option_product_Diamond_Clarity() as $option_group) { ?>
h1 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
h1 += '</select>';
h1 += '</span>';

h1 += '<span class="input-group-btn">';
h1 += '<select class="form-control" name="Diamond_Shape[]" id="Diamond_Shape">';
h1 += '<option value="">-- Pick Diamond Shape --</option>';
<?php  foreach($this->products->option_product_dia_shapes() as $option_group) { ?>
h1 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>

h1 += '</select>';
h1 += '</span>';

h1 += '<span class="input-group-btn">';
h1 += '<select class="form-control" name="DP_Clarity_1[]" id="DP_Clarity" >';
h1 += '<option value="">-- Pick Certified --</option>';
<?php  foreach($this->products->option_product_Diamond_Certified() as $option_group) { ?>
h1 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
h1 += '</select>';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_No_of_Diamonds[]" placeholder="No Of Diamonds" value="" >';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_Weight[]" placeholder="Weight" value="" >';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_Rate[]" placeholder="Price" value="" >';
h1 += '</span>';
h1 += '</div> ';
h1 += '<span class="diamond_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h1 += '</div>';
h1 += '</div>';



    $(".diamond_add").click(function() {
        $("#extra_diamond_prop").append(h1);

    });
    $(document).on('click', '.diamond_remove', function() {
        $(this).parent().remove();
    });
});

</script>



<script>




/*** Diamond Prop ***/
$(document).ready(function() {

/*** Pearl Prop ***/
var pearl_html='<div style="padding-top:15px;">';
pearl_html+='<div class="form-group-sm" >';
pearl_html+='<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';
pearl_html+='<span class="input-group-btn">';
pearl_html+='<select class="form-control" name="Pearls[]" id="Pearls">';
pearl_html+='<option value="">-- Pick Pearl --</option>';
<?php  foreach($this->products->option_product_pearls() as $option_group) { ?>
pearl_html+='<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
pearl_html+='</select>';
pearl_html+='</span>';
pearl_html+='<span class="input-group-btn">';
pearl_html+='<input type="text" class="form-control"  placeholder="Quantity" id="Pearls_quantity" name="Pearls_quantity[]"   value="" >';
pearl_html+='</span>';
pearl_html+='<span class="input-group-btn">';
pearl_html+='<input type="text" class="form-control"  id="" name="Pearl_Weight[]" placeholder="Weight"  value="" >';
pearl_html+='</span>';
pearl_html+='<span class="input-group-btn">';
pearl_html+='<input type="text" class="form-control"  id="" name="Pearls_Rate[]" placeholder="Price" value="" >';
pearl_html+='</span>';
pearl_html+='</div>';
pearl_html+='<span class="pearl_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
pearl_html+='</div> ';
pearl_html+='</div> ';


    $(".pearl_add").click(function() {
        $("#extra_pearl_prop").append(pearl_html);

    });
    $(document).on('click', '.pearl_remove', function() {
        $(this).parent().remove();
    });
});




/*** Polki Prop ***/
$(document).ready(function() {
var polki_html='<div style="padding-top:15px;">';
polki_html+='<div class="form-group-sm" >';
polki_html+='<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';
polki_html+='<span class="input-group-btn">';
polki_html+='<select class="form-control" name="Polki[]" id="Polki">';
polki_html+='<option value="">-- Pick Pearl --</option>';
<?php  foreach($this->products->option_product_polki() as $option_group) { ?>
polki_html+='<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
polki_html+='</select>';
polki_html+='</span>';
polki_html+='<span class="input-group-btn">';
polki_html+='<input type="text" class="form-control"  placeholder="Quantity" id="Polki_quantity" name="Polki_quantity[]"   value="" >';
polki_html+='</span>';
polki_html+='<span class="input-group-btn">';
polki_html+='<input type="text" class="form-control"  id="" name="Polki_Weight[]" placeholder="Weight"  value="" >';
polki_html+='</span>';
polki_html+='<span class="input-group-btn">';
polki_html+='<input type="text" class="form-control"  id="" name="Polki_Rate[]" placeholder="Price" value="" >';
polki_html+='</span>';
polki_html+='</div>';
polki_html+='<span class="polki_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
polki_html+='</div> ';
polki_html+='</div> ';


    $(".polki_add").click(function() {
        $("#extra_polki_prop").append(polki_html);
    });
    $(document).on('click', '.polki_remove', function() {
        $(this).parent().remove();
    });
});






/*** beads Prop ***/
$(document).ready(function() {
var beads_html='<div style="padding-top:15px;">';
beads_html+='<div class="form-group-sm" >';
beads_html+='<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';
beads_html+='<span class="input-group-btn">';
beads_html+='<select class="form-control" name="beads[]" id="beads">';
beads_html+='<option value="">-- Pick Pearl --</option>';
<?php  foreach($this->products->option_product_beads() as $option_group) { ?>
beads_html+='<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
beads_html+='</select>';
beads_html+='</span>';
beads_html+='<span class="input-group-btn">';
beads_html+='<input type="text" class="form-control"  placeholder="Quantity" id="beads_quantity" name="beads_quantity[]"   value="" >';
beads_html+='</span>';
beads_html+='<span class="input-group-btn">';
beads_html+='<input type="text" class="form-control"  id="" name="beads_Weight[]" placeholder="Weight"  value="" >';
beads_html+='</span>';
beads_html+='<span class="input-group-btn">';
beads_html+='<input type="text" class="form-control"  id="" name="beads_Rate[]" placeholder="Price" value="" >';
beads_html+='</span>';
beads_html+='</div>';
beads_html+='<span class="beads_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
beads_html+='</div> ';
beads_html+='</div> ';


    $(".beads_add").click(function() {
        $("#extra_beads_prop").append(beads_html);

    });
    $(document).on('click', '.beads_remove', function() {
        $(this).parent().remove();
    });
});



/*** Other Prop ***/
$(document).ready(function() {
var other_html='<div style="padding-top:15px;">';
other_html+='<div class="form-group-sm" >';
other_html+='<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';
other_html+='<span class="input-group-btn">';
other_html+='<select class="form-control" name="other[]" id="other">';
other_html+='<option value="">-- Pick Pearl --</option>';
<?php  foreach($this->products->option_product_other() as $option_group) { ?>
other_html+='<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
other_html+='</select>';
other_html+='</span>';
other_html+='<span class="input-group-btn">';
other_html+='<input type="text" class="form-control"  placeholder="Quantity" id="other_quantity" name="other_quantity[]"   value="" >';
other_html+='</span>';
other_html+='<span class="input-group-btn">';
other_html+='<input type="text" class="form-control"  id="" name="other_Weight[]" placeholder="Weight"  value="" >';
other_html+='</span>';
other_html+='<span class="input-group-btn">';
other_html+='<input type="text" class="form-control"  id="" name="other_Rate[]" placeholder="Price" value="" >';
other_html+='</span>';
other_html+='</div>';
other_html+='<span class="other_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
other_html+='</div> ';
other_html+='</div> ';


    $(".other_add").click(function() {
        $("#extra_other_prop").append(other_html);

    });
    $(document).on('click', '.other_remove', function() {
        $(this).parent().remove();
    });
});





</script>


<script>
$('#Material_type').on('change', function() {
   // after creating the option
   // try following
   var selectedMeterialType = $(this).children("option:selected").val();
   //alert(selectedCountry);
   
  // $("#karat").attr("disabled","disabled");
   if(selectedMeterialType!=1){
   //$('select#karat').attr('disabled', 'disabled');
   //$('select#G_Colors').attr('disabled', 'disabled');
   }
else
{
  //$('select#karat').attr('disabled', false);
  //$('select#G_Colors').attr('disabled', false);
}
  
});

</script>

<script>
$('#Making_charges_unit').on('change', function() {
   // after creating the option
   // try 

   
  // $("#karat").attr("disabled","disabled");
   if($(this).val()=="fix"){
   $('select#Making_chg_On_Grs_Net_Weight').attr('readonly', 'readonly');
   $('#Making_chg_On_Grs_Net_Weight').val($(this).val());

   }
else
{
 $('select#Making_chg_On_Grs_Net_Weight').attr('readonly', false);
 $('#Making_chg_On_Grs_Net_Weight').val('');
}
  
});


var Making_charges_unit=$("#Making_charges_unit").val();



   if(Making_charges_unit=="fix"){
   $('select#Making_chg_On_Grs_Net_Weight').attr('readonly', 'readonly');
   $('#Making_chg_On_Grs_Net_Weight').val(Making_charges_unit);

   }
else
{ 
 if(Making_charges_unit==""){
 $('#Making_chg_On_Grs_Net_Weight').val('');
 $('select#Making_chg_On_Grs_Net_Weight').attr('readonly', false);
 }
 else{
	 //$('select#Making_chg_On_Grs_Net_Weight').attr('readonly', false);
	 //$('#Making_chg_On_Grs_Net_Weight').val(Making_charges_unit);
 }
}



</script>

<script type="text/javascript">




$(document).ready(function() {


  function capitalize(str) {
  strVal = '';
  str = str.split(' ');
  for (var chr = 0; chr < str.length; chr++) {
    strVal += str[chr].substring(0, 1).toUpperCase() + str[chr].substring(1, str[chr].length) + ' '
  }
  return strVal
}
  $('select.get_subcategory_ajax').on('change', function() {
      var categoryID = $(this).val();   
      if(categoryID) {      
      var url="<?php echo base_url(); ?>Products/get_subcategory_ajax/"+categoryID;
        $.ajax({
              url: url,
              type: "GET",
              dataType: "json",
              success:function(data) {        
                  $('select[name="Sub_CategorylD"]').empty();
                  $('select[name="Sub_CategorylD"]').append('<option value="">-- Pick One --</option>');
                  $.each(data, function(key, value) {



                      $('select[name="Sub_CategorylD"]').append('<option value="'+ value.CategoryID+'">'+ capitalize(value.CategoryName)+'</option>');
                  });
          
              }
          });
      }else{
          $('select[name="SubCategorylD"]').append('<option value="">-- Pick One --</option>');
          $('select[name="Sub_CategorylD"]').empty();
      }
  })
  });
  </script>
  
<script>

$(document.body).on('change','#DP_Color,#DP_Clarity',function(){

  var data= $('select#DP_Color').find('option:selected').val();
  var data1= $('select#DP_Clarity').find('option:selected').val();
  
  
});
</script>


  <script type="text/javascript">
  

   $(document).ready(function() {
      $("form#import_excel_data").validate({
      rules:{  
        userfile:{  
          extension: "xls" ,
          required:true
        },  
        },
        messages: {
          userfile:"Upload xls Only.",  
        }
      });
 });

</script>


  <!-- Script -->
     <script type="text/javascript">
     $(document).ready(function(){

        // Check all
        $("#checkall").change(function(){

           var checked = $(this).is(':checked');
           if(checked){
              $(".checkbox").each(function(){
                  $(this).prop("checked",true);
              });
           }else{
              $(".checkbox").each(function(){
                  $(this).prop("checked",false);
              });
           }
        });

        // Changing state of CheckAll checkbox 
        $(".checkbox").click(function(){

           if($(".checkbox").length == $(".checkbox:checked").length) {
               $("#checkall").prop("checked", true);
           } else {
               $("#checkall").prop("checked",false);
           }

        });

        // Delete button clicked
        $('#delete').click(function(){

           // Confirm alert
           var deleteConfirm = confirm("Are you sure delete this record?");
           if (deleteConfirm == true) {

              // Get userid from checked checkboxes
              var users_arr = [];
              $(".checkbox:checked").each(function(){
                  var userid = $(this).val();

                  users_arr.push(userid);
              });

              // Array length
              var length = users_arr.length;

              if(length > 0){              
                 // AJAX request
                 $.ajax({
                    url: "<?php echo base_url(); ?>Products/deletetempproducts",
                    type: 'post',
                    data: {product_ids: users_arr},
                    success: function(response){               
                       // Remove <tr>
                   /*    $(".checkbox:checked").each(function(){
                           var userid = $(this).val();
                           $('#tr_'+userid).remove();
                       });*/
                    

                    }
                 });

          setTimeout(function(){
           location.reload(); 
      }, 1000); 

              }

              else{

                alert("Check at least one checkbox");
              }
           } 

        });



       // Move to product table button clicked
        $('#move_to_product_table').click(function(){

           // Confirm alert
           var deleteConfirm = confirm("Are you sure move this record to product table?");
           if (deleteConfirm == true) {

              // Get userid from checked checkboxes
              var users_arr = [];
              $(".checkbox:checked").each(function(){
                  var userid = $(this).val();

                  users_arr.push(userid);
              });


              // Array length
              var length = users_arr.length;

              if(length > 0){              
                 // AJAX request
                 $.ajax({
                    url: "<?php echo base_url(); ?>Products/move_temp_imported_data",
                    type: 'post',
                    data: {product_ids: users_arr},
                    success: function(response){   

                                  

                      if(response=="notfetch")   {
                         alert("Please clear errors and move data.");
                      } 
                      else {                          
                     
                        /* $(".checkbox:checked").each(function(){
                             var userid = $(this).val();
                             $('#tr_'+userid).remove();
                         });*/
                       }
                       
                    }
                 });



  setTimeout(function(){
           location.reload(); 
      }, 1000); 

              }

              else{

                alert("Check at least one checkbox");
              }
           } 

        });



$("form#add_edit_product").validate({
      rules:{
        CategorylD:{  
          required:true,     
        },
        Sub_CategorylD:{  
          required:false,     
        },
        Name:{  
        required:true,
        alphanumspace:true,
        minlength:3,
        maxlength:50   
        },

      SKU:{  
      required:true,
      alphanumspace:true,
      minlength:3,
      maxlength:50
      },
    No_of_pieces:{ 
          required:true, 
          alphanumspace:true,
          minlength:1,
          maxlength:50
        },Gross_weight:{  
          required:true,
          number:true,
        },Net_weight:{
          required:true,  
          number:true,
        },Width:{  
          number:true,
        },Height:{  
          number:true,
        },Length:{  
          number:true,
        },chain_length:{  
          number:true,
        },
        Polish_Details:{  
          alphanumspace:true,
          minlength:3,
          maxlength:50
        },certificate_number:{  
          alphanumspace:true,
          minlength:3,
          maxlength:50
        },product_type:{ 
          required:true 
        },ShortDesc:{  
          required:true,
          minlength:3,
          maxlength:250
        },      
        SEOTitle:{
          alphanumspace:true,
          minlength:3,
          maxlength:250
        },
        SEODescription:{
          alphanumspace:true,
          minlength:3,
          maxlength:250
        },
        SEOKeywords:{
          alphanumspace:true,
          minlength:3,
          maxlength:250
        },
        Price:{
          number:true,
        },
        MRP_Price:{
          number:true,
          /*greaterThan: "#Price"*/
        },
        lmage: {           
           extension: "jpg,jpeg,png"
        }

       },

       messages: {
    MRP_Price: {
        greaterThan: "Please enter a greater value of Price.",

    }
}
     

  
    });





/*$("#Price").blur(function(event) {

  var Price=$('#Price').val()*1;
  var Making_charges=$('#Making_charges').val()*1;
  var Gross_weight=$('#Gross_weight').val()*1;
  var On_mak_gross_price=Making_charges*Gross_weight;
  if((Price <= On_mak_gross_price)) { 
 alert("Price must greater value of making charges price.");
  $(':input[type="submit"]').prop('disabled', true);
  return false;
  } else { 
  $(':input[type="submit"]').prop('disabled', false);   
  return true;    
  }


   
});*/

/*$("#form_submit").click(function(event) {



  var Price=$('#Price').val()*1;

  if(Price>0) {
  var Making_charges=$('#Making_charges').val()*1;
  var Gross_weight=$('#Gross_weight').val()*1;
  var On_mak_gross_price=Making_charges*Gross_weight;
  if((Price <= On_mak_gross_price)) { 
  alert("Price must greater value of making charges price.");
  $(':input[type="submit"]').prop('disabled', true);
  return false;
  } else { 
  $(':input[type="submit"]').prop('disabled', false);   
  return true;    
  }
  }
   
});*/

 
  
  });


/*Data Table filter for Import Products*/

$("#datatable-import-table,#datatable-fixed-header").DataTable({
           
            "lengthMenu": [[50, 100, 150, -1], [50, 100, 150, "All"]],
         
columnDefs: [
   { orderable: false, targets: [0,1] }
]
        });

// Put top scroller
$('.dataTables_scrollHead').css({
    'overflow-x':'scroll'
}).on('scroll', function(e){
    var scrollBody = $(this).parent().find('.dataTables_scrollBody').get(0);
    scrollBody.scrollLeft = this.scrollLeft;
    $(scrollBody).trigger('scroll');
});





</script>
<script type="text/javascript">
     // Start jQuery function after page is loaded
        $(document).ready(function(){
         // Initiate DataTable function comes with plugin
         $('.dataTable').DataTable();
         // Start jQuery click function to view Bootstrap modal when view info button is clicked
         $(document).on('click', '.view_data', function() {
            // $('.view_data').click(function(){
             // Get the id of selected phone and assign it in a variable called phoneData
                var phoneData = $(this).attr('id');
                // Start AJAX function
                $.ajax({
                 // Path for controller function which fetches selected phone data
                    url: "<?php echo base_url() ?>Products/get_stone_prices",
                    // Method of getting data
                    method: "POST",
                    // Data is sent to the server
                    data: {phoneData:phoneData},
                    // Callback function that is executed after data is successfully sent and recieved
                    success: function(data){
                     // Print the fetched data of the selected phone in the section called #phone_result 
                     // within the Bootstrap modal
                        $('#phone_result').html(data);
                        // Display the Bootstrap modal
                        $('#phoneModal').modal('show');
                    }
             });
             // End AJAX function
         });
     });  
    </script>

