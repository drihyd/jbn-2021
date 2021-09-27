<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="<?php echo base_url('assets') ?>/img/favicon-16x16.png" type="image/x-icon">
<link rel="icon" href="<?php echo base_url('assets') ?>/img/favicon-32x32.png" type="image/x-icon">

    <title>Anaya - <?php echo ucwords($page_title);?> </title>

    <!-- Bootstrap -->
    <link href="<?php echo base_url(); ?>manage-assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<?php echo base_url(); ?>manage-assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<?php echo base_url(); ?>manage-assets/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="<?php echo base_url(); ?>manage-assets/iCheck/skins/flat/green.css" rel="stylesheet">
    
    <!-- bootstrap-progressbar -->
    <link href="<?php echo base_url(); ?>manage-assets/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<?php echo base_url(); ?>manage-assets/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<?php echo base_url(); ?>manage-assets/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<?php echo base_url(); ?>manage-assets/css/custom.min.css" rel="stylesheet">
    <!--Datatables -->

    <link href="<?php echo base_url(); ?>manage-assets/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>manage-assets/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>manage-assets/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>manage-assets/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>manage-assets/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Dropzone.js -->
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.0.1/min/dropzone.min.css" rel="stylesheet"> -->
    <link href="<?php echo base_url(); ?>manage-assets/dropzone/dist/min/dropzone.min.css" rel="stylesheet">


    <!-- Datatables -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script> -->
<link href="<?php echo base_url(); ?>manage-assets/css/bootstrap-iconpicker.min.css" rel="stylesheet">
<link href="<?php echo base_url(); ?>assets/css/tab.css" rel="stylesheet">

<?php if (isset($include_css)): ?>
  <?php foreach ($include_css as $key => $css_file_path): ?>
    <script src='<?php echo base_url("$css_file_path")?>'></script>
  <?php endforeach ?>
<?php endif ?>

</head>

  <body class="nav-md login">
    
    <div class="container body">
        <div class="main_container">
