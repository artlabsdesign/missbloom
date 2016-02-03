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
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> 
		</div>
		
		<?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <table class="form" id="poshy_<?php echo $module_row; ?>">
			<tr>
				<td><?php echo $entry_show_count; ?></td>
				<td><select name="popinfo_module[<?php echo $module_row; ?>][display_times]" class="spicy" style="width:200px;">
					<?php if ($module['display_times'] == 0) { ?>
						<option value="0" selected="selected"><?php echo $text_unlimited; ?></option>
						<option value="1"><?php echo $text_only_once; ?></option>
					<?php } else { ?>
						<option value="0"><?php echo $text_unlimited; ?></option>
						<option value="1" selected="selected"><?php echo $text_only_once; ?></option>
					<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_message_type; ?></td>
				<td><select id="message_type_<?php echo $module_row; ?>" name="popinfo_module[<?php echo $module_row; ?>][message_type]" onchange="checkMessageType(this);" class="pmt-<?php echo $module_row; ?> spicy" style="width:200px;">
					<option value="choose_product" <?php echo (($module['message_type'] == "choose_product")? 'selected="selected"' : ''); ?>><?php echo $text_choose_product; ?></option>
					<option value="define_myself" <?php echo (($module['message_type'] == "define_myself")? 'selected="selected"' : ''); ?>><?php echo $text_define_myself; ?></option>
					</select>
				</td>
			</tr>
            <tr>
            <td>Play notification sound when showing the message /only applies to lower-right positioned boxes/:</td>
            <td><select name="popinfo_module[<?php echo $module_row; ?>][sound]" class="spicy">
                <?php if ($module['sound'] == '1') { ?>
                <option value="1" selected="selected">Yes</option>
                <option value="0">No</option>
                <?php } else { ?>
                <option value="1">Yes</option>
                <option value="0" selected="selected">No</option>
                <?php } ?>
              </select></td>
          </tr>
			<tr id="pmt-choose-product" class="pmt" style="display:none;"> 
				
				<td colspan="2">
					<?php echo $entry_product; ?><br /><br /><input type="text" id="product_<?php echo $module_row; ?>" name="product_<?php echo $module_row; ?>" onkeydown="defineWithAuto(this);" size="40" class="spicy"  /><br />
<br />
					<div class="scrollbox" id="featured-product-<?php echo $module_row; ?>">
						<?php if ($module['featured_product']) { ?>
						<div id="featured-product-<?php echo $module_row; ?>-<?php echo $module['featured_product_info']['product_id']; ?>"><?php echo $module['featured_product_info']['name']; ?> <img src="view/image/delete.png" />
							<input type="hidden" value="<?php echo $module['featured_product_info']['product_id']; ?>" />
						</div>
						<?php } ?>
					</div>
					<input type="hidden" id="featured_product_<?php echo $module_row; ?>" name="popinfo_module[<?php echo $module_row; ?>][featured_product]" value="<?php echo $module['featured_product']; ?>" />
				</td>
			</tr>
			<tr id="pmt-define-myself" class="pmt" style="display:none;">
				<td colspan="2">
				  <?php echo $entry_importance; ?>&nbsp;&nbsp;&nbsp;&nbsp;<select name="popinfo_module[<?php echo $module_row; ?>][importance]" class="spicy">
				  <?php if ($module['importance'] == "normal"){ ?>
					<option value="normal" selected="selected"><?php echo $text_normal; ?></option>
					<option value="high"><?php echo $text_high; ?></option>
				  <?php } else { ?>
					<option value="normal"><?php echo $text_normal; ?></option>
					<option value="high" selected="selected"><?php echo $text_high; ?></option>
				  <?php } ?>
				  </select>	&nbsp;&nbsp;&nbsp;&nbsp;
				  <?php echo $entry_link; ?>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="popinfo_module[<?php echo $module_row; ?>][link]" value="<?php echo $module['link']; ?>" size="50" class="spicy" /><br /><br />	
				  <div id="language-<?php echo $module_row; ?>" class="htabs">
					<?php foreach ($languages as $language) { ?>
						<a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
					<?php } ?>
				  </div>
				  <?php foreach ($languages as $language) { ?>
				  <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">
					<table class="form">
					  <tr>
						<td><?php echo $entry_description; ?></td>
						<td><textarea name="popinfo_module[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea></td>
					  </tr>
					</table>
				  </div>
				  <?php } ?>
				</td>  
		  </table>
		  
          <table class="form">
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="popinfo_module[<?php echo $module_row; ?>][layout_id]" class="spicy">
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
              <td><select name="popinfo_module[<?php echo $module_row; ?>][position]" class="spicy">
                  <?php if ($module['position'] == 'content_top_fullscreen') { ?>
                  <option value="content_top_fullscreen" selected="selected">Pop info</option>
                  <?php } else { ?>
                  <option value="content_top_fullscreen">Pop info</option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="popinfo_module[<?php echo $module_row; ?>][status]" class="spicy">
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
              <td><input type="text" name="popinfo_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" class="spicy" /></td>
            </tr>
          </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--	
function checkMessageType(object){
	var module_no = parseInt($(object).attr('class').replace("pmt-", "")) ;
	
	$('#poshy_' + module_no + ' .pmt').hide();
	
	$('#poshy_' + module_no + ' #pmt-' + $(object).attr('value').replace('_', '-')).show();
}
//--></script>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#message_type_<?php echo $module_row; ?>').trigger('change');

<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
<?php $module_row++; ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '<table class="form" id="poshy_' + module_row + '">';
	html += '	<tr>';
	html += '	   <td><?php echo $entry_show_count; ?></td>';
	html += '	   <td><select name="popinfo_module[' + module_row + '][display_times]" class="spicy" style="width:200px;">';
	html += '          <option value="0" selected="selected"><?php echo addslashes($text_unlimited); ?></option>';
	html += '          <option value="1"><?php echo addslashes($text_only_once); ?></option>';
	html += '      </select></td>';
	html += '	</tr>';
	html += '	<tr>';
	html += '	   <td><?php echo $entry_message_type; ?></td>';
	html += '	   <td><select name="popinfo_module[' + module_row + '][message_type]" class="pmt-' + module_row + ' spicy" onchange="checkMessageType(this);" style="width:200px;">';
	html += '          <option value="choose_product"><?php echo addslashes($text_choose_product); ?></option>';
	html += '          <option value="define_myself"><?php echo addslashes($text_define_myself); ?></option>';
	html += '      </select></td>';
	html += '	</tr>';
	html += '    <tr>';
	html += '      <td>Play notification sound when showing the message /only applies to lower-right positioned boxes/:</td>';
	html += '      <td><select name="popinfo_module[' + module_row + '][sound]" class="spicy">';
	html += '        <option value="1">Yes</option>';
	html += '        <option value="0">No</option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '   <tr id="pmt-define-myself" class="pmt" style="display:none;">';
	html += '      <td colspan="2">';
	html += '       <?php echo $entry_importance; ?>&nbsp;&nbsp;&nbsp;&nbsp;<select name="popinfo_module[' + module_row + '][importance]" class="spicy">';
	html += '          <option value="normal" selected="selected"><?php echo $text_normal; ?></option>';
	html += '          <option value="high"><?php echo $text_high; ?></option>';
	html += '       </select>&nbsp;&nbsp;&nbsp;&nbsp;';
	html += '       <?php echo $entry_link; ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="popinfo_module[' + module_row + '][link]" value="" size="50" class="spicy" /><br /><br />';
	html += '  		<div id="language-' + module_row + '" class="htabs">';
					<?php foreach ($languages as $language) { ?>
	html += '    		<a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
					<?php } ?>
	html += '  		</div>';

					<?php foreach ($languages as $language) { ?>
	html += '    	<div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>">';
	html += '     		 <table class="form">';
	html += '        		<tr>';
	html += '         		 <td><?php echo $entry_description; ?></td>';
	html += '          		 <td><textarea name="popinfo_module[' + module_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
	html += '        		</tr>';
	html += '      		 </table>';
	html += '    	</div>';
					<?php } ?>
	html += '      </td>';				
	html += '   </tr>';
	
	html += '   <tr id="pmt-choose-product" class="pmt" style="">';
    html += '       <td colspan="2">';
    html += '       	<div id="autodefine_' + module_row + '">';
	html += '    			<?php echo $entry_product; ?><br /><br /><input type="text" id="product_'+ module_row +'" name="product_'+ module_row +'" onkeydown="defineWithAuto(this);" size="40"  class="spicy" /><br /><br />';
	html += '    			<div class="scrollbox" id="featured-product-' + module_row + '" style=" width:300px; height:63px;"></div>';
    html += '    			<input type="hidden" id="featured_product_' + module_row + '" name="popinfo_module[' + module_row + '][featured_product]" value="" />';
	html += '    	 	</div>';
    html += '       </td>';
    html += '    </tr>';
	
	html += '</table>';

	html += '  <table class="form">';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="popinfo_module[' + module_row + '][layout_id]" class="spicy">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="popinfo_module[' + module_row + '][position]" class="spicy">';
	html += '        <option value="content_top_fullscreen">Pop info</option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="popinfo_module[' + module_row + '][status]" class="spicy">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="popinfo_module[' + module_row + '][sort_order]" value="" size="3" class="spicy" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	html += '</div>';
	
	$('#form').append(html);
	
	<?php foreach ($languages as $language) { ?>
	CKEDITOR.replace('description-' + module_row + '-<?php echo $language['language_id']; ?>', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});  
	<?php } ?>
	
	$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	$('.choose-color').ColorPicker({
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
	
	module_row++;
}


function defineWithAuto(object){
	var module_number = $(object).attr('id').replace("product_", "");

	$('input[name=\'product_' + module_number + '\']').autocomplete({
		delay: 0,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item.name,
							value: item.product_id
						}
					}));
				}
			});
			
		}, 
		select: function(event, ui) {
			$('#featured-product-' + module_number).html('');
			$('#featured-product-' + module_number + '-' + ui.item.value).remove();
			
			$('#featured-product-' + module_number).append('<div id="featured-product-' + module_number + '-' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');

			$('#featured-product-' + module_number + ' div:odd').attr('class', 'odd');
			$('#featured-product-' + module_number + ' div:even').attr('class', 'even');
			
			data = $.map($('#featured-product-' + module_number + ' input'), function(element){
				return $(element).attr('value');
			});
							
			$('#featured_product_' + module_number).attr('value', data.join());
						
			return false;
		}
	});

	$('#featured-product-' + module_number + ' div img').live('click', function() {
		$(this).parent().remove();
		
		$('#featured-product-' + module_number + ' div:odd').attr('class', 'odd');
		$('#featured-product-' + module_number + ' div:even').attr('class', 'even');

		data = $.map($('#featured-product-' + module_number + ' input'), function(element){
			return $(element).attr('value');
		});
						
		$('#featured_product_' + module_number).attr('value', data.join());	
	});
}

//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();

$('.choose-color').ColorPicker({
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

//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 

<?php echo $footer; ?>