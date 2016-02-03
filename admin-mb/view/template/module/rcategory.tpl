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
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons">
		<a onclick="apply();" class="button"><?php echo $button_apply; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a><a onclick="emptyTable();" class="button empty"><?php echo $button_empty; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    
        <div id="tab-links">
			<span><?php echo $text_select_category; ?></span>
			<select id="scategories">
                <option value="0" selected="selected"><?php echo $text_none; ?></option>
                <?php foreach ($categories as $category) { ?>
					<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                <?php } ?>
            </select>			
			
			<table class="double_select">
				<tr>
					<td>
						<span class="help"><?php echo $text_move_category; ?></span>
						<select multiple="multiple" id="categories" size="10"></select>
						<span class="hint" name="help_box"><?php echo $text_hint ?><span class="hint-pointer">&nbsp;</span></span>
						<br />
						<a href="#add" id="move_to_right" class="multiple_select_add"><?php echo $text_add_category; ?></a>
					</td>

					<td>
						<span class="help"><?php echo $text_rcategory; ?></span>
						<select multiple="multiple" id="rcategories" size="10" name=related_categories[]></select>
						
						<span class="hint" name="help_box"><?php echo $text_hint ?><span class="hint-pointer">&nbsp;</span></span>
						<br />
						<a href="#del" id="move_to_left" class="multiple_select_remove"><?php echo $text_remove_category; ?></a>
					</td>
					<td style="vertical-align:top">
						<span class="help" id="limit"><?php echo $entry_limit; ?></span>
						<div id="rcategory_limit"></div>
					</td>
				</tr>
			</table>

        </div>    
    
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="center"><?php echo $entry_title; ?></td>
            <td class="center"><?php echo $entry_image; ?></td>
            <td class="center"><?php echo $entry_layout; ?></td>
            <td class="center"><?php echo $entry_position; ?></td>
            <td class="center"><?php echo $entry_status; ?></td>
            <td class="center"><?php echo $entry_sort_order; ?></td>
            <td class="center"><?php echo $entry_order_type; ?></td>
            <td class="center"><?php echo $entry_show_link; ?></td>
            <td class="center"><?php echo $entry_use_carousel; ?></td>
            <td class="center"><?php echo $entry_tab_color; ?></td>
            <td class="center"><?php echo $entry_action; ?></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
            <td class="left">
				  <div id="language-title-<?php echo $module_row; ?>" class="htabs lang">
					<?php foreach ($languages as $language) { ?>
						<a href="#tab-language-title-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>
					<?php } ?>
				  </div>		
				  <?php foreach ($languages as $language) { ?>
					  <div id="tab-language-title-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">				  
						<input type="text" name="rcategory_module[<?php echo $module_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['title'][$language['language_id']]) ? $module['title'][$language['language_id']] : ''; ?>" size="35" />
					  </div>
				  <?php } ?> 
				   <span class="help"><?php echo $text_replace_hint; ?></span>	
			</td>			  			
            <td class="center image_row">
				<input type="text" name="rcategory_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="1" />&nbsp;&times;&nbsp;<input type="text" name="rcategory_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="1" />
				<?php if (isset($error_image[$module_row])) { ?>
					<span class="error"><?php echo $error_image[$module_row]; ?></span>
				<?php } ?>
            </td>
            <td class="left">
				<select name="rcategory_module[<?php echo $module_row; ?>][layout_id]">
					<?php foreach ($layouts as $layout) { ?>
						<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
							<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
						<?php } ?>
					<?php } ?>
                </select>
            </td>            
            <td class="center"><select name="rcategory_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
					<option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
					<option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
					<option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
					<option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
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
            <td class="center">
				<select name="rcategory_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </td>
            <td class="center sort_row"><input type="text" name="rcategory_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="center">
				<select name="rcategory_module[<?php echo $module_row; ?>][order_type]">
                <?php if ($module['order_type'] == 'default') { ?>
					<option value="p.sort_order:ASC" selected="selected"><?php echo $text_default; ?></option>
                <?php } else { ?>
					<option value="p.sort_order:ASC"><?php echo $text_default; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'pd.name:ASC') { ?>
					<option value="pd.name:ASC" selected="selected"><?php echo $text_order_by_name_asc; ?></option>
                <?php } else { ?>
					<option value="pd.name:ASC"><?php echo $text_order_by_name_asc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'pd.name:DESC') { ?>
					<option value="pd.name:DESC" selected="selected"><?php echo $text_order_by_name_desc; ?></option>
                <?php } else { ?>
					<option value="pd.name:DESC"><?php echo $text_order_by_name_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.model:ASC') { ?>
					<option value="p.model:ASC" selected="selected"><?php echo $text_order_by_model_asc; ?></option>
                <?php } else { ?>
					<option value="p.model:ASC"><?php echo $text_order_by_model_asc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.model:DESC') { ?>
					<option value="p.model:DESC" selected="selected"><?php echo $text_order_by_model_desc; ?></option>
                <?php } else { ?>
					<option value="p.model:DESC"><?php echo $text_order_by_model_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.quantity:ASC') { ?>
					<option value="p.quantity:ASC" selected="selected"><?php echo $text_order_by_quantity_asc; ?></option>
                <?php } else { ?>
					<option value="p.quantity:ASC"><?php echo $text_order_by_quantity_asc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.quantity:DESC') { ?>
					<option value="p.quantity:DESC" selected="selected"><?php echo $text_order_by_quantity_desc; ?></option>
                <?php } else { ?>
					<option value="p.quantity:DESC"><?php echo $text_order_by_quantity_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.price:ASC') { ?>
					<option value="p.price:ASC" selected="selected"><?php echo $text_order_by_price_asc; ?></option>
                <?php } else { ?>
					<option value="p.price:ASC"><?php echo $text_order_by_price_asc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.price:DESC') { ?>
					<option value="p.price:DESC" selected="selected"><?php echo $text_order_by_price_desc; ?></option>
                <?php } else { ?>
					<option value="p.price:DESC"><?php echo $text_order_by_price_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'rating:DESC') { ?>
					<option value="rating:DESC" selected="selected"><?php echo $text_order_by_rating_desc; ?></option>
                <?php } else { ?>
					<option value="rating:DESC"><?php echo $text_order_by_rating_desc; ?></option>
                <?php } ?>                
                <?php if ($module['order_type'] == 'rating:ASC') { ?>
					<option value=rating:ASC" selected="selected"><?php echo $text_order_by_rating_asc; ?></option>
                <?php } else { ?>
					<option value="rating:ASC"><?php echo $text_order_by_rating_asc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.date_added:ASC') { ?>
					<option value="p.date_added:ASC" selected="selected"><?php echo $text_order_by_date_added_asc; ?></option>
                <?php } else { ?>
					<option value="p.date_added:ASC"><?php echo $text_order_by_date_added_asc; ?></option>
                <?php } ?>                
                <?php if ($module['order_type'] == 'p.date_added:DESC') { ?>
					<option value="p.date_added:DESC" selected="selected"><?php echo $text_order_by_date_added_desc; ?></option>
                <?php } else { ?>
					<option value="p.date_added:DESC"><?php echo $text_order_by_date_added_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'p.viewed:ASC') { ?>
					<option value="p.viewed:ASC" selected="selected"><?php echo $text_order_by_viewed_asc; ?></option>
                <?php } else { ?>
					<option value="p.viewed:ASC"><?php echo $text_order_by_viewed_asc; ?></option>
                <?php } ?>                
                <?php if ($module['order_type'] == 'p.viewed:DESC') { ?>
					<option value="p.viewed:DESC" selected="selected"><?php echo $text_order_by_viewed_desc; ?></option>
                <?php } else { ?>
					<option value="p.viewed:DESC"><?php echo $text_order_by_viewed_desc; ?></option>
                <?php } ?>
                <?php if ($module['order_type'] == 'rand()') { ?>
					<option value="rand()" selected="selected"><?php echo $text_order_by_rand; ?></option>
                <?php } else { ?>
					<option value="rand()"><?php echo $text_order_by_rand; ?></option>
                <?php } ?>
				</select>
			</td>
            <td class="center">
				<select name="rcategory_module[<?php echo $module_row; ?>][show_link][status]" class="show_link">
                <?php if ($module['show_link']['status']) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
				</select>
				<div id="show_link_settings_body-<?php echo $module_row; ?>">
					<a href="javascript:void(0);" id="show_link_settings-<?php echo $module_row; ?>" onclick="$(this).next().toggle();"><?php echo $text_settings; ?></a>
					<div class="show_link_settings">
						<a class="close-btn" onclick="$(this).parent().hide();" title="<?php echo $text_close; ?>">&times;</a>
						<div class="head"><?php echo $text_show_link_title?></div>
						<div id="language-show_link-<?php echo $module_row; ?>" class="htabs lang">
						<?php foreach ($languages as $language) { ?>
							<a href="#tab-language-show_link-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>
						<?php } ?>
						</div>		
						<?php foreach ($languages as $language) { ?>
						  <div id="tab-language-show_link-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">				  
							<input id="show_link-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" type="text" name="rcategory_module[<?php echo $module_row; ?>][show_link][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['show_link']['text'][$language['language_id']]) ? $module['show_link']['text'][$language['language_id']] : $text_show_link ?>" size="45" />
						  </div>
						<?php } ?> 
						<span class="help" style="text-align:left;"><?php echo $text_show_link_hint; ?></span>

						<div id="show_pcount">
							<?php echo $text_show_pcount; ?>
							<select name="rcategory_module[<?php echo $module_row; ?>][show_link][show_pcount]">
							<?php if ($module['show_link']['show_pcount']) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
							<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
							<?php } ?>
							</select>						
						</div>						
					</div>
				</div>
			</td>

            <td class="center">
				<select name="rcategory_module[<?php echo $module_row; ?>][use_carousel]">
                <?php if ($module['use_carousel']) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
				</select>

