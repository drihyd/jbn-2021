  <!-- page content -->
  <div class="right_col" role="main">
  <div class="">
  <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
  <div class="x_title">
  <h2><?php echo $page_title;?></h2>
  <div class="clearfix"></div>
  </div>
  <div class="x_content">
  <form role="form" method="post" id="import_excel_data" class="frm" data-parsley-validate action="<?php echo site_url()?>products/importdata"  enctype="multipart/form-data">
  <div class="row">	
  <div class="col-md-6">
    <div class="form-group">
  <h4>Product Import Instructions</h4>
  <ol>
    <li><a target="_new" href="<?php echo site_url()?>sample_product_import_file/Sample_Template.xls" style="color: red;" ><u>Download</u></a> Sample File</li>
    <li>Do not Rename/Change the order of the fields</li>
    <li>Do not add extra fields</li>
    <li>Enter Mandatory Fields(Red colour fields are mandatory)</li>
    <li>Do not add units (Example:mm,kt,ct)</li>
    <li>Fill the data upload and submit</li>
  </ol>
  </div>
  <div class="form-group">
  <label for="file">File Upload:</label>
  <input type="file" class="form-control" id="userfile" name="userfile" required="required">
  </div>
  
  </div>		
  </div>
  <button type="submit" class="btn btn-round btn-success pull-left" name="importfile" id="importfile">Submit</button>
  </form>
  </div>
  <div class="row"> 
  <div class="col-md-12">
  <h3>Importing Products <?php print_r($cellmismath);?></h3>

  <?php if(!empty($importing_products)) { ?>
      <!-- <a href="<?php echo site_url()?>products/move_temp_imported_data"><button class="btn btn-primary pull-right">Move to product table</button></a> -->
<input class="btn btn-primary pull-right" type="button" id="move_to_product_table" value='Move to product table'>
<!--       <a href="<?php echo site_url()?>products/clear_temp_product_data"><button class="btn btn-primary pull-right">Clear all</button></a> -->
  <input class="btn btn-primary pull-right" type="button" id="delete" value='Delete'>
  <table id="datatable-import-table" class="table table-condensed table-bordered" style="width:100%">
  <thead valign="middle">
  <tr>
  <th>S.No</th>
  <th><input type="checkbox" id="checkall" value='1'>&nbsp;</th>
  <th>Error</th>
  <?php
  $i=1; 
  $products1 = json_decode(json_encode($importing_products[0]), true);

  ?>
  <?php

  foreach ($products1 as $key => $value) { 
unset($products1['ID'],$products1['is_error'],$products1['category_error_checking'],$products1['sub_category_error_checking'],$products1['material_error_checking'],$products1['diam_certi_err_chk'],$products1['color_metal_err_chk'],$products1['dia_clor_error'],$products1['dia_clarity_error'],$products1['diam_shape_err_chk'],$products1['diam_shape_2_err_chk'],$products1['diam_shape_3_err_chk'],$products1['gemstone_err_chk'],$products1['pearls_err_chk'],$products1['purity_error_checking']);
}


  foreach ($products1 as $key => $value) { ?>

  <th>
  <?php
  echo $new_name = ucwords(str_replace('_', ' ', $key));
  ?>
    
  </th>
  <?php } ?>
  </tr>
  </thead>
  </tr>
  </thead>
  <tbody>
  <?php
  $i=1; 
  foreach($importing_products as  $products) { 
  $products = json_decode(json_encode($products), true);
  ?>
  <tr id='tr_<?= $products['ID'] ?>' <?php if(!empty($products['is_error'])) { ?> class="warning" <?php } ?> >
  <td><?php echo $i; ?></td>
  <td><input type="checkbox" class='checkbox' name='delete' value='<?= $products['ID'] ?>' ></td>
  <td>

    
<?php if(!empty($products['is_error'])): ?>
    <div class="info mb-2" >
    <i class="fa fa-info-circle tooltip" aria-hidden="true" style="font-size:12px;">
      <span class="tooltiptext">
    <?php echo $products['is_error']; ?>
    </span>
      
    </i>
    
    </div>
      
      <?php 
    else:
      endif;
      ?>


    </td>
  <?php

 
foreach ($products as $key => $value) { 
unset($products['ID'],$products['is_error'],$products['category_error_checking'],$products['sub_category_error_checking'],$products['material_error_checking'],$products['diam_certi_err_chk'],$products['color_metal_err_chk'],$products['dia_clor_error'],$products['dia_clarity_error'],$products['diam_shape_err_chk'],$products['diam_shape_2_err_chk'],$products['diam_shape_3_err_chk'],$products['gemstone_err_chk'],$products['pearls_err_chk'],$products['purity_error_checking']);
}





  foreach ($products as $key => $value) { ?>
  <td><?php 

  echo $value; 


  ?></td>
  <?php } ?>
  </tr>
  <?php 
  $i++; 
  } 
  ?>
  </tbody>
  </table>
  <?php } else {?>
  <div class="alert alert-danger" role="alert">
    <?php if($cellmismath) { ?> 
<strong><?php echo $cellmismath;?></strong>
    <?php } else { ?>
  <strong>No data found.</strong>

<?php } ?>
  </div>
  <?php } ?>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>


