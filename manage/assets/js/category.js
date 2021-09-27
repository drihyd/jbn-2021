$(document).ready(function(){
    if ($( "#is_customizable" ).is(":checked")) { //check if checkbox is checked
        $('#custom_size').show(); //hide if unchecked
    } else {
        $('#custom_size').hide(); //show if checked
    }
    $( "#is_customizable" ).on( "click", function() { //change click to hidden
       $( "#is_customizable" ).attr(':checked');
        if ($(this).is(":checked")) { //check if checkbox is checked
            $('#custom_size').show(); //hide if unchecked
        } else {
            $('#custom_size').hide(); //show if checked
        }
    });

     $("form").validate({
      rules:{
        CategoryName:{  
          
          minlength:3,
          maxlength:50
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

});
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
