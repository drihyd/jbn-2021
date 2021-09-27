

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
