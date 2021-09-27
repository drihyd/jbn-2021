<footer class="bg-bright pt-3 pb-3 pt-lg-5 pb-xl-5">
  <div class="container">
      <div class="row">
        <div class="col-lg-8 col-xl-8">
          <div class="row" id="listItems">
            <?php if ($this->nav_jbn_menu) { ?>
            <?php 

// $loopcount=1;
            foreach ($this->footer_menu as $key => $menu) { ?>
              <?php if($menu->parent_id == 0) { ?>
           <div class="footer-wrapper">
          <ul class="footer-list">
            <!-- <a href="#"><strong><?php echo $menu->m_item_name;?></strong></a> -->
            <h5><strong><?php echo $menu->m_item_name;?></strong></h5>
            <?php foreach ($this->footer_menu as $key => $sub_menu) { ?>
                  <?php if($sub_menu->parent_id == $menu->m_item_id) { ?>
            <li ><a href="<?php echo $sub_menu->m_item_url;?>"><strong><?php echo ucwords($sub_menu->m_item_name)?></strong></a></li>
            
            <!-- <li><a href="#">Gift Cards</a></li> -->
            <?php 
                      }
                      } ?>
          </ul>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <?php }

// $loopcount++;

      }

    } ?>

        <!-- <div class="footer-wrapper">

          <ul class="footer-list">
            <h4>Policies</h4>
            <li><a href="#">General Terms</a></li>
            <li><a href="<?php echo base_url('faqs')?>">Refund policy</a></li>
            <li><a href="<?php echo base_url('Shipping')?>">Exchange & buyback</a></li>
            <li><a href="#">Cancellation Policy</a></li>
            <li><a href="#">Shipping policy</a></li>
            <li><a href="#">Gift Cards</a></li>
          </ul>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="footer-wrapper">

          <ul class="footer-list">
            <h4>Jewellery by Nikitha</h4>
            <li><a href="#">About us</a></li>
            <li><a href="<?php echo base_url('faqs')?>">Blog</a></li>
            <li><a href="<?php echo base_url('Shipping')?>">Contact Us</a></li>
            <li><a href="#">Cancellation Policy</a></li>
            <li><a href="#">Shipping policy</a></li>
            <li><a href="#">Gift Cards</a></li>
          </ul>
        </div> -->
                
          </div>

        </div>

        <div class="col-md-4 col-lg-3 col-xl-3 align-self-center">
        <div class="footer-wrapper">
          <ul class="footer-list text-left text-lg-right text-xl-right">
            <li class="nav-item">
              <!-- <?php //if(validation_errors()) { ?>
            <div class="alert alert-warning">
              <?php //echo validation_errors(); ?>
            </div>
          <?php //} ?> -->
              <!-- <?php// if($this->session->flashdata('success')){ ?>
                <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php// echo $this->session->flashdata('success'); ?></strong>
</div>
  <?php //} ?> -->
<!--   <?php// if($this->session->flashdata('newletter_flash_message')){ ?>
                <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php// echo $this->session->flashdata('newletter_flash_message'); ?></strong>
</div>
  <?php// } ?> -->
  <!-- <?php// if($this->session->flashdata('error')){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong><span class="glyphicon glyphicon-ok"></span>   <?php// echo $this->session->flashdata('error'); ?></strong>
</div>
  <?php// } ?> -->


<form method="post" action="#" id="newsletter">
  <div class="input-group mb-3">
    <input type="email" class="form-control" name="email" placeholder="Email ID" aria-label="Recipient's username" aria-describedby="basic-addon2" required="required">
    <div class="input-group-append">
      <button type="submit" class="input-group-text btn btn-accent border-0 m-0" id="basic-addon2">Subscribe</button>
      <!-- <span class="input-group-text btn btn-accent border-0 m-0" id="basic-addon2">Subscribe</span> -->
    </div>
  </div>
</form>


</li>


            <li class="nav-item mb-0">
              <ul class="list-inline">
                <li class="list-inline-item"><a href="https://www.facebook.com/jewelryanaya/" target="_new"><img src="<?php echo base_url()?>assets/img/facebook1.png" alt=""></a></li>
                <li class="list-inline-item"><a href="https://www.instagram.com/anaya_jewellerybynikitha/?igshid=z4re7w85iqxg" target="_new"><img src="<?php echo base_url()?>assets/img/instagram1.png" alt=""></a></li>
                <li class="list-inline-item"><a href="https://www.youtube.com/watch?v=l0sfoB-9f08" target="_new"><img src="<?php echo base_url()?>assets/img/youtube1.png" alt="" width="125%"></a></li>
              </ul>
            </li>

            <li class="nav-item"><span>&copy; Jewellery by Nikitha 2021</span></li>
          </ul>
        </div>
      </div>

         </div>
  </div>
</footer>
<!-- PAGE BODY : END -->



<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Subscribe to our Newsletter</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <form action="#">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Email:</label>
            <input type="email" class="form-control" id="recipient-name">
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-brand m-0">Submit</button>
      </div>
    </div>
  </div>
</div>

<div class="fixedfloating">
<a href="https://api.whatsapp.com/send?phone=919949236006" class="floatwhatsapp" target="_blank">
<i class="fab fa-whatsapp my-float"></i></a>
</div>