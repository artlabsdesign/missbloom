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
      <div class="buttons"><a id="button_save" class="button"><i class="icon-save"></i> <?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><i class="icon-undo"></i> <?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="all_sliders">
          <div id="tab_modules">
            <ul class="nav">
              <?php $module_row = 0; ?>
              <?php foreach ($modules as $module) { ?>
              <li class="module"><a href="#tab_module<?php echo $module_row; ?>" <?php if ($module_row==0) { ?> class="current" <? } ?>><?php echo $ULTIMATUM_Layer_Slider_module; ?> <?php echo $module_row+1; ?></a><i class="icon-remove" onclick="deleteModule(<?php echo $module_row ?>)"></i></li>
              <?php $module_row++; } ?>
              <li class="new_module"><a class="new_module" onclick="addModule();"><?php echo $ULTIMATUM_Layer_Slider_add_new_module; ?></a></li>
            </ul>
          </div>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <div id="tab_module<?php echo $module_row; ?>" class="tab_module <?php if ($module_row>0) echo ' hide'; ?>">
            <h1 class="section_heading"><i class="icon-cogs"></i> Slider Module Settings</h1>
            <table>
              <thead>
                <tr>
                  <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_basic; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="title"><?php echo $entry_layout; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][layout_id]">
                      <?php foreach ($layouts as $layout) { ?>
                      <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                  <td class="title"><?php echo $entry_position; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][position]">
                      <?php if ($module['position'] == 'content_top_fullwidth') { ?>
                      <option value="content_top_fullwidth" selected="selected">Content Top Fullwidth</option>
                      <?php } else { ?>
                      <option value="content_top_fullwidth">Content Top Fullwidth</option>
                      <?php } ?>
                    </select></td>
                  <td class="title"><?php echo $entry_status; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][status]">
                      <?php if ($module['status']) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select></td>
                  <td class="title"><?php echo $entry_sort_order; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                  <td class="title"><?php echo $entry_language; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][language_id]">
                      <?php foreach ($languages as $language) { ?>
                      <?php if ($language['language_id'] == $module['language_id']) { ?>
                      <option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $language['language_id']; ?>" ><?php echo $language['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_responsive; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][responsive]" <?php if (isset($module['responsive'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_full_width; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][forceresponsive]" <?php if (isset($module['forceresponsive'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_responsive_under; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][responsiveunder]" value="<?php echo $module['responsiveunder']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_layers_container; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][sublayercontainer]" value="<?php echo $module['sublayercontainer']; ?>"/></td>
                </tr>
              </tbody>
              <thead>
                <tr>
                  <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_slideshow; ?></td>
                </tr>
              </thead>
              <tbody class="hide">
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_autostart; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][autostart]" <?php if (isset($module['autostart'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_pause_on_hover; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][pauseonhover]" <?php if (isset($module['pauseonhover'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_first_slide; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][firstlayer]" value="<?php echo $module['firstlayer']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_anim_first_slide; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][animatefirstlayer]" <?php if (isset($module['animatefirstlayer'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_random_slideshow; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][randomslideshow]" <?php if (isset($module['randomslideshow'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_two_way_slideshow; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][twowayslideshow]" <?php if (isset($module['twowayslideshow'])) echo 'checked="checked"'; ?>></td>
                </tr>
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_loops; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][loops]">
                      <option value="0" <?php if ($module['loops']=="0") echo "selected='selected'"; ?>>0</option>
                      <option value="1" <?php if ($module['loops']=="1") echo "selected='selected'"; ?>>1</option>
                      <option value="2" <?php if ($module['loops']=="2") echo "selected='selected'"; ?>>2</option>
                      <option value="3" <?php if ($module['loops']=="3") echo "selected='selected'"; ?>>3</option>
                      <option value="4" <?php if ($module['loops']=="4") echo "selected='selected'"; ?>>4</option>
                      <option value="5" <?php if ($module['loops']=="5") echo "selected='selected'"; ?>>5</option>
                      <option value="6" <?php if ($module['loops']=="6") echo "selected='selected'"; ?>>6</option>
                      <option value="7" <?php if ($module['loops']=="7") echo "selected='selected'"; ?>>7</option>
                      <option value="8" <?php if ($module['loops']=="8") echo "selected='selected'"; ?>>8</option>
                      <option value="9" <?php if ($module['loops']=="9") echo "selected='selected'"; ?>>9</option>
                      <option value="10" <?php if ($module['loops']=="10") echo "selected='selected'"; ?>>10</option>
                    </select></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_force_loops; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][forceloopnum]" <?php if (isset($module['forceloopnum'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_auto_video; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][autoplayvideos]" <?php if (isset($module['autoplayvideos'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_auto_pause; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][autopauseslideshow]">
                      <option value="auto" <?php if ($module['autopauseslideshow']=="auto") echo "selected='selected'"; ?>>auto</option>
                      <option value="disabled" <?php if ($module['autopauseslideshow']=="disabled") echo "selected='selected'"; ?>>disabled</option>
                    </select></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_youtube; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][youtubepreview]">
                      <option value="maxresdefault.jpg" <?php if ($module['youtubepreview']=="maxresdefault.jpg") echo "selected='selected'"; ?>>Maximum Quality</option>
                      <option value="hqdefault.jpg" <?php if ($module['youtubepreview']=="hqdefault.jpg") echo "selected='selected'"; ?>>High Quality</option>
                      <option value="mqdefault.jpg" <?php if ($module['youtubepreview']=="mqdefault.jpg") echo "selected='selected'"; ?>>Medium Quality</option>
                      <option value="default.jpg" <?php if ($module['youtubepreview']=="default.jpg") echo "selected='selected'"; ?>>Default Quality</option>
                    </select></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_keyboard; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][keynav]" <?php if (isset($module['keynav'])) echo 'checked="checked"'; ?>></td>
                </tr>
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_touch; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][touchnav]" <?php if (isset($module['touchnav'])) echo 'checked="checked"'; ?>></td>
                  <td colSpan="5"></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
              <thead>
                <tr>
                  <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_appearance; ?></td>
                </tr>
              </thead>
              <tbody class="hide">
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_skin; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][skin]">
                      <option value="fullwidth" <?php if ($module['skin']=="fullwidth") echo "selected='selected'"; ?>>fullwidth</option>
                    </select></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_color; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][transparent]" value="<?php echo $module['transparent']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td>
                  <td><i class="icon-remove"></i>
                    <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][backgroundimage]" value="<?php echo $module['backgroundimage']; ?>" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>backgroundimage"/>
                    <img src="<?php $image=HTTP_IMAGE; if ($module['backgroundimage']!="") $image.=$module['backgroundimage']; else $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload('ULTIMATUMLayerSlider_module<?php echo $module_row; ?>backgroundimage', 'thumb-icon');"></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_slider_style; ?></td>
                  <td colSpan="4"><textarea name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][sliderstyle]"><?php echo $module['sliderstyle']; ?></textarea></td>
                  <td></td>
                </tr>
              </tbody>
              <thead>
                <tr>
                  <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_navigation; ?></td>
                </tr>
              </thead>
              <tbody class="hide">
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_prev_next; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][navprevnext]" <?php if (isset($module['navprevnext'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_start_stop; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][navstartstop]" <?php if (isset($module['navstartstop'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_nav_buttons; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][navbuttons]" <?php if (isset($module['navbuttons'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_prev_next_hover; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][hoverprevnext]" <?php if (isset($module['hoverprevnext'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_nav_buttons_hover; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][hoverbottomnav]" <?php if (isset($module['hoverbottomnav'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_nav; ?></td>
                  <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_nav]">
                      <option value="disabled" <?php if ($module['thumb_nav']=="disabled") echo "selected='selected'"; ?>>disabled</option>
                      <option value="hover" <?php if ($module['thumb_nav']=="hover") echo "selected='selected'"; ?>>hover</option>
                      <option value="always" <?php if ($module['thumb_nav']=="always") echo "selected='selected'"; ?>>always</option>
                    </select></td>
                </tr>
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_width; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_width]" value="<?php echo $module['thumb_width']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_height; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_height]" value="<?php echo $module['thumb_height']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_container_width; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_container_width]" value="<?php echo $module['thumb_container_width']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_active_opacity; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_active_opacity]" value="<?php echo $module['thumb_active_opacity']; ?>"/></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_inactive_opacity; ?></td>
                  <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][thumb_inactive_opacity]" value="<?php echo $module['thumb_inactive_opacity']; ?>"/></td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
              <thead>
                <tr>
                  <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_misc_yourlogo; ?></td>
                </tr>
              </thead>
              <tbody class="hide">
                <tr>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_img_preload; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][imgpreload]" <?php if (isset($module['imgpreload'])) echo 'checked="checked"'; ?>></td>
                  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_use_urls; ?></td>
                  <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][relativeurls]" <?php if (isset($module['relativeurls'])) echo 'checked="checked"'; ?>></td>
                  
                </tr>
              </tbody>
              <thead>
                <tr>
                  <td colSpan="12" class="export-import"><?php echo $ULTIMATUM_Layer_Slider_import_export; ?></td>
                </tr>
              </thead>
              <tbody class="hide">
                <tr>
                  <td><?php echo $ULTIMATUM_Layer_Slider_your_import; ?></td>
                  <td colSpan="10"><textarea name="import"></textarea>
                    <input type="submit"  name="import_submit" value="<?php echo $ULTIMATUM_Layer_Slider_your_import; ?>"></td>
                  <td></td>
                </tr>
                <tr>
                  <td><?php echo $ULTIMATUM_Layer_Slider_your_export; ?></td>
                  <td colSpan="10"><textarea name="export"></textarea></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
            <h1 class="section_heading"><i class="icon-film"></i> Slides</h1>
            <div id="tab_slides">
              <ul class="nav">
                <?php $slide_row = 0; ?>
                <?php foreach ($module['slides'] as $slide) { ?>
                <li class="slide"><a href="#tab_slide<?php echo $slide_row; ?>" <?php if ($slide_row==0) { ?> class="current" <? } ?>><?php echo $ULTIMATUM_Layer_Slider_slide; ?> <?php echo $slide_row+1; ?></a><i onclick="deleteSlide(<?php echo $module_row; ?>, <?php echo $slide_row; ?>)" class="icon-remove"></i></li>
                <?php $slide_row++; } ?>
                <li class="new_slide"><a class="new_slide" onclick="addSlide();"><?php echo $ULTIMATUM_Layer_Slider_add_new_slide; ?></a></li>
              </ul>
              <div class="clear"></div>
            </div>
            <?php $slide_row = 0; ?>
            <?php foreach ($module['slides'] as $slide) { ?>
            <div id="tab_slide<?php echo $slide_row; ?>" class="tab_slide <?php if ($slide_row>0) echo ' hide'; ?>">
              <table>
                <thead>
                  <tr>
                    <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_image; ?></td>
                    <td><i class="icon-remove"></i>
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][background]" value="<?php echo $slide['background']; ?>" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>background"/>
                      <img src="<?php $image=HTTP_IMAGE; if ($slide['background']!="") $image.=$slide['background']; else $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload('ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>background', 'thumb-icon');"></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumbnail; ?></td>
                    <td><i class="icon-remove"></i>
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][thumbnail]" value="<?php echo $slide['thumbnail']; ?>" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>thumbnail" />
                      <img src="<?php $image=HTTP_IMAGE; if ($slide['thumbnail']!="") $image.=$slide['thumbnail']; else $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload('ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>thumbnail', 'thumb-icon');"></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_slide_delay; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][slidedelay]" value="<?php echo $slide['slidedelay']; ?>"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td><?php echo $ULTIMATUM_Layer_Slider_slide_transition; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_use_3d_2d; ?></td>
                    <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][new_transitions]" <?php if (isset($slide['new_transitions'])) echo 'checked="checked"'; ?>></td>
                    <td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_transitions; ?></td>
                    <td class="3D"><button class="button ls-select-transitions new"><?php echo $ULTIMATUM_Layer_Slider_select_transitions; ?></button>
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][3d_transitions]" value="<?php echo $slide['3d_transitions']; ?>">
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][2d_transitions]" value="<?php echo $slide['2d_transitions']; ?>">
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][custom_3d_transitions]" value="<?php echo $slide['custom_3d_transitions']; ?>">
                      <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][custom_2d_transitions]" value="<?php echo $slide['custom_2d_transitions']; ?>"></td>
                    <td class="2D hide title"><?php echo $ULTIMATUM_Layer_Slider_direction; ?></td>
                    <td class="2D hide"><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][slidedirection]">
                        <option value="top" <?php if ($slide['slidedirection']=="top") echo "selected='selected'"; ?>>top</option>
                        <option value="right" <?php if ($slide['slidedirection']=="right") echo "selected='selected'"; ?>>right</option>
                        <option value="bottom" <?php if ($slide['slidedirection']=="bottom") echo "selected='selected'"; ?>>bottom</option>
                        <option value="left" <?php if ($slide['slidedirection']=="left") echo "selected='selected'"; ?>>left</option>
                      </select></td>
                    <td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_time_shift; ?></td>
                    <td class="3D"><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][timeshift]" value="<?php echo $slide['timeshift']; ?>"/></td>
                    <td class="2D hide"></td>
                    <td class="2D hide"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="2D hide">
                    <td><?php echo $ULTIMATUM_Layer_Slider_slide_in; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][durationin]" value="<?php echo $slide['durationin']; ?>"></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td>
                    <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][easingin]">
                        <option value="linear" <?php if ($slide['easingin']=="linear") echo "selected='selected'"; ?>>Linear</option>
                        <option value="swing" <?php if ($slide['easingin']=="swing") echo "selected='selected'"; ?>>Swing</option>
                        <option value="easeInQuad" <?php if ($slide['easingin']=="easeInQuad") echo "selected='selected'"; ?>>easeInQuad</option>
                        <option value="easeOutQuad" <?php if ($slide['easingin']=="easeOutQuad") echo "selected='selected'"; ?>>easeOutQuad</option>
                        <option value="easeInCubic" <?php if ($slide['easingin']=="easeInCubic") echo "selected='selected'"; ?>>easeInCubic</option>
                        <option value="easeOutCubic" <?php if ($slide['easingin']=="easeOutCubic") echo "selected='selected'"; ?>>easeOutCubic</option>
                        <option value="easeInOutCubic" <?php if ($slide['easingin']=="easeInOutCubic") echo "selected='selected'"; ?>>easeInOutCubic</option>
                        <option value="easeInQuart" <?php if ($slide['easingin']=="easeInQuart") echo "selected='selected'"; ?>>easeInQuart</option>
                        <option value="easeOutCuart" <?php if ($slide['easingin']=="easeOutCuart") echo "selected='selected'"; ?>>easeOutCuart</option>
                        <option value="easeInOutCuard" <?php if ($slide['easingin']=="easeInOutCuard") echo "selected='selected'"; ?>>easeInOutCuard</option>
                        <option value="easeInQuint" <?php if ($slide['easingin']=="easeInQuint") echo "selected='selected'"; ?>>easeInQuint</option>
                        <option value="easeOutQuint" <?php if ($slide['easingin']=="easeOutQuint") echo "selected='selected'"; ?>>easeOutQuint</option>
                        <option value="easeInOutQuint" <?php if ($slide['easingin']=="easeInOutQuint") echo "selected='selected'"; ?>>easeInOutQuint</option>
                        <option value="easeInSine" <?php if ($slide['easingin']=="easeInSine") echo "selected='selected'"; ?>>easeInSine</option>
                        <option value="easeOutSine" <?php if ($slide['easingin']=="easeOutSine") echo "selected='selected'"; ?>>easeOutSine</option>
                        <option value="easeInOutSine" <?php if ($slide['easingin']=="easeInOutSine") echo "selected='selected'"; ?>>easeInOutSine</option>
                        <option value="easeInExpo" <?php if ($slide['easingin']=="easeInExpo") echo "selected='selected'"; ?>>easeInExpo</option>
                        <option value="easeOutExpo" <?php if ($slide['easingin']=="easeOutExpo") echo "selected='selected'"; ?>>easeOutExpo</option>
                        <option value="easeInOutExpo" <?php if ($slide['easingin']=="easeInOutExpo") echo "selected='selected'"; ?>>easeInOutExpo</option>
                        <option value="easeInCirc" <?php if ($slide['easingin']=="easeInCirc") echo "selected='selected'"; ?>>easeInCirc</option>
                        <option value="easeOutCirc" <?php if ($slide['easingin']=="easeOutCirc") echo "selected='selected'"; ?>>easeOutCirc</option>
                        <option value="easeInOutCirc" <?php if ($slide['easingin']=="easeInOutCirc") echo "selected='selected'"; ?>>easeInOutCirc</option>
                        <option value="easeInElastic" <?php if ($slide['easingin']=="easeInElastic") echo "selected='selected'"; ?>>easeInElastic</option>
                        <option value="easeOutElastic" <?php if ($slide['easingin']=="easeOutElastic") echo "selected='selected'"; ?>>easeOutElastic</option>
                        <option value="easeInOutElastic" <?php if ($slide['easingin']=="easeInOutElastic") echo "selected='selected'"; ?>>easeInOutElastic</option>
                        <option value="easeInBack" <?php if ($slide['easingin']=="easeInBack") echo "selected='selected'"; ?>>easeInBack</option>
                        <option value="easeOutBack" <?php if ($slide['easingin']=="easeOutBack") echo "selected='selected'"; ?>>easeOutBack</option>
                        <option value="easeInOutBack" <?php if ($slide['easingin']=="easeInOutBack") echo "selected='selected'"; ?>>easeInOutBack</option>
                        <option value="easeInBounce" <?php if ($slide['easingin']=="easeInBounce") echo "selected='selected'"; ?>>easeInBounce</option>
                        <option value="easeOutBounce" <?php if ($slide['easingin']=="easeOutBounce") echo "selected='selected'"; ?>>easeOutBounce</option>
                        <option value="easeInOutBounce" <?php if ($slide['easingin']=="easeInOutBounce") echo "selected='selected'"; ?>>easeInOutBounce</option>
                      </select></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_in; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][delayin]" value="<?php echo $slide['delayin']; ?>"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="2D hide">
                    <td><?php echo $ULTIMATUM_Layer_Slider_slide_out; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][durationout]" value="<?php echo $slide['durationout']; ?>"></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td>
                    <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][easingout]">
                        <option value="linear" <?php if ($slide['easingout']=="linear") echo "selected='selected'"; ?>>Linear</option>
                        <option value="swing" <?php if ($slide['easingout']=="swing") echo "selected='selected'"; ?>>Swing</option>
                        <option value="easeInQuad" <?php if ($slide['easingout']=="easeInQuad") echo "selected='selected'"; ?>>easeInQuad</option>
                        <option value="easeOutQuad" <?php if ($slide['easingout']=="easeOutQuad") echo "selected='selected'"; ?>>easeOutQuad</option>
                        <option value="easeInCubic" <?php if ($slide['easingout']=="easeInCubic") echo "selected='selected'"; ?>>easeInCubic</option>
                        <option value="easeOutCubic" <?php if ($slide['easingout']=="easeOutCubic") echo "selected='selected'"; ?>>easeOutCubic</option>
                        <option value="easeInOutCubic" <?php if ($slide['easingout']=="easeInOutCubic") echo "selected='selected'"; ?>>easeInOutCubic</option>
                        <option value="easeInQuart" <?php if ($slide['easingout']=="easeInQuart") echo "selected='selected'"; ?>>easeInQuart</option>
                        <option value="easeOutCuart" <?php if ($slide['easingout']=="easeOutCuart") echo "selected='selected'"; ?>>easeOutCuart</option>
                        <option value="easeInOutCuard" <?php if ($slide['easingout']=="easeInOutCuard") echo "selected='selected'"; ?>>easeInOutCuard</option>
                        <option value="easeInQuint" <?php if ($slide['easingout']=="easeInQuint") echo "selected='selected'"; ?>>easeInQuint</option>
                        <option value="easeOutQuint" <?php if ($slide['easingout']=="easeOutQuint") echo "selected='selected'"; ?>>easeOutQuint</option>
                        <option value="easeInOutQuint" <?php if ($slide['easingout']=="easeInOutQuint") echo "selected='selected'"; ?>>easeInOutQuint</option>
                        <option value="easeInSine" <?php if ($slide['easingout']=="easeInSine") echo "selected='selected'"; ?>>easeInSine</option>
                        <option value="easeOutSine" <?php if ($slide['easingout']=="easeOutSine") echo "selected='selected'"; ?>>easeOutSine</option>
                        <option value="easeInOutSine" <?php if ($slide['easingout']=="easeInOutSine") echo "selected='selected'"; ?>>easeInOutSine</option>
                        <option value="easeInExpo" <?php if ($slide['easingout']=="easeInExpo") echo "selected='selected'"; ?>>easeInExpo</option>
                        <option value="easeOutExpo" <?php if ($slide['easingout']=="easeOutExpo") echo "selected='selected'"; ?>>easeOutExpo</option>
                        <option value="easeInOutExpo" <?php if ($slide['easingout']=="easeInOutExpo") echo "selected='selected'"; ?>>easeInOutExpo</option>
                        <option value="easeInCirc" <?php if ($slide['easingout']=="easeInCirc") echo "selected='selected'"; ?>>easeInCirc</option>
                        <option value="easeOutCirc" <?php if ($slide['easingout']=="easeOutCirc") echo "selected='selected'"; ?>>easeOutCirc</option>
                        <option value="easeInOutCirc" <?php if ($slide['easingout']=="easeInOutCirc") echo "selected='selected'"; ?>>easeInOutCirc</option>
                        <option value="easeInElastic" <?php if ($slide['easingout']=="easeInElastic") echo "selected='selected'"; ?>>easeInElastic</option>
                        <option value="easeOutElastic" <?php if ($slide['easingout']=="easeOutElastic") echo "selected='selected'"; ?>>easeOutElastic</option>
                        <option value="easeInOutElastic" <?php if ($slide['easingout']=="easeInOutElastic") echo "selected='selected'"; ?>>easeInOutElastic</option>
                        <option value="easeInBack" <?php if ($slide['easingout']=="easeInBack") echo "selected='selected'"; ?>>easeInBack</option>
                        <option value="easeOutBack" <?php if ($slide['easingout']=="easeOutBack") echo "selected='selected'"; ?>>easeOutBack</option>
                        <option value="easeInOutBack" <?php if ($slide['easingout']=="easeInOutBack") echo "selected='selected'"; ?>>easeInOutBack</option>
                        <option value="easeInBounce" <?php if ($slide['easingout']=="easeInBounce") echo "selected='selected'"; ?>>easeInBounce</option>
                        <option value="easeOutBounce" <?php if ($slide['easingout']=="easeOutBounce") echo "selected='selected'"; ?>>easeOutBounce</option>
                        <option value="easeInOutBounce" <?php if ($slide['easingout']=="easeInOutBounce") echo "selected='selected'"; ?>>easeInOutBounce</option>
                      </select></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_out; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][delayout]" value="<?php echo $slide['delayout']; ?>"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td><?php echo $ULTIMATUM_Layer_Slider_link_this_slide; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_url; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layer_link]" value="<?php echo $slide['layer_link']; ?>"/></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_target; ?></td>
                    <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layer_link_target]">
                        <option value="_self" <?php if ($slide['layer_link_target']=="_self") echo "selected='selected'"; ?>>_self</option>
                        <option value="_blank" <?php if ($slide['layer_link_target']=="_blank") echo "selected='selected'"; ?>>_blank</option>
                        <option value="_parent" <?php if ($slide['layer_link_target']=="_parent") echo "selected='selected'"; ?>>_parent</option>
                        <option value="_top" <?php if ($slide['layer_link_target']=="_top") echo "selected='selected'"; ?>>_top</option>
                      </select></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td>
                    <td></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][id]" value="<?php echo $slide['id']; ?>"/></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_deeplink; ?></td>
                    <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][deeplink]" value="<?php echo $slide['deeplink']; ?>"/></td>
                    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td>
                    <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][skip]" <?php if (isset($slide['skip'])) echo 'checked="checked"'; ?>></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
              <table>
                <thead>
                  <tr>
                    <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_preview; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td colSpan="12"><div class="ls-preview-wrapper" style="width: 600px;">
                        <div class="ls-preview" style="width: 600px; height: 300px; background-color: transparent; background-image: none; display: block;">
                          <div class="draggable ls-layer"></div>
                        </div>
                        <div class="ls-real-time-preview" style="display: none;"></div>
                        <button class="button ls-preview-button"><?php echo $ULTIMATUM_Layer_Slider_enter_preview; ?></button>
                      </div></td>
                  </tr>
                </tbody>
                <thead>
                  <tr>
                    <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_layers; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td colSpan="12"><div id="layers_wrap">
                        <h1 class="section_heading"><i class="icon-th-large"></i> Layers</h1>
                        <div id="tab_layers">
                          <ul class="nav">
                            <?php $layer_row = 0; ?>
                            <?php foreach ($slide['layers'] as $layer) { ?>
                            <li class="layer"><a href="#tab_layer<?php echo $layer_row; ?>" <?php if ($layer_row==0) { ?> class="current" <? } ?>><?php echo $ULTIMATUM_Layer_Slider_layer; ?> <?php echo $layer_row+1; ?></a><i class="icon-remove" onclick="deleteLayer(<?php echo $module_row; ?>, <?php echo $slide_row; ?>, <?php echo $layer_row; ?>)"></i></li>
                            <?php $layer_row++; } ?>
                            <li class="new_layer"><a class="new_layer" onclick="addLayer();"><?php echo $ULTIMATUM_Layer_Slider_add_new_layer; ?></a></li>
                          </ul>
                          <div class="clear"></div>
                        </div>
                        <?php $layer_row = 0; ?>
                        <?php foreach ($slide['layers'] as $layer) { ?>
                        <div id="tab_layer<?php echo $layer_row; ?>" class="tab_layer <?php if ($layer_row>0) echo ' hide'; ?>">
                          <table>
                            <thead>
                              <tr>
                                <td colSpan="12">Basic</td>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
							    <td class="title">Insert image</td>
                                <td><i class="icon-remove"></i>
                                  <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][image]" value="<?php echo $layer['image']; ?>" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>layers<?php echo $layer_row; ?>image"/>
                                  <img src="<?php $image=HTTP_IMAGE; if ($layer['image']!="") $image.=$layer['image']; else $image.="no_image.jpg"; echo $image; ?>"  onclick="image_upload('ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>layers<?php echo $layer_row; ?>image', 'thumb-icon');">
								 </td>
                                <td>Insert custom HTML</td>
                                <td colSpan="8">
                                <textarea name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][html]" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>layers<?php echo $layer_row; ?>html_input" class="layer-small-tab-input"><?php echo $layer['html']; ?></textarea>
                                
                                </td>
                                <td></td>
                              </tr>
                            </tbody>
                            <thead>
                              <tr>
                                <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_options; ?></td>
                              </tr>
                            </thead>
                            <tbody >
                              <tr>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_transition_in; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td>
                                <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][slidedirection]">
                                    <option value="fade" <?php if ($layer['slidedirection']=="fade") echo "selected='selected'"; ?>>Fade</option>
                                    <option value="auto" <?php if ($layer['slidedirection']=="auto") echo "selected='selected'"; ?>>Auto (Slide from auto direction)</option>
                                    <option value="top" <?php if ($layer['slidedirection']=="top") echo "selected='selected'"; ?>>Top (Slide from top)</option>
                                    <option value="right" <?php if ($layer['slidedirection']=="right") echo "selected='selected'"; ?>>Right (Slide from Right)</option>
                                    <option value="bottom" <?php if ($layer['slidedirection']=="bottom") echo "selected='selected'"; ?>>Bottom (Slide from Bottom)</option>
                                    <option value="left" <?php if ($layer['slidedirection']=="left") echo "selected='selected'"; ?>>Left (Slide from Left)</option>
                                  </select></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][durationin]" value="<?php echo $layer['durationin']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td>
                                <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][easingin]">
                                    <option value="linear" <?php if ($layer['easingin']=="linear") echo "selected='selected'"; ?>>Linear</option>
                                    <option value="swing" <?php if ($layer['easingin']=="swing") echo "selected='selected'"; ?>>Swing</option>
                                    <option value="easeInQuad" <?php if ($layer['easingin']=="easeInQuad") echo "selected='selected'"; ?>>easeInQuad</option>
                                    <option value="easeOutQuad" <?php if ($layer['easingin']=="easeOutQuad") echo "selected='selected'"; ?>>easeOutQuad</option>
                                    <option value="easeInCubic" <?php if ($layer['easingin']=="easeInCubic") echo "selected='selected'"; ?>>easeInCubic</option>
                                    <option value="easeOutCubic" <?php if ($layer['easingin']=="easeOutCubic") echo "selected='selected'"; ?>>easeOutCubic</option>
                                    <option value="easeInOutCubic" <?php if ($layer['easingin']=="easeInOutCubic") echo "selected='selected'"; ?>>easeInOutCubic</option>
                                    <option value="easeInQuart" <?php if ($layer['easingin']=="easeInQuart") echo "selected='selected'"; ?>>easeInQuart</option>
                                    <option value="easeOutCuart" <?php if ($layer['easingin']=="easeOutCuart") echo "selected='selected'"; ?>>easeOutCuart</option>
                                    <option value="easeInOutCuard" <?php if ($layer['easingin']=="easeInOutCuard") echo "selected='selected'"; ?>>easeInOutCuard</option>
                                    <option value="easeInQuint" <?php if ($layer['easingin']=="easeInQuint") echo "selected='selected'"; ?>>easeInQuint</option>
                                    <option value="easeOutQuint" <?php if ($layer['easingin']=="easeOutQuint") echo "selected='selected'"; ?>>easeOutQuint</option>
                                    <option value="easeInOutQuint" <?php if ($layer['easingin']=="easeInOutQuint") echo "selected='selected'"; ?>>easeInOutQuint</option>
                                    <option value="easeInSine" <?php if ($layer['easingin']=="easeInSine") echo "selected='selected'"; ?>>easeInSine</option>
                                    <option value="easeOutSine" <?php if ($layer['easingin']=="easeOutSine") echo "selected='selected'"; ?>>easeOutSine</option>
                                    <option value="easeInOutSine" <?php if ($layer['easingin']=="easeInOutSine") echo "selected='selected'"; ?>>easeInOutSine</option>
                                    <option value="easeInExpo" <?php if ($layer['easingin']=="easeInExpo") echo "selected='selected'"; ?>>easeInExpo</option>
                                    <option value="easeOutExpo" <?php if ($layer['easingin']=="easeOutExpo") echo "selected='selected'"; ?>>easeOutExpo</option>
                                    <option value="easeInOutExpo" <?php if ($layer['easingin']=="easeInOutExpo") echo "selected='selected'"; ?>>easeInOutExpo</option>
                                    <option value="easeInCirc" <?php if ($layer['easingin']=="easeInCirc") echo "selected='selected'"; ?>>easeInCirc</option>
                                    <option value="easeOutCirc" <?php if ($layer['easingin']=="easeOutCirc") echo "selected='selected'"; ?>>easeOutCirc</option>
                                    <option value="easeInOutCirc" <?php if ($layer['easingin']=="easeInOutCirc") echo "selected='selected'"; ?>>easeInOutCirc</option>
                                    <option value="easeInElastic" <?php if ($layer['easingin']=="easeInElastic") echo "selected='selected'"; ?>>easeInElastic</option>
                                    <option value="easeOutElastic" <?php if ($layer['easingin']=="easeOutElastic") echo "selected='selected'"; ?>>easeOutElastic</option>
                                    <option value="easeInOutElastic" <?php if ($layer['easingin']=="easeInOutElastic") echo "selected='selected'"; ?>>easeInOutElastic</option>
                                    <option value="easeInBack" <?php if ($layer['easingin']=="easeInBack") echo "selected='selected'"; ?>>easeInBack</option>
                                    <option value="easeOutBack" <?php if ($layer['easingin']=="easeOutBack") echo "selected='selected'"; ?>>easeOutBack</option>
                                    <option value="easeInOutBack" <?php if ($layer['easingin']=="easeInOutBack") echo "selected='selected'"; ?>>easeInOutBack</option>
                                    <option value="easeInBounce" <?php if ($layer['easingin']=="easeInBounce") echo "selected='selected'"; ?>>easeInBounce</option>
                                    <option value="easeOutBounce" <?php if ($layer['easingin']=="easeOutBounce") echo "selected='selected'"; ?>>easeOutBounce</option>
                                    <option value="easeInOutBounce" <?php if ($layer['easingin']=="easeInOutBounce") echo "selected='selected'"; ?>>easeInOutBounce</option>
                                  </select></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][delayin]" value="<?php echo $layer['delayin']; ?>"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_transition_out; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td>
                                <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][slideoutdirection]">
                                    <option value="fade" <?php if ($layer['slideoutdirection']=="fade") echo "selected='selected'"; ?>>Fade</option>
                                    <option value="auto" <?php if ($layer['slideoutdirection']=="auto") echo "selected='selected'"; ?>>Auto (Slide from auto direction)</option>
                                    <option value="top" <?php if ($layer['slideoutdirection']=="top") echo "selected='selected'"; ?>>Top (Slide from top)</option>
                                    <option value="right" <?php if ($layer['slideoutdirection']=="right") echo "selected='selected'"; ?>>Right (Slide from Right)</option>
                                    <option value="bottom" <?php if ($layer['slideoutdirection']=="bottom") echo "selected='selected'"; ?>>Bottom (Slide from Bottom)</option>
                                    <option value="left" <?php if ($layer['slideoutdirection']=="left") echo "selected='selected'"; ?>>Left (Slide from Left)</option>
                                  </select></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][durationout]" value="<?php echo $layer['durationout']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td>
                                <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][easingout]">
                                    <option value="linear" <?php if ($layer['easingout']=="linear") echo "selected='selected'"; ?>>Linear</option>
                                    <option value="swing" <?php if ($layer['easingout']=="swing") echo "selected='selected'"; ?>>Swing</option>
                                    <option value="easeInQuad" <?php if ($layer['easingout']=="easeInQuad") echo "selected='selected'"; ?>>easeInQuad</option>
                                    <option value="easeOutQuad" <?php if ($layer['easingout']=="easeOutQuad") echo "selected='selected'"; ?>>easeOutQuad</option>
                                    <option value="easeInCubic" <?php if ($layer['easingout']=="easeInCubic") echo "selected='selected'"; ?>>easeInCubic</option>
                                    <option value="easeOutCubic" <?php if ($layer['easingout']=="easeOutCubic") echo "selected='selected'"; ?>>easeOutCubic</option>
                                    <option value="easeInOutCubic" <?php if ($layer['easingout']=="easeInOutCubic") echo "selected='selected'"; ?>>easeInOutCubic</option>
                                    <option value="easeInQuart" <?php if ($layer['easingout']=="easeInQuart") echo "selected='selected'"; ?>>easeInQuart</option>
                                    <option value="easeOutCuart" <?php if ($layer['easingout']=="easeOutCuart") echo "selected='selected'"; ?>>easeOutCuart</option>
                                    <option value="easeInOutCuard" <?php if ($layer['easingout']=="easeInOutCuard") echo "selected='selected'"; ?>>easeInOutCuard</option>
                                    <option value="easeInQuint" <?php if ($layer['easingout']=="easeInQuint") echo "selected='selected'"; ?>>easeInQuint</option>
                                    <option value="easeOutQuint" <?php if ($layer['easingout']=="easeOutQuint") echo "selected='selected'"; ?>>easeOutQuint</option>
                                    <option value="easeInOutQuint" <?php if ($layer['easingout']=="easeInOutQuint") echo "selected='selected'"; ?>>easeInOutQuint</option>
                                    <option value="easeInSine" <?php if ($layer['easingout']=="easeInSine") echo "selected='selected'"; ?>>easeInSine</option>
                                    <option value="easeOutSine" <?php if ($layer['easingout']=="easeOutSine") echo "selected='selected'"; ?>>easeOutSine</option>
                                    <option value="easeInOutSine" <?php if ($layer['easingout']=="easeInOutSine") echo "selected='selected'"; ?>>easeInOutSine</option>
                                    <option value="easeInExpo" <?php if ($layer['easingout']=="easeInExpo") echo "selected='selected'"; ?>>easeInExpo</option>
                                    <option value="easeOutExpo" <?php if ($layer['easingout']=="easeOutExpo") echo "selected='selected'"; ?>>easeOutExpo</option>
                                    <option value="easeInOutExpo" <?php if ($layer['easingout']=="easeInOutExpo") echo "selected='selected'"; ?>>easeInOutExpo</option>
                                    <option value="easeInCirc" <?php if ($layer['easingout']=="easeInCirc") echo "selected='selected'"; ?>>easeInCirc</option>
                                    <option value="easeOutCirc" <?php if ($layer['easingout']=="easeOutCirc") echo "selected='selected'"; ?>>easeOutCirc</option>
                                    <option value="easeInOutCirc" <?php if ($layer['easingout']=="easeInOutCirc") echo "selected='selected'"; ?>>easeInOutCirc</option>
                                    <option value="easeInElastic" <?php if ($layer['easingout']=="easeInElastic") echo "selected='selected'"; ?>>easeInElastic</option>
                                    <option value="easeOutElastic" <?php if ($layer['easingout']=="easeOutElastic") echo "selected='selected'"; ?>>easeOutElastic</option>
                                    <option value="easeInOutElastic" <?php if ($layer['easingout']=="easeInOutElastic") echo "selected='selected'"; ?>>easeInOutElastic</option>
                                    <option value="easeInBack" <?php if ($layer['easingout']=="easeInBack") echo "selected='selected'"; ?>>easeInBack</option>
                                    <option value="easeOutBack" <?php if ($layer['easingout']=="easeOutBack") echo "selected='selected'"; ?>>easeOutBack</option>
                                    <option value="easeInOutBack" <?php if ($layer['easingout']=="easeInOutBack") echo "selected='selected'"; ?>>easeInOutBack</option>
                                    <option value="easeInBounce" <?php if ($layer['easingout']=="easeInBounce") echo "selected='selected'"; ?>>easeInBounce</option>
                                    <option value="easeOutBounce" <?php if ($layer['easingout']=="easeOutBounce") echo "selected='selected'"; ?>>easeOutBounce</option>
                                    <option value="easeInOutBounce" <?php if ($layer['easingout']=="easeInOutBounce") echo "selected='selected'"; ?>>easeInOutBounce</option>
                                  </select></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][delayout]" value="<?php echo $layer['delayout']; ?>"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_other_options; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_distance; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][level]" value="<?php echo $layer['level']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_show_until; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][showuntil]" value="<?php echo $layer['showuntil']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td>
                                <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][skip]" <?php if (isset($layer['skip'])) echo 'checked="checked"'; ?>></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                            </tbody>
                            <thead>
                              <tr>
                                <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_link; ?></td>
                              </tr>
                            </thead>
                            <tbody >
                              <tr>
                                <td></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_url; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][url]" value="<?php echo $layer['url']; ?>"/></td>
                                <td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][target]">
                                    <option value="_self" <?php if ($layer['target']=="_self") echo "selected='selected'"; ?>>_self</option>
                                    <option value="_blank" <?php if ($layer['target']=="_blank") echo "selected='selected'"; ?>>_blank</option>
                                    <option value="_parent" <?php if ($layer['target']=="_parent") echo "selected='selected'"; ?>>_parent</option>
                                    <option value="_top" <?php if ($layer['target']=="_top") echo "selected='selected'"; ?>>_top</option>
                                  </select></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                            </tbody>
                            <thead>
                              <tr>
                                <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_style; ?></td>
                              </tr>
                            </thead>
                            <tbody >
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_layout_positions; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][width]" value="<?php echo $layer['width']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][height]" value="<?php echo $layer['height']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][top]" value="<?php echo $layer['top']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][left]" value="<?php echo $layer['left']; ?>"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr >
                                <td><?php echo $ULTIMATUM_Layer_Slider_padding; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][padding-top]" value="<?php echo $layer['padding-top']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][padding-right]" value="<?php echo $layer['padding-right']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][padding-bottom]" value="<?php echo $layer['padding-bottom']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][padding-left]" value="<?php echo $layer['padding-left']; ?>"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_border; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][border-top]" value="<?php echo $layer['border-top']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][border-right]" value="<?php echo $layer['border-right']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][border-bottom]" value="<?php echo $layer['border-bottom']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][border-left]" value="<?php echo $layer['border-left']; ?>"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_font; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_family; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][font-family]" value="<?php echo $layer['font-family']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_size; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][font-size]" value="<?php echo $layer['font-size']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_line_height; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][line-height]" value="<?php echo $layer['line-height']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_color; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][color]" value="<?php echo $layer['color']; ?>"  class"ls-colorpicker color"/></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td>
                                <td><i class="icon-remove"></i>
                                  <input type="hidden" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][background]" value="<?php echo $layer['background']; ?>" id="ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>layers<?php echo $layer_row; ?>background"/>
                                  <img src="<?php $image=HTTP_IMAGE; if ($layer['background']!="") $image.=$layer['background']; else $image.="no_image.jpg"; echo $image; ?>"  onclick="image_upload('ULTIMATUMLayerSlider_module<?php echo $module_row; ?>slides<?php echo $slide_row; ?>layers<?php echo $layer_row; ?>background', 'thumb-icon');"></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_rounded_corners; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][border-radius]" value="<?php echo $layer['border-radius']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_word_wrap; ?></td>
                                <td><input type="checkbox" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][wordwrap]" <?php if (isset($layer['wordwrap'])) echo 'checked="checked"'; ?>></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_custom_style; ?></td>
                                <td colSpan="10"><textarea name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][style]"><?php echo $layer['style']; ?></textarea></td>
                                <td></td>
                              </tr>
                            </tbody>
                            <thead>
                              <tr>
                                <td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td>
                                <td></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][id]" value="<?php echo $layer['id']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_classes; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][class]" value="<?php echo $layer['class']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_title; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][title]" value="<?php echo $layer['title']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_alt; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][alt]" value="<?php echo $layer['alt']; ?>"/></td>
                                <td class="title"><?php echo $ULTIMATUM_Layer_Slider_rel; ?></td>
                                <td><input type="text" name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][slides][<?php echo $slide_row; ?>][layers][<?php echo $layer_row; ?>][rel]" value="<?php echo $layer['rel']; ?>"/></td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <?php $layer_row++; } ?>
                        <div class="info2"></div>
                      </div></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <?php $slide_row++; } ?>
            <div class="info"></div>
          </div>
          <?php $module_row++; } ?>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">

