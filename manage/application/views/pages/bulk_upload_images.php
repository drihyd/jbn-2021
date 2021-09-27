
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
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
				   <div class="row">				   
				   <div class="col-md-5">
				   	
				   
	<form class="" role="form" method="post" data-parsley-validate action="<?php echo base_url()?>bulk_images_upload/doupload"  enctype="multipart/form-data" >
              
        <!-- <strong><?php if(isset($totalFiles)) echo "Successfully uploaded ".count($totalFiles)." files"; ?></strong> -->
      <div class="form-group">
        <label for="files">Upload Images here...</label>
        <input type="file" class="btn btn-primary" id="files" name="files[]" required="required" multiple="">
      </div>&nbsp;
      <div class="form-group">
        </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="<?php echo $this->config->base_url().'dashboard' ?>" class="btn btn-default">Cancel</a>
    </form> 
	
	</div>
	</div>
					
					
					
                  </div>
                </div>
              </div>

  </div>
</div>


<script src="https://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.13.1/additional-methods.min.js"></script>
<script>
$(document).ready(function(){

$('select[name="isparent"]').change(function(){
    if($(this).val()==10){      
       $('#way').attr('readonly', false);
       $('#way').val('');
    }
    else{
         $('#way').attr('readonly', true);
         $('#way').val('');
    }
});



});
 </script> 




