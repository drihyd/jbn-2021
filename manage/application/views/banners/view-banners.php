<!DOCTYPE html>
<html lang="en">
<head>
  <title>Codeigniter Crud By PHP Code Builder</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://crudegenerator.in">Codeigniter Crud By PHP Code Builder</a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="<?php echo site_url(); ?>manage-banners">Manage Banners</a></li>
        <li><a href="<?php echo site_url(); ?>add-banners">Add Banners</a></li>
      </ul>
  </div>
</nav>

<div class="container">

 <div class="row">
  <div class="col-xs-12 col-md-10 well">
   Heading_One  :  <?php echo $banners[0]->Heading_One ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Heading_Two  :  <?php echo $banners[0]->Heading_Two ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Button_Name  :  <?php echo $banners[0]->Button_Name ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Call_to_action_URL  :  <?php echo $banners[0]->Call_to_action_URL ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Order_By  :  <?php echo $banners[0]->Order_By ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Added_On  :  <?php echo $banners[0]->Added_On ?>
  </div>
</div>

</div>

</body>
</html>