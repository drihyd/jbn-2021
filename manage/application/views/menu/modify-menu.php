<!-- page content -->
<style>
  .drop-div{
    height:100px;
   
    }
</style>

 
 
        <link rel="stylesheet" type="text/css" href="https://www.jqueryscript.net/demo/Drag-Drop-Menu-Builder-For-Bootstrap/bs-iconpicker/css/bootstrap-iconpicker.min.css">
<div class="right_col" role="main">
<div class="">
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $page_title;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link "><i class="fa fa-chevron-up"></i>&nbsp;&nbsp;</a>
                      </li>
                      
                      <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>Mega_menu<?php echo isset($m_id);?>"><i class='fa fa-plus-square'></i> Back to Menu</a>
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
  <?php } ?>
 <!-- Add your code here -->


 <div class="container">
  <div class="row">
    
    <div class="col-md-7">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <h5 class="pull-left">Menu</h5>
          <div class="pull-right">
            <button id="btnOut" data-updateurl="<?php echo base_url("Mega_menu/update") ?>" data-menuid="<?php echo $this->uri->segment(3) ?>" type="button" class="btn btn-success btn-sm"> <i class="glyphicon glyphicon-ok"></i> Save</button>
          </div>
        </div>
        <div class="panel-body" id="cont">
          <ul id="myList" class="sortableLists">
            <?php echo $menu_list ?>
          </ul>
        </div>
      </div>
</div>
<div class="col-md-5">
      <div class="panel panel-default">
        <div class="panel-heading">Edit Menu</div>
        <div class="panel-body">
          <form id="frmEdit" class="form-horizontal">
            <input type="hidden" name="mnu_icon" id="mnu_icon">
            <div class="form-group">
              <label for="mnu_text" class="col-sm-4">Text</label>
              <div class="col-sm-10">
               
                  <input type="text" class="form-control" id="mnu_text" name="mnu_text" placeholder="Text" required="required">
              <!--     <div class="input-group-btn">
                    <button id="mnu_iconpicker" class="btn btn-default" data-iconset="fontawesome" data-icon="" type="button"></button>
                  </div> -->
              
              </div>
            </div>
            <div class="form-group">
              <label for="mnu_href" class="col-sm-4">URL</label>
              <div class="col-sm-10">
                <input type="url" class="form-control" id="mnu_href" name="mnu_href" placeholder="URL">
              </div>
            </div>

            <div class="form-group">
              <label for="is_nav_dropdown" class="col-sm-4">Is nav dropdown? (yes/no)</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mnu_is_nav_dropdown" name="mnu_is_nav_dropdown" placeholder="Text">
    
              </div>
            </div>

            <div class="form-group">
              <label for="is_display" class="col-sm-4">Is Display?(yes/no)</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mnu_is_display" name="mnu_is_display" placeholder="Text">
            
              </div>
            </div>



        
          </form>
        </div>
        <div class="panel-footer">
         <button type="button" id="btnUpdate" class="btn btn-primary btn-sm" disabled><i class="fa fa-refresh"></i> Update</button>
          <button type="button" id="btnAdd" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add</button>
        </div>
      </div>
    </div>
<!-- <p>Click the Output button</p>
                    <div class="card">
                    <div class="card-header">JSON Output -->
  <!-- <form class="" role="form" method="post" data-parsley-validate action="">
    <div class="float-right">
      <label for="out">Output:</label>
      <textarea id="out" class="form-control" cols="50" rows="10"></textarea>&nbsp;
      <input type="hidden" name="jsonoutputvalue" id="jsonoutputvalue" value=''>

        <button type="submit" class="btn btn-primary">Submit</button>
  </form> -->
  <!-- </div>
</div> -->
    </div>
  </div>
  <div>
    <div class="col-md-6"></div>
  </div>
</div>


 <!---- End Code her -->
                   
                  </div>
                </div>
              </div>
  </div>
</div>


