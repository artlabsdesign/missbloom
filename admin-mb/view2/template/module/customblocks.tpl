<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><i class="icon-save"></i> <?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><i class="icon-undo"></i> <?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
          <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
			  <table class="form">
				<tr style="display:none !important">
					<td class="left"><?php echo $entry_image_dimension; ?></td>
					<td class="left">
						<input type="text" name="customblocks_module[<?php echo $module_row; ?>][image_width]" value="50" size="5" />
						<input type="text" name="customblocks_module[<?php echo $module_row; ?>][image_height]" value="50" size="5" />
					</td>
				</tr>
				<tr>
				  <td><?php echo $entry_layout; ?></td>
				  <td><select name="customblocks_module[<?php echo $module_row; ?>][layout_id]">
					  <?php foreach ($layouts as $layout) { ?>
					  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
					  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
					  <?php } ?>
					  <?php } ?>
					</select></td>
				</tr>
				<tr>
				  <td><?php echo $entry_position; ?></td>
				  <td><select name="customblocks_module[<?php echo $module_row; ?>][position]">
                      <?php if ($module['position'] == 'content_top') { ?>
					  <option value="content_top" selected="selected">Sideblocks</option>
					  <?php } else { ?>
					  <option value="content_top">Sideblocks</option>
					  <?php } ?>
					</select></td>
				</tr>
				<tr>
				  <td><?php echo $entry_status; ?></td>
				  <td><select name="customblocks_module[<?php echo $module_row; ?>][status]">
					  <?php if ($module['status']) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <option value="0"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					</select></td>
				</tr>
				<tr>
				  <td><?php echo $entry_sort_order; ?></td>
				  <td><input type="text" name="customblocks_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
				</tr>
			  </table>
			  
			  <table id="section_<?php echo $module_row; ?>" class="list">
				<thead>
					<tr>
						<td class="left"><?php echo $entry_image; ?></td>
						<td class="left"><?php echo $entry_title_description; ?></td>
						<td class="left"></td>
					</tr>
				</thead> 
				
				<?php $section_row = 0; ?>
				<?php foreach($module['sections'] as $section){ ?>
					<tbody id="section-row-<?php echo $module_row; ?>-<?php echo $section_row; ?>" class="section">
						<tr>
							<td class="left"><div class="image"><img src="<?php echo $section['thumb']; ?>" alt="" id="thumb_<?php echo $module_row;?>_<?php echo $section_row; ?>" /><br />
								<input type="hidden" name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][image]" value="<?php echo $section['image']; ?>" id="image_<?php echo $module_row;?>_<?php echo $section_row; ?>" />
								<a onclick="image_upload('image_<?php echo $module_row;?>_<?php echo $section_row; ?>', 'thumb_<?php echo $module_row;?>_<?php echo $section_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb_<?php echo $module_row;?>_<?php echo $section_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image_<?php echo $module_row;?>_<?php echo $section_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div>
							</td>
							<td class="left">
                            Position: <select name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][left_right]">
					  		<option value="left" <?php if($section['left_right']=='left'){ echo 'selected="selected"';} ?>>Left</option>
					  		<option value="right" <?php if($section['left_right']=='right'){ echo 'selected="selected"';} ?>>Right</option>
							</select>
                            <br /><br />
                            Section width: <input type="text" name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][item_width]" value="<?php echo $section['item_width']; ?>" size="3" /><br /><br />
                            Section height: <input type="text" name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][item_height]" value="<?php echo $section['item_height']; ?>" size="3" /><br /><br />
                            Position from top in px: <input type="text" name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][top]" value="<?php echo $section['top']; ?>" size="3" /><br /><br />
							Section background color: #<input type="text" id="color_<?php echo $module_row; ?>_<?php echo $section_row; ?>" name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][color]" value="<?php echo $section['color']; ?>" size="7" /><br /><br />
                            
                            	
								<div id="language-<?php echo $module_row; ?>-<?php echo $section_row; ?>" class="htabs">
									<?php foreach ($languages as $language) { ?>
									<a href="#tab-language-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
									<?php } ?>
								</div>
								  
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>">								
									<?php echo $text_title; ?><input name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][title][<?php echo $language['language_id']; ?>]" id="title-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>" value="<?php echo isset($module['sections'][$section_row]['title'][$language['language_id']]) ? $module['sections'][$section_row]['title'][$language['language_id']] : ''; ?>" size="50" /><br /><br />
									<textarea name="customblocks_module[<?php echo $module_row; ?>][sections][<?php echo $section_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['sections'][$section_row]['description'][$language['language_id']]) ? $module['sections'][$section_row]['description'][$language['language_id']] : ''; ?></textarea>
								</div>
								<?php } ?>
							</td>
							<td><a class="button" onclick="removeSection(<?php echo $module_row; ?>, <?php echo $section_row; ?>);"><?php echo $button_remove; ?></a></td>
							
						</tr>
					</tbody>
				<?php $section_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="2"></td>
						<td><a class="button" onclick="addSection(<?php echo $module_row; ?>);"><?php echo $button_add_section; ?></a></td>
					</tr>
				</tfoot>
			  </table>
		  </div> 
			  
        <?php $module_row++; ?>
        <?php } ?>
       
      </form>   
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
<?php $section_row = 0; ?>
<?php   foreach($module['sections'] as $section) { ?>
<?php      foreach ($languages as $language) { ?>
				CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $section_row;?>-<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				
				$('#language-<?php echo $module_row; ?>-<?php echo $section_row; ?> a').tabs();
<?php      } ?>
<?php   $section_row++; ?>
<?php   } ?>
<?php $module_row++; ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
var section_row;

