$("form").validate({
      rules:{
        RoleID:{  
          required:true,
        },
        Email:{  
          email:true,
        },      
        FirstName:{
          alphanumspace:true,
          minlength:3,
          maxlength:250
        },
        LastName:{
          alphanumspace:true,
          minlength:3,
          maxlength:250
        },
        Password:{
          minlength:5,
          maxlength:10
        },
        Phone:{
          indian_phone: true,
        },
        
    },
      messages:{
        Phone:{
          regex: 'Please enter a valid phone number',
        }
      }
});
