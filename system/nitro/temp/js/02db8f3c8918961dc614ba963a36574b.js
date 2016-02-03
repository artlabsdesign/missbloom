
$(document).ready(function() {
$('#log-in').on('click', function() {
 $('.warning').hide();
 $('.warning').html('');
	$.ajax({
		url: 'index.php?route=account/login/send_login',
		type: 'post',		
		data: $('#login-form :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#log-in').attr('disabled', true);
			$('#log-in').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#log-in').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			if (json['error']) {
				$('#login-form').after('<div class="warning" style="width:160px; margin-left:8px;">' + json['error'] + '</div>');
				setTimeout(function(){$('.warning').fadeOut();}, 5000);
			} 
			if (json['success']) {
				$('#login-form input[name=\'email\']').val("");
				$('#login-form input[name=\'password\']').val("");	

        window.location.reload();

			}
		  }
	  });	
  });
});