<!-- OWL Carousel Setting Form //-->			
			<br><a href="javascript:void(0);" id="owl_settings-<?php echo $module_row; ?>" onclick="showPopup('owl_settings','owl_settings',true); return false;"><?php echo $text_settings; ?></a> (TODO)
						
			<div id="popup" class="hidden"></div>
			<div id="popup_owl_settings" class="hidden">
				<a class="close-btn" onclick="closePopup();" title="<?php echo $text_close; ?>">&times;</a>
				<div class="head">Settings OWL Carousel</div>
				<div class="owl_settings">
					<table>
						<tr><th colspan="2">Most important owl features</th></tr>
						<tr>
							<td>items: </td>
							<td><input type="text" value="5" size="1" /></td>
						</tr>
						<tr>
							<td>itemsCustom: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>itemsDesktop: </td>
							<td><input type="text" value="[1199,4]" /></td>
						</tr>
						<tr>
							<td>itemsDesktopSmall: </td>
							<td><input type="text" value="[980,3]" /></td>
						</tr>
						<tr>
							<td>itemsTablet: </td>
							<td><input type="text" value="[768,2]" /></td>
						</tr>
						<tr>
							<td>itemsTabletSmall: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>itemsMobile: </td>
							<td><input type="text" value="[479,1]" /></td>
						</tr>
						<tr>
							<td>singleItem: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>itemsScaleUp: </td>
							<td><input type="text" value="false" /></td>
						</tr>
					</table>
					
					<table>
						<tr><th colspan="2">Basic Speeds</th></tr>
						<tr>
							<td>slideSpeed: </td>
							<td><input type="text" value="200" size="3" /></td>
						</tr>
						<tr>
							<td>paginationSpeed: </td>
							<td><input type="text" value="800" size="3" /></td>
						</tr>
						<tr>
							<td>rewindSpeed: </td>
							<td><input type="text" value="1000" size="4" /></td>
						</tr>
						
						<tr><th colspan="2">Autoplay</th></tr>
						<tr>
							<td>autoPlay: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>stopOnHover: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						
						<tr><th colspan="2">Pagination</th></tr>
						<tr>
							<td>pagination: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>paginationNumbers: </td>
							<td><input type="text" value="false" /></td>
						</tr>
					</table>
					
					<table>				
						<tr><th colspan="2">Navigation</th></tr>
						<tr>
							<td>navigation: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>navigationText: </td>
							<td><input type="text" value='["prev","next"]' /></td>
						</tr>
						<tr>
							<td>rewindNav: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>scrollPerPage: </td>
							<td><input type="text" value="false" /></td>
						</tr>

						<tr><th colspan="2">Auto height</th></tr>
						<tr>
							<td>autoHeight: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						
						<tr><th colspan="2">JSON</th></tr>
						<tr>
							<td>jsonPath: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>jsonSuccess: </td>
							<td><input type="text" value="false" /></td>
						</tr>				
					</table>
					
					<table>				
						<tr><th colspan="2">Callbacks</th></tr>
						<tr>
							<td>beforeUpdate: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>afterUpdate: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>beforeInit: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>afterInit: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>beforeMove: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>afterMove: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>afterAction: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>startDragging: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>afterLazyLoad: </td>
							<td><input type="text" value="false" /></td>
						</tr>				
					</table> 	
					
					<table>				
						<tr><th colspan="2">Mouse Events</th></tr>
						<tr>
							<td>dragBeforeAnimFinish: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>mouseDrag: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>touchDrag: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						
						<tr><th colspan="2">Transitions</th></tr>
						<tr>
							<td>transitionStyle: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						
						<tr><th colspan="2">Other</th></tr>
						<tr>
							<td>addClassActive: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr><th colspan="2">Auto height</th></tr>
						<tr>
							<td>autoHeight: </td>
							<td><input type="text" value="false" /></td>
						</tr>				
					</table>			
					
					<table>				
						<tr><th colspan="2">Responsive</th></tr>
						<tr>
							<td>responsive: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>responsiveRefreshRate: </td>
							<td><input type="text" value="200" /></td>
						</tr>
						<tr>
							<td>responsiveBaseWidth: </td>
							<td><input type="text" value="window" /></td>
						</tr>
						
						<tr><th colspan="2">CSS Styles</th></tr>
						<tr>
							<td>baseClass: </td>
							<td><input type="text" value='"owl-carousel"' /></td>
						</tr>
						<tr>
							<td>theme: </td>
							<td><input type="text" value='"owl-theme"' /></td>
						</tr>
						<tr><th colspan="2">Lazy load</th></tr>
						<tr>
							<td>lazyLoad: </td>
							<td><input type="text" value="false" /></td>
						</tr>
						<tr>
							<td>lazyFollow: </td>
							<td><input type="text" value="true" /></td>
						</tr>
						<tr>
							<td>lazyEffect: </td>
							<td><input type="text" value='"fade"' /></td>
						</tr>				
					</table>										
					<div class="todo">THIS FORM IS TODO!!</div>
				</div>
			</div>

