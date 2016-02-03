
if (!window.console) {var console = {};}
if (!console.log) {console.log = function() {};}

function updatePx() {
	console.log('OPU: updatePx() called');
		var ajaxurl = 'index.php?route=product/option_price_update/updatePrice';
	
	jQuery.ajax({
		type: 'post',
		url: ajaxurl,
		dataType: 'json',
		data: jQuery(':input[name^="option"][type=\'checkbox\']:checked, :input[type=\'hidden\'], :input[name^="option"][type=\'radio\']:checked, select[name^="option"], :input[name=\'quantity\']'),

		success: function (mydata) {
			console.log('OPU: mydate.price'+mydata.price);
			console.log('OPU: mydate.special'+mydata.special);
			console.log('OPU: mydate.tax'+mydata.tax);
			
			// Update the main price with the new price.
									jQuery('#opu_price').fadeOut(400).queue(function(n){jQuery(this).html(mydata.price); n();}).fadeIn(400);
			jQuery('#opu_special').fadeOut(400).delay(100).queue(function(n){jQuery(this).html(mydata.special); n();}).fadeIn(400);
			jQuery('#opu_tax').fadeOut(400).delay(200).queue(function(n){jQuery(this).html(mydata.tax); n();}).fadeIn(400);
								},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

jQuery(document).ready(function () {
	console.log('OPU: initialized');
	var $updateOnLoad = true; // Change to true if using 1.4.x or want to force an update on page load
	
	// Update on initial page load for 1.4.x only
	if ($updateOnLoad) {
		updatePx();
	}

	// Update whenever the triggerable page inputs are changed
	jQuery(':input[name^="option"],:input[name^="quantity"]').change(function(){
		updatePx();
	});

});
