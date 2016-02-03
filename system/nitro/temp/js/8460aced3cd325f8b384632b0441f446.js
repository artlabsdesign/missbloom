
    $(document).ready(function() {
    
	if (document.getElementById("column-left")!= null) {
    var myNumber = 3;
	var myNumber2 = 2;
	var myNumber3 = 1;
	}
	else if (document.getElementById("column-left")!= null && document.getElementById("column-right")!= null)
  {
  var myNumber = 2;
  var myNumber2 = 2;
  var myNumber3 = 1;
  }
	else {
  var myNumber = 4;
  var myNumber2 = 3;
  var myNumber3 = 2;
  }
	 
    var owl = $("#featured-posts0");
     
    owl.owlCarousel({
    items : myNumber, //10 items above 1000px browser width
    itemsDesktop : [1199,myNumber2], //5 items between 1000px and 901px
    itemsDesktopSmall : [979,myNumber3], // betweem 900px and 601px
    itemsTablet: [767,1], //2 items between 600 and 0
    itemsMobile : [600,1], // itemsMobile disabled - inherit from itemsTablet option
	pagination: false,
	navigation: true
    });
     
    // Custom Navigation Events
    $(".next").click(function(){
    owl.trigger('owl.next');
    })
    $(".prev").click(function(){
    owl.trigger('owl.prev');
    })
     
    });
	