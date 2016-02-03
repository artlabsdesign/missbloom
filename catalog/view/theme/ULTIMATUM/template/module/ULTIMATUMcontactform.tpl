<div id="ULTIMATUMcontactform-box" class="box" />
<div class="box-heading"><?php echo $heading_title; ?></div>
	<div id="ULTIMATUMcontactform-content" class="box-content">
		<input id="ULTIMATUMcontactform_email" type="text" name="ULTIMATUMcontactform_email" value="<?php echo $text_email; ?>" onclick="if(this.value == '<?php echo $text_email; ?>') {this.value = ''; }" />
		<textarea id="ULTIMATUMcontactform_message" name="ULTIMATUMcontactform_message" onclick="if(this.value == '<?php echo $text_message; ?>') {this.value = ''; }" ><?php echo $text_message; ?></textarea>
		<?php if ($this->config->get('ULTIMATUMcontactform_captcha')) { ?>
		<input id="ULTIMATUMcontactform_captcha" type="text" name="captcha" onclick="if(this.value == '<?php echo $text_captcha; ?>') {this.value = ''; }" value="<?php echo $text_captcha; ?>" />
		<br />
		<img src="index.php?route=module/ULTIMATUMcontactform/captcha" alt="" />
		<?php } ?>
		<input type="button" value="<?php echo $text_submit; ?>" class="button" id="button-ULTIMATUMcontactform" />
		<div id="ULTIMATUMcontactform-warning-message" style="margin-top:10px;"></div>
	</div>
</div>
<script type="text/javascript"><!--
$('#button-ULTIMATUMcontactform').live('click', function() {
	$.ajax({
		url: 'index.php?route=module/ULTIMATUMcontactform/validate',
		type: 'post',
		data: $('#ULTIMATUMcontactform-box :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-ULTIMATUMcontactform').attr('disabled', true);
			$('#button-ULTIMATUMcontactform').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-ULTIMATUMcontactform').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			$('.ULTIMATUMcontactform-warning').remove();
			
			if (json['error']) {
				$('#ULTIMATUMcontactform-warning-message').prepend('<div class="ULTIMATUMcontactform-warning" style="color:#f00; display: none;">' + json['error']['warning'] + '</div>');

				$('.ULTIMATUMcontactform-warning').fadeIn('slow');
			} else {
				$('#ULTIMATUMcontactform-content').html('<div class="success" style="display:none;">' + json['success'] + '</div>');
				
				$('.success').fadeIn('slow');
			}
		}
	});	
});	
//--></script> 