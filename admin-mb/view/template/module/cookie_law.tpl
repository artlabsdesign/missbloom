<?php echo $header; ?>

<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				
				<div id="tabs" class="htabs">
					<a href="#tab-main"><?php echo $tab_main; ?></a>
					<a href="#tab-menu-settings"><?php echo $text_settings; ?></a>
				</div>

				<div id="tab-main">
					<div id="tabs-lang" class="htabs">
						<?php foreach( $languages as $lang ) { ?>
							<a href="#tab-main-<?php echo $lang['code']; ?>"><span><img src="view/image/flags/<?php echo $lang['image']; ?>" /> <?php echo $lang['name']; ?></span></a>
						<?php } ?>
					</div>
					
					<?php foreach( $languages as $lang ) { ?>
						<div id="tab-main-<?php echo $lang['code']; ?>">
							<table class="form">
								<tr>
									<td>
										<?php echo $entry_text; ?>
									</td>
									<td>
										<textarea id="cookie-info-text-<?php echo $lang['code']; ?>" name="cookie_law[text][<?php echo $lang['code']; ?>]"><?php echo isset( $settings['text'][$lang['code']] ) ? $settings['text'][$lang['code']] : ''; ?></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $entry_text_yes; ?>
									</td>
									<td>
										<input style="width:90%" type="text" name="cookie_law[text_yes][<?php echo $lang['code']; ?>]" value="<?php echo isset( $settings['text_yes'][$lang['code']] ) ? $settings['text_yes'][$lang['code']] : 'Yes, I accept'; ?>" />
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $entry_text_no; ?>
									</td>
									<td>
										<input style="width:90%" type="text" name="cookie_law[text_no][<?php echo $lang['code']; ?>]" value="<?php echo isset( $settings['text_no'][$lang['code']] ) ? $settings['text_no'][$lang['code']] : 'No thanks, take me to Google'; ?>" />
									</td>
								</tr>
								<tr>
									<td>
										<?php echo $entry_url_no; ?>
									</td>
									<td>
										<input style="width:90%" type="text" name="cookie_law[url_no][<?php echo $lang['code']; ?>]" value="<?php echo isset( $settings['url_no'][$lang['code']] ) ? $settings['url_no'][$lang['code']] : 'https://www.google.com'; ?>" />
									</td>
								</tr>
							</table>
						</div>
					<?php } ?>
				</div>

				<div id="tab-menu-settings">
					<table class="form">
						<tr>
							<td>
								<?php echo $entry_enabled; ?>
							</td>
							<td>
								<select name="cookie_law[enabled]">
									<option value="1"<?php if( ! isset( $settings['enabled'] ) || ! empty( $settings['enabled'] ) ) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
									<option value="0"<?php if( isset( $settings['enabled'] ) && empty( $settings['enabled'] ) ) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_clear_cookies; ?>
							</td>
							<td>
								<input type="checkbox" style="vertical-align:middle; margin-top: 0;" value="1" <?php echo empty( $settings['clear_cookies'] ) ? '' : 'checked="checked"'; ?> name="cookie_law[clear_cookies]" /> <?php echo $text_clear_cookies; ?> <span class="help"><?php echo $text_clear_guide; ?></span>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_border_radius; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['border_radius'] ) ? $settings['border_radius'] : '0'; ?>" name="cookie_law[border_radius]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_transparency; ?>
							</td>
							<td>
								<select name="cookie_law[transparency]">
									<option value="1"<?php if( $settings['transparency'] == '1' ) { ?> selected="selected"<?php } ?>>1</option>
									<option value="0.9"<?php if( $settings['transparency'] == '0.9' ) { ?> selected="selected"<?php } ?>>0.9</option>
									<option value="0.8"<?php if( $settings['transparency'] == '0.8' ) { ?> selected="selected"<?php } ?>>0.8</option>
									<option value="0.7"<?php if( $settings['transparency'] == '0.7' ) { ?> selected="selected"<?php } ?>>0.7</option>
									<option value="0.6"<?php if( $settings['transparency'] == '0.6' ) { ?> selected="selected"<?php } ?>>0.6</option>
									<option value="0.5"<?php if( $settings['transparency'] == '0.5' ) { ?> selected="selected"<?php } ?>>0.5</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_position; ?>
							</td>
							<td>
								<select name="cookie_law[position]">
									<option value="bottom_left"<?php if( $settings['position'] == 'bottom_left' ) { ?> selected="selected"<?php } ?>><?php echo $text_bottom_left; ?></option>
									<option value="bottom_right"<?php if( $settings['position'] == 'bottom_right' ) { ?> selected="selected"<?php } ?>><?php echo $text_bottom_right; ?></option>
									<option value="top_left"<?php if( $settings['position'] == 'top_left' ) { ?> selected="selected"<?php } ?>><?php echo $text_top_left; ?></option>
									<option value="top_right"<?php if( $settings['position'] == 'top_right' ) { ?> selected="selected"<?php } ?>><?php echo $text_top_right; ?></option>
									<option value="top"<?php if( $settings['position'] == 'top' ) { ?> selected="selected"<?php } ?>><?php echo $text_top; ?></option>
									<option value="bottom"<?php if( $settings['position'] == 'bottom' ) { ?> selected="selected"<?php } ?>><?php echo $text_bottom; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_margin_left; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['margin_left'] ) ? $settings['margin_left'] : '0'; ?>" name="cookie_law[margin_left]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_margin_right; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['margin_right'] ) ? $settings['margin_right'] : '0'; ?>" name="cookie_law[margin_right]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_margin_top; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['margin_top'] ) ? $settings['margin_top'] : '0'; ?>" name="cookie_law[margin_top]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_margin_bottom; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['margin_bottom'] ) ? $settings['margin_bottom'] : '0'; ?>" name="cookie_law[margin_bottom]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_padding_left; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['padding_left'] ) ? $settings['padding_left'] : '0'; ?>" name="cookie_law[padding_left]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_padding_right; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['padding_right'] ) ? $settings['padding_right'] : '0'; ?>" name="cookie_law[padding_right]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_padding_top; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['padding_top'] ) ? $settings['padding_top'] : '0'; ?>" name="cookie_law[padding_top]" /> px
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $entry_padding_bottom; ?>
							</td>
							<td>
								<input type="text" value="<?php echo isset( $settings['padding_bottom'] ) ? $settings['padding_bottom'] : '0'; ?>" name="cookie_law[padding_bottom]" /> px
							</td>
						</tr>
					</table>
				</div>

				
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">	
	$('#tabs a').tabs();
	$('#tabs-lang a').tabs();
	
	$('#content textarea').each(function(){
		CKEDITOR.replace( $(this).attr('id'), {
			filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode: CKEDITOR.ENTER_P
		});
	});
	
	$('select[name="cookie_law[position]"]').change(function(){
		var position	= $(this).val(),
			values		= {},
			show		= position.split('_');
		
		$('input[name^="cookie_law[margin_"]').each(function(){
			var name = $(this).attr('name').match( /\[([^\]]+)\]/ )[1];
			
			values[name] = $(this).val();
			
			if( values[name] === '' )
				values[name] = '0';
			
			$(this).val('').parent().parent().hide();
		});
		
		for( var i = 0; i < show.length; i++ ) {
			$('input[name="cookie_law[margin_' + show[i] + ']"]').val( values['margin_'+show[i]] ).parent().parent().show();
		}
	}).trigger('change');
//--></script> 
<?php echo $footer; ?>