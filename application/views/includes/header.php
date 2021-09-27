<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<?php echo base_url('assets') ?>/img/favicon-16x16.png" type="image/x-icon">
<link rel="icon" href="<?php echo base_url('assets') ?>/img/favicon-16x16.png" type="image/x-icon">

<title>Jewellery by Nikitha | <?php if(isset($seo->SEOTitle)) echo $seo->SEOTitle; else echo $page_title ?></title>
<meta name="description" content="<?php echo isset($seo->SEODesc); ?>">
<meta name="keywords" content="<?php echo isset($seo->SEOKeywords) ?>">
<meta name="robots" content="noodp"/>

<!-- FONTAWESOME INCLUDE : BEGIN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />

<!-- FONTAWESOME INCLUDE : END -->
<!-- BOOTSTRAP INCLUDE : BEGIN -->
<!-- defer -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
<!-- enddefer -->
<!-- BOOTSTRAP INCLUDE : END -->
<!-- SLICK CSS : BEGIN -->
<!-- defer -->
  <link rel="stylesheet" href="https://deepredink.in/taruni-v2/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<!-- enddefer -->
<!-- SLICK CSS : END -->
<!-- STYLES INCLUDE : BEGIN -->
<link rel="stylesheet" href="<?php echo base_url('assets') ?>/css/style.css?v=1.4">

<!-- STYLES INCLUDE : END -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.overlay{
    display: none;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 999;
    background: rgba(255,255,255,0.8) url("loader.gif") center no-repeat;
}
/* Turn off scrollbar when body element has the loading class */
body.loading{
    overflow: hidden;   
}
/* Make spinner image visible when body element has the loading class */
body.loading .overlay{
    display: block;
}
</style>

<script>
  function fblogin() {


  	var router_class="<?php echo $this->router->class;?>"
  	var router_method="<?php echo $this->router->method;?>"



     FB.init({
        appId      : '324969615427353',
        cookie     : true,  // enable cookies to allow the server to access 
                            // the session
        xfbml      : true,  // parse social plugins on this page
        version    : 'v2.8' // use graph api version 2.8
       
      });

    FB.login(function(response) {      if (response.status === 'connected') {
        // Logged into your app and Facebook.
         loginWithFacebook(router_class,router_method); return;
      } else {
        // The person is not logged into this app or we are unable to tell. 
      }
    },{scope: 'email, public_profile'});
  }

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function loginWithFacebook(router_class,router_method) {


  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', {fields: 'name, email'}, function (response) {
  console.log(JSON.stringify(response));
  console.log('Successful login for: ' + response.name);  
  console.log('ID: ' + response.id);  
  console.log('Email: ' + response.email);  
  console.log('response: ' + response);
  $url = "<?php echo base_url('UserLogin/Facebook_Auth') ?>";
  // alert(response.email);
  $.post($url, {'name': response.name, 'email': response.email,'id': response.id }, function(data, textStatus, xhr) {
  	if(router_method=="checkout"){
  		 window.location.href = "<?php echo base_url()?>"+router_class+"/"+router_method;
  	}
  	else{
  		 window.location.href = "<?php echo base_url()?>home";
  	}
   

  });
  });
  }
</script>


</head>
<body>



