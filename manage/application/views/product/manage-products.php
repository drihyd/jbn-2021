
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li> -->

                      
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>products/add">+Add Product</a></i>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <!-- <p class="text-muted font-13 m-b-30">
                      DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                    </p> -->
                   
				   
				   
<?php if($this->session->flashdata('success')){ ?>

<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>

<?php 

}
 ?>

<?php if(!empty($productss)) {


  ?>

  <div class="row">
<div class="col-md-12 col-sm-12 col-xs-12 text-center">
    <b><span class="label label-danger">Latest 24Kt Gold price (1 Gram) :<?php echo $this->goldprice->price. ' (INR)';?></span><b></span>
<pre>
14KT = (24Kt Gold price*60)/100;
18KT = (24Kt Gold price*76)/100;
20KT = (24Kt Gold price*85)/100;
22KT =(24Kt Gold price*92)/100;
24KT =24Kt Gold price;
</pre>
</div>
</div>
<table id="datatable-import-table" class="dataTable table table-striped table-bordered" style="width:100%;font-size:12px;">
<thead >
<tr>
<th>S.No.</th>
<th>Category</th>
<!-- <th>Slug</th> -->
<th>Name</th>
<!-- <th>SKU</th> -->
<!-- <th>Width*Height*Length</th> -->
<!-- <th>Gross*Net weight</th> -->
<!-- <th>Stock</th> -->

<!-- <th>Modify On</th> -->
<th align="center">SEO</th>
<th align="center">Attributes</th>
<th align="center">Prices</th>
<th align="center">Image</th>
<th align="center">Video</th>
<th align="center" width=10>Preview</th>

<th align="center">Actions</th>
</tr>
</thead>
<tbody>
<?php 
$i=1; foreach($productss as $products) { ?>
<tr>
<td><?php echo $i; ?></td>
<td><?php echo ucwords($products->CategoryName); ?></td>
<!-- <td><?php echo ucwords($products->product_type); ?>-<?php echo ucwords($products->sub_product_type);?>-<?php echo ucwords($products->Gender); ?>-<?php echo ucwords($products->CategoryName); ?></td> -->
<td>
  <?php echo ucwords($products->Name); ?>
<br><small>SKU: <?php echo ucwords($products->SKU); ?></small>
<br><small>Numbers of Pieces : <?php echo ucwords($products->No_of_pieces); ?></small>
<br><small>Stock: <?php echo ucwords($products->Stock); ?></small>
<br><small>Ornament For: <?php echo ucwords($products->Gender); ?></small>
<br><span class="badge badge-pill badge-danger">Metal: <?php echo ucwords($products->purity_kt); ?></span>

</td>
<!-- <td><?php echo ucwords($products->SKU); ?></td> -->
<!-- <td><?php echo ucwords($products->Width); ?>*<?php echo ucwords($products->Height); ?>*<?php echo ucwords($products->Length); ?></td> -->
<!-- <td><?php echo ucwords($products->Gross_weight); ?>
<?php if($products->Net_weight!="") { ?>
*
<?php echo ucwords($products->Net_weight); 
}
?>
</td> -->
<td align="right">
<a title="Add/Update SEO details." alt="Add/Update SEO details." href="<?php echo site_url()?>products/seo_createorupdate/<?php echo  encrypt_url($products->ProductID); ?>"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
</td>
<td align="right">
<a title="Add/Update Attributes details." alt="Add/Update Attributes details." href="<?php echo site_url()?>products/attributes_createorupdate/<?php echo  encrypt_url($products->ProductID); ?>"><i class="fa fa-diamond" aria-hidden="true"></i></a>
</td>


<td align="center">
<a title="Add/Update Price details." alt="Add/Update Price details." href="<?php echo site_url()?>products/prices_createorupdate/<?php echo  encrypt_url($products->ProductID); ?>">
<?php echo INRICON;?>&nbsp;<?php echo sprintf("%.2f",$products->Price); ?></a>
<?php if($products->product_type=="gift_cards") { ?>
<?php } else { ?>
<br>&nbsp;&nbsp;(<u><a href="#" class="view_data" id="<?php echo $products->ProductID;?>"><i class="fa fa-info" aria-hidden="true"></i></a> </u>)
<?php } ?>
</td>
<td>
  


<?php
$image = str_replace(' ', '_',$products->SKU);
$image=$image."_1.jpg";
$image_path = base_url("../uploads/products/".$image);

?>
  <img src="<?php echo $image_path; ?>" class="img-responsive" width="40"/>

</td>

<td>
    

    
  <p><a href="<?php echo $products->product_video_url;?>" target="_blank"><?php echo $products->product_video_url;?></a></p>
    
</td>

<td align="right">
<a target="_new" href="../product/<?php echo $products->productslug; ?>"><i class="fa fa-external-link" aria-hidden="true"></i></a>
</td>
<td align="right">
<a href="<?php echo site_url()?>products/change_status/<?php echo $products->ProductID; ?>" > <?php if($products->Productlive==1){ echo '<i class="fa fa-unlock"></i>'; } else { echo '<i class="fa fa-lock"></i>'; } ?></a>&nbsp;&nbsp;
<a href="<?php echo site_url()?>products/update/<?php echo  encrypt_url($products->ProductID); ?>" ><i class='fa fa-pencil-square-o'></i></a>&nbsp;&nbsp;
<a href="<?php echo site_url()?>products/delete/<?php echo $products->ProductID; ?>" onclick="return confirm('Are you sure you want to delete?')"><i class='fa fa-trash-o'></i></a>
</td>

</tr>
<?php 
$i++; 
} 
?>

</tbody>
</table>

  <?php } else {?>
  <div class="alert alert-danger" role="alert">
                    <strong>No Data Found!</strong>
                </div>
  <?php } ?>

                  </div>
                </div>
              </div>

  </div>
</div>

<!-- view Modal -->
 <div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" style="margin-top: -20px;">
   <div class="modal-dialog modal-lg">
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         <h4 class="modal-title" id="myModalLabel">Price Breakup</h4>
       </div>
       <div class="modal-body">
        <!-- Place to print the fetched phone -->
         <div id="phone_result"></div>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       </div>
     </div>
   </div>
 </div>




