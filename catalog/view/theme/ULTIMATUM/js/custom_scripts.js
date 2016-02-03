$(window).load(function() { 
	$("#loader").delay(500).fadeOut(); 
	$(".mask").delay(1000).fadeOut("slow");
	$('body').removeClass('mm-slideout');
});
$(document).ready(function(){

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////						   
								
		// -------------------------------------------------------------------------------------------------------
		// Dropdown Menu
		// -------------------------------------------------------------------------------------------------------

		if ( ! ( $.browser.msie && ($.browser.version == 6 || $.browser.version == 7) ) ){
			$("ul#topnav li:has(ul), ul.topnav2 li:has(ul)").addClass("dropdown");
		}
	
		// -------------------------------------------------------------------------------------------------------
		// Header modulules positioning
		// -------------------------------------------------------------------------------------------------------

		$('#notification').prependTo('#container');
		

    if (document.getElementById("column-left")!= null) {
    $('#content').addClass("content-column-left");
	$('#content .product-info .right .right_default').addClass("no-margin");
	if (document.getElementById("custom_column")!= null) {
    $('#custom_column').prependTo("#column-left");
	}
	}
	if (document.getElementById("column-right")!= null) {
    $('#content').addClass("content-column-right");
	$('#content .product-info .right .right_default').addClass("no-margin");
	if (document.getElementById("custom_column")!= null) {
    $('#custom_column').prependTo("#column-right");
	}
	}
	if (document.getElementById("content_top_fullwidth")!= null) {
    $('#content_wrap').addClass("has-top-full");
	}
	
	if (document.getElementById("custom_column")!= null) {
    $('#content .product-info .right .right_default .rating, #content .product-info .right .right_default .description').prependTo("#custom_column");
	}

		
		// -------------------------------------------------------------------------------------------------------
		// TIPSY
		// -------------------------------------------------------------------------------------------------------
	
		$('.chooser a').tipsy({gravity: 's', fade: true, title: function() { return this.getAttribute('original-title').toUpperCase(); }});
		
		// -------------------------------------------------------------------------------------------------------
		// STOP EMPTY HREF
		// -------------------------------------------------------------------------------------------------------
	
		$('a[href="#"]').click(function(event){ 
		event.preventDefault(); 
		}); 
		$("div.rating a").click(function(){ 
		document.getElementById("tab-review").scrollIntoView();
		});
		
		$('html.no-touch .element_from_bottom').each(function () {
		$(this).appear(function() {
		  $(this).delay(200).animate({opacity:1,bottom:"0px"},500);
		});	
		});
		
		$('html.no-touch .element_from_left').each(function () {
		$(this).appear(function() {
		  $(this).delay(200).animate({opacity:1,left:"0px"},500);
		});	
		});
		
		$('html.no-touch .element_from_right').each(function () {
		$(this).appear(function() {
		  $(this).delay(200).animate({opacity:1,right:"0px"},500);
		});	
		});
	
		$('html.no-touch .element_fade_in').each(function () {
		$(this).appear(function() {
		  $(this).delay(250).animate({opacity:1,right:"0px"},1500);
		});	
		});

		
		// -------------------------------------------------------------------------------------------------------
		// FADING ELEMENTS
		// -------------------------------------------------------------------------------------------------------
	
		$('a[href="#"]').click(function(event){ 
		event.preventDefault(); 
		});
		
		
		$("a.mob-menu-toggle").toggle(function(){
        $(this).addClass("swap");
        $('#menu_mobile').slideToggle("slow");
		return false;
    	}, function () {
        
        $('#menu_mobile').slideToggle("slow");
		$(this).removeClass("swap");
		return false;
		}); 
		
		$(".pull-item.left, .pull-item.right").hover(function () {									 
			$(this).addClass('active');
		}, function () {
			$(this).removeClass('active');
		});
		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	});