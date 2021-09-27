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
                      
                      <li><a class="btn btn-round btn-success" href="<?php echo site_url("menu")?>"><i class='fa fa-plus-square'></i>Back to Menu</a></i>
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
  <!-- id="datatable-fixed-header" -->
    <table  class="table table-striped table-bordered" style="width:100%">
      <thead>


        <tr>
          <th>Menu</th>
          <th>Parent Menu</th>
          <th></th>
          <th>Actions</th>
          
        </tr>
      </thead>
       <tbody>
       <?php if($menu_items) {
          foreach ($menu_items as $menu) { ?>
            <?php if($menu->parent_id == 0) { ?>
              <tr>
                <td><strong style="font-size: 15px;"><?php echo ucfirst($menu->m_item_name); ?></strong></td>
                 <td> </td>
                 <td> </td>
                 <td><a href="<?php echo site_url()?>menu_items/edit/<?php echo $m_id.'/'.$menu->m_item_id; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
                    <a href="<?php echo site_url()?>menu_items/delete/<?php echo $menu->m_item_id; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                  </td>
              
                <?php foreach ($menu_items as $key => $sub_menu) { ?>
                    <?php if($sub_menu->parent_id == $menu->m_item_id) { ?>
                <tr>
                  <td><b><?php echo ucwords($sub_menu->m_item_name)?></b></td>
                  <td><?php echo $menu->m_item_name?></td>
                  <td></td>
                  
                <td class="edit-column tiny-col">
                   <a href="<?php echo site_url()?>menu_items/edit/<?php echo $m_id.'/'.$sub_menu->m_item_id; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
                <a href="<?php echo site_url()?>menu_items/delete/<?php echo $m_id.'/'.$sub_menu->m_item_id; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                      </td>
                  
                  <?php foreach ($menu_items as $key => $sub_menu_1) { ?>
                    <?php if($sub_menu_1->parent_id == $sub_menu->m_item_id) { ?>
                  <tr>
                <td><?php echo $sub_menu_1->m_item_name?></td>
                <td><?php echo $sub_menu->m_item_name?></td>
                <td></td>
                
              <td class="edit-column tiny-col">
                 <a href="<?php echo site_url()?>menu_items/edit/<?php echo $m_id.'/'.$sub_menu_1->m_item_id; ?>"data-toggle="tooltip" data-placement="top" title="edit" ><i class='fa fa-pencil-square-o'></i></a>
              <a href="<?php echo site_url()?>menu_items/delete/<?php echo $m_id.'/'.$sub_menu_1->m_item_id; ?>" onclick="return confirm('are you sure to delete')" data-toggle="tooltip" data-placement="top" title="delete"><i class='fa fa-trash-o'></i></a>
                    </td>
                  </tr>
                  </tr>
                  </tr>
                  <?php  }}}}}}}?>
               

      </tbody>
    </table>
                  </div>
                </div>
              </div>
  </div>
</div>

