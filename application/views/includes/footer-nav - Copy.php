<footer class="bg-bright pt-5 pb-5">
  <div class="container">
    <div class="row" id="listItems">
                  <?php $content = $this->core->get('pages', array('slug'));?>
                  <?php $content = $this->core->get_order_by("pages","order_logic",array("slug"), 'ASC');?>
            <?php if($content) {
                  foreach ($content as $page) { ?>
              <li><a href="<?php echo base_url('pages/'.$page->slug)?>"><?php echo ucwords($page->name);?></a></li>
           <?php } 
         }?>
          <!-- <li><a href="#">Careers</a></li> -->
          <li><a href=" http://deepredink.com/demos/anaya/blog/" target='_blank'>Blog</a></li>
          <!-- <li><a href="<?php echo base_url('privacy-policy')?>">Website Policies</a></li>
          <li><a href="<?php echo base_url('terms-conditions')?>">Terms & Condition </a></li> -->
          <!-- <li><a href="#">Address</a></li> -->
          <li>
            <ul class="list-inline">
              <li class="list-inline-item"><a href="https://www.facebook.com/jewelryanaya/" target='_blank'><img src="<?php echo base_url()?>assets/img/icon-facebook.png" alt="" target='_blank' ></a></li>
              <li class="list-inline-item"><a href="https://www.instagram.com/anaya_jewels/?hl=en" target='_blank'><img src="<?php echo base_url()?>assets/img/icon-instagram.png" alt="" target='_blank'></a></li>
              <li class="list-inline-item"><a href="https://www.youtube.com/watch?v=l0sfoB-9f08" target='_blank'><img src="<?php echo base_url()?>assets/img/icon-youtube.png" alt="" ></a></li>
            </ul>
          </li>
            <!-- <li><a href="#">Contact Us</a></li>
            <li><a href="<?php echo base_url('faqs')?>">FAQ's</a></li>
            <li><a href="<?php echo base_url('Shipping')?>">Shipping & Returns</a></li>
            <li><a href="#">Product Care</a></li>
            <li><a href="#">Gift Cards</a></li> -->
         <!-- <div class="col-md-3">
          <div class="footer-wrapper">
            <ul class="footer-list">
              <li><a href="#">Careers</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="<?php echo base_url('privacy-policy')?>">Website Policies</a></li>
              <li><a href="<?php echo base_url('terms-conditions')?>">Terms & Condition </a></li>
              <li><a href="#">Address</a></li>
              <li>
                <ul class="list-inline">
                  <li class="list-inline-item"><a href=""><img src="<?php echo base_url()?>assets/img/icon-facebook.png" alt=""></a></li>
                  <li class="list-inline-item"><a href=""><img src="<?php echo base_url()?>assets/img/icon-instagram.png" alt=""></a></li>
                  <li class="list-inline-item"><a href=""><img src="<?php echo base_url()?>assets/img/icon-youtube.png" alt=""></a></li>
                </ul>
              </li>
              </ul>
            </div>
        </div> -->
      <div class="col-md-3 align-self-end">
        <div class="footer-wrapper">
          <ul class="footer-list">
            <li>
              <a href="#" class="btn btn-default m-0" data-toggle="modal" data-target="#exampleModal">Subscribe</a>
            </li>
            <li><span><b>&copy; Anaya Jewellery 2020</b></span></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- PAGE BODY : END -->
<script type="text/javascript">
var addWrap = '<div class="col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2"><ul class="footer-list"></ul></div>';
var listItem = $("#listItems > li");

for(var i = 0; i < listItem.length; i+=5) {
    var itemCount = listItem.slice(i, i+5);
    itemCount.wrapAll(addWrap);
}
</script>


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
        <form>
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