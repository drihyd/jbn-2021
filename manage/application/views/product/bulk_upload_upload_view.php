    <div class="admin-tabs">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#discountimage" aria-controls="discountimage" role="tab" data-toggle="tab">Choose Category</a></li>
      </ul>
    </div>
    
    <section class="white-section">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <div class="tab-content">
 <?php
    echo $this->session->flashdata('form-after-message');
    echo $this->session->flashdata('message');
?>             
              <div role="tabpanel" class="tab-pane active" id="discountimage">
                <?php echo validation_errors(); ?>
                <?php echo form_open_multipart('bulk_upload/import_bulk_data', array('class' => 'edit-form')); ?>
                  <legend>Bulk Upload</legend>
                  
                  <div class="form-group">
                    <label for="uploadCategory">Choose Category</label>
                    <select name="uploadCategory" id="uploadCategory" class="form-control input-sm" required>
<?php
  if(count(array_filter($categories)) > 0) {
    foreach($categories as $category) { ?>
                      <option value="<?php echo $category->id; ?>"><?php echo ucwords($category->name); ?></option>
<?php
    }
  } ?>
                    </select>
                  </div>  
                  
                  <div class="form-group">
                    <label for="bulkUploadFile">Upload .xlsx file</label>
                    <input type="file" name="bulkUploadFile" id="bulkUploadFile" class="form-control input-sm" required>
                  </div>
                  
                  <div class="form-group">
                    <button type="submit" class="btn btn-brand btn-wide btn-sm">Import Data</button> <a href="<?php echo $this->config->base_url().'dashboard' ?>" class="btn btn-action-link">Cancel</a>
                  </div>
                </form>
              </div> <!-- ./#discountimage tab end-->
              
            </div> <!-- ./tab-content -->
             
          </div>
          
          
        </div>
      </div> <!-- /.container-fluid -->
    </section>

  </div>
  <!-- /#main-content -->
