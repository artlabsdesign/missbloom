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
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
	</div>
	<div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">        
	<table id="module" class="list">
			<thead>
            <tr>
              <td class="left">Username</td>
              <td class="left">Thumbnails Grid (max 18 pics total)</td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
			<tbody id="module-row<?php echo $module_row; ?>">
				<tr>
                	<td class="left">@<input type="text" name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][username]" value="<?php echo $module['username']; ?>" /></td>
                    <td class="left">
                    <select name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][grid_horizontal]">
                    <?php if ($module['grid_horizontal'] == '3') { ?>
                  	<option value="3" selected="selected">3</option>
                  	<?php } else { ?>
                  	<option value="3">3</option>
                  	<?php } ?>
                    </select> / 
                    <select name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][grid_vertical]">
                    <?php if ($module['grid_vertical'] == '2') { ?>
                  	<option value="2" selected="selected">2</option>
                  	<?php } else { ?>
                  	<option value="2">2</option>
                  	<?php } ?>
                    <?php if ($module['grid_vertical'] == '3') { ?>
                  	<option value="3" selected="selected">3</option>
                  	<?php } else { ?>
                  	<option value="3">3</option>
                  	<?php } ?>
                    <?php if ($module['grid_vertical'] == '4') { ?>
                  	<option value="4" selected="selected">4</option>
                  	<?php } else { ?>
                  	<option value="4">4</option>
                  	<?php } ?>
                    <?php if ($module['grid_vertical'] == '5') { ?>
                  	<option value="5" selected="selected">5</option>
                  	<?php } else { ?>
                  	<option value="5">5</option>
                  	<?php } ?>
                    <?php if ($module['grid_vertical'] == '6') { ?>
                  	<option value="6" selected="selected">6</option>
                  	<?php } else { ?>
                  	<option value="6">6</option>
                  	<?php } ?>                   
                    </select>
                    </td>
					<td class="left"><select name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][layout_id]">
					<?php foreach ($layouts as $layout) { ?>
						<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
							<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
						<?php } ?>
					<?php } ?>
					</select></td>
                    <td class="left"><select name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
					<td class="left"><select name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][status]">
					<?php if ($module['status']) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select></td>
					<td class="right"><input type="text" name="ULTIMATUMinstagram_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
					<td class="center">
						<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a>
					</td>
				</tr>
			</tbody>
        <?php $module_row++; ?>
        <?php } ?>
			<tfoot>
				<tr>
					<td colspan="6"></td>
					<td class="center"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
				</tr>
			</tfoot>
		</table>
    </form>
	</div>
		
</div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left">@<input type="text" name="ULTIMATUMinstagram_module[' + module_row + '][username]" value="" /></td>';
	html += '    <td class="left"><select name="ULTIMATUMinstagram_module[' + module_row + '][grid_horizontal]">';
	html += '      <option value="3">3</option>';
	html += '    </select> / <select name="ULTIMATUMinstagram_module[' + module_row + '][grid_vertical]">';
	html += '      <option value="2">2</option>';
	html += '      <option value="3">3</option>';
	html += '      <option value="4">4</option>';
	html += '      <option value="5">5</option>';
	html += '      <option value="6">6</option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="ULTIMATUMinstagram_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="ULTIMATUMinstagram_module[' + module_row + '][position]">';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="ULTIMATUMinstagram_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="ULTIMATUMinstagram_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
<?php echo $footer; ?>