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
            <li class="active" ><a href="<?php echo site_url(); ?>add-products">Add Products</a></li>
          </ul>
      </div>
    </nav>

<div class="container">

  <h2>Add Products</h2>  
    <form role="form" method="post" action="<?php echo site_url()?>/add-products-post"  enctype="multipart/form-data" >
              <div class="form-group">
        <label for="ProductID">ProductID:</label>
        <input type="number" class="form-control" id="ProductID" name="ProductID">
      </div>
            <div class="form-group">
        <label for="SKU">SKU:</label>
        <input type="text" class="form-control" id="SKU" name="SKU">
      </div>
            <div class="form-group">
        <label for="Name">Name:</label>
        <input type="text" class="form-control" id="Name" name="Name">
      </div>
            <div class="form-group">
        <label for="Price">Price:</label>
        <input type="number" class="form-control" id="Price" name="Price">
      </div>
            <div class="form-group">
        <label for="Weight">Weight:</label>
        <input type="number" class="form-control" id="Weight" name="Weight">
      </div>
            <div class="form-group">
        <label for="CartDesc">CartDesc:</label>
        <input type="text" class="form-control" id="CartDesc" name="CartDesc">
      </div>
            <div class="form-group">
        <label for="ShortDesc">ShortDesc:</label>
        <input type="text" class="form-control" id="ShortDesc" name="ShortDesc">
      </div>
            <div class="form-group">
      <label for="LongDesc">LongDesc:</label>
    <textarea  class="form-control" id="LongDesc" name="LongDesc"></textarea>
      </div>
            <div class="form-group">
        <label for="Thumbnail">Thumbnail:</label>
        <input type="file" class="btn btn-primary" id="Thumbnail" name="Thumbnail">
      </div>
            <div class="form-group">
        <label for="lmage">Lmage:</label>
        <input type="file" class="btn btn-primary" id="lmage" name="lmage">
      </div>
            <div class="form-group">
        <label for="CategorylD">CategorylD:</label>
        <input type="number" class="form-control" id="CategorylD" name="CategorylD">
      </div>
            <div class="form-group">
        <label for="UpdateDate">UpdateDate:</label>
        <input type="text" class="form-control" id="UpdateDate" name="UpdateDate">
      </div>
            <div class="form-group">
        <label for="Stock">Stock:</label>
        <input type="number" class="form-control" id="Stock" name="Stock">
      </div>
          <div class="form-group">
    <label for="Productlive">Productlive:</label>
    
    <input type="radio" name="Productlive" value="Yes"> Yes    
    <input type="radio" name="Productlive" value="No"> No        </div>
            <div class="form-group">
        <label for="Addedon">Addedon:</label>
        <input type="text" class="form-control" id="Addedon" name="Addedon">
      </div>
            <div class="form-group">
        <label for="Modifiedon">Modifiedon:</label>
        <input type="text" class="form-control" id="Modifiedon" name="Modifiedon">
      </div>
            <div class="form-group">
        <label for="AddedBy">AddedBy:</label>
        <input type="text" class="form-control" id="AddedBy" name="AddedBy">
      </div>
            <div class="form-group">
        <label for="AddedByIP">AddedByIP:</label>
        <input type="text" class="form-control" id="AddedByIP" name="AddedByIP">
      </div>
            <div class="form-group">
        <label for="SEOTitle">SEOTitle:</label>
        <input type="text" class="form-control" id="SEOTitle" name="SEOTitle">
      </div>
            <div class="form-group">
        <label for="SEODesc">SEODesc:</label>
        <input type="text" class="form-control" id="SEODesc" name="SEODesc">
      </div>
            <div class="form-group">
        <label for="SEOKeywords">SEOKeywords:</label>
        <input type="text" class="form-control" id="SEOKeywords" name="SEOKeywords">
      </div>
          <div class="form-group">
    <label for="CouponID">CouponID:</label>
    <select class="form-control" id="CouponID" name="CouponID">
        <option value="Category One">Category One</option>
        <option value="Category Two">Category Two</option>
        </select>
    </div>
            <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
</html>