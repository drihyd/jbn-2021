<!--  page content --> 
<div class="right_col" role="main">
  <div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                     
                      <li><a class="btn btn-round btn-success" style="color: white;" href="<?php echo base_url(); ?>product_groups/add">+Add Product Group</a></i>
                      </li>
                      
                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  +Add Product Group option
                      </button>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   
                    <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php } ?>
                    <!-- <table id="datatable-fixed-header" class="table table-striped table-bordered" style="width:100%"> -->
                      <table  class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>Group Option</th>
                          <th>Product Group</th>
                          
                          <th>Actions</th>
                          <!-- <th>Start date</th>
                          <th>Salary</th> -->
                        </tr>
                      </thead>


                      <tbody>
                       <?php if($product_groupsinfo) {
                          foreach ($product_groupsinfo as $product_group) { ?>
                            
                              <tr>
                                 <td><strong style="font-size: 15px;"><?php echo $product_group->OptionGroupName;?></strong></td>
                                 <td> </td>
                                 <td><a href="<?php echo site_url()?>product_groups/edit/<?php echo $product_group->OptionGroupID ; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
                                    <a href="<?php echo site_url()?>product_groups/delete/<?php echo $product_group->OptionGroupID ; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                                  </td>
                              </tr>
                              <?php foreach($product_group_otionsinfo as $parentfilter) { ?>

                                  <?php if($parentfilter->OptionGroupID == $product_group->OptionGroupID) { ?>
                                    <tr>
                                      
                                      <td><?php echo ucfirst($parentfilter->OptionName); ?></td>
                                      <td><?php echo ucfirst($product_group->OptionGroupName); ?></td>
                                    <td class="edit-column tiny-col">
                                       <!-- <a ><i class='fa fa-pencil-square-o' data-toggle="modal" data-target="#exampleModalCenter"></i> -->
                                    <a href="<?php echo site_url()?>product_groups/delete_option/<?php echo $parentfilter->OptionID; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                    </td>
                  </tr>

                                  <?php } 
                               }
                              
                               }
                                } ?>

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

  </div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Add Group Option</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>product_groups/add_option"  enctype="multipart/form-data" >
    
      <div class="form-group col-md-8" id="ParentID">
        <label for="ParentID">Material type<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="OptionGroupID" id="ParentID" required="required">
          <!-- <option value="<?php //echo set_select('ParentID'); ?>">--Pick one--</option> -->
          <option value="0">-- Select Product Group--</option>
              <?php
              foreach ($this->parent_categeories as $key => $value) {
              echo '<option value="'.$value->OptionGroupID .'">'.ucwords($value->OptionGroupName).'</option>';
              }
              ?>
        </select>
      </div> 
      <div class="form-group col-md-8">
        <label for="CategoryName">Group Option Name<span class="text-red"style="color: red;">*</span></label>
        <input type="text" class="form-control" id="CategoryName" name="OptionName" required="required"  value="<?php echo set_value('OptionName'); ?>">
      </div>       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
      </form> 
    </div>
  </div>
</div>