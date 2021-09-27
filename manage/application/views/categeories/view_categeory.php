
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
        <h2><?php echo $page_title;?> - <?php echo isset($categeoriesinfo->CategoryName)?$categeoriesinfo->CategoryName:'';?></h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
            </li>
             <li>
              <a href="<?php echo site_url()?>categories/edit/<?php echo $categeoriesinfo->CategoryID; ?>"data-toggle="tooltip" data-placement="top" title="edit" class="btn btn-round btn-primary"><i class='fa fa-pencil-square-o'></i>Edit</a>
           </li>
           <li><a class="btn btn-round btn-success" href="<?php echo site_url(); ?>categories">Back</a>
                      </li>

                
          </ul>
          <div class="clearfix"></div>
          </div>
          <div class="x_content">
            <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12 profile_left">
            <div class="profile_img">
              <div id="crop-avatar">
                          <!-- Current avatar -->
                  <?php if (isset($categeoriesinfo) && isset($categeoriesinfo->CategoryImage) ): ?>        
                <img class="img-responsive" src="<?php echo base_url($categeoriesinfo->CategoryImage);?>" >
                <?php else: ?>
                <img src="<?php echo base_url();?>assets/img/file.png" alt="file" class="img-fluid" style="width: 30%;">
            <?php endif ?>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12"> 
                      <table class="table">
                  <tr>
                    <td>Category Name</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->CategoryName)?$categeoriesinfo->CategoryName:'');?></b></td>
                  </tr>
                  <?php if ($categeoriesinfo->CategoryID==$categeoriesinfo->ParentID) { ?>
                    <tr>
                    <td>Sub-Category Name</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->CategoryName)?$categeoriesinfo->CategoryName:'');?></b></td>
                  </tr>
                  <?php } ?>
                  
                  <tr>
                    <td>Slug</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->CategorySlug)?$categeoriesinfo->CategorySlug:'');?>  </b></td>
                  </tr>
                  <tr>
                    <td>Description</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->CategoryDesc)?$categeoriesinfo->CategoryDesc:'');?> </b></td>
                  </tr>
                  <tr>
                    <td>SEO Title</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->SEOTitle)?$categeoriesinfo->SEOTitle:'');?> </b></td>
                  </tr>
                  <tr>
                    <td>SEO Description</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->SEODescription)?$categeoriesinfo->SEODescription:'');?> </b></td>
                  </tr>
                  <tr>
                    <td>SEO Keywords</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->SEOKeywords)?$categeoriesinfo->SEOKeywords:'');?> </b></td>
                  </tr>
                  <?php if ($categeoriesinfo->is_customizable==1) { ?>
                    <tr>
                    <td>Custom Size</td><td>:</td>
                    <td><b><?php echo ucwords(isset($categeoriesinfo->custom_size)?$categeoriesinfo->custom_size:'');?> </b></td>
                  </tr>
                  <?php }else{ ?>

                  <?php } ?>
                  

                </table>
                      </div>
                      
                    </div>
                  </div>
                  </div>
                </div>
            <!-- <div class="row">           
              <div class="col-md-5">
              </div>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>



