
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
<div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-products">+Add Products</a>
                      </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
           <div class="row">           
           <div class="col-md-12">
            
          <?php if($this->session->flashdata('error')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('error'); ?></strong>
</div>
  <?php } ?>
          <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>

  <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>gold_price/add"  enctype="multipart/form-data" >
    
    
      
      <!-- <div class="form-group row">
    <label for="inputEmail3" class="col-sm-3 col-form-label">14 Kt Gold (1 Gram)</label>
    <div class="col-sm-6">
      <input type="number" class="form-control" name="goldprice_14" id="inputEmail3" placeholder="Price" required="required"  value="<?php echo isset($gold_price_info_1[0]->price)?$gold_price_info_1[0]->price:'';?>">
    </div>
    <label for="inputEmail3" class="col-sm-2 col-form-label">Grams</label>
  </div>
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-3 col-form-label">18 Kt Gold (1 Gram)</label>
    <div class="col-sm-6">
      <input type="number" class="form-control" name="goldprice_18" id="inputEmail3" placeholder="Price" required="required"  value="<?php echo isset($gold_price_info_2[0]->price)?$gold_price_info_2[0]->price:'';?>">
    </div>
    <label for="inputEmail3" class="col-sm-2 col-form-label">Grams</label>
  </div>
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-3 col-form-label">22 Kt Gold (1 Gram)</label>
    <div class="col-sm-6">
      <input type="number" class="form-control" name="goldprice_22" id="inputEmail3" placeholder="Price" required="required"  value="<?php echo isset($gold_price_info_3[0]->price)?$gold_price_info_3[0]->price:'';?>">
    </div>
    <label for="inputEmail3" class="col-sm-2 col-form-label">Grams</label>
  </div> -->
  <div class="form-group row">
    <!-- <label for="inputEmail3" class="col-sm-5 col-form-label">24 Kt Gold (1 Gram)</label> -->
    <div class="col-sm-8">
      <input type="number" step="any" class="form-control" name="goldprice_24" id="inputEmail3" placeholder="Price" required="required" >
    </div>
  </div>
  <div class="form-group row">
    <!-- <label for="inputEmail3" class="col-sm-5 col-form-label"></label> -->
    <div class="col-sm-8">
      <button type="submit" class="btn btn-primary">Update</button>
    </div>
  </div>
   
    
  
    
    </form> 
  
  </div>
  </div>
          
          
          
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> Gold Rate in India for Last 10 Days (1 gram)</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      <!-- <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>add-products">+Add Products</a>
                      </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
           <div class="row">           
           <div class="col-md-12">
            <table class="table table-striped table-bordered" style="width:100%">
                      <thead>


                        <tr>
                          <th>S.NO</th>
                          <th>Purity</th>
                          <th>Gold Price</th>
                          <th>Units</th>
                          <th>Date</th>
                        </tr>
                      </thead>
                      <tbody>
      <?php if($gold_price_info) { ?>
        <?php $i=1; foreach ($gold_price_info as $gold_price) { ?>

<tr>
<td><?php echo $i;?></td>
<td><?php echo $gold_price->metal_clar_purity.' Kt';?></td>
<td><?php echo $gold_price->price;?></td>
<?php if ($gold_price->units == 'gm') { ?>
  <td><?php echo '1 Gram'?></td>
<?php } ?>
<!-- <td><?php //echo ucfirst($gold_price->units);?></td> -->
<td><?php echo date("d-m-Y h:i", strtotime($gold_price->date));?></td>
</tr>
<?php $i++; }
} 
?> 
                      </tbody>
                    </table>
    
      </div>
    </div>
  </div>

  </div>
</div>
              
</div>
</div>

<!--  -->







