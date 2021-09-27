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
                      
                      <li><a class="btn btn-round btn-success" href="<?php echo base_url(); ?>menu_items/add/<?php echo isset($m_id);?>"><i class='fa fa-plus-square'></i>Back to Menu</a>
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
    <div class="col-md-6">
      <div class="panel panel-primary">
        <div class="panel-heading">Edit item</div>
        <div class="panel-body">
          <form id="frmEdit" class="form-horizontal">
            <input type="hidden" name="mnu_icon" id="mnu_icon">
            <div class="form-group">
              <label for="mnu_text" class="col-sm-2 control-label">Text</label>
              <div class="col-sm-10">
                <div class="input-group">
                  <input type="text" class="form-control" id="mnu_text" name="mnu_text" placeholder="Text">
                  <div class="input-group-btn">
                    <button id="mnu_iconpicker" class="btn btn-default" data-iconset="fontawesome" data-icon="" type="button"></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="mnu_href" class="col-sm-2 control-label">URL</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mnu_href" name="mnu_href" placeholder="URL">
              </div>
            </div>
          
           
          </form>
        </div>
        <div class="panel-footer">
         <button type="button" id="btnUpdate" class="btn btn-primary" disabled><i class="fa fa-refresh"></i> Update</button>
          <button type="button" id="btnAdd" class="btn btn-success"><i class="fa fa-plus"></i> Add</button>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <h5 class="pull-left">Menu</h5>
          <div class="pull-right">
            <button id="btnOut" type="button" class="btn btn-success"> <i class="glyphicon glyphicon-ok"></i> Save</button>
          </div>
        </div>
        <div class="panel-body" id="cont">
          <ul id="myList" class="sortableLists list-group">
            <li class="list-group-item" data-text="Home" data-icon="fa-home"
                                    data-href="http://home.com">
              <div><i class="fa fa-home"></i> <span class="txt">Home</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
            </li>
            <li class="list-group-item" data-text="Opcion2" data-icon="fa-bar-chart-o">
              <div><i class="fa fa-bar-chart-o"></i> <span class="txt">Opcion2</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
            </li>
            <li class="list-group-item" data-text="Opcion3" data-icon="fa-cloud-upload">
              <div><i class="fa fa-cloud-upload"></i> <span class="txt">Opcion3</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
            </li>
            <li class="list-group-item" data-text="Opcion4" data-icon="fa-crop">
              <div><i class="fa fa-crop"></i> <span class="txt">Opcion4</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
            </li>
            <li class="list-group-item" data-text="Opcion5" data-icon="fa-flask">
              <div><i class="fa fa-flask"></i> <span class="txt">Opcion5</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
            </li>
             <li class="list-group-item" data-text="Option 6" data-icon="fa-map-marker">
                      <div><i class="fa fa-map-marker"></i> <span class="txt">Option 6</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
                    </li>
            <li class="list-group-item" data-text="Opcion7" data-icon="fa-search">
              <div><i class="fa fa-search"></i> <span class="txt">Opcion7</span>
                <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
              </div>
              <ul>
                <li class="list-group-item" data-text="Opcion7-1" data-icon="fa-plug">
                  <div><i class="fa fa-plug"></i> <span class="txt">Opcion7-1</span>
                    <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
                  </div>
                </li>
                <li class="list-group-item" data-text="Opcion7-2" data-icon="fa-filter">
                  <div><i class="fa fa-filter"></i> <span class="txt">Opcion7-2</span>
                    <div class="btn-group pull-right"> <a href="#" class="btn btn-default btn-xs btnEdit">Edit</a> <a href="#" class="btn btn-danger btn-xs btnRemove">X</a> </div>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
        <p>Click the Output button</p>
                    <div class="card">
                    <div class="card-header">JSON Output
                    <div class="float-right">
      <label for="out">Output:</label>
      <textarea id="out" class="form-control" cols="50" rows="10"></textarea>
  </div>
</div>
</div>

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


