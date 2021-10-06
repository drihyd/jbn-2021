<!-- RESPONSIVE BEACONS : BEGIN - INCLUDE ON EVERY PAGE -->
<div id="mqCheck-1199"></div>
<div id="mqCheck-991"></div>
<div id="mqCheck-767"></div>
<div id="mqCheck-699"></div>
<div id="mqCheck-649"></div>
<div id="mqCheck-600"></div>
<div id="mqCheck-539"></div>
<div id="mqCheck-500"></div>
<div id="mqCheck-499"></div>
<div id="mqCheck-479"></div>
<div id="mqCheck-399"></div>
<!-- RESPONSIVE BEACONS : END - INCLUDE ON EVERY PAGE -->

<!-- JQUERY JS : BEGIN -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<?php echo base_url('assets') ?>/libraries/jquery-1.11.2/jquery-1.11.2.min.js"><\/script>')</script>
<!-- JQUERY JS : END -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!-- BOOTSTRAP V-3.3.7 CUSTOMIZED JS : BEGIN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- BOOTSTRAP V-3.3.7 CUSTOMIZED JS : END -->


<!-- SLICK JS : BEGIN -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- SLICK JS : END -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>
<script src="https://deepredink.in/taruni-v2/assets/scripts/zoom-image.js"></script>

<!-- CUSTOM JS : BEGIN -->
<script type="text/javascript" src="<?php echo base_url('assets') ?>/js/main.js" ></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" charset="utf-8"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.0/js/foundation.min.js" ></script>
<script type="text/javascript" src="<?php echo base_url('assets') ?>/js/alertif.js"></script>
<!-- <script type="text/javascript" src="./js/plugins.js?v=1.4"></script> -->
<!-- CUSTOM JS : END -->
<script type="text/javascript" src="<?php echo base_url('assets') ?>/js/lazyload.js"></script>
<!-- <script type="text/javascript" src="./js/plugins.js?v=1.4"></script> -->
<!-- CUSTOM JS : END -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.7.21/jquery.zoom.min.js"></script>
<script type="text/javascript" src="<?php echo base_url('assets') ?>/js/accordion-wizard.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>




<script src="https://deepredink.in/taruni-v2/assets/scripts/zoom-image.js"></script>
<script src="https://deepredink.in/taruni-v2/assets/scripts/main.js"></script>


<script>
  $("img.lazy").lazyload({
    effect : "fadeIn",
  });

</script>
<script type="text/javascript">
var addWrap = '<div class="col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2"><ul class="footer-list"></ul></div>';
var listItem = $("#listItems > li");

for(var i = 0; i < listItem.length; i+=5) {
    var itemCount = listItem.slice(i, i+5);
    itemCount.wrapAll(addWrap);
}
</script>

<?php if (isset($include_js)): ?>
  <?php foreach ($include_js as $key => $js_file_path): ?>
    <script src='<?php echo base_url("$js_file_path")?>'></script>
  <?php endforeach ?>
<?php endif ?>
<?php if (isset($include_files)): ?>
  <?php foreach ($include_files as $key => $file_path): ?>
    <?php include_once ($file_path); ?>
  <?php endforeach ?>
<?php endif ?>

<?php  if ($this->session->flashdata('success')): ?>
  <script>
    success_alert("<?php echo $this->session->flashdata('success') ?>");
  </script>  
<?php endif ?>
<?php if ($this->session->flashdata('error')): ?>
  <script>
    error_alert("<?php echo $this->session->flashdata('error') ?>");
  </script>  


<?php endif ?>
<!-- Product page script -->
<script>
// Sample alert message functions
  
  /*
  error_alert('Error message !!!!');*/
  

$('.img-zoom').zoom({magnify: 1.5});