<!-- OWL Carousel Setting Form //-->			
				
			</td>
			<td class="center"><input type="color" name="rcategory_module[<?php echo $module_row; ?>][tab_color]" value="<?php echo $module['tab_color']; ?>" /></td>
            <td class="center">
				<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
			</td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="10"></td>
            <td class="center"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left">';	
	html += '		<div id="language-title-' + module_row + '" class="htabs lang">';
    <?php foreach ($languages as $language) { ?>
    html += '			<a href="#tab-language-title'+ module_row + '-<?php echo $language['language_id']; ?>" style="padding:2px 5px;"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>';
    <?php } ?>
	html += '		</div>';
	<?php foreach ($languages as $language) { ?>
	html += '	    <div id="tab-language-title'+ module_row + '-<?php echo $language['language_id']; ?>">';
	html += '	     	<input type="text" name="rcategory_module[' + module_row + '][title][<?php echo $language['language_id']; ?>]" value="" size="35" />';
	html += '	    </div>';
	<?php } ?>
	html += '    <span class="help"><?php echo $text_replace_hint; ?></span>';
	html += '    </td>';
	html += '    <td class="center image_row"><input type="text" name="rcategory_module[' + module_row + '][image_width]" value="115" size="3" />&nbsp;&times;&nbsp;<input type="text" name="rcategory_module[' + module_row + '][image_height]" value="115" size="3" />';
	html += '    </td>';
	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>" <?php if($layout['layout_id'] == '2') echo 'selected'?> ><?php echo addslashes($layout['name']); ?></option>';	
	<?php } ?>
	html += '    </select></td>';	
	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="center sort_row"><input type="text" name="rcategory_module[' + module_row + '][sort_order]" value="" size="3" /></td>';

	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][order_type]">';
	html += '      <option value="p.sort_order:ASC"><?php echo $text_default; ?></option>';
	html += '      <option value="pd.name:ASC"><?php echo $text_order_by_name_asc; ?></option>';
	html += '      <option value="pd.name:DESC"><?php echo $text_order_by_name_desc; ?></option>';
	html += '      <option value="p.model:ASC"><?php echo $text_order_by_model_asc; ?></option>';	
	html += '      <option value="p.model:DESC"><?php echo $text_order_by_model_desc; ?></option>';
	html += '      <option value="p.quantity:ASC"><?php echo $text_order_by_quantity_asc; ?></option>';
	html += '      <option value="p.quantity:DESC"><?php echo $text_order_by_quantity_desc; ?></option>';
	html += '      <option value="p.price:ASC"><?php echo $text_order_by_price_asc; ?></option>';
	html += '      <option value="p.price:DESC"><?php echo $text_order_by_price_desc; ?></option>';
	html += '      <option value="rating:DESC"><?php echo $text_order_by_rating_desc; ?></option>';
	html += '      <option value="rating:ASC"><?php echo $text_order_by_rating_asc; ?></option>';
	html += '      <option value="p.date_added:ASC"><?php echo $text_order_by_date_added_asc; ?></option>';
	html += '      <option value="p.date_added:DESC"><?php echo $text_order_by_date_added_desc; ?></option>';
	html += '      <option value="p.viewed:ASC"><?php echo $text_order_by_viewed_asc; ?></option>';
	html += '      <option value="p.viewed:DESC"><?php echo $text_order_by_viewed_desc; ?></option>';
	html += '      <option value="rand()"><?php echo $text_order_by_rand; ?></option>';
	html += '    </select></td>';
	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][show_link][status]" class="show_link">';
    html += '      <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
    html += '      <option value="0"><?php echo $text_no; ?></option>';
    html += '    </select>';
	html += '	<div id="show_link_settings_body-' + module_row + '">';
	html += '		<a href="javascript:void(0);" id="show_link_settings-' + module_row + '" onclick="$(this).next().toggle();"><?php echo $text_settings; ?></a>';
	html += '		<div class="show_link_settings">';
	html += '			<a class="close-btn" onclick="$(this).parent().hide();" title="<?php echo $text_close; ?>">&times;</a>';
	html += '			<div class="head"><?php echo $text_show_link_title?></div>';
	html += '			<div id="language-show_link-' + module_row + '" class="htabs lang">';
						<?php foreach ($languages as $language) { ?>
	html += '				<a href="#tab-language-show_link-' + module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>';
						<?php } ?>
	html += '			</div>';		
						<?php foreach ($languages as $language) { ?>
	html += '			  <div id="tab-language-show_link-' + module_row + '-<?php echo $language['language_id']; ?>">';				  
	html += '				<input id="show_link-' + module_row + '-<?php echo $language['language_id']; ?>" type="text" name="rcategory_module[' + module_row + '][show_link][text][<?php echo $language['language_id']; ?>]" value="<?php echo $text_show_link; ?>" size="45" />';
	html += '			  </div>';
						<?php } ?> 
	html += '			<span class="help" style="text-align:left;"><?php echo $text_show_link_hint; ?></span>';
	html += '			<div id="show_pcount"><?php echo $text_show_pcount; ?>';
	html += '				<select name="rcategory_module[' + module_row + '][show_link][show_pcount]">';
	html += '					<option value="1" selected="selected"><?php echo $text_yes; ?></option>';
	html += '					<option value="0"><?php echo $text_no; ?></option>';
	html += '				</select>';						
	html += '			</div>';	
	html += '		</div>';
	html += '	</div>';     
    html += '    </td>';
	html += '    <td class="center"><select name="rcategory_module[' + module_row + '][use_carousel]">';
    html += '      <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
    html += '      <option value="0"><?php echo $text_no; ?></option>';
    html += '    </select></td>';	
    html += '	 <td class="center"><input type="color" name="rcategory_module[' + module_row + '][tab_color]" value="#FFFFFF" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);
	
	$('#language-title-' + module_row + ' a').tabs();
	$('#language-show_link-' + module_row + ' a').tabs();

	module_row++;
}
//--></script>
<script language="javascript">
	function apply(){
		$('#form').append('<input type="hidden" id="apply" name="apply" value="1"  />');
		$('#form').submit();
	}
	
	function emptyTable(){
		if (!confirm('<?php echo $text_confirm; ?>')) {
			return false;
		}
		$.ajax({
			url: "index.php?route=module/rcategory/emptyTable&token=<?php echo $token; ?>",
			type: "GET",
			success: function(){
				toastr.success('<?php echo $text_clear_table; ?>');	
			}
		});
	}
	