function addModule() {	
	section_row = 0;
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	
	html += '  <table class="form">';
	html += '    <tr style="display:none !important">';
	html += '      <td><?php echo $entry_image_dimension; ?></td>';
	html += '      <td><input type="text" name="customblocks_module[' + module_row + '][image_width]" size="5" value="50" /> <input  value="50" type="text" name="customblocks_module[' + module_row + '][image_height]" size="5" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="customblocks_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="customblocks_module[' + module_row + '][position]">';
	html += '        <option value="content_top">Sideblocks</option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="customblocks_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="customblocks_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	
    html += '  <table id="section_' + module_row + '" class="list">';
	html += '	 <thead>';
	html += '	    <tr>';
	html += '	       <td class="left"><?php echo $entry_image; ?></td>';
	html += '	       <td class="left"><?php echo $entry_title_description; ?></td>';
	html += '	       <td class="left"></td>';
	html += '	    </tr>';
	html += '    </thead>';
	html += '    <tfoot>';
    html += '     <tr>';
	html += '         <td colspan="2"></td>';
    html += '         <td class="left"><a onclick="addSection(' + module_row + ');" class="button"><?php echo $button_add_section; ?></a></td>';
    html += '     </tr>';
    html += '    </tfoot>';
    html += '  </table>';
	html += '</div>';
	
	$('#form').append(html);
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script>

<script type="text/javascript"><!--
function addSection( module_number) {
	section_row = $('#tab-module-' + module_number + ' .section').length;
	html  = '<tbody id="section-row-' + module_number + '-' + section_row + '" class="section">';
	html += '  <tr>';
    html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb_' + module_number + '_' + section_row +'" /><br />';
    html += '    <input type="hidden" name="customblocks_module[' + module_number + '][sections][' + section_row + '][image]" value="" id="image_' + module_number + '_' + section_row + '" />';
    html += '    <a onclick="image_upload(\'image_' + module_number + '_'+ section_row + '\', \'thumb_' + module_number + '_' + section_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb_' + module_number + '_' + section_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image_' + module_number + '_' + section_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="left">';
	html += '    <span style="margin:10px 0;"><strong>*Section must be saved in order to apply a background color. Default values will be used until the section is saved</strong></span><br /><br />';
	html += '    Position: <select name="customblocks_module[' + module_number + '][sections][' + section_row + '][left_right]">';
	html += '	 <option value="left">Left</option>';
	html += '	 <option value="right">Right</option>';
	html += '	 </select><br /><br />';
	html += '       Section width: <input type="text" name="customblocks_module[' + module_number + '][sections][' + section_row + '][item_width]" value="" size="10" /><br /><br />';
	html += '       Section height: <input type="text" name="customblocks_module[' + module_number + '][sections][' + section_row + '][item_height]" value="" size="10" /><br /><br />';
	html += '       Position from top in px: <input type="text" name="customblocks_module[' + module_number + '][sections][' + section_row + '][top]" value="" size="10" /><br /><br />';
	html += '       Section background color: #<input id="temporary_color" type="text" id="customblocks_module[' + module_number + '][sections][' + section_row + '][color]" name="customblocks_module[' + module_number + '][sections][' + section_row + '][color]" value="" size="10" /><br /><br />';
	html += '  		<div id="language-' + module_number + '-' + section_row + '" class="htabs">';
					<?php foreach ($languages as $language) { ?>
    html += '    		<a href="#tab-language-'+ module_number  + '-' + section_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
					<?php } ?>
	html += '       </div>';
     
					<?php foreach ($languages as $language) { ?>
	html += '    	<div id="tab-language-'+ module_number + '-' + section_row + '-<?php echo $language['language_id']; ?>">';
	html += '          	<?php echo $text_title; ?><input name="customblocks_module[' + module_number + '][sections][' + section_row + '][title][<?php echo $language['language_id']; ?>]" id="title-' + module_number + '-' + section_row +'-<?php echo $language['language_id']; ?>" size="60" /><br /><br />';
	html += '          	<textarea name="customblocks_module[' + module_number + '][sections][' + section_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + module_number + '-' + section_row + '-<?php echo $language['language_id']; ?>"></textarea>';
	html += '    	</div>';
					<?php } ?>
	html += '    </td>';
	html += '    <td><a class="button" onclick="removeSection('+ module_number +',' + section_row +');"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#section_' + module_number + ' tfoot').before(html);
	
	
	<?php foreach ($languages as $language) { ?>
	CKEDITOR.replace('description-' + module_number + '-' + section_row + '-<?php echo $language['language_id']; ?>', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});  
	<?php } ?>
	
	
	$('#language-' + module_number + '-' + section_row + ' a').tabs();
	
	section_row++;
}

