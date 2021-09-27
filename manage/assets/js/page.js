
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

CKEDITOR.replace( 'page_editor' );

$("form").validate({
      rules:{
        name:{  
          alphanumspace:true,
          minlength:3,
          maxlength:50
        },
        title:{  
          alphanumspace:true,
          minlength:3,
          maxlength:50
        },
        keywords:{  
          alphanumspace:true,
          minlength:3,
          maxlength:200
        },content:{  
          required:true,
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
        }
       }
    });