var module_row = <?php echo $module_row; ?>;
var module_current = 0;
var slide_row = new Array(); for(i=0;i<100;i++) slide_row[i]=1; var slide_current = new Array(); for(i=0;i<100;i++) slide_current[i]=0;
var layer_row = new Array(); for(i=0;i<100;i++) {layer_row[i] = new Array(); for(j=0;j<100;j++) layer_row[i][j]=1; } var layer_current = new Array(); for(i=0;i<100;i++) {layer_current[i] = new Array(); for(j=0;j<100;j++) layer_current[i][j]=0;}
var lsTrImgPath='<?php echo HTTP_SERVER . "view/image/ULTIMATUMLayerSlider/img/"; ?>';
var lsTrSkinPath='<?php echo HTTP_SERVER . "view/image/ULTIMATUMLayerSlider/skins/"; ?>';
var uploadPath='<?php echo HTTP_CATALOG; ?>image/';
var button_preview_on='<?php echo $ULTIMATUM_Layer_Slider_enter_preview; ?>';
var button_preview_off='<?php echo $ULTIMATUM_Layer_Slider_exit_preview; ?>';
<?php $module_row = 0; ?>
<?php foreach ($modules as $module) { ?>
slide_row[<?php echo $module_row; ?>]=<?php echo count($module['slides']); ?>;
slide_current[<?php echo $module_row; ?>]=0;
<?php $slide_row = 0; ?>
<?php foreach ($module['slides'] as $slide) { ?>
layer_row[<?php echo $module_row; ?>][<?php echo $slide_row; ?>]=<?php echo count($slide['layers']); ?>;
layer_current[<?php echo $module_row; ?>][<?php echo $slide_row; ?>]=0;
<?php $slide_row++; } ?>
<?php $module_row++; } ?>
$("#all_sliders input[type='text'], #all_sliders textarea").live("keyup", function() {
	LayerSlider.generatePreview();
	LayerSlider.stop();
});



		$('#all_sliders #tab_modules>ul>li.module>a').live("click", function(event){
			event.preventDefault();
			$("#all_sliders #tab_modules>ul>li>a").removeClass("current");
			$(this).addClass("current");
			$('#all_sliders div.tab_module').addClass("hide");
			var num=$(this).attr("href");
			$('#all_sliders div'+num).removeClass("hide");
			module_current=num.replace("#tab_module", "");
			LayerSlider.generatePreview();
			LayerSlider.stop();
		});
		$('#all_sliders .tab_module #tab_slides>ul>li.slide>a').live("click", function(event){
			event.preventDefault();
			$(this).parent().parent().find('a').removeClass("current");
			$(this).addClass("current");
			$('#all_sliders #tab_module'+module_current+' div.tab_slide').addClass("hide");
			var num=$(this).attr("href"); 
			$('#all_sliders #tab_module'+module_current+' div'+num).removeClass("hide");
			slide_current[module_current]=num.replace("#tab_slide", "");
			LayerSlider.generatePreview();
			LayerSlider.stop();
		});
		$('#all_sliders .tab_module .tab_slide #tab_layers>ul>li.layer>a').live("click", function(event){
			event.preventDefault();
			$(this).parent().parent().find('a').removeClass("current");
			$(this).addClass("current");
			$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' div.tab_layer').addClass("hide");
			var num=$(this).attr("href"); 
			$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' div'+num).removeClass("hide");
			layer_current[module_current][slide_current[module_current]]=num.replace("#tab_layer", "");
			LayerSlider.generatePreview();
			LayerSlider.stop();
		});
		$('#all_sliders thead').live("click", function(event){
			event.preventDefault();
			if ($(this).next().hasClass("hide")) $(this).next().removeClass("hide");
			else $(this).next().addClass("hide");
		});
		$('#all_sliders td>i').live("click", function(event){
			event.preventDefault();
			$(this).next().val("");
			$(this).next().next().attr("src", uploadPath+"no_image.jpg");
		});
		$('#all_sliders td>i.right').live("click", function(event){
			event.preventDefault();
			$(this).next().val("");
			$(this).next().next().val("");
			$(this).next().next().attr("src", '');
		});

