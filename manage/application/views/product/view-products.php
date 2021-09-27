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
        <li><a href="<?php echo site_url(); ?>manage-products">Manage Products</a></li>
        <li><a href="<?php echo site_url(); ?>add-products">Add Products</a></li>
      </ul>
  </div>
</nav>

<div class="container">

 <div class="row">
  <div class="col-xs-12 col-md-10 well">
   ProductID  :  <?php echo $products[0]->ProductID ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   SKU  :  <?php echo $products[0]->SKU ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Name  :  <?php echo $products[0]->Name ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Price  :  <?php echo $products[0]->Price ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Weight  :  <?php echo $products[0]->Weight ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   CartDesc  :  <?php echo $products[0]->CartDesc ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   ShortDesc  :  <?php echo $products[0]->ShortDesc ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   LongDesc  :  <?php echo $products[0]->LongDesc ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   CategorylD  :  <?php echo $products[0]->CategorylD ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   UpdateDate  :  <?php echo $products[0]->UpdateDate ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Stock  :  <?php echo $products[0]->Stock ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Productlive  :  <?php echo $products[0]->Productlive ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Addedon  :  <?php echo $products[0]->Addedon ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   Modifiedon  :  <?php echo $products[0]->Modifiedon ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   AddedBy  :  <?php echo $products[0]->AddedBy ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   AddedByIP  :  <?php echo $products[0]->AddedByIP ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   SEOTitle  :  <?php echo $products[0]->SEOTitle ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   SEODesc  :  <?php echo $products[0]->SEODesc ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   SEOKeywords  :  <?php echo $products[0]->SEOKeywords ?>
  </div>
</div>
<div class="row">
  <div class="col-xs-12 col-md-10 well">
   CouponID  :  <?php echo $products[0]->CouponID ?>
  </div>
</div>

</div>

</body>
</html>