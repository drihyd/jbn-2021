<!-- PAGE BODY : BEGIN -->
<main class="main-content">

    <section class="info sec-login">
        <div class="container" >
          <!-- <form action="" class="needs-validation" novalidate> -->
            <div class="form-container">
              <h2 class="form-title">
                <hr>
                <span>Contact Us</span>
              </h2>
               <?php if(validation_errors()){ ?>
                <div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo validation_errors(); ?></strong>
                </div>
                  <?php } ?>
              <?php if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('success'); ?></strong>
                </div>
                  <?php } ?>
                  <?php if($this->session->flashdata('flash_message')){ ?>
                                <div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('flash_message'); ?></strong>
                </div>
                  <?php } ?>
                  <?php if($this->session->flashdata('error')){ ?>
                                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <strong><span class="glyphicon glyphicon-ok"></span>   <?php echo $this->session->flashdata('error'); ?></strong>
                </div>
                  <?php } ?>
              <form method="post" role="form" class="needs-validation" novalidate action="<?php echo site_url()?>contact_us" >
            <div class="form-wrap">
            	<label for="log-email">Name <span style="color: red">*</span></label>
              <div class="form-group">
                <input type="text" class="form-control" id="log-email" name="name" value="" placeholder="Name" required pattern="[a-zA-Z0-9\s]+">
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback">Name is required</span>
              </div>

              <label for="log-email">Email <span style="color: red">*</span></label>
              <div class="form-group">
                <input type="email" class="form-control" id="log-email" name="email" value="" placeholder="Email" required>
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback"> Email is required</span>
              </div>
              <label for="log-email">Mobile number <span style="color: red">*</span></label>
	              <div class="form-group">
	                  <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="Phone" required pattern="[6-9]{1}[0-9]{9}">
	                  <!-- <span class="valid-feedback">Looks good!</span> -->
                	  <span class="invalid-feedback"> Mobile Number required</span>
	                </div>
                  <label for="log-email">Subject <span style="color: red">*</span></label>
              <div class="form-group">
                <input type="text" class="form-control" id="log-email" name="subject" value="" placeholder="Name" required>
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback">Subject is required</span>
              </div>

                  <label for="log-email">Appointment Type <span style="color: red">*</span></label>
              <div class="form-group">
                <select class="form-control" id="appointment_type" name="appointment_type" required>
                <option value="">---Select-</option>
                <option value="book_video_call_appointment">Book video call appointment</option>
                <option value="contact_us_an_whatsapp">Contact us on what'sapp</option>
                </select>
                <!-- <span class="valid-feedback">Looks good!</span> -->
                <span class="invalid-feedback">Appointment Type is required</span>
              </div>

	            <label for="log-email">Comments <span style="color: red">*</span></label>
	              <div class="form-group">   
	                  <textarea id="comments"  class="form-control" name="comments" value="" placeholder="Comments" required rows="3" ></textarea>
	                  <!-- <span class="valid-feedback">Looks good!</span> -->
                	  <span class="invalid-feedback">This field is required</span>
	                </div>
	           	<div class="row">
                  <div class="col">
              		<button type="submit" class="btn btn-brand btn-block mt-0">Submit</button>
          		  </div>
          		  </form>
          		  <div class="col">
          		  	<a href="<?php echo base_url();?>" class="btn  btn-default btn-block  m-0">Back to Home</a>
          		  </div>
          		</div>
              
            </div>
            </div>
          <!-- </form> -->
        </div>
    </section>

</main>