function deleteModule(num) {
	$('#all_sliders div#tab_module'+num).remove();
	$("#all_sliders #tab_modules>ul>li>a[href='#tab_module"+num+"']").parent().remove();
	var rem=$("#all_sliders #tab_modules>ul>li").index();
	for(i=0;i<rem;i++) $("#all_sliders #tab_modules>ul>li>a:eq("+i+")").text("<?php echo $ULTIMATUM_Layer_Slider_module; ?> "+(i+1));
	if (rem>0) {
		var fm=$("#all_sliders #tab_modules>ul>li>a:eq(0)");
		$("#all_sliders #tab_modules>ul>li>a").removeClass("current");
		$(fm).addClass("current");
		$('#all_sliders div.tab_module').addClass("hide");
		num=$(fm).attr("href");
		$('#all_sliders div'+num).removeClass("hide");
		module_current=num.replace("#tab_module", "");
		LayerSlider.generatePreview();
		LayerSlider.stop();
	}
}
function deleteSlide(numModule, numSlide) {
	$('#all_sliders div#tab_module'+numModule+' div#tab_slide'+numSlide).remove();
	$("#all_sliders div#tab_module"+numModule+" #tab_slides>ul>li>a[href='#tab_slide"+numSlide+"']").parent().remove();
	var rem=$("#all_sliders div#tab_module"+numModule+" #tab_slides>ul>li").index();
	for(i=0;i<rem;i++) $("#all_sliders div#tab_module"+numModule+" #tab_slides>ul>li>a:eq("+i+")").text("<?php echo $ULTIMATUM_Layer_Slider_slide; ?> "+(i+1));
	if (rem>0) {
		var fs=$("#all_sliders div#tab_module"+numModule+" #tab_slides>ul>li>a:eq(0)");
		$(fs).parent().parent().find('a').removeClass("current");
		$(fs).addClass("current");
		$('#all_sliders #tab_module'+module_current+' div.tab_slide').addClass("hide");
		numSlide=$(fs).attr("href"); 
		$('#all_sliders #tab_module'+module_current+' div'+numSlide).removeClass("hide");
		slide_current[module_current]=numSlide.replace("#tab_slide", "");
		LayerSlider.generatePreview();
		LayerSlider.stop();
	}
}
function deleteLayer(numModule, numSlide, numLayer) {
	$('#all_sliders div#tab_module'+numModule+' div#tab_slide'+numSlide+' div#tab_layer'+numLayer).remove();
	$("#all_sliders div#tab_module"+numModule+' div#tab_slide'+numSlide+" #tab_layers>ul>li>a[href='#tab_layer"+numLayer+"']").parent().remove();
	var rem=$("#all_sliders div#tab_module"+numModule+' div#tab_slide'+numSlide+" #tab_layers>ul>li").index();
	for(i=0;i<rem;i++) $("#all_sliders div#tab_module"+numModule+" div#tab_slide"+numSlide+" #tab_layers>ul>li>a:eq("+i+")").text("<?php echo $ULTIMATUM_Layer_Slider_layer; ?> "+(i+1));
	if (rem>0) {
		var fs=$("#all_sliders div#tab_module"+numModule+" div#tab_slide"+numSlide+" #tab_layers>ul>li>a:eq(0)");
		$(fs).parent().parent().find('a').removeClass("current");
		$(fs).addClass("current");
		$('#all_sliders #tab_module'+module_current+' div#tab_slide'+numSlide+' div.tab_layer').addClass("hide");
		numLayer=$(fs).attr("href"); 
		$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' div'+numLayer).removeClass("hide");
		layer_current[module_current][slide_current[module_current]]=numLayer.replace("#tab_layer", "");
		LayerSlider.generatePreview();
		LayerSlider.stop();
	}
}
function addLayer() {
	var html;
	$("#all_sliders #tab_module"+module_current+" #tab_slide"+slide_current[module_current]+" #tab_layers>ul>li>a").removeClass("current");
	$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' div.tab_layer').addClass("hide");
	html = '<li class="layer"><a href="#tab_layer' + layer_row[module_current][slide_current[module_current]] + '" class="current"><?php echo $ULTIMATUM_Layer_Slider_layer; ?> ' + (layer_row[module_current][slide_current[module_current]]+1) + '</a><i class="icon-remove" onclick="deleteLayer('+module_current+', '+slide_current[module_current]+', '+layer_row[module_current][slide_current[module_current]]+')"></i></li>';
	$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' ul li.new_layer').before(html);
	html = '<div id="tab_layer'+layer_row[module_current][slide_current[module_current]] + '" class="tab_layer">';
	html += '<table><thead><tr><td colSpan="12">Basic</td></tr></thead><tbody><tr>';	
	html += '<td class="title">Insert image</td><td><i>x</i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][image]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_current[module_current]+'layers'+layer_row[module_current][slide_current[module_current]]+'image"/><img src="<?php $image=HTTP_IMAGE; $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_current[module_current]+'layers'+layer_row[module_current][slide_current[module_current]]+'image\', \'thumb-icon\');"></td>';
	html += '<td>Insert custom HTML</td><td colSpan="10"><textarea name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][html]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_options; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_transition_in; ?></td><td></td><td  class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][slidedirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td  class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][durationin]" value="1500"/></td>';
	html += '<td  class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][easingin]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td  class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][delayin]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_transition_out; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][slideoutdirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][durationout]" value="1500"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][easingout]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][delayout]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td class="title"><?php echo $ULTIMATUM_Layer_Slider_other_options; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_distance; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][level]" value="-1"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_show_until; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][showuntil]" value="0"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][skip]"></td><td></td><td></td><td></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12" ><?php echo $ULTIMATUM_Layer_Slider_link; ?></td></tr></thead><tbody><tr>';
	html += '<td></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_url; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][url]" value=""/></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][target]"><option value="_self" selected="selected">_self</option><option value="_blank">_blank</option><option value="_parent">_parent</option><option value="_top">_top</option></select></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>';				
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_style; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_layout_positions; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][width]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][height]" value="" /></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_padding; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][padding-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][padding-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][padding-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][padding-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_border; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][border-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][border-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][border-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][border-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_font; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_family; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][font-family]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_size; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][font-size]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_line_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][line-height]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_color; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][color]" value=""/></td><td></td><td></td></tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][background]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_current[module_current]+'layers'+layer_row[module_current][slide_current[module_current]]+'background"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_current[module_current]+'layers'+layer_row[module_current][slide_current[module_current]]+'background\', \'thumb-icon\')"></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rounded_corners; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][border-radius]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_word_wrap; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][wordwrap]"></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_custom_style; ?></td><td colSpan="10"><textarea name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][style]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][id]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_classes; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][class]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_title; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][title]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_alt; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][alt]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rel; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+layer_row[module_current][slide_current[module_current]]+'][rel]" value=""/></td></tr></tbody>';				
	html += '</table></div>';
	
	$('#all_sliders #tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .info2').before(html);
	
	layer_current[module_current][slide_current[module_current]]=layer_row[module_current][slide_current[module_current]];

	layer_row[module_current][slide_current[module_current]]++;
	
	$(":checkbox:not(.noreplace)").customCheckbox();
	LayerSlider.generatePreview();
	LayerSlider.stop();
}
function addSlide() {
	var html;
	$("#all_sliders #tab_module"+module_current+" #tab_slides>ul>li>a").removeClass("current");
	$('#all_sliders #tab_module'+module_current+' div.tab_slide').addClass("hide");
	html = '<li class="slide"><a href="#tab_slide' + slide_row[module_current] + '" class="current"><?php echo $ULTIMATUM_Layer_Slider_slide; ?> ' + (slide_row[module_current]+1) + '</a><i class="icon-remove" onclick="deleteSlide('+module_current+', 0)"></i></li>';
	$('#all_sliders #tab_module'+module_current+' ul li.new_slide').before(html);
	html = '<div id="tab_slide'+ slide_row[module_current] +'" class="tab_slide">';
	html += '<table><thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][background]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'background"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'background\', \'thumb-icon\');"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumbnail; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][thumbnail]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'thumbnail"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'thumbnail\', \'thumb-icon\');"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_slide_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][slidedelay]" value="4000"/></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_slide_transition; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_use_3d_2d; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][new_transitions]" checked="checked"></td>';
	html += '<td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_transitions; ?></td><td class="3D"><button class="button ls-select-transitions new"><?php echo $ULTIMATUM_Layer_Slider_select_transitions; ?></button><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][3d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][2d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][custom_3d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][custom_2d_transitions]" value=""></td>';
	html += '<td class="2D hide title"><?php echo $ULTIMATUM_Layer_Slider_direction; ?></td><td class="2D hide"><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][slidedirection]"><option value="top">top</option><option value="right" selected="selected">right</option><option value="bottom">bottom</option><option value="left">left</option></select></td>';		  
	html += '<td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_time_shift; ?></td><td class="3D"><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][timeshift]" value="0"/></td><td class="2D"></td><td class="2D"></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr class="2D hide">';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_in; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][durationin]" value="1500"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][easingin]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutQuint">easeOutQuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_in; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][delayin]" value="0" ></td><td></td><td></td><td></td><td></td></tr>';	
	html += '<tr class="2D hide">';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_out; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][durationout]" value="1500"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][easingout]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutQuint">easeOutQuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_out; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][delayout]" value="0"></td><td></td><td></td><td></td><td></td></tr>';	
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_link_this_slide; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_url; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layer_link]" value=""/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_target; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layer_link_target]"><option value="_self" selected="selected";>_self</option><option value="_blank">_blank</option><option value="_parent">_parent</option><option value="_top">_top</option></select></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][id]" value=""/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_deeplink; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][deeplink]" value="" /></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][skip]"></td><td></td><td></td><td></td><td></td></tr>';	  
	html += '</tbody><thead><tr><td colSpan="12">Preview</td></tr></thead><tbody><tr><td colSpan="12">';
	html += '<div class="ls-preview-wrapper" style="width: 600px;"><div class="ls-preview" style="width: 600px; height: 300px; background-color: transparent; background-image: none; display: block;"><div class="draggable ls-layer"></div></div><div class="ls-real-time-preview" style="display: none;"></div><button class="button ls-preview-button">Enter Preview</button></div></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12">Layers</td></tr></thead><tbody><tr><td colSpan="12">';
	html += '<div id="layers_wrap"><div id="tab_layers"><h1 class="section_heading"><i class="icon-th-large"></i> Layer Settings</h1><ul class="nav">';
	html += '<li class="layer"><a href="#tab_layer0" class="current"><?php echo $ULTIMATUM_Layer_Slider_layer; ?> 1</a><i class="icon-remove" onclick="deleteLayer('+module_current+', '+slide_row[module_current]+', 0)"></i></li>';
	html += '<li class="new_layer"><a class="new_layer" onclick="addLayer();"><?php echo $ULTIMATUM_Layer_Slider_add_new_layer; ?></a></li>';
	html += '</ul><div class="clear"></div></div>';
	html += '<div id="tab_layer0" class="tab_layer">';
	html += '<table><thead><tr><td colSpan="12">Basic</td></tr></thead><tbody><tr>';	
	html += '<td class="title">Insert image</td><td><i>x</i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][image]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'layers0image"/><img src="<?php $image=HTTP_IMAGE; $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'layers0image\', \'thumb-icon\');"></td>';
	html += '<td>Insert custom HTML</td><td colSpan="8"><textarea name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][html]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_options; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_transition_in ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][slidedirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][durationin]" value="1500"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][easingin]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][delayin]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_transition_out; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][slideoutdirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][durationout]" value="1500"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][easingout]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][delayout]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td class="title"><?php echo $ULTIMATUM_Layer_Slider_other_options; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_distance; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][level]" value="-1"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_show_until; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][showuntil]" value="0"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][skip]" ></td><td></td><td></td><td></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_link; ?></td></tr></thead><tbody><tr>';
	html += '<td></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_url; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][url]" value=""/></td><td><select name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][target]"><option value="_self" selected="selected">_self</option><option value="_blank">_blank</option><option value="_parent">_parent</option><option value="_top">_top</option></select></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>';				
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_style; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_layout_positions; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][width]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][height]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_padding; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][padding-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][padding-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][padding-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][padding-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_border; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][border-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][border-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][border-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][border-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_font; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_family; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][font-family]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_size; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][font-size]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_line_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][line-height]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_color; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][color]" value=""/></td><td></td><td></td></tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][background]" value="" id="ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'layers0background"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_current+'slides'+slide_row[module_current]+'layers0background\', \'thumb-icon\')"></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rounded_corners; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][border-radius]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_word_wrap; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][wordwrap]"></td><td></td><td></td><td></td><td></td></tr>';	
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_custom_style; ?></td><td colSpan="10"><textarea name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][style]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][id]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_classes; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][class]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_title; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][title]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_alt; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][alt]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rel; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_row[module_current]+'][layers][0][rel]" value=""/></td></tr></tbody>';				
	html += '</table></div><div class="info2"></div></td></tr></tbody></table>';
	html += '</div>';
	$('#all_sliders #tab_module'+module_current+' .info').before(html);
	slide_current[module_current]=slide_row[module_current];
	slide_row[module_current]++;
	var rem=$("#all_sliders #tab_module"+module_current+" #tab_slides>ul>li").index();
	for(i=0;i<rem;i++) $("#all_sliders #tab_module"+module_current+" #tab_slides>ul>li>a:eq("+i+")").text("<?php echo $ULTIMATUM_Layer_Slider_slide; ?> "+(i+1));
	$(":checkbox:not(.noreplace)").customCheckbox();
	$("td.3D").removeClass("hide");	$("td.2D").addClass("hide"); $("tr.2D").addClass("hide");
	LayerSlider.generatePreview();
	LayerSlider.stop();
}

