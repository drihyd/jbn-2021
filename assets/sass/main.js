var _dateObj = new Date,
    _year = _dateObj.getFullYear(),
    _toTopOffset = 500,
    dateYear = $("#footerYear");
dateYear.html(_year), $(document).on("ready", function() {
    func_footerGridAdjust(), "undefined" != typeof initMainBannerSlider && init_mainBannerSlider(), "undefined" != typeof initProductsSlider && init_productsSlider(), "undefined" != typeof initProductsShowcase && init_productsShowcase(), "undefined" != typeof initProductsGrid && adjust_productsGrid(), "undefined" != typeof initTestimonialsSlider && init_testimonialsSlider()
}), $(window).load(function() {
    func_addHeaderShadow(), "undefined" != typeof initProductsGrid && adjust_productsGrid()
}), $(window).resize(function() {
    func_footerGridAdjust(), "undefined" != typeof initProductsGrid && adjust_productsGrid()
}), $(window).scroll(function() {
    func_addHeaderShadow()
});
var scrollToID = function(e) {
    return $("html, body, .main-body").animate({
        scrollTop: $("#" + e).offset().top - 60
    }, 500), !1
};
$(".delete-confirm").click(function() {
    var e = $(this).attr("href");
    if (1 != confirm("Are you sure you want to delete this item?")) return !1;
    window.location(e)
}), $(".scrollLink").click(function(e) {
    e.preventDefault();
    var i = $(this).attr("href");
    $("html, body").animate({
        scrollTop: $(i).offset().top - 0
    }, 500)
});
var getUrlParameter = function(e) {
    var i, o, t = decodeURIComponent(window.location.search.substring(1)).split("&");
    for (o = 0; o < t.length; o++)
        if ((i = t[o].split("="))[0] === e) return void 0 === i[1] || i[1]
};

function toTopHandler() {
    var e = $("#toTop"),
        i = TOTOPOFFSET;
    $(document).scrollTop() >= i ? $(e).addClass("visible") : $(e).removeClass("visible")
}

function init_mainBannerSlider() {
    $(".main-banner-slider").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: !0,
        autoplaySpeed: 5e3,
        pauseOnHover: !1,
        dots: !1,
        fade: !1,
        adaptiveHeight: !1,
        arrows: !0,
        prevArrow: $(".main-banner-slider-nav-list .slider-nav.prev"),
        nextArrow: $(".main-banner-slider-nav-list .slider-nav.next")
    })
}

function init_productsSlider() {
    $(".products-slider").slick({
        slidesToShow: 4,
        swipeToSlide: !0,
        autoplay: !0,
        autoplaySpeed: 3e3,
        pauseOnHover: !1,
        dots: !1,
        fade: !1,
        arrows: !0,
        centerMode: !1,
        initialSlide: 1,
        infinite: !0,
        initialSlide: 0,
        prevArrow: $(".products-slider-nav-list .slider-nav.prev"),
        nextArrow: $(".products-slider-nav-list .slider-nav.next"),
        responsive: [{
            breakpoint: 1199,
            settings: {
                slidesToShow: 3
            }
        }, {
            breakpoint: 991,
            settings: {
                slidesToShow: 2
            }
        }, {
            breakpoint: 599,
            settings: {
                slidesToShow: 1,
                initialSlide: 0
            }
        }]
    })
}

function init_productsShowcase() {
    $("#product-showcase").elevateZoom({
        gallery: "product-showcase-gallery",
        galleryActiveClass: "active",
        tint: !0,
        zoomLevel: 1,
        scrollZoom: !0,
        lensSize: 100,
        borderSize: 0,
        zoomWindowWidth: 500,
        zoomWindowHeight: 550,
        easing: !0
    })
}
$(".btn-size-select").click(function(e) {
    if ($(e.target).find("input:disabled, input.disabled").length) return !1
});
var func_footerGridAdjust = function() {
    if ($("#mqCheck-399").is(":visible")) {
        $(".footer-links-grid .item").css("height", "auto");
        var e = [];
        $(".footer-links-grid .item").each(function() {
            var i = $(this).outerHeight();
            e.push(i)
        });
        var i = (e = e.sort(function(e, i) {
            return i - e
        }))[0];
        $(".footer-links-grid .item").css("height", i + "px")
    } else $(".footer-links-grid .item").css("height", "auto")
}, adjust_productsGrid = function() {
        var e = $("#filters-area").outerHeight();
        $("#mqCheck-767").is(":visible") ? $("#products-area").css("min-height", e + 30 + "px") : $("#products-area").css("min-height", "auto"), $(".products-grid .item .product-title").css("height", "auto");
        var i = [];
        $(".products-grid .item .product-title").each(function() {
            $(this);
            var e = $(this).outerHeight();
            console.log(i), i.push(e)
        }), console.log(i);
        var o = (i = i.sort(function(e, i) {
            return i - e
        }))[0];
        $(".products-grid .item .product-title").css("height", o + "px")
    };

function init_testimonialsSlider() {
    $(".testimonials-slider").slick({
        slidesToShow: 1,
        swipeToSlide: !0,
        autoplay: !0,
        autoplaySpeed: 3e3,
        pauseOnHover: !1,
        dots: !0,
        fade: !1,
        arrows: !1,
        centerMode: !1,
        initialSlide: 1,
        infinite: !1,
        initialSlide: 0,
        prevArrow: $(".testimonials-slider-nav-list .slider-nav.prev"),
        nextArrow: $(".testimonials-slider-nav-list .slider-nav.next")
    })
}

function func_addHeaderShadow() {
    $(window).scrollTop() > 90 ? $("#main-nav").addClass("add-shadow") : $("#main-header").removeClass("add-shadow")
}
$("#toggleFilter").click(function(e) {
    e.preventDefault(), $("#filters-backdrop").addClass("show"), $("#filters-area").addClass("show")
}), $("#account-menu-toggle").click(function(e) {
    e.preventDefault(), $("#my-account-menu-backdrop").addClass("show"), $("#my-account-menu").addClass("show")
}), $("#filters-backdrop").click(function(e) {
    $("#filters-area").removeClass("show"), $("#filters-backdrop").removeClass("show")
}), $("#my-account-menu-backdrop").click(function(e) {
    $("#my-account-menu").removeClass("show"), $("#my-account-menu-backdrop").removeClass("show")
}), $("#account-toggle").click(function(e) {
    e.preventDefault(), $(".my-account-menu-backdrop").addClass("show"), $(".my-account-menu").addClass("show")
}), $(".my-account-menu-backdrop").click(function(e) {
    $(".my-account-menu").removeClass("show"), $(".my-account-menu-backdrop").removeClass("show")
}), $(".my-account-close").click(function(e) {
    $(".my-account-menu").removeClass("show"), $(".my-account-menu-backdrop").removeClass("show")
}), $("#registerOpen").click(function(e) {
    $("#loginModal").modal("hide"), $("#registerModal").modal("show"), $("#forgotPass").modal("hide")
}), $("#forgotOpenbtn").click(function(e) {
    $("#loginModal").modal("hide"), $("#registerModal").modal("hide"), $("#forgotPass").modal("show")
}), $("#loginOpen").click(function(e) {
    $("#registerModal").modal("hide"), $("#loginModal").modal("show"), $("#forgotPass").modal("hide")
}), $(".filter-more").click(function(e) {
    var i = $(this),
        o = i.parent(".filter-checkboxes").find(".extra");
    i.hasClass("active") ? (i.removeClass("active"), o.addClass("dont-show")) : (i.addClass("active"), o.removeClass("dont-show"))
});