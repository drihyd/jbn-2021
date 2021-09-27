
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
              <div class="col-md-6">
                <table>
                  <tr>
                    <td><h5>Issue</h5></td><td>:</td>
                    <td><b><?php echo ucwords(isset($support_leads->issue_type)?$support_leads->issue_type:'');?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Name</h5></td><td>:</td>
                    <td><b><?php echo ucwords(isset($support_leads->name)?$support_leads->name:'');?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Email</h5></td><td>:</td>
                    <td><b><?php echo isset($support_leads->email)?$support_leads->email:'';?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Phone</h5></td><td>:</td>
                    <td><b><?php echo isset($support_leads->phone)?$support_leads->phone:'';?></b></td>
                  </tr>
                  <tr>
                    <td><h5>Comments</h5></td><td>:</td>
                    <td><b><?php echo ucwords(isset($support_leads->comments)?$support_leads->comments:'');?></b></td>
                  </tr>
                </table>
                <a href="<?php echo base_url();?>support_leads" class="btn btn btn-success" style="margin-top: 10px;" >Back</a>
            </div>
            <div class="col-md-6">
              <form class="" role="form" method="post" data-parsley-validate action="<?php echo site_url()?>support_leads/submit">
                <div><span><b>Reply to: </b></span> <?php echo isset($support_leads->email)?$support_leads->email:'';?> </div>&nbsp;
                
         <div class="form-group" id="status">
              <label for="status">Status<span class="text-red"style="color: red;">*</span></label>
        <select  class="form-control" name="status" id="status" required="required">
           <option value="">-- Pick One --</option>
              <?php
              foreach ($this->status as $key => $value) {
              echo '<option value="'.$value.'">'.ucwords($value).'</option>';
              }
              ?>
        </select>
      </div>
    
              <div class="form-group">
        <label for="reply">Reply<span class="text-red"style="color: red;">*</span></label>
        
        <textarea class="form-control" id="reply" name="reply" required="required" rows="7"></textarea>
      </div>
      
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" value="<?php echo $support_leads->id; ?>" name="support_lead_id" id="support_lead_id" />
    </form>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>