function addModule() {	
	var html;
	$("#all_sliders #tab_modules>ul>li>a").removeClass("current");
	$('#all_sliders div.tab_module').addClass("hide");
	html = '<li class="module"><a href="#tab_module' + module_row + '" class="current"></a><i class="icon-remove" onclick="deleteModule('+module_row+')"></i></li>';
	$('#all_sliders ul li.new_module').before(html);
	html = '<div id="tab_module' + module_row + '" class="tab_module"><h1 class="section_heading"><i class="icon-cogs"></i> Main Slider Settings</h1>';
	html += '<table><thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_basic; ?></td></tr></thead><tbody><tr>';
	html += '<td class="title"><?php echo $entry_layout; ?></td><td><select name="ULTIMATUMLayerSlider_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '<option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="title"><?php echo $entry_position;?></td><td><select name="ULTIMATUMLayerSlider_module[' + module_row + '][position]">';
	html += '      <option value="content_top_fullwidth">Content Top Fullwidth</option>';
	html += '    </select></td>';
	html += '    <td class="title"><?php echo $entry_status; ?></td><td><select name="ULTIMATUMLayerSlider_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="title"><?php echo $entry_sort_order; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module[' + module_row + '][sort_order]" value="" /></td>';
	html += '    <td class="title"><?php echo $entry_language; ?></td><td><select name="ULTIMATUMLayerSlider_module[<?php echo $module_row; ?>][language_id]">';
	<?php foreach ($languages as $language) { ?>
    html += '	  <option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>';
    <?php } ?>
	html += '    </select></td>';
	html += '    <tr><td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][width]" value="600"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][height]" value="300"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_responsive; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][responsive]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_full_width; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][forceresponsive]"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_responsive_under; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][responsiveunder]" value="0"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_layers_container; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][sublayercontainer]" value="0"/></td></tr></tbody>';
	html += '    <thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_slideshow; ?></td></tr></thead><tbody class="hide"><tr>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_autostart; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][autostart]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_pause_on_hover; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][pauseonhover]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_first_slide; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][firstlayer]" value="1"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_anim_first_slide; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][animatefirstlayer]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_random_slideshow; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][randomslideshow]"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_two_way_slideshow; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][twowayslideshow]" checked="checked"></td>';
	html += '	  </tr><tr>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_loops; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][loops]"><option value="0" selected="selected">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_force_loops; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][forceloopnum]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_auto_video; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][autoplayvideos]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_auto_pause; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][autopauseslideshow]"><option value="auto" selected="selected">auto</option><option value="disabled">disabled</option></select></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_youtube; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][youtubepreview]"><option value="maxresdefault.jpg">Maximum Quality</option><option value="hqdefault.jpg">High Quality</option><option value="mqdefault.jpg">Medium Quality</option><option value="default.jpg" selected="selected">Default Quality</option></select></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_keyboard; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][keynav]" checked="checked"></td>';
	html += '	  </tr><tr><td class="title"><?php echo $ULTIMATUM_Layer_Slider_touch; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][touchnav]" checked="checked"></td><td colSpan="5"></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>';
	html += '    <thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_appearance; ?></td></tr></thead><tbody class="hide"><tr>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_skin; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][skin]"><option value="fullwidth">fullwidth</option></select></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_color; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][transparent]" value="#606060"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][backgroundimage]" value="" id="ULTIMATUMLayerSlider_module'+module_row+'backgroundimage"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_row+'backgroundimage\', \'thumb-icon\');"></td>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_slider_style; ?></td><td colSpan="4"><textarea name="ULTIMATUMLayerSlider_module['+module_row+'][sliderstyle]"></textarea></td><td></td></tr></tbody>';
	html += '    <thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_navigation; ?></td></tr></thead><tbody class="hide"><tr>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_prev_next; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][navprevnext]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_start_stop; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][navstartstop]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_nav_buttons; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][navbuttons]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_prev_next_hover; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][hoverprevnext]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_nav_buttons_hover; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][hoverbottomnav]"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_nav; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_nav]"><option value="disabled">disabled</option><option value="hover" selected="selected">hover</option><option value="always">always</option></select></td>';
	html += '	  </tr><tr>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_width]" value="100"/></td>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_height]" value="60"/></td>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_container_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_container_width]" value="60%"/></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_active_opacity; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_active_opacity]" value="35"/></td>';
	html += '    <td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumb_inactive_opacity; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][thumb_inactive_opacity]" value="100"/></td><td></td><td></td></tr></tbody>';
	html += '    <thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_misc_yourlogo; ?></td></tr></thead><tbody class="hide"><tr>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_img_preload; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][imgpreload]" checked="checked"></td>';
	html += '	  <td class="title"><?php echo $ULTIMATUM_Layer_Slider_use_urls; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][relativeurls]"></td>';
	html += '    </tr></tbody>';
	html += '    <thead><tr><td colSpan="12" class="export-import"><?php echo $ULTIMATUM_Layer_Slider_import_export; ?></td></tr></thead><tbody class="hide">';
	html += '	  <tr><td><?php echo $ULTIMATUM_Layer_Slider_your_import; ?></td><td colSpan="10"><textarea name="import"></textarea><input type="submit"  name="import_submit" value="<?php echo $ULTIMATUM_Layer_Slider_your_import; ?>"></td><td></td></tr>';
	html += '	  <tr><td><?php echo $ULTIMATUM_Layer_Slider_your_export; ?></td><td colSpan="10"><textarea name="export"></textarea></td><td></td>';
	html += '	  </tr></tbody></table>';
	html += '<div id="tab_slides"><h1 class="section_heading"><i class="icon-film"></i> Slides  Settings</h1><ul class="nav">';
	html += '<li class="slide"><a href="#tab_slide0" class="current"><?php echo $ULTIMATUM_Layer_Slider_slide; ?> 1</a><i class="icon-remove" onclick="deleteSlide('+module_row+', 0)"></i></li>';
	html += '<li class="new_slide"><a class="new_slide" onclick="addSlide();"><?php echo $ULTIMATUM_Layer_Slider_add_new_slide; ?></a></li>';
	html += '</ul><div class="clear"></div></div>';
	html += '<div id="tab_slide0" class="tab_slide">';
	html += '<table><thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_options; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][background]" value="" id="ULTIMATUMLayerSlider_module'+module_row+'slides0background"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_row+'slides0background\', \'thumb-icon\');"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_thumbnail; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][thumbnail]" value="" id="ULTIMATUMLayerSlider_module'+module_row+'slides0thumbnail"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_row+'slides0thumbnail\', \'thumb-icon\');"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_slide_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][slidedelay]" value="4000"/></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_slide_transition; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_use_3d_2d; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][new_transitions]" checked="checked"></td>';
	html += '<td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_transitions; ?></td><td class="3D"><button class="button ls-select-transitions new"><?php echo $ULTIMATUM_Layer_Slider_select_transitions; ?></button><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][3d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][2d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][custom_3d_transitions]" value=""><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][custom_2d_transitions]" value=""></td>';
	html += '<td class="2D hide title"><?php echo $ULTIMATUM_Layer_Slider_direction; ?></td><td class="2D hide"><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][slidedirection]"><option value="top">top</option><option value="right" selected="selected">right</option><option value="bottom">bottom</option><option value="left">left</option></select></td>';		  
	html += '<td class="3D title"><?php echo $ULTIMATUM_Layer_Slider_time_shift; ?></td><td class="3D"><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][timeshift]" value="0"/></td><td class="2D"></td><td class="2D"></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr class="2D hide title">';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_in; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][durationin]" value="1500"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][easingin]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutQuint">easeOutQuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_in; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][delayin]" value="0"></td><td></td><td></td><td></td><td></td></tr>';	
	html += '<tr class="2D hide">';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_slide_out; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][durationout]" value="1500"></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][easingout]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutQuint">easeOutQuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay_out; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][delayout]" value="0"></td><td></td><td></td><td></td><td></td></tr>';	
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_link_this_slide; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_url; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layer_link]" value=""/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_link_target; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layer_link_target]"><option value="_self" selected="selected";>_self</option><option value="_blank">_blank</option><option value="_parent">_parent</option><option value="_top">_top</option></select></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td><td></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][id]" value=""/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_deeplink; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][deeplink]" value=""/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][skip]"></td><td></td><td></td><td></td><td></td></tr>';	  
	html += '</tbody><thead><tr><td colSpan="12">Preview</td></tr></thead><tbody><tr><td colSpan="12">';
	html += '<div class="ls-preview-wrapper" style="width: 600px;"><div class="ls-preview" style="width: 600px; height: 300px; background-color: transparent; background-image: none; display: block;"><div class="draggable ls-layer"></div></div><div class="ls-real-time-preview" style="display: none;"></div><button class="button ls-preview-button">Enter Preview</button></div></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12">Layers</td></tr></thead><tbody><tr><td colSpan="12">';
	html += '<div id="layers_wrap"><div id="tab_layers"><h1 class="section_heading"><i class="icon-th-large"></i> Layer Settings</h1><ul class="nav">';
	html += '<li class="layer"><a href="#tab_layer0" class="current"><?php echo $ULTIMATUM_Layer_Slider_layer; ?> 1</a><i class="icon-remove" onclick="deleteLayer('+module_row+', 0, 0)"></i></li>';
	html += '<li class="new_layer"><a class="new_layer" onclick="addLayer();"><?php echo $ULTIMATUM_Layer_Slider_add_new_layer; ?></a></li>';
	html += '</ul><div class="clear"></div></div>';
	html += '<div id="tab_layer0" class="tab_layer">';
	html += '<table><thead><tr><td colSpan="12">Basic</td></tr></thead><tbody><tr>';
	html += '<td class="title">Insert image</td><td><i>x</i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][image]" value="" id="ULTIMATUMLayerSlider_module'+module_row+'slides0layers0image"/><img src="<?php $image=HTTP_IMAGE; $image.="no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_row+'slides0layers0image\', \'thumb-icon\');"></td>';
	html += '<td>Insert custom HTML</td><td colSpan="8"><textarea name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][html]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_options; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_transition_in; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][slidedirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][durationin]" value="1500"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][easingin]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][delayin]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_transition_out; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_type; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][slideoutdirection]"><option value="fade">Fade</option><option value="auto" selected="selected">Auto (Slide from auto direction)</option><option value="top">Top (Slide from top)</option><option value="right">Right (Slide from Right)</option><option value="bottom">Bottom (Slide from Bottom)</option><option value="left">Left (Slide from Left)</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_duration; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][durationout]" value="1500"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_easing; ?></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][easingout]"><option value="linear" selected="selected">Linear</option><option value="swing">Swing</option><option value="easeInQuad">easeInQuad</option><option value="easeOutQuad">easeOutQuad</option><option value="easeInCubic">easeInCubic</option><option value="easeOutCubic">easeOutCubic</option><option value="easeInOutCubic">easeInOutCubic</option><option value="easeInQuart">easeInQuart</option><option value="easeOutCuart">easeOutCuart</option><option value="easeInOutCuard">easeInOutCuard</option><option value="easeInQuint">easeInQuint</option><option value="easeOutCuint">easeOutCuint</option><option value="easeInOutQuint">easeInOutQuint</option><option value="easeInSine">easeInSine</option><option value="easeOutSine">easeOutSine</option><option value="easeInOutSine">easeInOutSine</option><option value="easeInExpo">easeInExpo</option><option value="easeOutExpo">easeOutExpo</option><option value="easeInOutExpo">easeInOutExpo</option><option value="easeInCirc">easeInCirc</option><option value="easeOutCirc">easeOutCirc</option><option value="easeInOutCirc">easeInOutCirc</option><option value="easeInElastic">easeInElastic</option><option value="easeOutElastic">easeOutElastic</option><option value="easeInOutElastic">easeInOutElastic</option><option value="easeInBack">easeInBack</option><option value="easeOutBack">easeOutBack</option><option value="easeInOutBack">easeInOutBack</option><option value="easeInBounce">easeInBounce</option><option value="easeOutBounce">easeOutBounce</option><option value="easeInOutBounce">easeInOutBounce</option></select></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_delay; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][delayout]" value="0"/></td><td></td><td></td></tr>';
	html += '<tr><td class="title"><?php echo $ULTIMATUM_Layer_Slider_other_options; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_distance; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][level]" value="-1"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_show_until; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][showuntil]" value="0"/></td>';
	html += '<td class="title"><?php echo $ULTIMATUM_Layer_Slider_hidden; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][skip]"></td><td></td><td></td><td></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_link; ?></td></tr></thead><tbody><tr>';
	html += '<td></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_url; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][url]" value=""/></td><td><select name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][target]"><option value="_self" selected="selected">_self</option><option value="_blank">_blank</option><option value="_parent">_parent</option><option value="_top">_top</option></select></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>';				
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_style; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_layout_positions; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_width; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][width]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][height]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_padding; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][padding-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][padding-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][padding-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][padding-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_border; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_top; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][border-top]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_right; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][border-right]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_bottom; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][border-bottom]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_left; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][border-left]" value=""/></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_font; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_family; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][font-family]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_size; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][font-size]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_line_height; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][line-height]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_color; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][color]" value=""/></td><td></td><td></td></tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_misc; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_background_image; ?></td><td><i class="icon-remove"></i><input type="hidden" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][background]" value="" id="ULTIMATUMLayerSlider_module'+module_row+'slides0layers0background"/><img src="<?php $image=HTTP_CATALOG . "image/no_image.jpg"; echo $image; ?>" onclick="image_upload(\'ULTIMATUMLayerSlider_module'+module_row+'slides0layers0background\', \'thumb-icon\')"></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rounded_corners; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][border-radius]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_word_wrap; ?></td><td><input type="checkbox" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][wordwrap]"></td><td></td><td></td><td></td><td></td></tr>';
	html += '<tr><td><?php echo $ULTIMATUM_Layer_Slider_custom_style; ?></td><td colSpan="10"><textarea name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][style]"></textarea></td><td></td></tr></tbody>';
	html += '<thead><tr><td colSpan="12"><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td></tr></thead><tbody><tr>';
	html += '<td><?php echo $ULTIMATUM_Layer_Slider_attributes; ?></td><td></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_id; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][id]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_classes; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][class]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_title; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][title]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_alt; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][alt]" value=""/></td><td class="title"><?php echo $ULTIMATUM_Layer_Slider_rel; ?></td><td><input type="text" name="ULTIMATUMLayerSlider_module['+module_row+'][slides][0][layers][0][rel]" value=""/></td></tr></tbody>';				
	html += '</table></div><div class="info2"></div></td></tr></tbody></table>';
	html += '</div>';
	html += '<div class="info"></div></div>';
	$('#all_sliders').append(html);
	module_current=module_row;
	module_row++;
	var rem=$("#all_sliders #tab_modules>ul>li").index();
	for(i=0;i<rem;i++) $("#all_sliders #tab_modules>ul>li>a:eq("+i+")").text("<?php echo $ULTIMATUM_Layer_Slider_module; ?> "+(i+1));
	$(":checkbox:not(.noreplace)").customCheckbox();
	$("td.3D").removeClass("hide");	$("td.2D").addClass("hide"); $("tr.2D").addClass("hide");
	LayerSlider.generatePreview();
	LayerSlider.stop();	
}