function removeSection(module_number, section_number){
	$('#section-row-' + module_number + '-' + section_number).remove();
}

function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};

//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script>
<script type="text/javascript">

$(document).ready(function() {

	$('#color_1_0, #color_1_1, #color_1_2, #color_1_3, #color_1_4, #color_1_5, #color_1_6, #color_1_7, #color_1_8, #color_1_9, #color_1_10, #color_1_11, #color_1_12, #color_1_13, #color_1_14, #color_1_15,#color_2_0, #color_2_1, #color_2_2, #color_2_3, #color_2_4, #color_2_5, #color_2_6, #color_2_7, #color_2_8, #color_2_9, #color_2_10, #color_2_11, #color_2_12, #color_2_13, #color_2_14, #color_2_15, #color_3_0, #color_3_1, #color_3_2, #color_3_3, #color_3_4, #color_3_5, #color_3_6, #color_3_7, #color_3_8, #color_3_9, #color_3_10, #color_3_11, #color_3_12, #color_3_13, #color_3_14, #color_3_15, #color_4_0, #color_4_1, #color_4_2, #color_4_3, #color_4_4, #color_4_5, #color_4_6, #color_4_7, #color_4_8, #color_4_9, #color_4_10, #color_4_11, #color_4_12, #color_4_13, #color_4_14, #color_4_15, #color_5_0, #color_5_1, #color_5_2, #color_5_3, #color_5_4, #color_5_5, #color_5_6, #color_5_7, #color_5_8, #color_5_9, #color_5_10, #color_5_11, #color_5_12, #color_5_13, #color_5_14, #color_5_15, #color_6_0, #color_6_1, #color_6_2, #color_6_3, #color_6_4, #color_6_5, #color_6_6, #color_6_7, #color_6_8, #color_6_9, #color_6_10, #color_6_11, #color_6_12, #color_6_13, #color_6_14, #color_6_15, #color_7_0, #color_7_1, #color_7_2, #color_7_3, #color_7_4, #color_7_5, #color_7_6, #color_7_7, #color_7_8, #color_7_9, #color_7_10, #color_7_11, #color_7_12, #color_7_13, #color_7_14, #color_7_15, #color_8_0, #color_8_1, #color_8_2, #color_8_3, #color_8_4, #color_8_5, #color_8_6, #color_8_7, #color_8_8, #color_8_9, #color_8_10, #color_8_11, #color_8_12, #color_8_13, #color_8_14, #color_8_15, #color_9_0, #color_9_1, #color_9_2, #color_9_3, #color_9_4, #color_9_5, #color_9_6, #color_9_7, #color_9_8, #color_9_9, #color_9_10, #color_9_11, #color_9_12, #color_9_13, #color_9_14, #color_9_15, #color_10_0, #color_10_1, #color_10_2, #color_10_3, #color_10_4, #color_10_5, #color_10_6, #color_10_7, #color_10_8, #color_10_9, #color_10_10, #color_10_11, #color_10_12, #color_10_13, #color_10_14, #color_10_15, #temporary_color').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
	 });
</script>
<?php echo $footer; ?>