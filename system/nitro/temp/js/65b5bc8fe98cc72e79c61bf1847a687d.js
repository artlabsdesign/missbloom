
    $(document).ready(function() {
     
    var owl = $("#testimonials_module0");
     
    owl.owlCarousel({
    items : 3, //10 items above 1000px browser width
    itemsDesktop : [979,2], //5 items between 1000px and 901px
    itemsDesktopSmall : [768,2], // betweem 900px and 601px
    itemsTablet: [480,1], //2 items between 600 and 0
    itemsMobile : [479,1], // itemsMobile disabled - inherit from itemsTablet option
	pagination: true,
	autoPlay : 4500,
	navigation: false
    });
     
    });
	