
$('#button-subscribero').live('click', function() {
	$.ajax({
		url: 'index.php?route=module/subscribero/validate',
		type: 'post',
		data: $('#subscribero_email'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-subscribero').attr('disabled', true);
			$('#button-subscribero').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-subscribero').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			if (json['error']) {
				alert(json['error']['warning']);
			} else {
				alert(json['success']);
			}
		}
	});	
});	
$('#subscribero_email').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-subscribero').trigger('click');
	}
});
//