// Show popup window
function showPopup(popup_type,position_id,center) {

	if(!center){
		var pos = $('#'+position_id).position();
		var el = $('#popup_owl_settings');
		$('#opaco').height($(document).height()).toggleClass('hidden');
		$('#popup').css({'position':'absolute','top':pos.top+5,'left':pos.left-el.width()/2});
		$('#popup').html($('#popup_' + popup_type).html()).removeClass('hidden')/*.animate({'top':pos.top},150)*/;
	} else {
		$('#opaco').height($(document).height()).toggleClass('hidden').css({'background-color':'#000', 'opacity':0.5});
		$('#popup').css({'position':'fixed','width':950,'top':'0','left':'50%'});
		$('#popup').html($('#popup_' + popup_type).html()).alignCenter().removeClass('hidden').animate({'top':400},400);
	}

	$('#opaco').bind('click',function(){closePopup()});

	return false;
}	

function closePopup() {
	$('#opaco').addClass('hidden').removeAttr('style');
	$('#popup').animate({'top':-400},150,function(){$(this).addClass('hidden').removeAttr('style')});
	return false;
}
	
$(document).ready(function(){
	$.fn.alignCenter = function() {
		var marginLeft = - $(this).width()/2 + 'px';
		var marginTop = - $(this).height()/2 + 'px';
		return $(this).css({'margin-left':marginLeft, 'margin-top':marginTop});
	};
});	
	