$('#all_sliders input[name="import_submit"]').live("click", function(event){
	 event.preventDefault();
	import_data($(this).prev().val())

});
$('#all_sliders textarea[name="export"]').live("click", function(event){
	event.preventDefault();
	$(this).val(export_data())
	})
$('#all_sliders .export-import').live("click", function(event){
	$(this).parent().parent().parent().find('textarea[name="export"]').val(export_data())

	})
function export_data(){
	var info=""; var i=0; var j=0;
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][language_id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][responsive]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][forceresponsive]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][responsiveunder]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][sublayercontainer]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][autostart]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][pauseonhover]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][firstlayer]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][animatefirstlayer]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][randomslideshow]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][twowayslideshow]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][loops]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][forceloopnum]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][autoplayvideos]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][autopauseslideshow]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][youtubepreview]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][keynav]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][touchnav]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][skin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][transparent]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][backgroundimage]']").val()+"|";
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][sliderstyle]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navprevnext]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navstartstop]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navbuttons]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][hoverprevnext]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][hoverbottomnav]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_nav]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_container_width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_active_opacity]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_inactive_opacity]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][imgpreload]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][relativeurls]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogo]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogostyle]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogolink]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogotarget]']").val()+"|";
	info+=$("#all_sliders div#tab_module"+module_current+" #tab_slides>ul>li").index()+"|";
	for(i=0;i<slide_row[module_current];i++) {
	if ($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][background]']").length) {
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][background]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][thumbnail]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][slidedelay]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][new_transitions]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][3d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][2d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][custom_3d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][custom_2d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][timeshift]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layer_link]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layer_link_target]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][deeplink]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][skip]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][slidedirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][durationin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][easingin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][delayin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][durationout]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][easingout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][delayout]']").val()+"|";
	info+=$("#all_sliders div#tab_module"+module_current+' div#tab_slide'+i+" #tab_layers>ul>li").index()+"|";
	for(j=0;j<layer_row[module_current][i];j++) {
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][image]']").val()+"|";
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][html]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][slidedirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][durationin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][easingin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][delayin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][slideoutdirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][durationout]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][easingout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][delayout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][level]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][showuntil]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][skip]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][url]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][target]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][padding-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][padding-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][padding-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][padding-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][border-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][border-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][border-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][border-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][font-family]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][font-size]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][line-height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][color]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][background]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][border-radius]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][wordwrap]']").prop('checked')+"|";
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][style]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][class]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][title]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][alt]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][rel]']").val()+"|";
	}
	}
	}
	var str=info; str = (str + '').toString();
	return info;
};

