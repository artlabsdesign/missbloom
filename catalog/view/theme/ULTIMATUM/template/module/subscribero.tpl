<?php if (($setting['position'] == 'column_left') || ($setting['position'] == 'column_right') || ($setting['position'] == 'content_footer')){ ?>
<div class="box box-subscribero">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
<p><?php echo $entry_subscribe_text; ?></p>
<input type="text" value="<?php echo $text_email; ?>" onclick="if(this.value == '<?php echo $text_email; ?>') {this.value = ''; }" onkeydown="this.style.color = '#000000';" name="email" id="subscribero_email" />
<a class="button" id="button-subscribero"><span><?php echo $entry_email; ?></span></a>
<small><?php echo $entry_policy_text; ?></small>
</div>
</div>
<?php } else { ?>

<div class="subscribe_module">
<h4><i class="icon-envelope"></i><?php echo $heading_title; ?></h4>
<p><?php echo $entry_subscribe_text; ?></p>
<input type="text" value="<?php echo $text_email; ?>" onclick="if(this.value == '<?php echo $text_email; ?>') {this.value = ''; }" onkeydown="this.style.color = '#000000';" name="email" id="subscribero_email" />
<a class="button" id="button-subscribero"><span><?php echo $entry_email; ?></span></a>
<small><?php echo $entry_policy_text; ?></small>
</div>

<?php } ?> 
<script type="text/javascript"><!--
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
//--></script> 