</script>
<script type="text/javascript"><!--
<?php $module_row = 0; ?>
<?php foreach ($modules as $module) { ?>
$('#language-title-<?php echo $module_row; ?> a').tabs();
$('#language-show_link-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?>
//--></script>

<script type="text/javascript"><!--
	
	$(document).ready(function(){

		$('#show_pcount select').live('change',function(){
			var r = $(this).parent().parent().find('input[id^=show_link-]');
			if(parseInt($(this).val())){
				$(this).parent().parent().find('input[id^=show_link-]').val($.trim(r.val())+" ({pqnt})");
			} else {
				r.val(r.val().replace(/\({pqnt}\)/g,""));
			}
		});

		$('#scategories').change(function(){	
			var cat = $(this).val();
			$.ajax({
				url: "index.php?route=module/rcategory/getRcategories&token=<?php echo $token; ?>&category_id="+$(this).val(),
				dataType: 'json',
				beforeSend: function(json) {
					$("#categories option").remove();
					<?php foreach ($categories as $category) { ?>
						var cat_ = '<?php echo $category['category_id']; ?>';
						if(cat != cat_)
							$("#categories").append('<option id="category-<?php echo $category['category_id']; ?>" value="<?php echo $category['category_id']; ?>"><?php echo addslashes($category['name']); ?></option>');
					<?php } ?>					
				},
				success: function(json) {
					$("#rcategories option, #rcategory_limit input").remove();
					for (i = 0; i < json.length; i++) {
						$("#category-"+json[i]['rcategory_id']+"").remove();
						$("#rcategories").append('<option id="rcategory-'+json[i]['rcategory_id']+'" value="'+json[i]['rcategory_id']+'">'+json[i]["name"]+'</option>');
						$('#rcategory_limit').append('<input class="rcategory_limit" id="limit-'+json[i]['rcategory_id']+'" type="text" value="'+json[i]['limit']+'" size="2" title="'+json[i]['name']+'" />');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}				
			});		
			$('#limit').show();
		});

		$("#move_to_right").bind('click',addRelated);
		
		$("#move_to_left").bind('click',removeRelated);

		$("#categories option").live("dblclick", addRelated);
		
		$("#rcategories option").live("dblclick",removeRelated);
		
		$('.rcategory_limit').live('change',function(){
			var rcategory_id = $(this).attr('id').match(/^([a-z\_]*)\-([0-9]*)$/)[2];
			var limit = $(this).val();
			var cname = $(this).attr('title');
			if(limit){
				$.post("index.php?route=module/rcategory/updateRcategoryLimit&token=<?php echo $token; ?>",{category_id:$("#scategories").val(),rcategory_id:rcategory_id,rcategory_limit:limit},
				function(){
					toastr.info('<?php echo $text_update_rcategory_limit ?><b>'+cname+'</b>');		
				});
			}
		});
		
		$('select[multiple=multiple]').bind('mouseover',function(){$(this).next('.hint').css('display','block')});
		$('select[multiple=multiple]').bind('mouseout',function(){$('.hint').css('display','none')});
		
		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "positionClass": "toast-bottom-right",
		  "onclick": null,
		  "showDuration": "1000",
		  "hideDuration": "300",
		  "timeOut": "5000",
		  "extendedTimeOut": "100",
		  "showEasing": "linear",
		  "hideEasing": "linear",
		  "showMethod": "slideDown",
		  "hideMethod": "fadeOut"
		}		
		
		
		$('.show_link').live('change',function(){
			parseInt($(this).val()) ? $(this).next('div[id^=show_link_settings_body]').show() : $(this).next('div[id^=show_link_settings_body]').hide();
		});
		
	});

	function addRelated() {
		$("#categories :selected").each(function() {
			var cname = $(this).text();
			$('#rcategory_limit').append('<input class="rcategory_limit" id="limit-'+$(this).val()+'" type="text" value="5" size="2" title="'+$(this).text()+'" />');
			$.post("index.php?route=module/rcategory/addRelated&token=<?php echo $token; ?>",{category_id:$("#scategories").val(),rcategory_id:$(this).attr("value"),rcategory_limit:$('#limit-'+$(this).attr("value")+'').val()},
			function(){
				toastr.success('<?php echo $text_add_rcategory?>><b>'+cname+'</b>');	
			});
			
			$(this).remove().appendTo("#rcategories");
		});
		return false;
	}

	function removeRelated() {
		$("#rcategories :selected").each(function() {
			var cname = $(this).text();
			$("#limit-"+$(this).attr("value")).remove();
			$.post("index.php?route=module/rcategory/removeRelated&token=<?php echo $token; ?>",{category_id:$("#scategories").val(),rcategory_id:$(this).attr("value")},
			function(){		
				toastr.info('<?php echo $text_remove_rcategory?>><b>'+cname+'</b>');		
			});
			$(this).remove().appendTo("#categories");
		});
		return false;
	}
//--></script>
<?php echo $footer; ?>