//Duplicate layer
$('#all_sliders .duplicate-layer').live('click',function(){
	event.preventDefault();
	duplicate_layer();
	})
function duplicate_layer() {
	
	var info=""; var i=0; var j=0;
	
	
	info+=$("#all_sliders div#tab_module"+module_current+' div#tab_slide'+slide_current[module_current]+" #tab_layers>ul>li").index()+"|";
	for(j=0;j<layer_row[module_current][slide_current[module_current]];j++) {
	if ($("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][html]']").length) {
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][html]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][slidedirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][durationin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][easingin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][delayin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][slideoutdirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][durationout]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][easingout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][delayout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][level]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][showuntil]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][skip]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][url]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][target]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][font-family]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][font-size]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][line-height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][color]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][background]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-radius]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][wordwrap]']").prop('checked')+"|";
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][style]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][class]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][title]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][alt]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][rel]']").val()+"|";
	}
	}

	var data=info.split("|"); var k=0;
	var slide_count=0; var layer_count=0; var i=0; var j=0;
	
	k++;

	addLayer();
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][html]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slidedirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slideoutdirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationout]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][level]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][showuntil]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][skip]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][url]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][target]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-family]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-size]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][line-height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][color]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").val(data[k]);
	if(data[k] != ''){$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").next().attr('src',uploadPath+data[k]);
	}k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-radius]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][wordwrap]']").prop('checked', (data[k]=='true'));k++;
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][style]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][class]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][title]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][alt]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][rel]']").val(data[k]);k++;
	
	var check_count=$('#all_sliders div#tab_module'+module_current+' a.ls-checkbox').index();
	
	for(i=0;i<check_count;i++) {
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===true) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("off").addClass("on");
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===false) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("on").addClass("off");
	}
	LayerSlider.generatePreview();
	LayerSlider.stop();
}


