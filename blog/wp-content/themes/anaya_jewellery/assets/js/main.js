
$(document).ready(function () {
	func_addHeaderFixed();
});

// CUSTOM AFFIX SCRIPT : BEGIN
$(document).ready(function() {

var toggleAffix = function(affixElement, scrollElement, wrapper) {
  var height = affixElement.outerHeight(),
      top = wrapper.offset().top;
  if (scrollElement.scrollTop() >= top){
      wrapper.height(height);
      affixElement.addClass("affix");
  }
  else {
      affixElement.removeClass("affix");
      wrapper.height('auto');
  }
};

$('[data-toggle="affix"]').each(function() {
  var ele = $(this),
      wrapper = $('<div></div>');

  ele.before(wrapper);
  $(window).on('scroll resize', function() {
      toggleAffix(ele, $(this), wrapper);
  });

  // init
  toggleAffix(ele, $(window), wrapper);
});

});


function func_addHeaderFixed() {
    var headerHeight = $('#main-header').innerHeight();
    var mainNav = $('#main-header');
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        scroll > headerHeight ? mainNav.addClass("fixed") : mainNav.removeClass("fixed");
    });
}

$(".main-menu-toggler").click(function(e) {
    e.preventDefault();
    var elem = $(this);
    if(elem.hasClass('open')) {
        $("#menu-overlay").removeClass('showoverlay');
        $("#header-nav").removeClass('show');
        $('.main-menu-toggler').removeClass('open');
    }
    else {
        $("#header-nav").addClass('show');
        $('.main-menu-toggler').addClass('open');
        $("#menu-overlay").addClass('showoverlay');
    }
});

$(".filter-menu-toggle").click(function(e) {
	e.preventDefault();
	var elem = $(this);
	if(elem.hasClass('open')) {
		$('body, html').removeClass('menuOpen');
		$(".pf-container").removeClass('show');
		$('.filter-menu-toggle').removeClass('open');
	} else {
		$('body, html').addClass('menuOpen');
		$(".pf-container").addClass('show');
		$('.filter-menu-toggle').addClass('open');
	}
});

$(".filter-sort-toggle").click(function(e) {
	e.preventDefault();
	var elem = $(this);
	if(elem.hasClass('open')) {
		$('.overlay').removeClass('show');
		$(".custom-sort").removeClass('show');
		$('.filter-sort-toggle').removeClass('open');
	} else {
		$('.overlay').addClass('show');
		$(".custom-sort").addClass('show');
		$('.filter-sort-toggle').addClass('open');
	}
});


$(".filter-sub-menu-toggle").click(function(e) {
	e.preventDefault();
	var elem = $(this);
	if(elem.hasClass('open')) {
		$(".pf-sub-list").removeClass('show');
		$(".filter-sub-menu-toggle").removeClass('open');
	} else {
		elem.parent('.filter-list').find(".pf-sub-list").addClass('show');
		$(".filter-sub-menu-toggle").addClass('open');
	}
});

$('filter-option').click(function (e) {
	e.preventDefault();
	var elem = $(this);
	elem.addClass('selected');
});

$('.product-wish').click(function (e) {
	e.preventDefault();
	var elem = $(this);
	elem.toggleClass('active');
});

$('.filter-option').click(function (e) {
	e.preventDefault();
	var elem = $(this);
	elem.toggleClass('active');
});


$(document).ready(function(){
	$('.pass_show').append('<span class="ptxt">Show</span>');
});

$(document).on('click','.pass_show .ptxt', function(){
	$(this).text($(this).text() == "Show" ? "Hide" : "Show");
	$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; });
});


$(".delete-confirm").click(function() {
    var e = $(this);
	e.parent('.product-card')
	.append('<div class="product-overlay"><span class="center"><i class="fas fa-spinner fa-spin"></i></span></div>');
});

$('#listItems').each(function(){
	var addWrap = '<div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-3"><ul class="footer-list"></ul></div>';
	var listItem = $(this).children('li');
	for(var i = 0; i < listItem.length; i+=5) {
		var itemCount = listItem.slice(i, i+5);
		itemCount.wrapAll(addWrap);
	}
 });

 if (screen.width > 992) {
	$('.dropdown').find('.dropdown-toggle').removeAttr('data-toggle');
    $('.dropdown-menu-list > li ul').each(function(){
		var $lis = $(this).children('li');
		for(var i = 0, len = $lis.length; i < len; i+=5){
		  $lis.slice(i, i+5).wrapAll("<li><ul></ul></li>");
	   }
	 });
}
else {
	$('.dropdown-footer').hide();
}

$(document).on('click', '.dropdown-menu', function (e) {
    e.stopPropagation();
  });


// CUSTOM SELECT SCRIPT : BEGIN
document.querySelector('.custom-select-wrapper').addEventListener('click', function() {
    this.querySelector('.custom-select').classList.toggle('open');
});
for (const option of document.querySelectorAll(".custom-option")) {
    option.addEventListener('click', function() {
        if (!this.classList.contains('selected')) {
            this.parentNode.querySelector('.custom-option.selected').classList.remove('selected');
            this.classList.add('selected');
            this.closest('.custom-select').querySelector('.custom-select-trigger span').textContent = this.textContent;
        }
    })
};
