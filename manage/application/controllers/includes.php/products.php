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

var h2 = '';
h2 += '<div class="form-group-sm">';
h2 += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';

h2 += '<span class="input-group-btn">';
h2 += '<select class="form-control" name="Diamond_Shape[]" id="Pearls">';
<?php  foreach($this->products->option_product_dia_shapes() as $option_group) { ?>
h2 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>

h2 += '</select>';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_no_diamonds[]" placeholder="No Of Diamonds" >';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_Weight[]" placeholder="Diamond Weight" >';
h2 += '</span>';
h2 += '<span class="input-group-btn">';
h2 += '<input type="text" class="form-control" id="" name="DS_Rate[]" placeholder="Diamond Rate" >';
h2 += '</span>';
h2 += '</div> ';
h2 += '<span class="diamond_shape_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h2 += '</div>';

</script>
<script>  

var h3 = '';
h3 += '<div class="form-group-sm">';
h3 += '<div class="input-group" style="margin-bottom:0px!important;width: fit-content;">';

h3 += '<span class="input-group-btn">';
h3 += '<select class="form-control" name="GSN_type[]" id="">';
h3 += '<option value="">-- Pick Type --</option>';
    <?php  foreach($this->products->option_product_gemstone() as $option_group) { ?>
h3 += '<option value="<?php echo $option_group->OptionID;?>"><?php echo ucwords($option_group->OptionName);?></option>';
    <?php } ?>
h3 += '</select>';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Quantity[]" placeholder="Gemstone quantity" >';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Weight[]" placeholder="Gemstone weight" >';
h3 += '</span>';
h3 += '<span class="input-group-btn">';
h3 += '<input type="text" class="form-control" id="" name="GSN_Rate[]" placeholder="Gemstone rate" >';
h3 += '</span>';
h3 += '</div> ';
h3 += '<span class="gemstone_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h3 += '</div>';

</script>

<script>
  

  var h = '<div>';
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

</script>

<script>  

var h1 = '';
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
h1 += '<select class="form-control" name="DP_Clarity_1[]" id="DP_Clarity" >';
h1 += '<option value="">-- Pick Clarity --</option>';
<?php  foreach($this->products->option_product_Diamond_Clarity() as $option_group) { ?>
h1 += '<option value="<?php echo $option_group->OptionID;?>" ><?php echo ucwords($option_group->OptionName);?></option>';
<?php } ?>
h1 += '</select>';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_No_of_Diamonds[]" placeholder="No Of Diamonds" value="" >';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_Weight[]" placeholder="Diamond Weight" value="" >';
h1 += '</span>';
h1 += '<span class="input-group-btn">';
h1 += '<input type="text" class="form-control" id="" name="DP_Rate[]" placeholder="Diamond Rate" value="" >';
h1 += '</span>';
h1 += '</div> ';
h1 += '<span class="diamond_remove" style="font-size:10px;text-align: end;float:right;display: inline-block;"><i class="fa fa-minus-square"></i></span> ';
h1 += '</div>';

</script>



<script>

$(document).ready(function() {
	
	var selected_MeterialType=$("#Material_type").val();
	
		if(selected_MeterialType!=1 && selected_MeterialType!=""){
		$('select#karat').attr('disabled', 'disabled');
		$('select#G_Colors').attr('disabled', 'disabled');
		}
		else
		{
		$('select#karat').attr('disabled', false);
		$('select#G_Colors').attr('disabled', false);
		}
	
	
	
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
        return false;
    });

    $(document).on('click', '.remove', function() {
        $(this).parent().remove();
    });
});


/*** Diamond Prop ***/

$(document).ready(function() {
    $(".diamond_add").click(function() {
        //$(".diamond_cloneDefault").clone(true).insertBefore(".frm .making_charges");
        $("#extra_diamond_prop").append(h1);
        //$(".frm > .diamond_cloneDefault").removeClass("diamond_cloneDefault");
        return false;
    });

    $(document).on('click', '.diamond_remove', function() {
        $(this).parent().remove();
    });
});


</script>



<script>

$(document).ready(function() {
    $(".diamond_shape_add").click(function() {
        //$(".diamond_shape_cloneDefault").clone(true).insertBefore(".frm .making_charges");
        $("#extra_diamond_shpae_prop").append(h2);
        //$(".frm > .diamond_shape_cloneDefault").removeClass("diamond_shape_cloneDefault");
        return false;
    });

    $(document).on('click', '.diamond_shape_remove', function() {
        $(this).parent().remove();
    });
});

</script>


<script>

$(document).ready(function() {
    $(".gemstone_add").click(function() {
        $("#gemstone_prop").append(h3);
        return false;
    });

    $(document).on('click', '.gemstone_remove', function() {
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
   $('select#karat').attr('disabled', 'disabled');
   $('select#G_Colors').attr('disabled', 'disabled');
   }
else
{
  $('select#karat').attr('disabled', false);
  $('select#G_Colors').attr('disabled', false);
}
  
});

</script>
<script type="text/javascript">
$(document).ready(function() {
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
                      $('select[name="Sub_CategorylD"]').append('<option value="'+ value.CategoryID+'">'+ value.CategoryName+'</option>');
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