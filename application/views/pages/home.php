<!-- PAGE BODY : BEGIN -->
<main class="main-content">
<section class="hero">
    <div class="container slider-container">
      <div class="new-collections hero-collections">        
		<?php echo $Listof_Banners;?>
	  </div>
    </div>
</section>

<section class="info padding-0" style="padding:0px;">
  <div class="container">
    <div class="section-heading-content">
     <?php echo $Without_Image_Panel;?>
    </div>
    <div class=" slider-container arrows-rb mt-lg-5 pb-0 pb-md-5 pb-lg-5 pb-xl-5">
      <div class="product-container new-arrivals">	  
		<?php echo $Listof_Products;?>        
      </div>
      <ul class="slider-nav-list new-arrivals-slider-nav-list d-none d-md-block d-lg-block d-xl-block">
        <li class="slider-nav prev"><img src="<?php echo base_url();?>assets/img/back.svg" class="icon" alt=""></span></li>
        <li class="slider-nav next"><img src="<?php echo base_url();?>assets/img/next.svg" class="icon" alt=""></span></li>
      </ul>
    </div>
  </div>
</section>

<section class="info bg-brand">
  <div class="container">
    <div class="row">
      <div class="col-12 col-sm-6 col-md-3 col-lg-3 col-xs-3">
        <div class="info-card text-center">
          <img src="<?php echo base_url();?>assets/img/icon-01.png" alt="">
          <p class="info-text text-bright m-0 pt-3">IGI Graded<br>Diamonds</p>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3 col-lg-3 col-xs-3">
        <div class="info-card text-center">
          <img src="<?php echo base_url();?>assets/img/icon-02.png" alt="">
          <p class="info-text text-bright m-0 pt-3">Secure<br> Payment options</p>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3 col-lg-3 col-xs-3">
        <div class="info-card text-center">
          <img src="<?php echo base_url();?>assets/img/icon-03.png" alt="">
          <p class="info-text text-bright m-0 pt-3">90 Day<br>Return Policy</p>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3 col-lg-3 col-xs-3">
        <div class="info-card text-center">
          <img src="<?php echo base_url();?>assets/img/icon-04.png" alt="">
          <p class="info-text text-bright m-0 pt-3">Shipping<br>All Over India</p>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="info-nitika">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <img src="<?php echo base_url();?>assets/img/jewellerybynikitha.png" alt="" 
width="250px">

        <h2 class="title pt-5">JEWELLERY BY NIKITHA</h2>
        <p class="pt-5">Carrying a legacy of over 100 years, Nikitha Linga is an eminent name in the field of Jewellery Design. Her passion for diamonds and gems has inspired her to create timeless pieces that showcase her journey as a jewellery designer and an entrepreneur. With her motto of “Empowering Women is Empowering All”, she has successfully created a loyal clientele for her brand “Jewellery by Nikitha” and has now moved on to creating a new saga of elegance and luxury for all, through her sub-brand, “Anaya”.</p>
      </div>
    </div>
  </div>
</section>
<section class="info">
  <div class="container">

    <div class="card info-card card-info  mb-5">
		  <?php echo $Left_Image_Panel;?>   
    </div>
    <div class="pt-3 pt-lg-5 pt-xl-5 pb-lg-5 pb-xl-5 text-center">
      <a href="https://www.instagram.com/anaya_jewellerybynikitha/?igshid=z4re7w85iqxg" target="_blank"><h5 class="p-2 pl-4 pr-4 bg-brand text-bright d-inline-block rounded">Shop on Instagram</h5></a>
    </div>
    
    
     <div class="card info-card card-info  mb-5">
		  <?php echo $Right_Image_Panel;?>   
    </div>
    <!--
    
    <div class="card info-card card-info mt-5">
      	  <?php echo $Right_Image_Panel;?>		  
      </div>
      -->
    </div>
  </div>
</section>

</main>