//Duplicate slide
$('#all_sliders .duplicate-slide').live('click',function(){
	event.preventDefault();
	duplicate_slide();
	})
function duplicate_slide() {
	
	var info=""; var i=0; var j=0;
	
	info+=$("#all_sliders div#tab_module"+module_current+" #tab_slides>ul>li").index()+"|";
	if ($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").length) {
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][thumbnail]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedelay]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][new_transitions]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][3d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][2d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_3d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_2d_transitions]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][timeshift]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link_target]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][deeplink]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][skip]']").prop('checked')+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationout]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayout]']").val()+"|";
	info+=$("#all_sliders div#tab_module"+module_current+' div#tab_slide'+slide_current[module_current]+" #tab_layers>ul>li").index()+"|";
	for(j=0;j<layer_row[module_current][slide_current[module_current]];j++) {
	if ($("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][html]']").length) {
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][html]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][slidedirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][durationin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][easingin]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][delayin]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][slideoutdirection]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][durationout]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][easingout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][delayout]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][level]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][showuntil]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][skip]']").prop('checked')+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][url]']").val()+"|";
	info+=$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][target]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][width]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][padding-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-top]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-right]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-bottom]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-left]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][font-family]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][font-size]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][line-height]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][color]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][background]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][border-radius]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][wordwrap]']").prop('checked')+"|";
	info+=$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][style]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][id]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][class]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][title]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][alt]']").val()+"|";
	info+=$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][rel]']").val()+"|";
	}
	}
	}

	var data=info.split("|"); var k=0;
	var slide_count=0; var layer_count=0; var i=0; var j=0;
	
	k++;

	addSlide();
	
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").val(data[k]);
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").next().attr('src',uploadPath+data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][thumbnail]']").val(data[k]);
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][thumbnail]']").next().attr('src',uploadPath+data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedelay]']").val(data[k])+"|";k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][new_transitions]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][3d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][2d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_3d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_2d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][timeshift]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link_target]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][deeplink]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][skip]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationout]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayout]']").val(data[k]);k++;
	
	deleteLayer(module_current, slide_current[module_current], 0);
	layer_count=data[k];k++;
	for(j=0;j<layer_count;j++) {
	addLayer();
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][html]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slidedirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slideoutdirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationout]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][level]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][showuntil]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][skip]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][url]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][target]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-family]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-size]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][line-height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][color]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").val(data[k]);
	if(data[k] != ''){$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").next().attr('src',uploadPath+data[k]);
	}k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-radius]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][wordwrap]']").prop('checked', (data[k]=='true'));k++;
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][style]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][class]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][title]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][alt]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][rel]']").val(data[k]);k++;
	}
	
	var check_count=$('#all_sliders div#tab_module'+module_current+' a.ls-checkbox').index();
	
	for(i=0;i<check_count;i++) {
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===true) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("off").addClass("on");
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===false) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("on").addClass("off");
	}
	LayerSlider.generatePreview();
	LayerSlider.stop();
}





