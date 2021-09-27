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
                     
                      <li><a class="btn btn-round btn-success" style="color: white;" href="<?php echo base_url(); ?>categories/add">+Add Category</a></i>
                      </li>
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
                          <th>Category</th>
                          <th>Parent Category</th>
                          
                          <th>Actions</th>
                          <!-- <th>Start date</th>
                          <th>Salary</th> -->
                        </tr>
                      </thead>


                      <tbody>
                       <?php if($categeoriesinfo) {
                          foreach ($categeoriesinfo as $category) { ?>
                            <?php if($category->ParentID == 0) { ?>
                              <tr>
                                 <td><strong style="font-size: 15px;"><a href="<?php echo site_url()?>categories/view/<?php echo $category->CategoryID; ?>"data-toggle="tooltip" data-placement="top" title="view Category" ><u><?php echo $category->CategoryName;?></u></a></strong></td>
                                 <td> </td>
                                 <td><a href="<?php echo site_url()?>categories/edit/<?php echo $category->CategoryID; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
                                    <a href="<?php echo site_url()?>categories/delete/<?php echo $category->CategoryID; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                                  </td>
                              </tr>
                              <?php foreach($categeoriesinfo as $parentfilter) { ?>

                                  <?php if($parentfilter->ParentID == $category->CategoryID) { ?>
                                    <tr>
                                      <!-- <td><?php// echo ucfirst($parentfilter->CategoryName); ?></td> -->
                                      <td><a href="<?php echo site_url()?>categories/view/<?php echo $parentfilter->CategoryID; ?>"data-toggle="tooltip" data-placement="top" title="view Category" ><?php echo ucfirst($parentfilter->CategoryName); ?></a></td>
                                      <td><?php echo ucfirst($category->CategoryName); ?></td>
                                    <td class="edit-column tiny-col">
                                       <a href="<?php echo site_url()?>categories/edit/<?php echo $parentfilter->CategoryID; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
                                    <a href="<?php echo site_url()?>categories/delete/<?php echo $parentfilter->CategoryID; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                    </td>
                  </tr>

                                  <?php } 
                               } 
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