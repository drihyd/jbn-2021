
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <h2><?php echo ucwords(isset($pageinfo->name)?$pageinfo->name:'');?> <?php echo $page_title;?></h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
            </li>
          </ul>
          <div class="clearfix"></div>
          </div>
          <div class="x_content">        
            <div class="row">           
              <div class="col-md-12">
                <table>
                  <!-- <tr>
                    <td><h5>Name:</h5></td>
                    <td><?php echo ucwords(isset($pageinfo->name)?$pageinfo->name:'');?></td>
                  </tr> -->
                  <tr>
                    <td><h5>Title:</h5></td>
                    <td><?php echo ucwords(isset($pageinfo->title)?$pageinfo->title:'');?></td>
                  </tr>
                  <tr>
                    <td><h5>Slug:</h5></td>
                    <td><?php echo ucwords(isset($pageinfo->slug)?$pageinfo->slug:'');?></td>
                  </tr>

                </table>
                <?php if (isset($pageinfo) && isset($pageinfo->featured_image_path) ): ?>
                <img src="<?php echo base_url($pageinfo->featured_image_path);?>" alt="file" class="img-fluid" style="width: 60%; margin-left: 10px; margin-top: 10px;">
              <?php else: ?>
              <!--   <img src="<?php //echo base_url();?>assets/img/file.png" alt="file" class="img-fluid" style="width: 30%;"> -->
            <?php endif ?>
                
                <h5>Content: <?php echo ucwords(isset($pageinfo->content)?$pageinfo->content:'');?></h5>

                <a href="<?php echo base_url();?>Pages" class="btn btn btn-default" style="margin-top: 10px;" >Back to pages</a>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>