$("a.ls-checkbox").live("click", function(event){
	//event.preventDefault();
	if ($(this).prev().attr("name")=="ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][new_transitions]") {
	if ($(this).hasClass("off")) {
		$("td.3D").removeClass("hide");
		$("td.2D").addClass("hide");
		$("tr.2D").addClass("hide");
	}
	else {

		$("td.3D").addClass("hide");
		$("td.2D").removeClass("hide");
		$("tr.2D").removeClass("hide");
	}
	}
});
function image_upload(field, thumb) {
	var old_val=$('#' + field).val();
		
	$('#dialog').remove();
	$('#'+field).val("");
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
					$('#'+field).next().attr("src",uploadPath+$('#'+field).val());
					LayerSlider.generatePreview();
					LayerSlider.stop();		
							
						//$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
			else {
				$('#' + field).val(old_val);
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
	
function import_data(info) {
	var str=info; str = (str + '').toString();
	var data=info.split("|"); var k=0;
	var slide_count=0; var layer_count=0; var i=0; var j=0;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][language_id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][responsive]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][forceresponsive]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][responsiveunder]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][sublayercontainer]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][autostart]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][pauseonhover]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][firstlayer]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][animatefirstlayer]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][randomslideshow]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][twowayslideshow]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][loops]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][forceloopnum]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][autoplayvideos]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][autopauseslideshow]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][youtubepreview]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][keynav]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][touchnav]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][skin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][transparent]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][backgroundimage]']").val(data[k]);k++;
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][sliderstyle]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navprevnext]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navstartstop]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][navbuttons]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][hoverprevnext]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][hoverbottomnav]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_nav]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_container_width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_active_opacity]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][thumb_inactive_opacity]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][imgpreload]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][relativeurls]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogo]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogostyle]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogolink]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][yourlogotarget]']").val(data[k]);k++;
	
	for(i=0;i<slide_row[module_current];i++) {
		if ($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][background]']").length) deleteSlide(module_current, i);
	}
	slide_count=data[k];k++;
	
	for(i=0;i<slide_count;i++) {
	
	addSlide();
	
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").val(data[k]);
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][background]']").next().attr('src',uploadPath+data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][thumbnail]']").val(data[k]);
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][thumbnail]']").next().attr('src',uploadPath+data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedelay]']").val(data[k])+"|";k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][new_transitions]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][3d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][2d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_3d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][custom_2d_transitions]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][timeshift]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layer_link_target]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][deeplink]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][skip]']").prop('checked', (data[k]=='true'));k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][slidedirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][durationout]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][easingout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][delayout]']").val(data[k]);k++;
	
	deleteLayer(module_current, slide_current[module_current], 0);
	layer_count=data[k];k++;
	for(j=0;j<layer_count;j++) {
	addLayer();
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][image]']").val(data[k]);k++;
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][html]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slidedirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingin]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayin]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][slideoutdirection]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][durationout]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][easingout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][delayout]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][level]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][showuntil]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][skip]']").prop('checked', (data[k]=='true'));k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][url]']").val(data[k]);k++;
	$("select[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][target]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][width]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][padding-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-top]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-right]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-bottom]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-left]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-family]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][font-size]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][line-height]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][color]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").val(data[k]);
	if(data[k] != ''){$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][background]']").next().attr('src',uploadPath+data[k]);
	}k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][border-radius]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][wordwrap]']").prop('checked', (data[k]=='true'));k++;
	$("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][style]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][id]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][class]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][title]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][alt]']").val(data[k]);k++;
	$("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+layer_current[module_current][slide_current[module_current]]+"][rel]']").val(data[k]);k++;
	}
	}
	var check_count=$('#all_sliders div#tab_module'+module_current+' a.ls-checkbox').index();
	
	for(i=0;i<check_count;i++) {
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===true) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("off").addClass("on");
		if ($('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').prev().prop('checked')===false) $('#all_sliders div#tab_module'+module_current+' a.ls-checkbox:eq('+i+')').removeClass("on").addClass("off");
	}
	alert("Import success!");
	LayerSlider.generatePreview();
	LayerSlider.stop();
}
$('.layer-small-tab').live('click',function(){
	$(this).parent().parent().parent().find('.layer-small-tab').removeClass('button')
	$(this).addClass('button')
	$(this).parent().parent().parent().find(".layer-small-tab-input").hide()
	$("#"+$(this).attr('id')+"_input").show()
	})
$('#button_save').click(function(){
	var limit = '<?php echo ini_get("max_input_vars"); ?>';

	if(limit.length == 0){
		$('textarea[name="export"], textarea[name="import"]').val('')
	  	$('#form').submit();
	}else if($('form :input').length < limit){
		$('textarea[name="export"], textarea[name="import"]').val('')
	  	$('#form').submit();
	}else{
	 alert('Sorry, but php.ini allows only  '+limit+' fields to be stored in a variable. At the moment you have '+ $('form :input').length + ' fields and you need to reduce to less then  <?php echo ini_get("max_input_vars"); ?>. Try to reduce the amount of slides or view the tutorial to learn how to increase this value. After that you will be able to save the settings.') 	
	}
})
--></script> 
<?php echo $footer; ?>