$('.showcase-slider').slick({
  lazyLoad: 'ondemand',
   slidesToShow: 1,
   slidesToScroll: 1,
   arrows: false,
   fade: true,
   asNavFor: '.showcase-tabs',
   loop: true,
 });
 $('.showcase-tabs').slick({
  lazyLoad: 'ondemand',
   slidesToShow: 1,
   slidesToScroll: 1,
   asNavFor: '.showcase-slider',
   arrows: true,
   dots: false,
   focusOnSelect: true,
   loop: true,
 });

 $('a[data-slide]').click(function(e) {
   e.preventDefault();
   var slideno = $(this).data('slide');
   $('.showcase-tabs').slick('slickGoTo', slideno - 1);
 });

  $('.rp-slider').slick({
		lazyLoad: 'ondemand',
		slidesToShow: 3,
		slidesToScroll: 1,
		swipeToSlide: true,
		autoplay: false,
		autoplaySpeed: 5000,
		pauseOnHover:false,
		dots: false,
		arrows: true,
		infinite: true,
		loop: true,
    responsive: [{
        breakpoint: 990,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      }, {
        breakpoint: 600,
        settings: {
          centerMode: true,
          centerPadding: '30px',
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows:false
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
	});
  $('.sc-slider').slick({
		lazyLoad: 'ondemand',
		slidesToShow: 3,
		slidesToScroll: 1,
		swipeToSlide: true,
		autoplay: false,
		autoplaySpeed: 5000,
		pauseOnHover:false,
		dots: false,
		arrows: true,
		infinite: true,
		loop: true,
    responsive: [{
        breakpoint: 990,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      }, {
        breakpoint: 600,
        settings: {
          centerMode: true,
          centerPadding: '30px',
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows:false
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
	});
</script>

<!-- Product page script Ends -->

<!-- Home page script -->
<script>
  $('.hero-collections').slick({
		lazyLoad: 'ondemand',
		slidesToShow: 1,
		slidesToScroll: 1,
		swipeToSlide: true,
		autoplay: true,
		autoplaySpeed: 5000,
		pauseOnHover:false,
		dots: false,
		arrows: true,
		infinite: true,
		loop: true,
	});

  $('.new-arrivals').slick({
		lazyLoad: 'ondemand',
		slidesToShow: 4,
		slidesToScroll: 3,
		swipeToSlide: true,
		autoplay: false,
		autoplaySpeed: 5000,
		pauseOnHover:false,
		dots: false,
		arrows: true,
		infinite: true,
		loop: true,
		responsive: [{
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: true,
        }
      }
      ],
    prevArrow: $('.new-arrivals-slider-nav-list .slider-nav.prev'),
    nextArrow: $('.new-arrivals-slider-nav-list .slider-nav.next'),
	});
</script>
<!-- Home page script Ends-->

<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
<script>
  var options = {
        mode: 'wizard',
        //autoButtonsNextClass: 'btn btn-brand float-right',
        //autoButtonsPrevClass: 'btn btn-default',
        // stepNumberClass: 'badge badge-pill badge-primary mr-1',
     /*   onSubmit: function() {
          alert('Form submitted!');
          return true;
        }*/
      }

      $( function() {

        $( "#form" ).accWizard(options);

      });
    </script>


<script>
    $('#videomodal').on('shown.bs.modal', function () {
      $('#video1')[0].play();
    })
    $('#videomodal').on('hidden.bs.modal', function () {
      $('#video1')[0].pause();
    })
</script>


  <?php
    $this->session->set_flashdata('success','');
    $this->session->set_flashdata('error', '');

  ?>
  <script>
        function hide()
        {
            //alert('hi');
            document.getElementById('printbtn').style.display='none';
        }
    </script>

    <script type="text/javascript">
    $('form#newsletter').submit(function(e) {


      e.preventDefault();
      var email = $("input[name='email']").val();

     

  


        $.ajax({
           url: "<?php echo base_url();?>Newsletter/subscribe",
           type: 'POST',
           data: {email: email},
           error: function(data) {  
             data=jQuery.parseJSON(data);        
              error_alert(data.error_msg);
           },
           success: function(data) {
            data=jQuery.parseJSON(data);
            if(data.code==200){
               success_alert(data.error_msg);
            }
            else {
              error_alert(data.error_msg);
            }
           
 
           }
        });


      

      return false;
        


    });


</script>
    
</body>
</html>