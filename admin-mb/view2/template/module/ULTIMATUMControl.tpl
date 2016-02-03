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
  <div class="box fixed">
  <div class="heading">
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div class="buttons">
      <select name="ULTIMATUMControl_status" class="spicyBig">
        <?php
														if ($ULTIMATUMControl_status) {
															?>
        <option value="1" selected="selected" class="green">
        <?php
															echo $text_enabled;
															?>
        </option>
        <option value="0" class="red">
        <?php
															echo $text_disabled;
															?>
        </option>
        <?php
														} else {
															?>
        <option value="1" class="green">
        <?php
															echo $text_enabled;
															?>
        </option>
        <option value="0" selected="selected" class="red">
        <?php
															echo $text_disabled;
															?>
        </option>
        <?php
														}
														?>
      </select>
      
      <a onclick="$('#form').attr('action', location + '&exit=true');$('#form').submit();" class="button" style="background:#09F !Important;"><i class="icon-save"></i><i class="icon-signout"></i> <span><?php echo $button_save_exit; ?></span></a>
        <a onclick="$('#form').submit();" class="button"><i class="icon-save"></i> <span><?php echo $button_save; ?></span></a>
        <a href="<?php echo $cancel; ?>" class="button"style="background:#FC0000 !Important;"><i class="icon-undo"></i><span><?php echo $button_cancel; ?></span></a>
      </div>
    </div>
    </div>
    <div class="box fixed long_box">
    <div id="tabs" class="htabs"> <a href="#tab_layout"><i class="icon-cogs"></i><?php echo $text_general_settings; ?></a> <a href="#tab_modules"><i class="icon-cogs"></i>Module settings</a> <a href="#tab_header"><i class="icon-collapse-top"></i><?php echo $text_header_settings; ?></a> <a href="#tab_footer"><i class="icon-collapse"></i><?php echo $text_footer_settings; ?></a><a href="#tab_color"><i class="icon-magic"></i><?php echo $text_common_colors; ?></a> <a href="#tab_product"><i class="icon-shopping-cart"></i><?php echo $text_product_page; ?></a> <a href="#tab_category"><i class="icon-sort-by-alphabet"></i>Category page</a> <a href="#tab_fonts"><i class="icon-text-height"></i><?php echo $text_fonts; ?></a> <a href="#tab_social"><i class="icon-comments"></i><?php echo $text_social; ?></a> <a href="#tab_cards"><i class="icon-credit-card"></i><?php echo $text_icons; ?></a><a href="#tab_css"><i class="icon-css3"></i><?php echo $text_css; ?></a> <a href="#tab_map"><i class="icon-map-marker"></i>Contact Us Page</a> </div>
    <div class="htabs-content" id="tab_modules">
      <h2 class="layout"><span>Modules settings / Colors, Backgrounds, Paralax /</span></h2>
      <p>Here you can adjust the colors, backgrounds and Paralax effects on per module and/or area basis. All modules are <strong>non-paralax by default</strong> and would automatically adjust to paralax mode if one or both of the paralax background fields are not empty!</p>
      <p>Each module/area can have it's own set of colors, backgrounds and title colors!</p>
      <p><span class="helper"><strong>*The parallax and video settings only apply for modules enabled in Content Top Fullwidth AND/OR Content Bottom Fullwidth positions!</strong></span></p>
      <p><span class="helper"><strong>*The title and background color, module mode and display type settings only apply for modules enabled in Content Top, Content Bottom, Content Top Fullwidth AND/OR Content Bottom Fullwidth positions!</strong></span></p>
      <h2 class="layout"><span>Video backgrounds mask type:</span></h2>
      <table class="form">
        <tr>
            <td>Choose mask type:</td>
            <td><select name="ULTIMATUMControl_video_mask" class="spicy">
                <?php if (isset($ULTIMATUMControl_video_mask)) {
              $selected_video_mask = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_video_mask=='0'){echo $selected_video_mask;} ?>>Raster</option>
                <option value="rgba(0,0,0,0.6)" <?php if($ULTIMATUMControl_video_mask=='rgba(0,0,0,0.6)'){echo $selected_video_mask;} ?>>Transparent dark</option>
                <option value="rgba(255,255,255,0.6)" <?php if($ULTIMATUMControl_video_mask=='rgba(255,255,255,0.6)'){echo $selected_video_mask;} ?>>Transparent white</option>
                <option value="none" <?php if($ULTIMATUMControl_video_mask=='none'){echo $selected_video_mask;} ?>>No mask</option>
                <?php } else { ?>
                <option value="0" selected="selected">Raster</option>
                <option value="rgba(0,0,0,0.6)">Transparent dark</option>
                <option value="rgba(255,255,255,0.6)">Transparent white</option>
                <option value="none">No mask</option>
                <?php } ?>
              </select></td>
          </tr>
</table>
      
      <div id="tabsmodule" class="htabs htabs2"> <a href="#ULTIMATUM_prods">Product Tabs</a> <a href="#featured_module">Featured</a> <a href="#latest_module">Latest</a> <a href="#bestsellers_module">Bestsellers</a> <a href="#specials_module">Specials</a> <a href="#deal_module">Deals</a> <a href="#welcome_module">Welcome</a> <a href="#slideshow_module">Slideshow</a> <a href="#banners_module">Banners</a> <a href="#iconboxes_module">Iconboxes</a> <a href="#ULTIMATUMtabs_module">ULTIMATUMTabs module</a></div>
      <div class="htabs-content no_margin"  id="ULTIMATUM_prods">
        <h2 class="layout"><span>Product Tabs module settings</span></h2>
        <table class="form">
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_tabbed_background_color" type="text" name="ULTIMATUMControl_tabbed_background_color" value="<?php echo $ULTIMATUMControl_tabbed_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_tabbed_video" type="text" name="ULTIMATUMControl_tabbed_video" value="<?php echo $ULTIMATUMControl_tabbed_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_tabbed_video_start" type="text" name="ULTIMATUMControl_tabbed_video_start" value="<?php echo $ULTIMATUMControl_tabbed_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_tabbedBg1Img" value="<?php echo $ULTIMATUMControl_tabbedBg1Img; ?>" id="ULTIMATUMControl_tabbedBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_tabbedBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_tabbedBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_tabbedBg1Img', 'ULTIMATUMControl_tabbedBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_tabbedBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_tabbedBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_tabbedBg2Img" value="<?php echo $ULTIMATUMControl_tabbedBg2Img; ?>" id="ULTIMATUMControl_tabbedBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_tabbedBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_tabbedBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_tabbedBg2Img', 'ULTIMATUMControl_tabbedBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_tabbedBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_tabbedBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>Product hover effect</td>
            <td><select name="ULTIMATUMControl_sort_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_sort_hover_mode)) {
              $selected_sort_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_sort_hover_mode=='0'){echo $selected_sort_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_sort_hover_mode=='1'){echo $selected_sort_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_sort_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_sort_flydesc_mode)) {
              $selected_sort_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_sort_flydesc_mode=='1'){echo $selected_sort_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_sort_flydesc_mode=='0'){echo $selected_sort_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="latest_module">
        <h2 class="layout"><span>Latest module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_latest_title_color" type="text" name="ULTIMATUMControl_latest_title_color" value="<?php echo $ULTIMATUMControl_latest_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_latest_background_color" type="text" name="ULTIMATUMControl_latest_background_color" value="<?php echo $ULTIMATUMControl_latest_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_latest_video" type="text" name="ULTIMATUMControl_latest_video" value="<?php echo $ULTIMATUMControl_latest_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_latest_video_start" type="text" name="ULTIMATUMControl_latest_video_start" value="<?php echo $ULTIMATUMControl_latest_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_latestBg1Img" value="<?php echo $ULTIMATUMControl_latestBg1Img; ?>" id="ULTIMATUMControl_latestBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_latestBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_latestBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_latestBg1Img', 'ULTIMATUMControl_latestBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_latestBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_latestBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_latestBg2Img" value="<?php echo $ULTIMATUMControl_latestBg2Img; ?>" id="ULTIMATUMControl_latestBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_latestBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_latestBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_latestBg2Img', 'ULTIMATUMControl_latestBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_latestBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_latestBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>Module style</td>
            <td><select name="ULTIMATUMControl_latest_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_mode)) {
              $selected_latest_mode = 'selected="selected"';
              ?>
                <option value="latest_standard" <?php if($ULTIMATUMControl_latest_mode=='latest_standard'){echo $selected_latest_mode;} ?>>Standard</option>
                <option value="latest_carousel" <?php if($ULTIMATUMControl_latest_mode=='latest_carousel'){echo $selected_latest_mode;} ?>>Carousel</option>
                <?php } else { ?>
                <option value="latest_standard" selected="selected">Standard</option>
                <option value="latest_carousel">Carousel</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product hover effect</td>
            <td><select name="ULTIMATUMControl_latest_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_hover_mode)) {
              $selected_latest_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_latest_hover_mode=='0'){echo $selected_latest_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_latest_hover_mode=='1'){echo $selected_latest_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_latest_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_flydesc_mode)) {
              $selected_latest_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_latest_flydesc_mode=='1'){echo $selected_latest_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_latest_flydesc_mode=='0'){echo $selected_latest_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product name visibility</td>
            <td><select name="ULTIMATUMControl_latest_name_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_name_display)) {
              $selected_latest_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_latest_name_display=='0'){echo $selected_latest_name_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_latest_name_display=='1'){echo $selected_latest_name_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product price visibility</td>
            <td><select name="ULTIMATUMControl_latest_price_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_price_display)) {
              $selected_latest_price_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_latest_price_display=='0'){echo $selected_latest_price_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_latest_price_display=='1'){echo $selected_latest_price_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product rating visibility</td>
            <td><select name="ULTIMATUMControl_latest_rating_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_rating_display)) {
              $selected_latest_rating_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_latest_rating_display=='0'){echo $selected_latest_rating_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_latest_rating_display=='1'){echo $selected_latest_rating_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Cart button visibility</td>
            <td><select name="ULTIMATUMControl_latest_cart_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_latest_cart_display)) {
              $selected_latest_cart_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_latest_cart_display=='0'){echo $selected_latest_cart_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_latest_cart_display=='1'){echo $selected_latest_cart_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="deal_module">
        <h2 class="layout"><span>Deal of the day module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_deal_title_color" type="text" name="ULTIMATUMControl_deal_title_color" value="<?php echo $ULTIMATUMControl_deal_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_deal_background_color" type="text" name="ULTIMATUMControl_deal_background_color" value="<?php echo $ULTIMATUMControl_deal_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_deal_video" type="text" name="ULTIMATUMControl_deal_video" value="<?php echo $ULTIMATUMControl_deal_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_deal_video_start" type="text" name="ULTIMATUMControl_deal_video_start" value="<?php echo $ULTIMATUMControl_deal_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_dealBg1Img" value="<?php echo $ULTIMATUMControl_dealBg1Img; ?>" id="ULTIMATUMControl_dealBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_dealBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_dealBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_dealBg1Img', 'ULTIMATUMControl_dealBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_dealBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_dealBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_dealBg2Img" value="<?php echo $ULTIMATUMControl_dealBg2Img; ?>" id="ULTIMATUMControl_dealBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_dealBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_dealBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_dealBg2Img', 'ULTIMATUMControl_dealBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_dealBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_dealBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_deal_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_deal_flydesc_mode)) {
              $selected_deal_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_deal_flydesc_mode=='1'){echo $selected_deal_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_deal_flydesc_mode=='0'){echo $selected_deal_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="featured_module">
        <h2 class="layout"><span>Featured module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_featured_title_color" type="text" name="ULTIMATUMControl_featured_title_color" value="<?php echo $ULTIMATUMControl_featured_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_featured_background_color" type="text" name="ULTIMATUMControl_featured_background_color" value="<?php echo $ULTIMATUMControl_featured_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_featured_video" type="text" name="ULTIMATUMControl_featured_video" value="<?php echo $ULTIMATUMControl_featured_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_featured_video_start" type="text" name="ULTIMATUMControl_featured_video_start" value="<?php echo $ULTIMATUMControl_featured_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_featuredBg1Img" value="<?php echo $ULTIMATUMControl_featuredBg1Img; ?>" id="ULTIMATUMControl_featuredBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_featuredBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_featuredBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_featuredBg1Img', 'ULTIMATUMControl_featuredBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_featuredBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_featuredBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_featuredBg2Img" value="<?php echo $ULTIMATUMControl_featuredBg2Img; ?>" id="ULTIMATUMControl_featuredBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_featuredBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_featuredBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_featuredBg2Img', 'ULTIMATUMControl_featuredBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_featuredBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_featuredBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>Module style</td>
            <td><select name="ULTIMATUMControl_featured_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_mode)) {
              $selected_featured_mode = 'selected="selected"';
              ?>
                <option value="featured_standard" <?php if($ULTIMATUMControl_featured_mode=='featured_standard'){echo $selected_featured_mode;} ?>>Standard</option>
                <option value="featured_carousel" <?php if($ULTIMATUMControl_featured_mode=='featured_carousel'){echo $selected_featured_mode;} ?>>Carousel</option>
                <?php } else { ?>
                <option value="featured_standard" selected="selected">Standard</option>
                <option value="featured_carousel">Carousel</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product hover effect</td>
            <td><select name="ULTIMATUMControl_featured_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_hover_mode)) {
              $selected_featured_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_featured_hover_mode=='0'){echo $selected_featured_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_featured_hover_mode=='1'){echo $selected_featured_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_featured_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_flydesc_mode)) {
              $selected_featured_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_featured_flydesc_mode=='1'){echo $selected_featured_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_featured_flydesc_mode=='0'){echo $selected_featured_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product name visibility</td>
            <td><select name="ULTIMATUMControl_featured_name_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_name_display)) {
              $selected_featured_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_featured_name_display=='0'){echo $selected_featured_name_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_featured_name_display=='1'){echo $selected_featured_name_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product price visibility</td>
            <td><select name="ULTIMATUMControl_featured_price_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_price_display)) {
              $selected_featured_price_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_featured_price_display=='0'){echo $selected_featured_price_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_featured_price_display=='1'){echo $selected_featured_price_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product rating visibility</td>
            <td><select name="ULTIMATUMControl_featured_rating_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_rating_display)) {
              $selected_featured_rating_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_featured_rating_display=='0'){echo $selected_featured_rating_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_featured_rating_display=='1'){echo $selected_featured_rating_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Cart button visibility</td>
            <td><select name="ULTIMATUMControl_featured_cart_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_featured_cart_display)) {
              $selected_featured_cart_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_featured_cart_display=='0'){echo $selected_featured_cart_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_featured_cart_display=='1'){echo $selected_featured_cart_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="specials_module">
        <h2 class="layout"><span>Specials module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_special_title_color" type="text" name="ULTIMATUMControl_special_title_color" value="<?php echo $ULTIMATUMControl_special_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_special_background_color" type="text" name="ULTIMATUMControl_special_background_color" value="<?php echo $ULTIMATUMControl_special_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_special_video" type="text" name="ULTIMATUMControl_special_video" value="<?php echo $ULTIMATUMControl_special_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_special_video_start" type="text" name="ULTIMATUMControl_special_video_start" value="<?php echo $ULTIMATUMControl_special_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_specialBg1Img" value="<?php echo $ULTIMATUMControl_specialBg1Img; ?>" id="ULTIMATUMControl_specialBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_specialBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_specialBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_specialBg1Img', 'ULTIMATUMControl_specialBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_specialBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_specialBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_specialBg2Img" value="<?php echo $ULTIMATUMControl_specialBg2Img; ?>" id="ULTIMATUMControl_specialBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_specialBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_specialBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_specialBg2Img', 'ULTIMATUMControl_specialBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_specialBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_specialBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>Module style</td>
            <td><select name="ULTIMATUMControl_special_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_mode)) {
              $selected_special_mode = 'selected="selected"';
              ?>
                <option value="special_standard" <?php if($ULTIMATUMControl_special_mode=='special_standard'){echo $selected_special_mode;} ?>>Standard</option>
                <option value="special_carousel" <?php if($ULTIMATUMControl_special_mode=='special_carousel'){echo $selected_special_mode;} ?>>Carousel</option>
                <?php } else { ?>
                <option value="special_standard" selected="selected">Standard</option>
                <option value="special_carousel">Carousel</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product hover effect</td>
            <td><select name="ULTIMATUMControl_special_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_hover_mode)) {
              $selected_special_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_special_hover_mode=='0'){echo $selected_special_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_special_hover_mode=='1'){echo $selected_special_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_special_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_flydesc_mode)) {
              $selected_special_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_special_flydesc_mode=='1'){echo $selected_special_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_special_flydesc_mode=='0'){echo $selected_special_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product name visibility</td>
            <td><select name="ULTIMATUMControl_special_name_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_name_display)) {
              $selected_special_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_special_name_display=='0'){echo $selected_special_name_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_special_name_display=='1'){echo $selected_special_name_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product price visibility</td>
            <td><select name="ULTIMATUMControl_special_price_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_price_display)) {
              $selected_special_price_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_special_price_display=='0'){echo $selected_special_price_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_special_price_display=='1'){echo $selected_special_price_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product rating visibility</td>
            <td><select name="ULTIMATUMControl_special_rating_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_rating_display)) {
              $selected_special_rating_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_special_rating_display=='0'){echo $selected_special_rating_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_special_rating_display=='1'){echo $selected_special_rating_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Cart button visibility</td>
            <td><select name="ULTIMATUMControl_special_cart_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_special_cart_display)) {
              $selected_special_cart_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_special_cart_display=='0'){echo $selected_special_cart_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_special_cart_display=='1'){echo $selected_special_cart_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="bestsellers_module">
        <h2 class="layout"><span>Bestsellers module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_bestseller_title_color" type="text" name="ULTIMATUMControl_bestseller_title_color" value="<?php echo $ULTIMATUMControl_bestseller_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_bestseller_background_color" type="text" name="ULTIMATUMControl_bestseller_background_color" value="<?php echo $ULTIMATUMControl_bestseller_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_bestseller_video" type="text" name="ULTIMATUMControl_bestseller_video" value="<?php echo $ULTIMATUMControl_bestseller_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_bestseller_video_start" type="text" name="ULTIMATUMControl_bestseller_video_start" value="<?php echo $ULTIMATUMControl_bestseller_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_bestsellerBg1Img" value="<?php echo $ULTIMATUMControl_bestsellerBg1Img; ?>" id="ULTIMATUMControl_bestsellerBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_bestsellerBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_bestsellerBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_bestsellerBg1Img', 'ULTIMATUMControl_bestsellerBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_bestsellerBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_bestsellerBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_bestsellerBg2Img" value="<?php echo $ULTIMATUMControl_bestsellerBg2Img; ?>" id="ULTIMATUMControl_bestsellerBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_bestsellerBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_bestsellerBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_bestsellerBg2Img', 'ULTIMATUMControl_bestsellerBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_bestsellerBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_bestsellerBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td>Module style</td>
            <td><select name="ULTIMATUMControl_bestseller_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_mode)) {
              $selected_bestseller_mode = 'selected="selected"';
              ?>
                <option value="bestseller_standard" <?php if($ULTIMATUMControl_bestseller_mode=='bestseller_standard'){echo $selected_bestseller_mode;} ?>>Standard</option>
                <option value="bestseller_carousel" <?php if($ULTIMATUMControl_bestseller_mode=='bestseller_carousel'){echo $selected_bestseller_mode;} ?>>Carousel</option>
                <?php } else { ?>
                <option value="bestseller_standard" selected="selected">Standard</option>
                <option value="bestseller_carousel">Carousel</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>"Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_bestseller_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_flydesc_mode)) {
              $selected_bestseller_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_flydesc_mode=='1'){echo $selected_bestseller_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_flydesc_mode=='0'){echo $selected_bestseller_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product hover effect</td>
            <td><select name="ULTIMATUMControl_bestseller_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_hover_mode)) {
              $selected_bestseller_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_hover_mode=='0'){echo $selected_bestseller_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_hover_mode=='1'){echo $selected_bestseller_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product name visibility</td>
            <td><select name="ULTIMATUMControl_bestseller_name_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_name_display)) {
              $selected_bestseller_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_name_display=='0'){echo $selected_bestseller_name_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_name_display=='1'){echo $selected_bestseller_name_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product price visibility</td>
            <td><select name="ULTIMATUMControl_bestseller_price_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_price_display)) {
              $selected_bestseller_price_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_price_display=='0'){echo $selected_bestseller_price_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_price_display=='1'){echo $selected_bestseller_price_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product rating visibility</td>
            <td><select name="ULTIMATUMControl_bestseller_rating_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_rating_display)) {
              $selected_bestseller_rating_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_rating_display=='0'){echo $selected_bestseller_rating_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_rating_display=='1'){echo $selected_bestseller_rating_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Cart button visibility</td>
            <td><select name="ULTIMATUMControl_bestseller_cart_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_bestseller_cart_display)) {
              $selected_bestseller_cart_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_bestseller_cart_display=='0'){echo $selected_bestseller_cart_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_bestseller_cart_display=='1'){echo $selected_bestseller_cart_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="welcome_module">
        <h2 class="layout"><span>Welcome module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_welcome_title_color" type="text" name="ULTIMATUMControl_welcome_title_color" value="<?php echo $ULTIMATUMControl_welcome_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_welcome_background_color" type="text" name="ULTIMATUMControl_welcome_background_color" value="<?php echo $ULTIMATUMControl_welcome_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_welcome_video" type="text" name="ULTIMATUMControl_welcome_video" value="<?php echo $ULTIMATUMControl_welcome_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_welcome_video_start" type="text" name="ULTIMATUMControl_welcome_video_start" value="<?php echo $ULTIMATUMControl_welcome_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_welcomeBg1Img" value="<?php echo $ULTIMATUMControl_welcomeBg1Img; ?>" id="ULTIMATUMControl_welcomeBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_welcomeBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_welcomeBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_welcomeBg1Img', 'ULTIMATUMControl_welcomeBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_welcomeBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_welcomeBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_welcomeBg2Img" value="<?php echo $ULTIMATUMControl_welcomeBg2Img; ?>" id="ULTIMATUMControl_welcomeBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_welcomeBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_welcomeBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_welcomeBg2Img', 'ULTIMATUMControl_welcomeBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_welcomeBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_welcomeBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="slideshow_module">
        <h2 class="layout"><span>Slideshow module settings (applies to Flex slideshow and the default Slideshow modules)</span></h2>
        <table class="form">
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_slideshow_background_color" type="text" name="ULTIMATUMControl_slideshow_background_color" value="<?php echo $ULTIMATUMControl_slideshow_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_slideshow_video" type="text" name="ULTIMATUMControl_slideshow_video" value="<?php echo $ULTIMATUMControl_slideshow_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_slideshow_video_start" type="text" name="ULTIMATUMControl_slideshow_video_start" value="<?php echo $ULTIMATUMControl_slideshow_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_slideshowBg1Img" value="<?php echo $ULTIMATUMControl_slideshowBg1Img; ?>" id="ULTIMATUMControl_slideshowBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_slideshowBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_slideshowBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_slideshowBg1Img', 'ULTIMATUMControl_slideshowBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_slideshowBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_slideshowBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_slideshowBg2Img" value="<?php echo $ULTIMATUMControl_slideshowBg2Img; ?>" id="ULTIMATUMControl_slideshowBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_slideshowBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_slideshowBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_slideshowBg2Img', 'ULTIMATUMControl_slideshowBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_slideshowBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_slideshowBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="banners_module">
        <h2 class="layout"><span>Banners module settings</span></h2>
        <table class="form">
          
            <td>Show banner name<br />
              <span class="helper"><strong>*Global setting for all module instances in content top AND/OR content bottom area!</strong></span></td>
            <td><select name="ULTIMATUMControl_banner_name_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_banner_name_mode)) {
              $selected_banner_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_banner_name_mode=='0'){echo $selected_banner_name_mode;} ?>>No</option>
                <option value="1" <?php if($ULTIMATUMControl_banner_name_mode=='1'){echo $selected_banner_name_mode;} ?>>Yes</option>
                <?php } else { ?>
                <option value="0" selected="selected">No</option>
                <option value="1">Yes</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_banners_background_color" type="text" name="ULTIMATUMControl_banners_background_color" value="<?php echo $ULTIMATUMControl_banners_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_banners_video" type="text" name="ULTIMATUMControl_banners_video" value="<?php echo $ULTIMATUMControl_banners_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_banners_video_start" type="text" name="ULTIMATUMControl_banners_video_start" value="<?php echo $ULTIMATUMControl_banners_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_bannersBg1Img" value="<?php echo $ULTIMATUMControl_bannersBg1Img; ?>" id="ULTIMATUMControl_bannersBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_bannersBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_bannersBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_bannersBg1Img', 'ULTIMATUMControl_bannersBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_bannersBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_bannersBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_bannersBg2Img" value="<?php echo $ULTIMATUMControl_bannersBg2Img; ?>" id="ULTIMATUMControl_bannersBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_bannersBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_bannersBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_bannersBg2Img', 'ULTIMATUMControl_bannersBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_bannersBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_bannersBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="ULTIMATUMtabs_module">
        <h2 class="layout"><span>Tabs / Accordions / Toggles module settings</span></h2>
        <div id="tabsmodule2" class="htabs htabs2"> <a href="#ULTIMATUMtabs_tabs"><i class="icon-cogs"></i>Tabs module</a> <a href="#ULTIMATUMtabs_accordion"><i class="icon-cogs"></i>Accordion module</a> <a href="#ULTIMATUMtabs_toggle"><i class="icon-cogs"></i>Toggle module</a> </div>
        <div class="htabs-content no_margin"  id="ULTIMATUMtabs_tabs">
          <h2 class="layout"><span>Tabs module settings</span></h2>
          <table class="form">
            <tr>
              <td>Title color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMtabs_title_color" type="text" name="ULTIMATUMControl_ULTIMATUMtabs_title_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabs_title_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
              <td>Background color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMtabs_background_color" type="text" name="ULTIMATUMControl_ULTIMATUMtabs_background_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabs_background_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMtabs_video" type="text" name="ULTIMATUMControl_ULTIMATUMtabs_video" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabs_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMtabs_video_start" type="text" name="ULTIMATUMControl_ULTIMATUMtabs_video_start" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabs_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
            <tr>
              <td> Paralax main background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMtabsBg1Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabsBg1Img; ?>" id="ULTIMATUMControl_ULTIMATUMtabsBg1Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMtabsBg1Img', 'ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMtabsBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
            <tr>
              <td> Paralax secondary background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMtabsBg2Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMtabsBg2Img; ?>" id="ULTIMATUMControl_ULTIMATUMtabsBg2Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMtabsBg2Img', 'ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMtabsBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
          </table>
        </div>
        <div class="htabs-content no_margin"  id="ULTIMATUMtabs_accordion">
          <h2 class="layout"><span>Accordions module settings</span></h2>
          <table class="form">
            <tr>
              <td>Title color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMaccordion_title_color" type="text" name="ULTIMATUMControl_ULTIMATUMaccordion_title_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordion_title_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
              <td>Background color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMaccordion_background_color" type="text" name="ULTIMATUMControl_ULTIMATUMaccordion_background_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordion_background_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMaccordion_video" type="text" name="ULTIMATUMControl_ULTIMATUMaccordion_video" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordion_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMaccordion_video_start" type="text" name="ULTIMATUMControl_ULTIMATUMaccordion_video_start" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordion_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
            <tr>
              <td> Paralax main background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMaccordionBg1Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordionBg1Img; ?>" id="ULTIMATUMControl_ULTIMATUMaccordionBg1Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMaccordionBg1Img', 'ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMaccordionBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
            <tr>
              <td> Paralax secondary background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMaccordionBg2Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMaccordionBg2Img; ?>" id="ULTIMATUMControl_ULTIMATUMaccordionBg2Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMaccordionBg2Img', 'ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMaccordionBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
          </table>
        </div>
        <div class="htabs-content no_margin"  id="ULTIMATUMtabs_toggle">
          <h2 class="layout"><span>Toggles module settings</span></h2>
          <table class="form">
            <tr>
              <td>Title color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMtoggle_title_color" type="text" name="ULTIMATUMControl_ULTIMATUMtoggle_title_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggle_title_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
              <td>Background color</td>
              <td><input id="ULTIMATUMControl_ULTIMATUMtoggle_background_color" type="text" name="ULTIMATUMControl_ULTIMATUMtoggle_background_color" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggle_background_color; ?>" class="spicy" ></td>
            </tr>
            <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMtoggle_video" type="text" name="ULTIMATUMControl_ULTIMATUMtoggle_video" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggle_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_ULTIMATUMtoggle_video_start" type="text" name="ULTIMATUMControl_ULTIMATUMtoggle_video_start" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggle_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
            <tr>
              <td> Paralax main background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMtoggleBg1Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggleBg1Img; ?>" id="ULTIMATUMControl_ULTIMATUMtoggleBg1Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMtoggleBg1Img', 'ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMtoggleBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
            <tr>
              <td> Paralax secondary background: </td>
              <td><input type="hidden" name="ULTIMATUMControl_ULTIMATUMtoggleBg2Img" value="<?php echo $ULTIMATUMControl_ULTIMATUMtoggleBg2Img; ?>" id="ULTIMATUMControl_ULTIMATUMtoggleBg2Img" />
                <img src="<?php echo $ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview" class="PreviewImage" />
                <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_ULTIMATUMtoggleBg2Img', 'ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_ULTIMATUMtoggleBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="htabs-content no_margin"  id="iconboxes_module">
        <h2 class="layout"><span>Iconboxes module settings</span></h2>
        <table class="form">
          <tr>
            <td>Title color</td>
            <td><input id="ULTIMATUMControl_iconboxes_title_color" type="text" name="ULTIMATUMControl_iconboxes_title_color" value="<?php echo $ULTIMATUMControl_iconboxes_title_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Background color</td>
            <td><input id="ULTIMATUMControl_iconboxes_background_color" type="text" name="ULTIMATUMControl_iconboxes_background_color" value="<?php echo $ULTIMATUMControl_iconboxes_background_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Icons background color</td>
            <td><input id="ULTIMATUMControl_iconboxes_icon_color" type="text" name="ULTIMATUMControl_iconboxes_icon_color" value="<?php echo $ULTIMATUMControl_iconboxes_icon_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
          <tr>
            <td>Video background YouTube URL</td>
            <td><input id="ULTIMATUMControl_iconboxes_video" type="text" name="ULTIMATUMControl_iconboxes_video" value="<?php echo $ULTIMATUMControl_iconboxes_video; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Video start at (in seconds):</td>
            <td><input id="ULTIMATUMControl_iconboxes_video_start" type="text" name="ULTIMATUMControl_iconboxes_video_start" value="<?php echo $ULTIMATUMControl_iconboxes_video_start; ?>" class="spicy" ><span class="helper"><strong>*REQUIRED!!! If you want the video to start from the beginning - type 0! Don't leave the field empty!!!</strong></span></td>
          </tr>
          <tr>
            <td> Paralax main background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_iconboxesBg1Img" value="<?php echo $ULTIMATUMControl_iconboxesBg1Img; ?>" id="ULTIMATUMControl_iconboxesBg1Img" />
              <img src="<?php echo $ULTIMATUMControl_iconboxesBg1Img_preview; ?>" alt="" id="ULTIMATUMControl_iconboxesBg1Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_iconboxesBg1Img', 'ULTIMATUMControl_iconboxesBg1Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_iconboxesBg1Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_iconboxesBg1Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
            <td> Paralax secondary background: </td>
            <td><input type="hidden" name="ULTIMATUMControl_iconboxesBg2Img" value="<?php echo $ULTIMATUMControl_iconboxesBg2Img; ?>" id="ULTIMATUMControl_iconboxesBg2Img" />
              <img src="<?php echo $ULTIMATUMControl_iconboxesBg2Img_preview; ?>" alt="" id="ULTIMATUMControl_iconboxesBg2Img_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_iconboxesBg2Img', 'ULTIMATUMControl_iconboxesBg2Img_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_iconboxesBg2Img_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_iconboxesBg2Img').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="htabs-content" id="tab_layout">
      <h2 class="layout"><span><?php echo $text_general_settings; ?></span></h2>
      <table class="form">
        <tr>
          <td><?php echo $text_site_mode; ?></td>
          <td><select name="ULTIMATUMControl_site_mode" class="spicy">
              <?php if (isset($ULTIMATUMControl_site_mode)) {
              $selected323 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_site_mode=='1'){echo $selected323;} ?>><?php echo $text_mode_store; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_site_mode=='0'){echo $selected323;} ?>><?php echo $text_mode_catalog; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_mode_store; ?></option>
              <option value="0"><?php echo $text_mode_catalog; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_layout_type; ?></td>
          <td><select name="ULTIMATUMControl_layout" class="spicy">
              <?php if (isset($ULTIMATUMControl_layout)) {
              $selected912 = 'selected="selected"';
              ?>
              <option value="full_width_container" <?php if($ULTIMATUMControl_layout=='full_width_container'){echo $selected912;} ?>><?php echo $text_layout_full; ?></option>
              <option value="boxed" <?php if($ULTIMATUMControl_layout=='boxed'){echo $selected912;} ?>><?php echo $text_layout_boxed; ?></option>
              <?php } else { ?>
              <option value="full_width_container" selected="selected"><?php echo $text_layout_full; ?></option>
              <option value="boxed"><?php echo $text_layout_boxed; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Choose skin</td>
          <td><select name="ULTIMATUMControl_skin" class="spicy">
              <?php if (isset($ULTIMATUMControl_skin)) {
              $selected597 = 'selected="selected"';
              ?>
              <option value="stylesheet" <?php if($ULTIMATUMControl_skin=='stylesheet'){echo $selected597;} ?>>Default skin</option>
              <option value="stylesheet_blue" <?php if($ULTIMATUMControl_skin=='stylesheet_blue'){echo $selected597;} ?>>Blue skin</option>
              <option value="stylesheet_green" <?php if($ULTIMATUMControl_skin=='stylesheet_green'){echo $selected597;} ?>>Green skin</option>
              <option value="stylesheet_red" <?php if($ULTIMATUMControl_skin=='stylesheet_red'){echo $selected597;} ?>>Red skin</option>
              <option value="stylesheet_orange" <?php if($ULTIMATUMControl_skin=='stylesheet_orange'){echo $selected597;} ?>>Orange skin</option>
              <option value="stylesheet_magenta" <?php if($ULTIMATUMControl_skin=='stylesheet_magenta'){echo $selected597;} ?>>Magenta skin</option>
              <option value="stylesheet_dark" <?php if($ULTIMATUMControl_skin=='stylesheet_dark'){echo $selected597;} ?>>Dark skin</option>
              <option value="stylesheet_circular" <?php if($ULTIMATUMControl_skin=='stylesheet_circular'){echo $selected597;} ?>>Circular skin</option>
              <option value="stylesheet_kids" <?php if($ULTIMATUMControl_skin=='stylesheet_kids'){echo $selected597;} ?>>Kinder skin</option>
              <option value="stylesheet_auto" <?php if($ULTIMATUMControl_skin=='stylesheet_auto'){echo $selected597;} ?>>Automotive skin</option>
              <option value="stylesheet_travel" <?php if($ULTIMATUMControl_skin=='stylesheet_travel'){echo $selected597;} ?>>Travel agent skin</option>
              <option value="stylesheet_food" <?php if($ULTIMATUMControl_skin=='stylesheet_food'){echo $selected597;} ?>>Food skin</option>
              <?php } else { ?>
              <option value="stylesheet" selected="selected">Default skin</option>
              <option value="stylesheet_blue">Blue skin</option>
              <option value="stylesheet_green">Green skin</option>
              <option value="stylesheet_red">Red skin</option>
              <option value="stylesheet_orange">Orange skin</option>
              <option value="stylesheet_magenta">Magenta skin</option>
              <option value="stylesheet_dark">Dark skin</option>
              <option value="stylesheet_circular">Circular skin</option>
              <option value="stylesheet_kids">Kinder skin</option>
              <option value="stylesheet_auto">Automotive skin</option>
              <option value="stylesheet_travel">Travel agent skin</option>
              <option value="stylesheet_food">Food skin</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_responsive; ?></td>
          <td><select name="ULTIMATUMControl_responsive" class="spicy">
              <?php if (isset($ULTIMATUMControl_responsive)) {
              $selected3013 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_responsive=='1'){echo $selected3013;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_responsive=='0'){echo $selected3013;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Logo Position</td>
          <td><select name="ULTIMATUMControl_logo_position" class="spicy">
              <?php if (isset($ULTIMATUMControl_logo_position)) {
              $selectedLogo = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_logo_position=='1'){echo $selectedLogo;} ?>>Left</option>
              <option value="0" <?php if($ULTIMATUMControl_logo_position=='0'){echo $selectedLogo;} ?>>Center</option>
              <?php } else { ?>
              <option value="1" selected="selected">Left</option>
              <option value="0">Center</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Page preload</td>
          <td><select name="ULTIMATUMControl_preload" class="spicy">
              <?php if (isset($ULTIMATUMControl_preload)) {
              $selectedULTIMATUMControl_preload = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_preload=='1'){echo $selectedULTIMATUMControl_preload;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_preload=='0'){echo $selectedULTIMATUMControl_preload;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
            </tr>
            <tr>
            <td> Preload image: </td>
            <td><input type="hidden" name="ULTIMATUMControl_preloadImg" value="<?php echo $ULTIMATUMControl_preloadImg; ?>" id="ULTIMATUMControl_preloadImg" />
              <img src="<?php echo $ULTIMATUMControl_preloadImg_preview; ?>" alt="" id="ULTIMATUMControl_preloadImg_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_preloadImg', 'ULTIMATUMControl_preloadImg_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_preloadImg_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_preloadImg').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
        </tr>
        
        <tr>
          <td><?php echo $text_new_label; ?></td>
          <td><select name="ULTIMATUMControl_new_label" class="spicy">
              <?php if (isset($ULTIMATUMControl_new_label)) {
              $selected44 = 'selected="selected"';
              ?>
              <option value="0" <?php if($ULTIMATUMControl_new_label=='0'){echo $selected44;} ?>>Disabled</option>
              <option value="10" <?php if($ULTIMATUMControl_new_label=='10'){echo $selected44;} ?>>10</option>
              <option value="20" <?php if($ULTIMATUMControl_new_label=='20'){echo $selected44;} ?>>20</option>
              <option value="30" <?php if($ULTIMATUMControl_new_label=='30'){echo $selected44;} ?>>30</option>
              <option value="45" <?php if($ULTIMATUMControl_new_label=='45'){echo $selected44;} ?>>45</option>
              <option value="60" <?php if($ULTIMATUMControl_new_label=='60'){echo $selected44;} ?>>60</option>
              <option value="90" <?php if($ULTIMATUMControl_new_label=='90'){echo $selected44;} ?>>90</option>
              <?php } else { ?>
              <option value="0">Disabled</option>
              <option value="10" selected="selected">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="45">45</option>
              <option value="60">60</option>
              <option value="90">90</option>
              <?php } ?>
            </select>
        </tr>
        <tr>
          <td><?php echo $text_countdown; ?></td>
          <td><select name="ULTIMATUMControl_countdown" class="spicy">
              <?php if (isset($ULTIMATUMControl_countdown)) {
              $selected4 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_countdown=='1'){echo $selected4;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_countdown=='0'){echo $selected4;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Mark sold products as "SOLD OUT" (non active/can't be purchased)</td>
          <td><select name="ULTIMATUMControl_countdown_sold" class="spicy">
              <?php if (isset($ULTIMATUMControl_countdown_sold)) {
              $selected_sold = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_countdown_sold=='1'){echo $selected_sold;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_countdown_sold=='0'){echo $selected_sold;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Disable wishlist</td>
          <td><select name="ULTIMATUMControl_wish_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_wish_status)) {
              $selected_wish = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_wish_status=='1'){echo $selected_wish;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_wish_status=='0'){echo $selected_wish;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Disable compare</td>
          <td><select name="ULTIMATUMControl_compare_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_compare_status)) {
              $selected_compare = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_compare_status=='1'){echo $selected_compare;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_compare_status=='0'){echo $selected_compare;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Disable affiliates</td>
          <td><select name="ULTIMATUMControl_affiliate_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_affiliate_status)) {
              $selected_affiliate = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_affiliate_status=='1'){echo $selected_affiliate;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_affiliate_status=='0'){echo $selected_affiliate;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>POP-UP Login:</td>
          <td><select name="ULTIMATUMControl_pop_log_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_pop_log_status)) {
              $selected_pop_log_status = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_pop_log_status=='1'){echo $selected_pop_log_status;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_pop_log_status=='0'){echo $selected_pop_log_status;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
      </table>
    </div>
    <div class="htabs-content" id="tab_map">
      <h2 class="layout"><span><?php echo $text_map; ?></span></h2>
      <p><?php echo $text_map_helper; ?></p>
      <table class="form">
        <tr>
          <td><?php echo $map_module; ?></td>
          <td><select name="ULTIMATUMControl_map_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_map_status)) {
              $selectedgfd = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_map_status=='1'){echo $selectedgfd;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_map_status=='0'){echo $selectedgfd;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_latitude; ?></td>
          <td><input id="ULTIMATUMControl_latitude" type="text" name="ULTIMATUMControl_latitude" value="<?php echo $ULTIMATUMControl_latitude; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_longitude; ?></td>
          <td><input id="ULTIMATUMControl_longitude" type="text" name="ULTIMATUMControl_longitude" value="<?php echo $ULTIMATUMControl_longitude; ?>" class="spicy" ></td>
        </tr>
      </table>
      <h2 class="layout"><span>Contact Us page custom content (below map and above phone and address details)</span></h2>
      <table class="form">
          <tr>
            <td>
              <br />              
              
              <div class="htabslang4_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_contact_lang_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_contact_lang_<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_contact<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_contact<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_contact' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_contact' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>
              </td>
          </tr>
        </table>
    </div>
    <div class="htabs-content" id="tab_css">
      <h2 class="layout"><span><?php echo $text_css; ?></span></h2>
      <table class="form">
        <tr>
          <td><?php echo $text_css; ?></td>
          <td><textarea id="ULTIMATUMControl_custom_css" name="ULTIMATUMControl_custom_css" cols="140" rows="8" class="spicy"><?php echo $ULTIMATUMControl_custom_css; ?></textarea></td>
        </tr>
      </table>
    </div>
    <div class="htabs-content" id="tab_category">
      <h2 class="layout"><span>Category page settings</span></h2>
      <table class="form">
        <tr>
          <td>Display category description</td>
          <td><select name="ULTIMATUMControl_cat_desc_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_cat_desc_status)) {
              $selected_cat_desc_status = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_cat_desc_status=='1'){echo $selected_cat_desc_status;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_cat_desc_status=='0'){echo $selected_cat_desc_status;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Display sub-categories (refine search) section</td>
          <td><select name="ULTIMATUMControl_cat_refine_status" class="spicy">
              <?php if (isset($ULTIMATUMControl_cat_refine_status)) {
              $selected_cat_refine_status = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_cat_refine_status=='1'){echo $selected_cat_refine_status;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_cat_refine_status=='0'){echo $selected_cat_refine_status;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Refine search category images:</td>
          <td><select name="ULTIMATUMControl_cat_refine_images" class="spicy">
              <?php if (isset($ULTIMATUMControl_cat_refine_images)) {
              $selected_cat_refine_images = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_cat_refine_images=='1'){echo $selected_cat_refine_images;} ?>>Show</option>
              <option value="0" <?php if($ULTIMATUMControl_cat_refine_images=='0'){echo $selected_cat_refine_images;} ?>>Hide</option>
              <?php } else { ?>
              <option value="1" selected="selected">Show</option>
              <option value="0">Hide</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Refine search image size</td>
          <td>
          <?php if ((isset($ULTIMATUMControl_cat_refine_image_size_w)) && ($ULTIMATUMControl_cat_refine_image_size_w != null)) { ?>
          <input id="ULTIMATUMControl_cat_refine_image_size_w" type="text" name="ULTIMATUMControl_cat_refine_image_size_w" value="<?php echo $ULTIMATUMControl_cat_refine_image_size_w; ?>" class="spicy" >
          <?php } else { ?>
          <input id="ULTIMATUMControl_cat_refine_image_size_w" type="text" name="ULTIMATUMControl_cat_refine_image_size_w" value="80" class="spicy" >
          <?php } ?> x <?php if ((isset($ULTIMATUMControl_cat_refine_image_size_h)) && ($ULTIMATUMControl_cat_refine_image_size_h != null)) { ?>
          <input id="ULTIMATUMControl_cat_refine_image_size_h" type="text" name="ULTIMATUMControl_cat_refine_image_size_h" value="<?php echo $ULTIMATUMControl_cat_refine_image_size_h; ?>" class="spicy" >
          <?php } else { ?>
          <input id="ULTIMATUMControl_cat_refine_image_size_h" type="text" name="ULTIMATUMControl_cat_refine_image_size_h" value="80" class="spicy" >
          <?php } ?> px.</td>
        </tr>
        <tr>
          <td>Change "Sort by:/Display" bar background color</td>
          <td><input id="ULTIMATUMControl_cat_sort_back" type="text" name="ULTIMATUMControl_cat_sort_back" value="<?php echo $ULTIMATUMControl_cat_sort_back; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Change "Sort by:/Display" bar text color</td>
          <td><input id="ULTIMATUMControl_cat_sort_color" type="text" name="ULTIMATUMControl_cat_sort_color" value="<?php echo $ULTIMATUMControl_cat_sort_color; ?>" class="spicy" ></td>
        </tr>
      </table>
    </div>
    <div class="htabs-content" id="tab_product">
      <h2 class="layout"><span><?php echo $text_product_page; ?></span></h2>
      <table class="form">
        <tr>
          <td><?php echo $text_preview_type; ?></td>
          <td><select name="ULTIMATUMControl_preview" class="spicy">
              <?php if (isset($ULTIMATUMControl_preview)) {
              $selected1199 = 'selected="selected"';
              ?>
              <option value="zoom.php" <?php if($ULTIMATUMControl_preview=='zoom.php'){echo $selected1199;} ?>><?php echo $text_zoom; ?></option>
              <option value="colorbox.php" <?php if($ULTIMATUMControl_preview=='colorbox.php'){echo $selected1199;} ?>>iLIGHTBOX</option>
              <?php } else { ?>
              <option value="zoom.php"><?php echo $text_zoom; ?></option>
              <option value="colorbox.php" selected="selected">iLIGHTBOX</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td>Additional images mode:</td>
            <td><select name="ULTIMATUMControl_additional_image_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_additional_image_mode)) {
              $selected_additional_image_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_additional_image_mode=='0'){echo $selected_additional_image_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_additional_image_mode=='1'){echo $selected_additional_image_mode;} ?>>Carousel</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Carousel</option>
                <?php } ?>
              </select></td>
          </tr>
        <tr>
          <td>Play sound when product is added to cart</td>
          <td><select name="ULTIMATUMControl_play_sound" class="spicy">
              <?php if (isset($ULTIMATUMControl_play_sound)) {
              $selectedsound = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_play_sound=='1'){echo $selectedsound;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_play_sound=='0'){echo $selectedsound;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Custom content column on product page</td>
          <td><select name="ULTIMATUMControl_custom_column" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_column)) {
              $selected_custom_column = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_column=='1'){echo $selected_custom_column;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_custom_column=='0'){echo $selected_custom_column;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Display brand logo in custom content column on product page</td>
          <td><select name="ULTIMATUMControl_custom_column_logo" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_column_logo)) {
              $selected_custom_column_logo = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_column_logo=='1'){echo $selected_custom_column_logo;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_custom_column_logo=='0'){echo $selected_custom_column_logo;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Display share buttons on product page</td>
          <td><select name="ULTIMATUMControl_product_share_mode" class="spicy">
              <?php if (isset($ULTIMATUMControl_product_share_mode)) {
              $selected_product_share_mode = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_product_share_mode=='1'){echo $selected_product_share_mode;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_product_share_mode=='0'){echo $selected_product_share_mode;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td>Product listing hover effect /category, manufacturer, search, specials/</td>
            <td><select name="ULTIMATUMControl_listing_hover_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_hover_mode)) {
              $selected_listing_hover_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_listing_hover_mode=='0'){echo $selected_listing_hover_mode;} ?>>Standard</option>
                <option value="1" <?php if($ULTIMATUMControl_listing_hover_mode=='1'){echo $selected_listing_hover_mode;} ?>>Image swap</option>
                <?php } else { ?>
                <option value="0" selected="selected">Standard</option>
                <option value="1">Image swap</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product listings (category, search page, specials page, manufacturer page, related products, also bought products) "Flying" short product description baloon on hover:</td>
            <td><select name="ULTIMATUMControl_listing_flydesc_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_flydesc_mode)) {
              $selected_listing_flydesc_mode = 'selected="selected"';
              ?>
                <option value="1" <?php if($ULTIMATUMControl_listing_flydesc_mode=='1'){echo $selected_listing_flydesc_mode;} ?>><?php echo $text_enabled; ?></option>
                <option value="0" <?php if($ULTIMATUMControl_listing_flydesc_mode=='0'){echo $selected_listing_flydesc_mode;} ?>><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product listing name visibility /category, manufacturer, search, specials/</td>
            <td><select name="ULTIMATUMControl_listing_name_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_name_display)) {
              $selected_listing_name_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_listing_name_display=='0'){echo $selected_listing_name_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_listing_name_display=='1'){echo $selected_listing_name_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product listing price visibility /category, manufacturer, search, specials/</td>
            <td><select name="ULTIMATUMControl_listing_price_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_price_display)) {
              $selected_listing_price_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_listing_price_display=='0'){echo $selected_listing_price_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_listing_price_display=='1'){echo $selected_listing_price_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product listing rating visibility /category, manufacturer, search, specials/</td>
            <td><select name="ULTIMATUMControl_listing_rating_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_rating_display)) {
              $selected_listing_rating_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_listing_rating_display=='0'){echo $selected_listing_rating_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_listing_rating_display=='1'){echo $selected_listing_rating_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Product listing add-to-cart button visibility /category, manufacturer, search, specials/</td>
            <td><select name="ULTIMATUMControl_listing_cart_display" class="spicy">
                <?php if (isset($ULTIMATUMControl_listing_cart_display)) {
              $selected_listing_cart_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_listing_cart_display=='0'){echo $selected_listing_cart_mode;} ?>>Visible</option>
                <option value="1" <?php if($ULTIMATUMControl_listing_cart_display=='1'){echo $selected_listing_cart_mode;} ?>>Hidden</option>
                <?php } else { ?>
                <option value="0" selected="selected">Visible</option>
                <option value="1">Hidden</option>
                <?php } ?>
              </select></td>
          </tr>
        <tr>
          <td><?php echo $text_cart_button_color; ?></td>
          <td><input id="ULTIMATUMControl_cart_button_color" type="text" name="ULTIMATUMControl_cart_button_color" value="<?php echo $ULTIMATUMControl_cart_button_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_wish_button_color; ?></td>
          <td><input id="ULTIMATUMControl_wish_button_color" type="text" name="ULTIMATUMControl_wish_button_color" value="<?php echo $ULTIMATUMControl_wish_button_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_compare_button_color; ?></td>
          <td><input id="ULTIMATUMControl_compare_button_color" type="text" name="ULTIMATUMControl_compare_button_color" value="<?php echo $ULTIMATUMControl_compare_button_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Product page Countdown color</td>
          <td><input id="ULTIMATUMControl_countdown_color" type="text" name="ULTIMATUMControl_countdown_color" value="<?php echo $ULTIMATUMControl_countdown_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_main_price; ?></td>
          <td><input id="ULTIMATUMControl_main_price_color" type="text" name="ULTIMATUMControl_main_price_color" value="<?php echo $ULTIMATUMControl_main_price_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_old_price; ?></td>
          <td><input id="ULTIMATUMControl_old_price_color" type="text" name="ULTIMATUMControl_old_price_color" value="<?php echo $ULTIMATUMControl_old_price_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Product box background color (in modules only - doesn't apply to DEALS module)</td>
          <td><input id="ULTIMATUMControl_prod_hold_back" type="text" name="ULTIMATUMControl_prod_hold_back" value="<?php echo $ULTIMATUMControl_prod_hold_back; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Product name color (in modules)</td>
          <td><input id="ULTIMATUMControl_prod_name_color" type="text" name="ULTIMATUMControl_prod_name_color" value="<?php echo $ULTIMATUMControl_prod_name_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td colspan="2"><h2 class="colors">Product page custom CMS block 1 (above the add to cart button)</h2></td>
          </tr>
                  <tr>
          <td>Status:</td>
          <td><select name="ULTIMATUMControl_product1_cms_block_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_product1_cms_block_state)) {
              $selected_product1_cms_block = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_product1_cms_block_state=='1'){echo $selected_product1_cms_block;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_product1_cms_block_state=='0'){echo $selected_product1_cms_block;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td>Product page custom CMS block 1 background color:</td>
            <td><input id="ULTIMATUMControl_product1_cms_block_background" type="text" name="ULTIMATUMControl_product1_cms_block_background" value="<?php echo $ULTIMATUMControl_product1_cms_block_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Product page custom CMS block 1 text color:</td>
            <td><input id="ULTIMATUMControl_product1_cms_block_color" type="text" name="ULTIMATUMControl_product1_cms_block_color" value="<?php echo $ULTIMATUMControl_product1_cms_block_color; ?>" class="spicy" ></td>
          </tr>
        <tr>
            <td colspan="2"><h2 class="colors">Product page custom CMS block 1 content (supports HTML)</h2>
              <br />
              <div class="htabs_product1_cms_1_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_product1_cms_block_content_lang_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_product1_cms_block_content_lang_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_product1_cms_block_content_1<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_product1_cms_block_content_1<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']}) ? ${'ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>              </td>
          </tr>
          <tr>
          <td colspan="2"><h2 class="colors">Product page custom CMS block 2 (above the product tabs)</h2></td>
          </tr>
                    <tr>
          <td>Status:</td>
          <td><select name="ULTIMATUMControl_product2_cms_block_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_product2_cms_block_state)) {
              $selected_product2_cms_block = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_product2_cms_block_state=='1'){echo $selected_product2_cms_block;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_product2_cms_block_state=='0'){echo $selected_product2_cms_block;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td>Product page custom CMS block 2 background color:</td>
            <td><input id="ULTIMATUMControl_product2_cms_block_background" type="text" name="ULTIMATUMControl_product2_cms_block_background" value="<?php echo $ULTIMATUMControl_product2_cms_block_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Product page custom CMS block 2 text color:</td>
            <td><input id="ULTIMATUMControl_product2_cms_block_color" type="text" name="ULTIMATUMControl_product2_cms_block_color" value="<?php echo $ULTIMATUMControl_product2_cms_block_color; ?>" class="spicy" ></td>
          </tr>
        <tr>
            <td colspan="2"><h2 class="colors">Product page custom CMS block 2 content (supports HTML)</h2>
              <br />
              <div class="htabs_product2_cms_1_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_product2_cms_block_content_lang_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_product2_cms_block_content_lang_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_product2_cms_block_content_1<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_product2_cms_block_content_1<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']}) ? ${'ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>              </td>
          </tr>
      </table>
    </div>
    <div class="htabs-content" id="tab_color">
      <h2 class="colors"><span><?php echo $text_common_colors; ?></span></h2>
      <p><?php echo $text_color_helper; ?></p>
      <table class="form">
        <tr>
          <td><?php echo $text_body_color; ?></td>
          <td><input id="ULTIMATUMControl_body_bg_color" type="text" name="ULTIMATUMControl_body_bg_color" value="<?php echo $ULTIMATUMControl_body_bg_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_body_pattern; ?></td>
          <td><select name="ULTIMATUMControl_body_bg_pattern" class="spicy">
              <?php if (isset($ULTIMATUMControl_body_bg_pattern)) {
                    $selected3 = 'selected="selected"';
            ?>
              <option value="pattern0.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern0.png'){echo $selected3;} ?>>No pattern</option>
              <option value="pattern1.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern1.png'){echo $selected3;} ?>>Pattern 1</option>
              <option value="pattern2.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern2.png'){echo $selected3;} ?>>Pattern 2</option>
              <option value="pattern3.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern3.png'){echo $selected3;} ?>>Pattern 3</option>
              <option value="pattern4.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern4.png'){echo $selected3;} ?>>Pattern 4</option>
              <option value="pattern5.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern5.png'){echo $selected3;} ?>>Pattern 5</option>
              <option value="pattern6.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern6.png'){echo $selected3;} ?>>Pattern 6</option>
              <option value="pattern7.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern7.png'){echo $selected3;} ?>>Pattern 7</option>
              <option value="pattern8.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern8.png'){echo $selected3;} ?>>Pattern 8</option>
              <option value="pattern9.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern9.png'){echo $selected3;} ?>>Pattern 9</option>
              <option value="pattern10.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern10.png'){echo $selected3;} ?>>Pattern 10</option>
              <option value="pattern11.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern11.png'){echo $selected3;} ?>>Pattern 11</option>
              <option value="pattern12.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern12.png'){echo $selected3;} ?>>Pattern 12</option>
              <option value="pattern13.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern13.png'){echo $selected3;} ?>>Pattern 13</option>
              <option value="pattern14.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern14.png'){echo $selected3;} ?>>Pattern 14</option>
              <option value="pattern15.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern15.png'){echo $selected3;} ?>>Pattern 15</option>
              <option value="pattern16.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern16.png'){echo $selected3;} ?>>Pattern 16</option>
              <option value="pattern17.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern17.png'){echo $selected3;} ?>>Pattern 17</option>
              <option value="pattern18.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern18.png'){echo $selected3;} ?>>Pattern 18</option>
              <option value="pattern19.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern19.png'){echo $selected3;} ?>>Pattern 19</option>
              <option value="pattern20.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern20.png'){echo $selected3;} ?>>Pattern 20</option>
              <option value="pattern21.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern21.png'){echo $selected3;} ?>>Pattern 21</option>
              <option value="pattern22.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern22.png'){echo $selected3;} ?>>Pattern 22</option>
              <option value="pattern23.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern23.png'){echo $selected3;} ?>>Pattern 23</option>
              <option value="pattern24.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern24.png'){echo $selected3;} ?>>Pattern 24</option>
              <option value="pattern25.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern25.png'){echo $selected3;} ?>>Pattern 25</option>
              <option value="pattern26.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern26.png'){echo $selected3;} ?>>Pattern 26</option>
              <option value="pattern27.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern27.png'){echo $selected3;} ?>>Pattern 27</option>
              <option value="pattern28.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern28.png'){echo $selected3;} ?>>Pattern 28</option>
              <option value="pattern29.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern29.png'){echo $selected3;} ?>>Pattern 29</option>
              <option value="pattern30.gif" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern30.gif'){echo $selected3;} ?>>Pattern 30</option>
              <option value="pattern31.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern31.png'){echo $selected3;} ?>>Pattern 31</option>
              <option value="pattern32.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern32.png'){echo $selected3;} ?>>Pattern 32</option>
              <option value="pattern33.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern33.png'){echo $selected3;} ?>>Pattern 33</option>
              <option value="pattern34.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern34.png'){echo $selected3;} ?>>Pattern 34</option>
              <option value="pattern35.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern35.png'){echo $selected3;} ?>>Pattern 35</option>
              <option value="pattern36.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern36.png'){echo $selected3;} ?>>Pattern 36</option>
              <option value="pattern37.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern37.png'){echo $selected3;} ?>>Pattern 37</option>
              <option value="pattern38.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern38.png'){echo $selected3;} ?>>Pattern 38</option>
              <option value="pattern39.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern39.png'){echo $selected3;} ?>>Pattern 39</option>
              <option value="pattern40.png" <?php if($ULTIMATUMControl_body_bg_pattern=='pattern40.png'){echo $selected3;} ?>>Pattern 40</option>
              <?php } else { ?>
              <option value="pattern0.png" selected="selected">No pattern</option>
              <option value="pattern1.png">Pattern 1</option>
              <option value="pattern2.png">Pattern 2</option>
              <option value="pattern3.png">Pattern 3</option>
              <option value="pattern4.png">Pattern 4</option>
              <option value="pattern5.png">Pattern 5</option>
              <option value="pattern6.png">Pattern 6</option>
              <option value="pattern7.png">Pattern 7</option>
              <option value="pattern8.png">Pattern 8</option>
              <option value="pattern9.png">Pattern 9</option>
              <option value="pattern10.png">Pattern 10</option>
              <option value="pattern11.png">Pattern 11</option>
              <option value="pattern12.png">Pattern 12</option>
              <option value="pattern13.png">Pattern 13</option>
              <option value="pattern14.png">Pattern 14</option>
              <option value="pattern15.png">Pattern 15</option>
              <option value="pattern16.png">Pattern 16</option>
              <option value="pattern17.png">Pattern 17</option>
              <option value="pattern18.png">Pattern 18</option>
              <option value="pattern19.png">Pattern 19</option>
              <option value="pattern20.png">Pattern 20</option>
              <option value="pattern21.png">Pattern 21</option>
              <option value="pattern22.png">Pattern 22</option>
              <option value="pattern23.png">Pattern 23</option>
              <option value="pattern24.png">Pattern 24</option>
              <option value="pattern25.png">Pattern 25</option>
              <option value="pattern26.png">Pattern 26</option>
              <option value="pattern27.png">Pattern 27</option>
              <option value="pattern28.png">Pattern 28</option>
              <option value="pattern29.png">Pattern 29</option>
              <option value="pattern30.gif">Pattern 30</option>
              <option value="pattern31.png">Pattern 31</option>
              <option value="pattern32.png">Pattern 32</option>
              <option value="pattern33.png">Pattern 33</option>
              <option value="pattern34.png">Pattern 34</option>
              <option value="pattern35.png">Pattern 35</option>
              <option value="pattern36.png">Pattern 36</option>
              <option value="pattern37.png">Pattern 37</option>
              <option value="pattern38.png">Pattern 38</option>
              <option value="pattern39.png">Pattern 39</option>
              <option value="pattern40.png">Pattern 40</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_pattern_samples; ?></td>
          <td><span class="preview prev1"><b>1</b></span> <span class="preview prev2"><b>2</b></span> <span class="preview prev3"><b>3</b></span> <span class="preview prev4"><b>4</b></span> <span class="preview prev5"><b>5</b></span> <span class="preview prev6"><b>6</b></span> <span class="preview prev7"><b>7</b></span> <span class="preview prev8"><b>8</b></span> <span class="preview prev9"><b>9</b></span> <span class="preview prev10"><b>10</b></span> <span class="preview prev11"><b>11</b></span> <span class="preview prev12"><b>12</b></span> <span class="preview prev13"><b>13</b></span> <span class="preview prev14"><b>14</b></span> <span class="preview prev15"><b>15</b></span> <span class="preview prev16"><b>16</b></span> <span class="preview prev17"><b>17</b></span> <span class="preview prev18"><b>18</b></span> <span class="preview prev19"><b>19</b></span> <span class="preview prev20"><b>20</b></span> <span class="preview prev21"><b>21</b></span> <span class="preview prev22"><b>22</b></span> <span class="preview prev23"><b>23</b></span> <span class="preview prev24"><b>24</b></span> <span class="preview prev25"><b>25</b></span> <span class="preview prev26"><b>26</b></span> <span class="preview prev27"><b>27</b></span> <span class="preview prev28"><b>28</b></span> <span class="preview prev29"><b>29</b></span> <span class="preview prev30"><b>30</b></span> <span class="preview prev31"><b>31</b></span> <span class="preview prev32"><b>32</b></span> <span class="preview prev33"><b>33</b></span> <span class="preview prev34"><b>34</b></span> <span class="preview prev35"><b>35</b></span> <span class="preview prev36"><b>36</b></span> <span class="preview prev37"><b>37</b></span> <span class="preview prev38"><b>38</b></span> <span class="preview prev39"><b>39</b></span> <span class="preview prev40"><b>40</b></span></td>
        </tr>
        <tr>
          <td> Upload background pattern: </td>
          <td><input type="hidden" name="ULTIMATUMControl_bodyBgImg" value="<?php echo $ULTIMATUMControl_bodyBgImg; ?>" id="ULTIMATUMControl_bodyBgImg" />
            <img src="<?php echo $ULTIMATUMControl_bodyBgImg_preview; ?>" alt="" id="ULTIMATUMControl_bodyBgImg_preview" class="PreviewImage" />
            <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_bodyBgImg', 'ULTIMATUMControl_bodyBgImg_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_bodyBgImg_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_bodyBgImg').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
        </tr>
        <tr>
          <td><?php echo $text_headings_color; ?>:</td>
          <td><input id="ULTIMATUMControl_headings_color" type="text" name="ULTIMATUMControl_headings_color" value="<?php echo $ULTIMATUMControl_headings_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Page titles color:</td>
          <td><input id="ULTIMATUMControl_pagetitle_title_color" type="text" name="ULTIMATUMControl_pagetitle_title_color" value="<?php echo $ULTIMATUMControl_pagetitle_title_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Modules title color (applies for all modules except in left/right column):</td>
          <td><input id="ULTIMATUMControl_module_headings_color" type="text" name="ULTIMATUMControl_module_headings_color" value="<?php echo $ULTIMATUMControl_module_headings_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Modules title background color (applies for all modules except in left/right column):</td>
          <td><input id="ULTIMATUMControl_module_headings_background" type="text" name="ULTIMATUMControl_module_headings_background" value="<?php echo $ULTIMATUMControl_module_headings_background; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_body_text_color; ?>:</td>
          <td><input id="ULTIMATUMControl_text_color" type="text" name="ULTIMATUMControl_text_color" value="<?php echo $ULTIMATUMControl_text_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_links_color; ?>:</td>
          <td><input id="ULTIMATUMControl_links_color" type="text" name="ULTIMATUMControl_links_color" value="<?php echo $ULTIMATUMControl_links_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_links_hover_color; ?>:</td>
          <td><input id="ULTIMATUMControl_links_color_hover" type="text" name="ULTIMATUMControl_links_color_hover" value="<?php echo $ULTIMATUMControl_links_color_hover; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_buttons_color; ?></td>
          <td><input id="ULTIMATUMControl_buttons_color" type="text" name="ULTIMATUMControl_buttons_color" value="<?php echo $ULTIMATUMControl_buttons_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_buttons_hover_color; ?></td>
          <td><input id="ULTIMATUMControl_buttons_color_hover" type="text" name="ULTIMATUMControl_buttons_color_hover" value="<?php echo $ULTIMATUMControl_buttons_color_hover; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_new_color; ?></td>
          <td><input id="ULTIMATUMControl_new_label_color" type="text" name="ULTIMATUMControl_new_label_color" value="<?php echo $ULTIMATUMControl_new_label_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_save_color; ?></td>
          <td><input id="ULTIMATUMControl_save_label_color" type="text" name="ULTIMATUMControl_save_label_color" value="<?php echo $ULTIMATUMControl_save_label_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_breadcrumb_color; ?></td>
          <td><input id="ULTIMATUMControl_breadcrumb_color" type="text" name="ULTIMATUMControl_breadcrumb_color" value="<?php echo $ULTIMATUMControl_breadcrumb_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Default categories module link color:</td>
          <td><input id="ULTIMATUMControl_default_cat_color" type="text" name="ULTIMATUMControl_default_cat_color" value="<?php echo $ULTIMATUMControl_default_cat_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td>Default categories module link hover color:</td>
          <td><input id="ULTIMATUMControl_default_cat_hover_color" type="text" name="ULTIMATUMControl_default_cat_hover_color" value="<?php echo $ULTIMATUMControl_default_cat_hover_color; ?>" class="spicy" ></td>
        </tr>
      </table>
      <!--  <input type="hidden" name="ULTIMATUMControl_module" value="<?php //echo $ULTIMATUMControl_module; ?>" /> --> 
    </div>
    <div class="htabs-content"  id="tab_header">
      <h2 class="colors"><span><?php echo $text_header_settings; ?></span></h2>
      <p><?php echo $text_color_helper; ?></p>
      <div id="tabsheader" class="htabs htabs2"> <a href="#tab_colors_header"><i class="icon-cogs"></i>Colors and backgrounds</a> <a href="#tab_menu_settings"><i class="icon-cogs"></i>Menu Settings</a> <a href="#tab_custom_main_menu"><i class="icon-cogs"></i>Custom MAIN Menu Items</a> <a href="#tab_custom_top_menu"><i class="icon-cogs"></i>Custom TOP Menu Items</a></div>
      <div class="htabs-content no_margin"  id="tab_colors_header">
        <table class="form">
        <tr>
            <td>Customer support block in top header:</td>
            <td><select name="ULTIMATUMControl_header_support_mode" class="spicy">
                <?php if (isset($ULTIMATUMControl_header_support_mode)) {
              $selected_header_support_mode = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_header_support_mode=='0'){echo $selected_header_support_mode;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_header_support_mode=='1'){echo $selected_header_support_mode;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_disabled; ?></option>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td>Header support block e-mail:</td>
            <td><input id="ULTIMATUMControl_header_support_mail" type="text" name="ULTIMATUMControl_header_support_mail" value="<?php echo $ULTIMATUMControl_header_support_mail; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Header support block phone number:</td>
            <td><input id="ULTIMATUMControl_header_support_phone" type="text" name="ULTIMATUMControl_header_support_phone" value="<?php echo $ULTIMATUMControl_header_support_phone; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_header_top_color; ?>:</td>
            <td><input id="ULTIMATUMControl_header_top_back" type="text" name="ULTIMATUMControl_header_top_back" value="<?php echo $ULTIMATUMControl_header_top_back; ?>" class="spicy" ></td>
          </tr>
        <tr>
            <td>Header top menu background (menu, cart and search area):</td>
            <td><input id="ULTIMATUMControl_header_top_color" type="text" name="ULTIMATUMControl_header_top_color" value="<?php echo $ULTIMATUMControl_header_top_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Header top menu border-bottom (menu, cart and search area):</td>
            <td><input id="ULTIMATUMControl_header_top_border" type="text" name="ULTIMATUMControl_header_top_border" value="<?php echo $ULTIMATUMControl_header_top_border; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_menu_link_color; ?>:</td>
            <td><input id="ULTIMATUMControl_main_menu_color" type="text" name="ULTIMATUMControl_main_menu_color" value="<?php echo $ULTIMATUMControl_main_menu_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_menu_link_hover_color; ?>:</td>
            <td><input id="ULTIMATUMControl_main_menu_hover_color" type="text" name="ULTIMATUMControl_main_menu_hover_color" value="<?php echo $ULTIMATUMControl_main_menu_hover_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Top menu link hover background:</td>
            <td><input id="ULTIMATUMControl_main_menu_hover_back" type="text" name="ULTIMATUMControl_main_menu_hover_back" value="<?php echo $ULTIMATUMControl_main_menu_hover_back; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Top menu > Submenu link hover color:</td>
            <td><input id="ULTIMATUMControl_top_links_hover_color" type="text" name="ULTIMATUMControl_top_links_hover_color" value="<?php echo $ULTIMATUMControl_top_links_hover_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Top menu > Submenu link hover background:</td>
            <td><input id="ULTIMATUMControl_top_links_hover_background" type="text" name="ULTIMATUMControl_top_links_hover_background" value="<?php echo $ULTIMATUMControl_top_links_hover_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Currency link and support block text color:</td>
            <td><input id="ULTIMATUMControl_cur_color" type="text" name="ULTIMATUMControl_cur_color" value="<?php echo $ULTIMATUMControl_cur_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Currency link hover and active color:</td>
            <td><input id="ULTIMATUMControl_cur_hover_color" type="text" name="ULTIMATUMControl_cur_hover_color" value="<?php echo $ULTIMATUMControl_cur_hover_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_header_color; ?></td>
            <td><input id="ULTIMATUMControl_header_bg_color" type="text" name="ULTIMATUMControl_header_bg_color" value="<?php echo $ULTIMATUMControl_header_bg_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_header_pattern; ?></td>
            <td><select name="ULTIMATUMControl_header_bg_pattern" class="spicy">
                <?php if (isset($ULTIMATUMControl_header_bg_pattern)) {
                    $selected313 = 'selected="selected"';
            ?>
                <option value="pattern0.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern0.png'){echo $selected313;} ?>>No pattern</option>
                <option value="pattern1.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern1.png'){echo $selected313;} ?>>Pattern 1</option>
                <option value="pattern2.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern2.png'){echo $selected313;} ?>>Pattern 2</option>
                <option value="pattern3.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern3.png'){echo $selected313;} ?>>Pattern 3</option>
                <option value="pattern4.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern4.png'){echo $selected313;} ?>>Pattern 4</option>
                <option value="pattern5.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern5.png'){echo $selected313;} ?>>Pattern 5</option>
                <option value="pattern6.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern6.png'){echo $selected313;} ?>>Pattern 6</option>
                <option value="pattern7.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern7.png'){echo $selected313;} ?>>Pattern 7</option>
                <option value="pattern8.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern8.png'){echo $selected313;} ?>>Pattern 8</option>
                <option value="pattern9.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern9.png'){echo $selected313;} ?>>Pattern 9</option>
                <option value="pattern10.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern10.png'){echo $selected313;} ?>>Pattern 10</option>
                <option value="pattern11.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern11.png'){echo $selected313;} ?>>Pattern 11</option>
                <option value="pattern12.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern12.png'){echo $selected313;} ?>>Pattern 12</option>
                <option value="pattern13.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern13.png'){echo $selected313;} ?>>Pattern 13</option>
                <option value="pattern14.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern14.png'){echo $selected313;} ?>>Pattern 14</option>
                <option value="pattern15.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern15.png'){echo $selected313;} ?>>Pattern 15</option>
                <option value="pattern16.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern16.png'){echo $selected313;} ?>>Pattern 16</option>
                <option value="pattern17.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern17.png'){echo $selected313;} ?>>Pattern 17</option>
                <option value="pattern18.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern18.png'){echo $selected313;} ?>>Pattern 18</option>
                <option value="pattern19.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern19.png'){echo $selected313;} ?>>Pattern 19</option>
                <option value="pattern20.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern20.png'){echo $selected313;} ?>>Pattern 20</option>
                <option value="pattern21.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern21.png'){echo $selected313;} ?>>Pattern 21</option>
                <option value="pattern22.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern22.png'){echo $selected313;} ?>>Pattern 22</option>
                <option value="pattern23.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern23.png'){echo $selected313;} ?>>Pattern 23</option>
                <option value="pattern24.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern24.png'){echo $selected313;} ?>>Pattern 24</option>
                <option value="pattern25.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern25.png'){echo $selected313;} ?>>Pattern 25</option>
                <option value="pattern26.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern26.png'){echo $selected313;} ?>>Pattern 26</option>
                <option value="pattern27.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern27.png'){echo $selected313;} ?>>Pattern 27</option>
                <option value="pattern28.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern28.png'){echo $selected313;} ?>>Pattern 28</option>
                <option value="pattern29.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern29.png'){echo $selected313;} ?>>Pattern 29</option>
                <option value="pattern30.gif" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern30.gif'){echo $selected313;} ?>>Pattern 30</option>
                <option value="pattern31.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern31.png'){echo $selected313;} ?>>Pattern 31</option>
                <option value="pattern32.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern32.png'){echo $selected313;} ?>>Pattern 32</option>
                <option value="pattern33.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern33.png'){echo $selected313;} ?>>Pattern 33</option>
                <option value="pattern34.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern34.png'){echo $selected313;} ?>>Pattern 34</option>
                <option value="pattern35.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern35.png'){echo $selected313;} ?>>Pattern 35</option>
                <option value="pattern36.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern36.png'){echo $selected313;} ?>>Pattern 36</option>
                <option value="pattern37.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern37.png'){echo $selected313;} ?>>Pattern 37</option>
                <option value="pattern38.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern38.png'){echo $selected313;} ?>>Pattern 38</option>
                <option value="pattern39.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern39.png'){echo $selected313;} ?>>Pattern 39</option>
                <option value="pattern40.png" <?php if($ULTIMATUMControl_header_bg_pattern=='pattern40.png'){echo $selected313;} ?>>Pattern 40</option>
                <?php } else { ?>
                <option value="pattern0.png" selected="selected">No pattern</option>
                <option value="pattern1.png">Pattern 1</option>
                <option value="pattern2.png">Pattern 2</option>
                <option value="pattern3.png">Pattern 3</option>
                <option value="pattern4.png">Pattern 4</option>
                <option value="pattern5.png">Pattern 5</option>
                <option value="pattern6.png">Pattern 6</option>
                <option value="pattern7.png">Pattern 7</option>
                <option value="pattern8.png">Pattern 8</option>
                <option value="pattern9.png">Pattern 9</option>
                <option value="pattern10.png">Pattern 10</option>
                <option value="pattern11.png">Pattern 11</option>
                <option value="pattern12.png">Pattern 12</option>
                <option value="pattern13.png">Pattern 13</option>
                <option value="pattern14.png">Pattern 14</option>
                <option value="pattern15.png">Pattern 15</option>
                <option value="pattern16.png">Pattern 16</option>
                <option value="pattern17.png">Pattern 17</option>
                <option value="pattern18.png">Pattern 18</option>
                <option value="pattern19.png">Pattern 19</option>
                <option value="pattern20.png">Pattern 20</option>
                <option value="pattern21.png">Pattern 21</option>
                <option value="pattern22.png">Pattern 22</option>
                <option value="pattern23.png">Pattern 23</option>
                <option value="pattern24.png">Pattern 24</option>
                <option value="pattern25.png">Pattern 25</option>
                <option value="pattern26.png">Pattern 26</option>
                <option value="pattern27.png">Pattern 27</option>
                <option value="pattern28.png">Pattern 28</option>
                <option value="pattern29.png">Pattern 29</option>
                <option value="pattern30.gif">Pattern 30</option>
                <option value="pattern31.png">Pattern 31</option>
                <option value="pattern32.png">Pattern 32</option>
                <option value="pattern33.png">Pattern 33</option>
                <option value="pattern34.png">Pattern 34</option>
                <option value="pattern35.png">Pattern 35</option>
                <option value="pattern36.png">Pattern 36</option>
                <option value="pattern37.png">Pattern 37</option>
                <option value="pattern38.png">Pattern 38</option>
                <option value="pattern39.png">Pattern 39</option>
                <option value="pattern40.png">Pattern 40</option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $text_pattern_samples; ?></td>
            <td><span class="preview prev1"><b>1</b></span> <span class="preview prev2"><b>2</b></span> <span class="preview prev3"><b>3</b></span> <span class="preview prev4"><b>4</b></span> <span class="preview prev5"><b>5</b></span> <span class="preview prev6"><b>6</b></span> <span class="preview prev7"><b>7</b></span> <span class="preview prev8"><b>8</b></span> <span class="preview prev9"><b>9</b></span> <span class="preview prev10"><b>10</b></span> <span class="preview prev11"><b>11</b></span> <span class="preview prev12"><b>12</b></span> <span class="preview prev13"><b>13</b></span> <span class="preview prev14"><b>14</b></span> <span class="preview prev15"><b>15</b></span> <span class="preview prev16"><b>16</b></span> <span class="preview prev17"><b>17</b></span> <span class="preview prev18"><b>18</b></span> <span class="preview prev19"><b>19</b></span> <span class="preview prev20"><b>20</b></span> <span class="preview prev21"><b>21</b></span> <span class="preview prev22"><b>22</b></span> <span class="preview prev23"><b>23</b></span> <span class="preview prev24"><b>24</b></span> <span class="preview prev25"><b>25</b></span> <span class="preview prev26"><b>26</b></span> <span class="preview prev27"><b>27</b></span> <span class="preview prev28"><b>28</b></span> <span class="preview prev29"><b>29</b></span> <span class="preview prev30"><b>30</b></span> <span class="preview prev31"><b>31</b></span> <span class="preview prev32"><b>32</b></span> <span class="preview prev33"><b>33</b></span> <span class="preview prev34"><b>34</b></span> <span class="preview prev35"><b>35</b></span> <span class="preview prev36"><b>36</b></span> <span class="preview prev37"><b>37</b></span> <span class="preview prev38"><b>38</b></span> <span class="preview prev39"><b>39</b></span> <span class="preview prev40"><b>40</b></span></td>
          </tr>
          <tr>
            <td> Upload custom header background image or pattern: </td>
            <td><input type="hidden" name="ULTIMATUMControl_HeaderBgImg" value="<?php echo $ULTIMATUMControl_HeaderBgImg; ?>" id="ULTIMATUMControl_HeaderBgImg" />
              <img src="<?php echo $ULTIMATUMControl_HeaderBgImg_preview; ?>" alt="" id="ULTIMATUMControl_HeaderBgImg_preview" class="PreviewImage" />
              <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_HeaderBgImg', 'ULTIMATUMControl_HeaderBgImg_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_HeaderBgImg_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_HeaderBgImg').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
          </tr>
          <tr>
          <td>Custom header background image position</td>
          <td><select name="ULTIMATUMControl_header_back_position" class="spicy">
              <?php if (isset($ULTIMATUMControl_header_back_position)) {
              $selected_header_back_position = 'selected="selected"';
              ?>
              <option value="top left repeat" <?php if($ULTIMATUMControl_header_back_position=='top left repeat'){echo $selected_header_back_position;} ?>>Top Left Repeat</option>
              <option value="top left no-repeat" <?php if($ULTIMATUMControl_header_back_position=='top left no-repeat'){echo $selected_header_back_position;} ?>>Top Left No-repeat</option>
              <option value="center center repeat" <?php if($ULTIMATUMControl_header_back_position=='center center repeat'){echo $selected_header_back_position;} ?>>Center Center Repeat</option>
              <option value="center center no-repeat" <?php if($ULTIMATUMControl_header_back_position=='center center no-repeat'){echo $selected_header_back_position;} ?>>Center Center No-repeat</option>
              <option value="top center repeat" <?php if($ULTIMATUMControl_header_back_position=='top center repeat'){echo $selected_header_back_position;} ?>>Top Center Repeat</option>
              <option value="top center no-repeat" <?php if($ULTIMATUMControl_header_back_position=='top center no-repeat'){echo $selected_header_back_position;} ?>>Top Center No-repeat</option>
              <option value="bottom center repeat" <?php if($ULTIMATUMControl_header_back_position=='bottom center repeat'){echo $selected_header_back_position;} ?>>Bottom Center Repeat</option>
              <option value="bottom center no-repeat" <?php if($ULTIMATUMControl_header_back_position=='bottom center no-repeat'){echo $selected_header_back_position;} ?>>Bottom Center No-repeat</option>
              <?php } else { ?>
              <option value="top left repeat">Top Left Repeat</option>
              <option value="top left no-repeat">Top Left No-repeat</option>
              <option value="center center repeat">Center Center Repeat</option>
              <option value="center center no-repeat">Center Center No-repeat</option>
              <option value="top center repeat">Top Center Repeat</option>
              <option value="top center no-repeat">Top Center No-repeat</option>
              <option value="bottom center repeat">Bottom Center Repeat</option>
              <option value="bottom center no-repeat">Bottom Center No-repeat</option>
              <?php } ?>
            </select></td>
        </tr>
          <tr>
            <td><?php echo $text_menu_icon_back; ?>:</td>
            <td><input id="ULTIMATUMControl_menu_icon_back" type="text" name="ULTIMATUMControl_menu_icon_back" value="<?php echo $ULTIMATUMControl_menu_icon_back; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><?php echo $text_cart_icon_back; ?>:</td>
            <td><input id="ULTIMATUMControl_cart_icon_back" type="text" name="ULTIMATUMControl_cart_icon_back" value="<?php echo $ULTIMATUMControl_cart_icon_back; ?>" class="spicy" ></td>
          </tr>
          
          <tr>
          <td>Header Top custom CMS block:</td>
          <td><select name="ULTIMATUMControl_header_cms_block" class="spicy">
              <?php if (isset($ULTIMATUMControl_header_cms_block)) {
              $selected_header_cms_block = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_header_cms_block=='1'){echo $selected_header_cms_block;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_header_cms_block=='0'){echo $selected_header_cms_block;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Header Top custom CMS block initial state:</td>
          <td><select name="ULTIMATUMControl_header_cms_block_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_header_cms_block_state)) {
              $selected_header_cms_block_state = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_header_cms_block_state=='1'){echo $selected_header_cms_block_state;} ?>>Opened</option>
              <option value="0" <?php if($ULTIMATUMControl_header_cms_block_state=='0'){echo $selected_header_cms_block_state;} ?>>Closed</option>
              <?php } else { ?>
              <option value="1">Opened</option>
              <option value="0" selected="selected">Closed</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td>Header Top custom CMS block background color:</td>
            <td><input id="ULTIMATUMControl_header_cms_block_background" type="text" name="ULTIMATUMControl_header_cms_block_background" value="<?php echo $ULTIMATUMControl_header_cms_block_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Header Top custom CMS block text color:</td>
            <td><input id="ULTIMATUMControl_header_cms_block_color" type="text" name="ULTIMATUMControl_header_cms_block_color" value="<?php echo $ULTIMATUMControl_header_cms_block_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Header Top custom CMS block open/close button background color:</td>
            <td><input id="ULTIMATUMControl_header_cms_button_color" type="text" name="ULTIMATUMControl_header_cms_button_color" value="<?php echo $ULTIMATUMControl_header_cms_button_color; ?>" class="spicy" ></td>
          </tr>
        <tr>
            <td colspan="2"><h2 class="colors">Header Top custom CMS block content (supports HTML)</h2>
              <br />
              <div class="htabs_header_cms_1_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_header_cms_block_content_lang_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_header_cms_block_content_lang_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_header_cms_block_content_1<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_header_cms_block_content_1<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']}) ? ${'ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>              </td>
          </tr>
        </table>
      </div>
      
      
      <div class="htabs-content no_margin"  id="tab_custom_top_menu">
      
<h2 class="colors"><span>Custom TOP menu links</span></h2>
<p>Create up to 3 custom links in TOP menu.</p>


        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 1</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 1</p>
              <br />
              <div class="htabslang1_top">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_top_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_top_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_top_1<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_top_1<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_top_1' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?>
              </td>
              </tr>
              
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 1</p>
              <br />
              
              <input id="ULTIMATUMControl_custom_top_link_1" type="text" name="ULTIMATUMControl_custom_top_link_1" value="<?php echo $ULTIMATUMControl_custom_top_link_1; ?>" class="spicy" ></td>
          </tr>
        </table>
        
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 2</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 2</p>
              <br />
              <div class="htabslang2_top">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_top_2-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_top_2-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_top_2<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_top_2<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_top_2' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?>
              </td>
              </tr>
              
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 2</p>
              <br />
              
              <input id="ULTIMATUMControl_custom_top_link_2" type="text" name="ULTIMATUMControl_custom_top_link_2" value="<?php echo $ULTIMATUMControl_custom_top_link_2; ?>" class="spicy" ></td>
          </tr>
        </table>
        
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 3</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 3</p>
              <br />
              <div class="htabslang3_top">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_top_3-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_top_3-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_top_3<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_top_3<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_top_3' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?>
              </td>
              </tr>
              
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 3</p>
              <br />
              
              <input id="ULTIMATUMControl_custom_top_link_3" type="text" name="ULTIMATUMControl_custom_top_link_3" value="<?php echo $ULTIMATUMControl_custom_top_link_3; ?>" class="spicy" ></td>
          </tr>
        </table>
      </div>
      
      
            <div class="htabs-content no_margin"  id="tab_custom_main_menu">
      

          <h2 class="colors"><span><?php echo $ULTIMATUMControl_custom_menu_heading; ?></span></h2>
        <p><?php echo $ULTIMATUMControl_custom_menu_helper; ?></p>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 1</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 1</p>
              <br />
              <div class="htabslang1">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_1<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_1<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_1' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?>
              </td>
              </tr>
              <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_1_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_1_state)) {
              $selectedstate1 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_1_state=='1'){echo $selectedstate1;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_1_state=='0'){echo $selectedstate1;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 1</p>
              <br />
              
              <input id="ULTIMATUMControl_custom_link_1" type="text" name="ULTIMATUMControl_custom_link_1" value="<?php echo $ULTIMATUMControl_custom_link_1; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 1</p>
              <br />
              <div class="htabslang1_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_1<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_1<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_1' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_1' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>              </td>
          </tr>
        </table>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 2</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 2</p>
              <br />
              <div class="htabslang2">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_2-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_2-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_2<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_2<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_2' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?>
              </td>
          </tr>
          <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_2_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_2_state)) {
              $selectedstate2 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_2_state=='1'){echo $selectedstate2;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_2_state=='0'){echo $selectedstate2;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 2</p>
              <br />
              <input id="ULTIMATUMControl_custom_link_2" type="text" name="ULTIMATUMControl_custom_link_2" value="<?php echo $ULTIMATUMControl_custom_link_2; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 2</p>
              <br />
              <div class="htabslang2_2">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang2_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang2_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_2<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_2<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_2' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_2' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?></td>
          </tr>
        </table>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 3</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 3</p>
              <br />
              <div class="htabslang3">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_3-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_3-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_3<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_3<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_3' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?></td>
          </tr>
          <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_3_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_3_state)) {
              $selectedstate3 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_3_state=='1'){echo $selectedstate3;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_3_state=='0'){echo $selectedstate3;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 3</p>
              <br />
              <input id="ULTIMATUMControl_custom_link_3" type="text" name="ULTIMATUMControl_custom_link_3" value="<?php echo $ULTIMATUMControl_custom_link_3; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 3</p>
              <br />
              <div class="htabslang3_2">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang3_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang3_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_3<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_3<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_3' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_3' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?></textarea></td>
          </tr>
        </table>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 4</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 4</p>
              <br />
              <div class="htabslang7">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_4-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_4-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_4<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_4<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_4' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?></td>
          </tr>
          <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_4_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_4_state)) {
              $selectedstate4 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_4_state=='1'){echo $selectedstate4;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_4_state=='0'){echo $selectedstate4;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 4</p>
              <br />
              <input id="ULTIMATUMControl_custom_link_4" type="text" name="ULTIMATUMControl_custom_link_4" value="<?php echo $ULTIMATUMControl_custom_link_4; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 4</p>
              <br />
              <div class="htabslang7_2">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang4_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang4_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_4<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_4<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_4' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_4' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?></textarea></td>
          </tr>
        </table>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 5</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 5</p>
              <br />
              <div class="htabslang8">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_5-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_5-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_5<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_5<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_5' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?></td>
          </tr>
          <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_5_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_5_state)) {
              $selectedstate5 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_5_state=='1'){echo $selectedstate5;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_5_state=='0'){echo $selectedstate5;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 5</p>
              <br />
              <input id="ULTIMATUMControl_custom_link_5" type="text" name="ULTIMATUMControl_custom_link_5" value="<?php echo $ULTIMATUMControl_custom_link_5; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 5</p>
              <br />
              <div class="htabslang8_2">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang5_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang5_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_5<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_5<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_5' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_5' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?></textarea></td>
          </tr>
        </table>
        <table class="form">
          <tr>
            <td><h3><?php echo $ULTIMATUMControl_custom_menu; ?> 6</h3></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_title; ?> 6</p>
              <br />
              <div class="htabslang9">
              <?php foreach ($languages as $language) { ?>
                  <a href="#custom_menu_6-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
<?php } ?>
</div>
              <?php foreach ($languages as $language) { ?>
              <div id="custom_menu_6-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <input id="ULTIMATUMControl_custom_menu_6<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_custom_menu_6<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_custom_menu_6' . $language['language_id']}; ?>" class="spicy" >
              </div>
              <?php } ?></td>
          </tr>
          <tr>
              <td><p>Submenu state:</p>
              <br />
              <select name="ULTIMATUMControl_custom_menu_6_state" class="spicy">
              <?php if (isset($ULTIMATUMControl_custom_menu_6_state)) {
              $selectedstate6 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_custom_menu_6_state=='1'){echo $selectedstate6;} ?>>Classic drop-down</option>
              <option value="0" <?php if($ULTIMATUMControl_custom_menu_6_state=='0'){echo $selectedstate6;} ?>>Mega menu</option>
              <?php } else { ?>
              <option value="1" selected="selected">Classic drop-down</option>
              <option value="0">Mega menu</option>
              <?php } ?>
            </select></td>
            </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_link; ?> 6</p>
              <br />
              <input id="ULTIMATUMControl_custom_link_6" type="text" name="ULTIMATUMControl_custom_link_6" value="<?php echo $ULTIMATUMControl_custom_link_6; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td><p><?php echo $ULTIMATUMControl_custom_submenu; ?> 6</p>
              <br />
              <div class="htabslang9_2">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_custom_submenu_lang6_1-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_custom_submenu_lang6_1-<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_custom_submenu_6<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_custom_submenu_6<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_custom_submenu_6' . $language['language_id']}) ? ${'ULTIMATUMControl_custom_submenu_6' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?></textarea></td>
          </tr>
        </table>
      </div>
      <div class="htabs-content no_margin"  id="tab_menu_settings">
      
      
      
      <table class="form"> 
      
        <tr>
          <td>Link to Blog in top menu:</td>
          <td><select name="ULTIMATUMControl_blog_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_blog_link)) {
              $selected590 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_blog_link=='1'){echo $selected590;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_blog_link=='0'){echo $selected590;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Link to Account in top menu:</td>
          <td><select name="ULTIMATUMControl_account_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_account_link)) {
              $selected_account_link = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_account_link=='1'){echo $selected_account_link;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_account_link=='0'){echo $selected_account_link;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Information pages in top menu:</td>
          <td><select name="ULTIMATUMControl_information_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_information_link)) {
              $selected595 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_information_link=='1'){echo $selected595;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_information_link=='0'){echo $selected595;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Link to Contacts page in top menu:</td>
          <td><select name="ULTIMATUMControl_contact_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_contact_link)) {
              $selected_contact_link = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_contact_link=='1'){echo $selected_contact_link;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_contact_link=='0'){echo $selected_contact_link;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Show currency and language block in header:</td>
          <td><select name="ULTIMATUMControl_curlang_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_curlang_link)) {
              $selected_curlang_link = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_curlang_link=='1'){echo $selected_curlang_link;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_curlang_link=='0'){echo $selected_curlang_link;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Main menu enabled/disabled:</td>
          <td><select name="ULTIMATUMControl_top_menu" class="spicy">
              <?php if (isset($ULTIMATUMControl_top_menu)) {
              $selected5959 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_top_menu=='1'){echo $selected5959;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_top_menu=='0'){echo $selected5959;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Link to special offers in main menu</td>
          <td><select name="ULTIMATUMControl_specials_link" class="spicy">
              <?php if (isset($ULTIMATUMControl_specials_link)) {
              $selected6 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_specials_link=='1'){echo $selected6;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_specials_link=='0'){echo $selected6;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Show brands in main menu</td>
          <td><select name="ULTIMATUMControl_brands" class="spicy">
              <?php if (isset($ULTIMATUMControl_brands)) {
              $selected979 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_brands=='1'){echo $selected979;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_brands=='0'){echo $selected979;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Show 1st level category thumb and description in main menu</td>
          <td><select name="ULTIMATUMControl_menuthumb" class="spicy">
              <?php if (isset($ULTIMATUMControl_menuthumb)) {
              $ULTIMATUMControl_menuthumbselected979 = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_menuthumb=='1'){echo $ULTIMATUMControl_menuthumbselected979;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_menuthumb=='0'){echo $ULTIMATUMControl_menuthumbselected979;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td>Sticky Header</td>
          <td><select name="ULTIMATUMControl_sticky_menu" class="spicy">
              <?php if (isset($ULTIMATUMControl_sticky_menu)) {
              $selectedsticky = 'selected="selected"';
              ?>
              <option value="1" <?php if($ULTIMATUMControl_sticky_menu=='1'){echo $selectedsticky;} ?>><?php echo $text_enabled; ?></option>
              <option value="0" <?php if($ULTIMATUMControl_sticky_menu=='0'){echo $selectedsticky;} ?>><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
      </table>
      
      <h2 class="colors"><span>Responsive TOP menu title</span></h2>
        <p>Choose a title for each language</p>
      <table class="form">
            <td>Title:</td>
              
              <td><?php foreach ($languages as $language) { ?>
              <div id="custom_menu_top_3-<?php echo $language['language_id']; ?>">
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?><br><br>
<input id="ULTIMATUMControl_menu_label<?php echo $language['language_id']; ?>" type="text" name="ULTIMATUMControl_menu_label<?php echo $language['language_id']; ?>" value="<?php echo ${'ULTIMATUMControl_menu_label' . $language['language_id']}; ?>" class="spicy" style="width:250px !important; margin:0 !important;" >
              </div><br><br>
              <?php } ?>
              </td>
              </tr>
        </table>
      
      
      <h2 class="colors"><span>CATEGORIES SUBMENU WIDTH (number of columns)</span></h2>
        <p>Choose the width of the subcategories container (1, 2 or 3 columns)</p>
        <table class="form">
        <tr>
            <td>Set columns:</td>
            <td>
            <select name="ULTIMATUMControl_submenu_columns" class="spicy">
                <?php if (isset($ULTIMATUMControl_submenu_columns)) {
              $selected_submenu_columns = 'selected="selected"';
              ?>
                <option value="170" <?php if($ULTIMATUMControl_submenu_columns=='170'){echo $selected_submenu_columns;} ?>>1 column (170px)</option>
                <option value="340" <?php if($ULTIMATUMControl_submenu_columns=='340'){echo $selected_submenu_columns;} ?>>2 columns (340px)</option>
                <option value="510" <?php if($ULTIMATUMControl_submenu_columns=='510'){echo $selected_submenu_columns;} ?>>3 columns (510px)</option>
                <?php } else { ?>
                <option value="170">1 column (170px)</option>
                <option value="340" selected="selected">2 columns (340px)</option>
                <option value="510">3 columns (510px)</option>
                <?php } ?>
              </select>
            </td>
          </tr>
</table>


<h2 class="colors"><span>BRANDS SUBMENU WIDTH (number of columns)</span></h2>
        <p>Choose the width of the brands sub-menu container (1, 2 or 3 columns)</p>
        <table class="form">
        <tr>
            <td>Set columns:</td>
            <td>
            <select name="ULTIMATUMControl_brandmenu_columns" class="spicy">
                <?php if (isset($ULTIMATUMControl_brandmenu_columns)) {
              $selected_brandmenu_columns = 'selected="selected"';
              ?>
                <option value="170" <?php if($ULTIMATUMControl_brandmenu_columns=='170'){echo $selected_brandmenu_columns;} ?>>1 column (170px)</option>
                <option value="340" <?php if($ULTIMATUMControl_brandmenu_columns=='340'){echo $selected_brandmenu_columns;} ?>>2 columns (340px)</option>
                <option value="510" <?php if($ULTIMATUMControl_brandmenu_columns=='510'){echo $selected_brandmenu_columns;} ?>>3 columns (510px)</option>
                <?php } else { ?>
                <option value="170">1 column (170px)</option>
                <option value="340">2 columns (340px)</option>
                <option value="510">3 columns (510px)</option>
                <?php } ?>
              </select>
            </td>
          </tr>
</table>
      
      
      <h2 class="colors"><span>THE WHOLE MAIN MENU BACKGROUND COLOR</span></h2>
        <p>Choose the background color of the menu bar</p>
        <table class="form">
        <tr>
            <td>Main menu bar background color:</td>
            <td width="220" colspan="2">Color: <input id="ULTIMATUMControl_menu_bar_background" type="text" name="ULTIMATUMControl_menu_bar_background" value="<?php echo $ULTIMATUMControl_menu_bar_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Main menu bar border-top color and thickness:</td>
            <td width="220">Color: <input id="ULTIMATUMControl_menu_bar_border_top" type="text" name="ULTIMATUMControl_menu_bar_border_top" value="<?php echo $ULTIMATUMControl_menu_bar_border_top; ?>" class="spicy" ></td>
            <td>Thickness: <input id="ULTIMATUMControl_menu_bar_border_top_thicknes" type="text" name="ULTIMATUMControl_menu_bar_border_top_thicknes" value="<?php echo $ULTIMATUMControl_menu_bar_border_top_thicknes; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Main menu bar border-bottom color and thickness:</td>
            <td width="220">Color: <input id="ULTIMATUMControl_menu_bar_border_bottom" type="text" name="ULTIMATUMControl_menu_bar_border_bottom" value="<?php echo $ULTIMATUMControl_menu_bar_border_bottom; ?>" class="spicy" ></td>
            <td>Thickness: <input id="ULTIMATUMControl_menu_bar_border_bottom_thicknes" type="text" name="ULTIMATUMControl_menu_bar_border_bottom_thicknes" value="<?php echo $ULTIMATUMControl_menu_bar_border_bottom_thicknes; ?>" class="spicy" ></td>
          </tr>
          </table>
      <h2 class="colors"><span>SHOP CATEGORIES BACKGROUND COLOR</span></h2>
        <p>Choose the background color of shop categories in the main menu (Brands, Specials and Custom menu items NOT affected!)</p>
        <table class="form">
        <tr>
            <td>1st level Categories background color:</td>
            <td><input id="ULTIMATUMControl_shop_cats_background" type="text" name="ULTIMATUMControl_shop_cats_background" value="<?php echo $ULTIMATUMControl_shop_cats_background; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>1st level Categories text color:</td>
            <td><input id="ULTIMATUMControl_shop_cats_color" type="text" name="ULTIMATUMControl_shop_cats_color" value="<?php echo $ULTIMATUMControl_shop_cats_color; ?>" class="spicy" ></td>
          </tr>
          </table>
          <h2 class="colors"><span>OTHER MENU ITEM'S COLOR SETTINGS</span></h2>
        <p>Choose the color settings of all other items in the main menu (Brands, Specials and Custom menu items)</p>
        <table class="form">
          <tr>
            <td>Main menu link color (this setting would be overwritten if "1st level Categories text color" is set):</td>
            <td><input id="ULTIMATUMControl_category_menu_color" type="text" name="ULTIMATUMControl_category_menu_color" value="<?php echo $ULTIMATUMControl_category_menu_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Main menu link hover color (this setting would be overwritten if "1st level Categories background color" is set):</td>
            <td><input id="ULTIMATUMControl_category_menu_hover_color" type="text" name="ULTIMATUMControl_category_menu_hover_color" value="<?php echo $ULTIMATUMControl_category_menu_hover_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>Main menu link hover background (applies to all menu items even if "1st level Categories background color" is set):</td>
            <td><input id="ULTIMATUMControl_category_menu_hover_background" type="text" name="ULTIMATUMControl_category_menu_hover_background" value="<?php echo $ULTIMATUMControl_category_menu_hover_background; ?>" class="spicy" ></td>
          </tr>
</table>
      
      
        
        <h2 class="colors"><span>CUSTOM MENU ITEM'S LABELS/TAGS:</span></h2>
        <p>Create custom tags (e.g. HOT, NEW, SALE etc.) for top level menu items</p>
        <table class="form">
        <tr>
            <td>1st Menu item custom label:</td>
            <td width="150px"><input id="ULTIMATUMControl_cat1_label" type="text" name="ULTIMATUMControl_cat1_label" value="<?php echo $ULTIMATUMControl_cat1_label; ?>" class="spicy" ></td>
            <td width="140px">Label background color:</td>
            <td><input id="ULTIMATUMControl_cat1_color" type="text" name="ULTIMATUMControl_cat1_color" value="<?php echo $ULTIMATUMControl_cat1_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>2nd Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat2_label" type="text" name="ULTIMATUMControl_cat2_label" value="<?php echo $ULTIMATUMControl_cat2_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat2_color" type="text" name="ULTIMATUMControl_cat2_color" value="<?php echo $ULTIMATUMControl_cat2_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>3rd Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat3_label" type="text" name="ULTIMATUMControl_cat3_label" value="<?php echo $ULTIMATUMControl_cat3_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat3_color" type="text" name="ULTIMATUMControl_cat3_color" value="<?php echo $ULTIMATUMControl_cat3_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>4th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat4_label" type="text" name="ULTIMATUMControl_cat4_label" value="<?php echo $ULTIMATUMControl_cat4_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat4_color" type="text" name="ULTIMATUMControl_cat4_color" value="<?php echo $ULTIMATUMControl_cat4_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>5th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat5_label" type="text" name="ULTIMATUMControl_cat5_label" value="<?php echo $ULTIMATUMControl_cat5_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat5_color" type="text" name="ULTIMATUMControl_cat5_color" value="<?php echo $ULTIMATUMControl_cat5_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>6th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat6_label" type="text" name="ULTIMATUMControl_cat6_label" value="<?php echo $ULTIMATUMControl_cat6_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat6_color" type="text" name="ULTIMATUMControl_cat6_color" value="<?php echo $ULTIMATUMControl_cat6_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>7th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat7_label" type="text" name="ULTIMATUMControl_cat7_label" value="<?php echo $ULTIMATUMControl_cat7_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat7_color" type="text" name="ULTIMATUMControl_cat7_color" value="<?php echo $ULTIMATUMControl_cat7_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>8th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat8_label" type="text" name="ULTIMATUMControl_cat8_label" value="<?php echo $ULTIMATUMControl_cat8_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat8_color" type="text" name="ULTIMATUMControl_cat8_color" value="<?php echo $ULTIMATUMControl_cat8_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>9th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat9_label" type="text" name="ULTIMATUMControl_cat9_label" value="<?php echo $ULTIMATUMControl_cat9_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat9_color" type="text" name="ULTIMATUMControl_cat9_color" value="<?php echo $ULTIMATUMControl_cat9_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>10th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat10_label" type="text" name="ULTIMATUMControl_cat10_label" value="<?php echo $ULTIMATUMControl_cat10_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat10_color" type="text" name="ULTIMATUMControl_cat10_color" value="<?php echo $ULTIMATUMControl_cat10_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>11th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat11_label" type="text" name="ULTIMATUMControl_cat11_label" value="<?php echo $ULTIMATUMControl_cat11_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat11_color" type="text" name="ULTIMATUMControl_cat11_color" value="<?php echo $ULTIMATUMControl_cat11_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>12th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat12_label" type="text" name="ULTIMATUMControl_cat12_label" value="<?php echo $ULTIMATUMControl_cat12_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat12_color" type="text" name="ULTIMATUMControl_cat12_color" value="<?php echo $ULTIMATUMControl_cat12_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>13th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat13_label" type="text" name="ULTIMATUMControl_cat13_label" value="<?php echo $ULTIMATUMControl_cat13_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat13_color" type="text" name="ULTIMATUMControl_cat13_color" value="<?php echo $ULTIMATUMControl_cat13_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>14th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat14_label" type="text" name="ULTIMATUMControl_cat14_label" value="<?php echo $ULTIMATUMControl_cat14_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat14_color" type="text" name="ULTIMATUMControl_cat14_color" value="<?php echo $ULTIMATUMControl_cat14_color; ?>" class="spicy" ></td>
          </tr>
          <tr>
            <td>15th Menu item custom label:</td>
            <td><input id="ULTIMATUMControl_cat15_label" type="text" name="ULTIMATUMControl_cat15_label" value="<?php echo $ULTIMATUMControl_cat15_label; ?>" class="spicy" ></td>
            <td>Label background color:</td>
            <td><input id="ULTIMATUMControl_cat15_color" type="text" name="ULTIMATUMControl_cat15_color" value="<?php echo $ULTIMATUMControl_cat15_color; ?>" class="spicy" ></td>
          </tr>
          </table>
          
      </div>
    </div>
    <div class="htabs-content"  id="tab_footer">
      <h2 class="colors"><span><?php echo $text_footer_settings; ?></span></h2>
      <p><?php echo $text_color_helper; ?></span></p>
      <table class="form">
        <tr>
          <td><?php echo $text_footer_back_color; ?>:</td>
          <td><input id="ULTIMATUMControl_footer_bg_color" type="text" name="ULTIMATUMControl_footer_bg_color" value="<?php echo $ULTIMATUMControl_footer_bg_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_footer_pattern; ?></td>
          <td><select name="ULTIMATUMControl_footer_bg_pattern" class="spicy">
              <?php if (isset($ULTIMATUMControl_footer_bg_pattern)) {
                    $selected373 = 'selected="selected"';
            ?>
              <option value="pattern0.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern0.png'){echo $selected373;} ?>>No pattern</option>
              <option value="pattern1.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern1.png'){echo $selected373;} ?>>Pattern 1</option>
              <option value="pattern2.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern2.png'){echo $selected373;} ?>>Pattern 2</option>
              <option value="pattern3.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern3.png'){echo $selected373;} ?>>Pattern 3</option>
              <option value="pattern4.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern4.png'){echo $selected373;} ?>>Pattern 4</option>
              <option value="pattern5.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern5.png'){echo $selected373;} ?>>Pattern 5</option>
              <option value="pattern6.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern6.png'){echo $selected373;} ?>>Pattern 6</option>
              <option value="pattern7.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern7.png'){echo $selected373;} ?>>Pattern 7</option>
              <option value="pattern8.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern8.png'){echo $selected373;} ?>>Pattern 8</option>
              <option value="pattern9.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern9.png'){echo $selected373;} ?>>Pattern 9</option>
              <option value="pattern10.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern10.png'){echo $selected373;} ?>>Pattern 10</option>
              <option value="pattern11.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern11.png'){echo $selected373;} ?>>Pattern 11</option>
              <option value="pattern12.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern12.png'){echo $selected373;} ?>>Pattern 12</option>
              <option value="pattern13.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern13.png'){echo $selected373;} ?>>Pattern 13</option>
              <option value="pattern14.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern14.png'){echo $selected373;} ?>>Pattern 14</option>
              <option value="pattern15.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern15.png'){echo $selected373;} ?>>Pattern 15</option>
              <option value="pattern16.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern16.png'){echo $selected373;} ?>>Pattern 16</option>
              <option value="pattern17.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern17.png'){echo $selected373;} ?>>Pattern 17</option>
              <option value="pattern18.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern18.png'){echo $selected373;} ?>>Pattern 18</option>
              <option value="pattern19.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern19.png'){echo $selected373;} ?>>Pattern 19</option>
              <option value="pattern20.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern20.png'){echo $selected373;} ?>>Pattern 20</option>
              <option value="pattern21.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern21.png'){echo $selected373;} ?>>Pattern 21</option>
              <option value="pattern22.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern22.png'){echo $selected373;} ?>>Pattern 22</option>
              <option value="pattern23.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern23.png'){echo $selected373;} ?>>Pattern 23</option>
              <option value="pattern24.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern24.png'){echo $selected373;} ?>>Pattern 24</option>
              <option value="pattern25.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern25.png'){echo $selected373;} ?>>Pattern 25</option>
              <option value="pattern26.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern26.png'){echo $selected373;} ?>>Pattern 26</option>
              <option value="pattern27.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern27.png'){echo $selected373;} ?>>Pattern 27</option>
              <option value="pattern28.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern28.png'){echo $selected373;} ?>>Pattern 28</option>
              <option value="pattern29.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern29.png'){echo $selected373;} ?>>Pattern 29</option>
              <option value="pattern30.gif" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern30.gif'){echo $selected373;} ?>>Pattern 30</option>
              <option value="pattern31.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern31.png'){echo $selected373;} ?>>Pattern 31</option>
              <option value="pattern32.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern32.png'){echo $selected373;} ?>>Pattern 32</option>
              <option value="pattern33.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern33.png'){echo $selected373;} ?>>Pattern 33</option>
              <option value="pattern34.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern34.png'){echo $selected373;} ?>>Pattern 34</option>
              <option value="pattern35.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern35.png'){echo $selected373;} ?>>Pattern 35</option>
              <option value="pattern36.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern36.png'){echo $selected373;} ?>>Pattern 36</option>
              <option value="pattern37.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern37.png'){echo $selected373;} ?>>Pattern 37</option>
              <option value="pattern38.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern38.png'){echo $selected373;} ?>>Pattern 38</option>
              <option value="pattern39.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern39.png'){echo $selected373;} ?>>Pattern 39</option>
              <option value="pattern40.png" <?php if($ULTIMATUMControl_footer_bg_pattern=='pattern40.png'){echo $selected373;} ?>>Pattern 40</option>
              <?php } else { ?>
              <option value="pattern0.png" selected="selected">No pattern</option>
              <option value="pattern1.png">Pattern 1</option>
              <option value="pattern2.png">Pattern 2</option>
              <option value="pattern3.png">Pattern 3</option>
              <option value="pattern4.png">Pattern 4</option>
              <option value="pattern5.png">Pattern 5</option>
              <option value="pattern6.png">Pattern 6</option>
              <option value="pattern7.png">Pattern 7</option>
              <option value="pattern8.png">Pattern 8</option>
              <option value="pattern9.png">Pattern 9</option>
              <option value="pattern10.png">Pattern 10</option>
              <option value="pattern11.png">Pattern 11</option>
              <option value="pattern12.png">Pattern 12</option>
              <option value="pattern13.png">Pattern 13</option>
              <option value="pattern14.png">Pattern 14</option>
              <option value="pattern15.png">Pattern 15</option>
              <option value="pattern16.png">Pattern 16</option>
              <option value="pattern17.png">Pattern 17</option>
              <option value="pattern18.png">Pattern 18</option>
              <option value="pattern19.png">Pattern 19</option>
              <option value="pattern20.png">Pattern 20</option>
              <option value="pattern21.png">Pattern 21</option>
              <option value="pattern22.png">Pattern 22</option>
              <option value="pattern23.png">Pattern 23</option>
              <option value="pattern24.png">Pattern 24</option>
              <option value="pattern25.png">Pattern 25</option>
              <option value="pattern26.png">Pattern 26</option>
              <option value="pattern27.png">Pattern 27</option>
              <option value="pattern28.png">Pattern 28</option>
              <option value="pattern29.png">Pattern 29</option>
              <option value="pattern30.gif">Pattern 30</option>
              <option value="pattern31.png">Pattern 31</option>
              <option value="pattern32.png">Pattern 32</option>
              <option value="pattern33.png">Pattern 33</option>
              <option value="pattern34.png">Pattern 34</option>
              <option value="pattern35.png">Pattern 35</option>
              <option value="pattern36.png">Pattern 36</option>
              <option value="pattern37.png">Pattern 37</option>
              <option value="pattern38.png">Pattern 38</option>
              <option value="pattern39.png">Pattern 39</option>
              <option value="pattern40.png">Pattern 40</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_pattern_samples; ?></td>
          <td><span class="preview prev1"><b>1</b></span> <span class="preview prev2"><b>2</b></span> <span class="preview prev3"><b>3</b></span> <span class="preview prev4"><b>4</b></span> <span class="preview prev5"><b>5</b></span> <span class="preview prev6"><b>6</b></span> <span class="preview prev7"><b>7</b></span> <span class="preview prev8"><b>8</b></span> <span class="preview prev9"><b>9</b></span> <span class="preview prev10"><b>10</b></span> <span class="preview prev11"><b>11</b></span> <span class="preview prev12"><b>12</b></span> <span class="preview prev13"><b>13</b></span> <span class="preview prev14"><b>14</b></span> <span class="preview prev15"><b>15</b></span> <span class="preview prev16"><b>16</b></span> <span class="preview prev17"><b>17</b></span> <span class="preview prev18"><b>18</b></span> <span class="preview prev19"><b>19</b></span> <span class="preview prev20"><b>20</b></span> <span class="preview prev21"><b>21</b></span> <span class="preview prev22"><b>22</b></span> <span class="preview prev23"><b>23</b></span> <span class="preview prev24"><b>24</b></span> <span class="preview prev25"><b>25</b></span> <span class="preview prev26"><b>26</b></span> <span class="preview prev27"><b>27</b></span> <span class="preview prev28"><b>28</b></span> <span class="preview prev29"><b>29</b></span> <span class="preview prev30"><b>30</b></span> <span class="preview prev31"><b>31</b></span> <span class="preview prev32"><b>32</b></span> <span class="preview prev33"><b>33</b></span> <span class="preview prev34"><b>34</b></span> <span class="preview prev35"><b>35</b></span> <span class="preview prev36"><b>36</b></span> <span class="preview prev37"><b>37</b></span> <span class="preview prev38"><b>38</b></span> <span class="preview prev39"><b>39</b></span> <span class="preview prev40"><b>40</b></span></td>
        </tr>
        <tr>
          <td> Upload custom footer background image / pattern: </td>
          <td><input type="hidden" name="ULTIMATUMControl_FooterBgImg" value="<?php echo $ULTIMATUMControl_FooterBgImg; ?>" id="ULTIMATUMControl_FooterBgImg" />
            <img src="<?php echo $ULTIMATUMControl_FooterBgImg_preview; ?>" alt="" id="ULTIMATUMControl_FooterBgImg_preview" class="PreviewImage" />
            <div class='upload-btn'> <a onclick="image_upload('ULTIMATUMControl_FooterBgImg', 'ULTIMATUMControl_FooterBgImg_preview');" class="bt btn btn-mini">Browse</a> | <a onclick="$('#ULTIMATUMControl_FooterBgImg_preview').attr('src', '<?php echo $no_image; ?>'); $('#ULTIMATUMControl_FooterBgImg').attr('value', '');" class="bt btn btn-mini">Delete</a> </div></td>
        </tr>
        <tr>
          <td>Custom footer background image position</td>
          <td><select name="ULTIMATUMControl_footer_back_position" class="spicy">
              <?php if (isset($ULTIMATUMControl_footer_back_position)) {
              $selected_footer_back_position = 'selected="selected"';
              ?>
              <option value="top left repeat" <?php if($ULTIMATUMControl_footer_back_position=='top left repeat'){echo $selected_footer_back_position;} ?>>Top Left Repeat</option>
              <option value="top left no-repeat" <?php if($ULTIMATUMControl_footer_back_position=='top left no-repeat'){echo $selected_footer_back_position;} ?>>Top Left No-repeat</option>
              <option value="center center repeat" <?php if($ULTIMATUMControl_footer_back_position=='center center repeat'){echo $selected_footer_back_position;} ?>>Center Center Repeat</option>
              <option value="center center no-repeat" <?php if($ULTIMATUMControl_footer_back_position=='center center no-repeat'){echo $selected_footer_back_position;} ?>>Center Center No-repeat</option>
              <option value="top center repeat" <?php if($ULTIMATUMControl_footer_back_position=='top center repeat'){echo $selected_footer_back_position;} ?>>Top Center Repeat</option>
              <option value="top center no-repeat" <?php if($ULTIMATUMControl_footer_back_position=='top center no-repeat'){echo $selected_footer_back_position;} ?>>Top Center No-repeat</option>
              <option value="bottom center repeat" <?php if($ULTIMATUMControl_footer_back_position=='bottom center repeat'){echo $selected_footer_back_position;} ?>>Bottom Center Repeat</option>
              <option value="bottom center no-repeat" <?php if($ULTIMATUMControl_footer_back_position=='bottom center no-repeat'){echo $selected_footer_back_position;} ?>>Bottom Center No-repeat</option>
              <?php } else { ?>
              <option value="top left repeat">Top Left Repeat</option>
              <option value="top left no-repeat">Top Left No-repeat</option>
              <option value="center center repeat">Center Center Repeat</option>
              <option value="center center no-repeat">Center Center No-repeat</option>
              <option value="top center repeat">Top Center Repeat</option>
              <option value="top center no-repeat">Top Center No-repeat</option>
              <option value="bottom center repeat">Bottom Center Repeat</option>
              <option value="bottom center no-repeat">Bottom Center No-repeat</option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $text_footer_titles_color; ?>:</td>
          <td><input id="ULTIMATUMControl_footer_link_color" type="text" name="ULTIMATUMControl_footer_link_color" value="<?php echo $ULTIMATUMControl_footer_link_color; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_footer_borders_color; ?>:</td>
          <td><input id="ULTIMATUMControl_footer_link_border" type="text" name="ULTIMATUMControl_footer_link_border" value="<?php echo $ULTIMATUMControl_footer_link_border; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_copyright_back_color; ?>:</td>
          <td><input id="ULTIMATUMControl_powered_bg" type="text" name="ULTIMATUMControl_powered_bg" value="<?php echo $ULTIMATUMControl_powered_bg; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td><?php echo $text_copyright_text_color; ?>:</td>
          <td><input id="ULTIMATUMControl_powered_text" type="text" name="ULTIMATUMControl_powered_text" value="<?php echo $ULTIMATUMControl_powered_text; ?>" class="spicy" ></td>
        </tr>
        <tr>
          <td colspan="2">
          <h2 class="colors"><span><?php echo $text_footer_seals; ?>:</span></h2>          
          <div class="htabslang5_1">
              <?php foreach ($languages as $language) { ?>
              <a href="#ULTIMATUMControl_seals_lang_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

              <?php } ?>
</div>
<?php foreach ($languages as $language) { ?>
              <div id="ULTIMATUMControl_seals_lang_<?php echo $language['language_id']; ?>" class="htabs-content no_margin">
              <textarea id="ULTIMATUMControl_seals<?php echo $language['language_id']; ?>" name="ULTIMATUMControl_seals<?php echo $language['language_id']; ?>" cols="80" rows="8" class="spicy"><?php echo isset(${'ULTIMATUMControl_seals' . $language['language_id']}) ? ${'ULTIMATUMControl_seals' . $language['language_id']} : ''; ?></textarea>
              
</div>
              <?php } ?>
          </td>
        </tr>
        <tr>
          <td><?php echo $text_footer_copyright; ?>:</td>
          <td><textarea id="ULTIMATUMControl_copyright" name="ULTIMATUMControl_copyright" cols="140" rows="4" class="spicy"><?php echo $ULTIMATUMControl_copyright; ?></textarea></td>
        </tr>
      </table>
    </div>
    <div class="htabs-content"  id="tab_fonts">
      <h2 class="fonts"><span><?php echo $text_font_settings; ?></span></h2>
      <table class="form">
        <tr>
          <td><?php echo $text_body_font; ?></td>
          <td><select name="ULTIMATUMControl_body_font" class="spicy">
              <?php if (isset($ULTIMATUMControl_body_font)) {
              $selected = 'selected="selected"';
              ?>
              <option value="Arial" <?php if($ULTIMATUMControl_body_font=='Arial'){echo $selected;} ?>>Arial</option>
              <option value="Verdana" <?php if($ULTIMATUMControl_body_font=='Verdana'){echo $selected;} ?>>Verdana</option>
              <option value="Helvetica" <?php if($ULTIMATUMControl_body_font=='Helvetica'){echo $selected;} ?>>Helvetica</option>
              <option value="Lucida Grande" <?php if($ULTIMATUMControl_body_font=='Lucida Grande'){echo $selected;} ?>>Lucida Grande</option>
              <option value="Trebuchet MS" <?php if($ULTIMATUMControl_body_font=='Trebuchet MS'){echo $selected;} ?>>Trebuchet MS</option>
              <option value="Times New Roman" <?php if($ULTIMATUMControl_body_font=='Times New Roman'){echo $selected;} ?>>Times New Roman</option>
              <option value="Tahoma" <?php if($ULTIMATUMControl_body_font=='Tahoma'){echo $selected;} ?>>Tahoma</option>
              <option value="Georgia" <?php if($ULTIMATUMControl_body_font=='Georgia'){echo $selected;} ?>>Georgia</option>
              <?php } else { ?>
              <option value="Arial">Arial</option>
              <option value="Verdana">Verdana</option>
              <option value="Helvetica">Helvetica</option>
              <option value="Lucida Grande">Lucida Grande</option>
              <option value="Trebuchet MS" selected="selected">Trebuchet MS</option>
              <option value="Times New Roman">Times New Roman</option>
              <option value="Tahoma">Tahoma</option>
              <option value="Georgia">Georgia</option>
              <?php } ?>
            </select>
            <span class="default_value"><?php echo $text_default_value; ?>: Trebuchet MS</span></td>
        </tr>
        <tr>
          <td><?php echo $text_headings_font; ?></td>
          <td><select name="ULTIMATUMControl_headings_font" class="spicy">
              <?php if (isset($ULTIMATUMControl_headings_font)) {
                	$selected2 = 'selected="selected"';
            ?>
              <option value="Arial" <?php if($ULTIMATUMControl_headings_font=='Arial'){echo $selected2;} ?>>Arial</option>
              <option value="Aclonica" <?php if($ULTIMATUMControl_headings_font=='Aclonica'){echo $selected2;} ?>>Aclonica</option>
              <option value="Allan" <?php if($ULTIMATUMControl_headings_font=='Allan'){echo $selected2;} ?>>Allan</option>
              <option value="Annie+Use+Your+Telescope" <?php if($ULTIMATUMControl_headings_font=='Annie+Use+Your+Telescope'){echo $selected2;} ?>>Annie Use Your Telescope</option>
              <option value="Anonymous+Pro" <?php if($ULTIMATUMControl_headings_font=='Anonymous+Pro'){echo $selected2;} ?>>Anonymous Pro</option>
              <option value="Allerta+Stencil" <?php if($ULTIMATUMControl_headings_font=='Allerta+Stencil'){echo $selected2;} ?>>Allerta Stencil</option>
              <option value="Allerta" <?php if($ULTIMATUMControl_headings_font=='Allerta'){echo $selected2;} ?>>Allerta</option>
              <option value="Amaranth" <?php if($ULTIMATUMControl_headings_font=='Amaranth'){echo $selected2;} ?>>Amaranth</option>
              <option value="Anton" <?php if($ULTIMATUMControl_headings_font=='Anton'){echo $selected2;} ?>>Anton</option>
              <option value="Architects+Daughter" <?php if($ULTIMATUMControl_headings_font=='Architects+Daughter'){echo $selected2;} ?>>Architects Daughter</option>
              <option value="Arimo" <?php if($ULTIMATUMControl_headings_font=='Arimo'){echo $selected2;} ?>>Arimo</option>
              <option value="Artifika" <?php if($ULTIMATUMControl_headings_font=='Artifika'){echo $selected2;} ?>>Artifika</option>
              <option value="Arvo" <?php if($ULTIMATUMControl_headings_font=='Arvo'){echo $selected2;} ?>>Arvo</option>
              <option value="Asset" <?php if($ULTIMATUMControl_headings_font=='Asset'){echo $selected2;} ?>>Asset</option>
              <option value="Astloch" <?php if($ULTIMATUMControl_headings_font=='Astloch'){echo $selected2;} ?>>Astloch</option>
              <option value="Bangers" <?php if($ULTIMATUMControl_headings_font=='Bangers'){echo $selected2;} ?>>Bangers</option>
              <option value="Bentham" <?php if($ULTIMATUMControl_headings_font=='Bentham'){echo $selected2;} ?>>Bentham</option>
              <option value="Bevan" <?php if($ULTIMATUMControl_headings_font=='Bevan'){echo $selected2;} ?>>Bevan</option>
              <option value="Bigshot+One" <?php if($ULTIMATUMControl_headings_font=='Bigshot+One'){echo $selected2;} ?>>Bigshot One</option>
              <option value="Bowlby+One" <?php if($ULTIMATUMControl_headings_font=='Bowlby+One'){echo $selected2;} ?>>Bowlby One</option>
              <option value="Bowlby+One+SC" <?php if($ULTIMATUMControl_headings_font=='Bowlby+One+SC'){echo $selected2;} ?>>Bowlby One SC</option>
              <option value="Brawler" <?php if($ULTIMATUMControl_headings_font=='Brawler'){echo $selected2;} ?>>Brawler </option>
              <option value="Buda" <?php if($ULTIMATUMControl_headings_font=='Buda'){echo $selected2;} ?>>Buda</option>
              <option value="Cabin" <?php if($ULTIMATUMControl_headings_font=='Cabin'){echo $selected2;} ?>>Cabin</option>
              <option value="Calligraffitti" <?php if($ULTIMATUMControl_headings_font=='Calligraffitti'){echo $selected2;} ?>>Calligraffitti</option>
              <option value="Candal" <?php if($ULTIMATUMControl_headings_font=='Candal'){echo $selected2;} ?>>Candal</option>
              <option value="Cantarell" <?php if($ULTIMATUMControl_headings_font=='Cantarell'){echo $selected2;} ?>>Cantarell</option>
              <option value="Cardo" <?php if($ULTIMATUMControl_headings_font=='Cardo'){echo $selected2;} ?>>Cardo</option>
              <option value="Carter+One" <?php if($ULTIMATUMControl_headings_font=='Carter+One'){echo $selected2;} ?>>Carter One</option>
              <option value="Caudex" <?php if($ULTIMATUMControl_headings_font=='Caudex'){echo $selected2;} ?>>Caudex</option>
              <option value="Cedarville+Cursive" <?php if($ULTIMATUMControl_headings_font=='Cedarville+Cursive'){echo $selected2;} ?>>Cedarville Cursive</option>
              <option value="Cherry+Cream+Soda" <?php if($ULTIMATUMControl_headings_font=='Cherry+Cream+Soda'){echo $selected2;} ?>>Cherry Cream Soda</option>
              <option value="Chewy" <?php if($ULTIMATUMControl_headings_font=='Chewy'){echo $selected2;} ?>>Chewy</option>
              <option value="Coda" <?php if($ULTIMATUMControl_headings_font=='Coda'){echo $selected2;} ?>>Coda</option>
              <option value="Coming+Soon" <?php if($ULTIMATUMControl_headings_font=='Coming+Soon'){echo $selected2;} ?>>Coming Soon</option>
              <option value="Copse" <?php if($ULTIMATUMControl_headings_font=='Copse'){echo $selected2;} ?>>Copse</option>
              <option value="Corben" <?php if($ULTIMATUMControl_headings_font=='Corben'){echo $selected2;} ?>>Corben</option>
              <option value="Cousine" <?php if($ULTIMATUMControl_headings_font=='Cousine'){echo $selected2;} ?>>Cousine</option>
              <option value="Covered+By+Your+Grace" <?php if($ULTIMATUMControl_headings_font=='Covered+By+Your+Grace'){echo $selected2;} ?>>Covered By Your Grace</option>
              <option value="Crafty+Girls" <?php if($ULTIMATUMControl_headings_font=='Crafty+Girls'){echo $selected2;} ?>>Crafty Girls</option>
              <option value="Crimson+Text" <?php if($ULTIMATUMControl_headings_font=='Crimson+Text'){echo $selected2;} ?>>Crimson Text</option>
              <option value="Crushed" <?php if($ULTIMATUMControl_headings_font=='Crushed'){echo $selected2;} ?>>Crushed</option>
              <option value="Cuprum" <?php if($ULTIMATUMControl_headings_font=='Cuprum'){echo $selected2;} ?>>Cuprum</option>
              <option value="Damion" <?php if($ULTIMATUMControl_headings_font=='Damion'){echo $selected2;} ?>>Damion</option>
              <option value="Dancing+Script" <?php if($ULTIMATUMControl_headings_font=='Dancing+Script'){echo $selected2;} ?>>Dancing Script</option>
              <option value="Dawning+of+a+New+Day" <?php if($ULTIMATUMControl_headings_font=='Dawning+of+a+New+Day'){echo $selected2;} ?>>Dawning of a New Day</option>
              <option value="Didact+Gothic" <?php if($ULTIMATUMControl_headings_font=='Didact+Gothic'){echo $selected2;} ?>>Didact Gothic</option>
              <option value="Droid+Sans" <?php if($ULTIMATUMControl_headings_font=='Droid+Sans'){echo $selected2;} ?>>Droid Sans</option>
              <option value="Droid+Sans+Mono" <?php if($ULTIMATUMControl_headings_font=='Droid+Sans+Mono'){echo $selected2;} ?>>Droid Sans Mono</option>
              <option value="Droid+Serif" <?php if($ULTIMATUMControl_headings_font=='Droid+Serif'){echo $selected2;} ?>>Droid Serif</option>
              <option value="EB+Garamond" <?php if($ULTIMATUMControl_headings_font=='EB+Garamond'){echo $selected2;} ?>>EB Garamond</option>
              <option value="Expletus+Sans" <?php if($ULTIMATUMControl_headings_font=='Expletus+Sans'){echo $selected2;} ?>>Expletus Sans</option>
              <option value="Fontdiner+Swanky" <?php if($ULTIMATUMControl_headings_font=='Fontdiner+Swanky'){echo $selected2;} ?>>Fontdiner Swanky</option>
              <option value="Forum" <?php if($ULTIMATUMControl_headings_font=='Forum'){echo $selected2;} ?>>Forum</option>
              <option value="Francois+One" <?php if($ULTIMATUMControl_headings_font=='Francois+One'){echo $selected2;} ?>>Francois One</option>
              <option value="Federo" <?php if($ULTIMATUMControl_headings_font=='Federo'){echo $selected2;} ?>>Federo</option>
              <option value="Geo" <?php if($ULTIMATUMControl_headings_font=='Geo'){echo $selected2;} ?>>Geo</option>
              <option value="Give+You+Glory" <?php if($ULTIMATUMControl_headings_font=='Give+You+Glory'){echo $selected2;} ?>>Give You Glory</option>
              <option value="Goblin+One" <?php if($ULTIMATUMControl_headings_font=='Goblin+One'){echo $selected2;} ?>>Goblin One</option>
              <option value="Goudy+Bookletter+1911" <?php if($ULTIMATUMControl_headings_font=='Goudy+Bookletter+1911'){echo $selected2;} ?>>Goudy Bookletter 1911</option>
              <option value="Gravitas+One" <?php if($ULTIMATUMControl_headings_font=='Gravitas+One'){echo $selected2;} ?>>Gravitas One</option>
              <option value="Gruppo" <?php if($ULTIMATUMControl_headings_font=='Gruppo'){echo $selected2;} ?>>Gruppo</option>
              <option value="Hammersmith+One" <?php if($ULTIMATUMControl_headings_font=='Hammersmith+One'){echo $selected2;} ?>>Hammersmith One</option>
              <option value="Holtwood+One+SC" <?php if($ULTIMATUMControl_headings_font=='Holtwood+One+SC'){echo $selected2;} ?>>Holtwood One SC</option>
              <option value="Homemade+Apple" <?php if($ULTIMATUMControl_headings_font=='Homemade+Apple'){echo $selected2;} ?>>Homemade Apple</option>
              <option value="Inconsolata" <?php if($ULTIMATUMControl_headings_font=='Inconsolata'){echo $selected2;} ?>>Inconsolata</option>
              <option value="Indie+Flower" <?php if($ULTIMATUMControl_headings_font=='Indie+Flower'){echo $selected2;} ?>>Indie Flower</option>
              <option value="IM+Fell+DW+Pica" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+DW+Pica'){echo $selected2;} ?>>IM Fell DW Pica</option>
              <option value="IM+Fell+DW+Pica+SC" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+DW+Pica+SC'){echo $selected2;} ?>>IM Fell DW Pica SC</option>
              <option value="IM+Fell+Double+Pica" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+Double+Pica'){echo $selected2;} ?>>IM Fell Double Pica</option>
              <option value="IM+Fell+Double+Pica+SC" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+Double+Pica+SC'){echo $selected2;} ?>>IM Fell Double Pica SC</option>
              <option value="IM+Fell+English" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+English'){echo $selected2;} ?>>IM Fell English</option>
              <option value="IM+Fell+English+SC" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+English+SC'){echo $selected2;} ?>>IM Fell English SC</option>
              <option value="IM+Fell+French+Canon" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+French+Canon'){echo $selected2;} ?>>IM Fell French Canon</option>
              <option value="IM+Fell+French+Canon+SC" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+French+Canon+SC'){echo $selected2;} ?>>IM Fell French Canon SC</option>
              <option value="IM+Fell+Great+Primer" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+Great+Primer'){echo $selected2;} ?>>IM Fell Great Primer</option>
              <option value="IM+Fell+Great+Primer+SC" <?php if($ULTIMATUMControl_headings_font=='IM+Fell+Great+Primer+SC'){echo $selected2;} ?>>IM Fell Great Primer SC</option>
              <option value="Irish+Grover" <?php if($ULTIMATUMControl_headings_font=='Irish+Grover'){echo $selected2;} ?>>Irish Grover</option>
              <option value="Irish+Growler" <?php if($ULTIMATUMControl_headings_font=='Irish+Growler'){echo $selected2;} ?>>Irish Growler</option>
              <option value="Istok+Web" <?php if($ULTIMATUMControl_headings_font=='Istok+Web'){echo $selected2;} ?>>Istok Web</option>
              <option value="Josefin+Sans" <?php if($ULTIMATUMControl_headings_font=='Josefin+Sans'){echo $selected2;} ?>>Josefin Sans Regular 400</option>
              <option value="Josefin+Slab" <?php if($ULTIMATUMControl_headings_font=='Josefin+Slab'){echo $selected2;} ?>>Josefin Slab Regular 400</option>
              <option value="Judson" <?php if($ULTIMATUMControl_headings_font=='Judson'){echo $selected2;} ?>>Judson</option>
              <option value="Jura" <?php if($ULTIMATUMControl_headings_font=='Jura'){echo $selected2;} ?>> Jura Regular</option>
              <option value="Just+Another+Hand" <?php if($ULTIMATUMControl_headings_font=='Just+Another+Hand'){echo $selected2;} ?>>Just Another Hand</option>
              <option value="Just+Me+Again+Down+Here" <?php if($ULTIMATUMControl_headings_font=='Just+Me+Again+Down+Here'){echo $selected2;} ?>>Just Me Again Down Here</option>
              <option value="Kameron" <?php if($ULTIMATUMControl_headings_font=='Kameron'){echo $selected2;} ?>>Kameron</option>
              <option value="Kenia" <?php if($ULTIMATUMControl_headings_font=='Kenia'){echo $selected2;} ?>>Kenia</option>
              <option value="Kranky" <?php if($ULTIMATUMControl_headings_font=='Kranky'){echo $selected2;} ?>>Kranky</option>
              <option value="Kreon" <?php if($ULTIMATUMControl_headings_font=='Kreon'){echo $selected2;} ?>>Kreon</option>
              <option value="Kristi" <?php if($ULTIMATUMControl_headings_font=='Kristi'){echo $selected2;} ?>>Kristi</option>
              <option value="La+Belle+Aurore" <?php if($ULTIMATUMControl_headings_font=='La+Belle+Aurore'){echo $selected2;} ?>>La Belle Aurore</option>
              <option value="Lato" <?php if($ULTIMATUMControl_headings_font=='Lato'){echo $selected2;} ?>>Lato</option>
              <option value="League+Script" <?php if($ULTIMATUMControl_headings_font=='League+Script'){echo $selected2;} ?>>League Script</option>
              <option value="Lekton" <?php if($ULTIMATUMControl_headings_font=='Lekton'){echo $selected2;} ?>> Lekton </option>
              <option value="Limelight" <?php if($ULTIMATUMControl_headings_font=='Limelight'){echo $selected2;} ?>> Limelight </option>
              <option value="Lobster" <?php if($ULTIMATUMControl_headings_font=='Lobster'){echo $selected2;} ?>>Lobster</option>
              <option value="Lobster+Two" <?php if($ULTIMATUMControl_headings_font=='Lobster+Two'){echo $selected2;} ?>>Lobster Two</option>
              <option value="Lora" <?php if($ULTIMATUMControl_headings_font=='Lora'){echo $selected2;} ?>>Lora</option>
              <option value="Love+Ya+Like+A+Sister" <?php if($ULTIMATUMControl_headings_font=='Love+Ya+Like+A+Sister'){echo $selected2;} ?>>Love Ya Like A Sister</option>
              <option value="Loved+by+the+King" <?php if($ULTIMATUMControl_headings_font=='Loved+by+the+King'){echo $selected2;} ?>>Loved by the King</option>
              <option value="Luckiest+Guy" <?php if($ULTIMATUMControl_headings_font=='Luckiest+Guy'){echo $selected2;} ?>>Luckiest Guy</option>
              <option value="Maiden+Orange" <?php if($ULTIMATUMControl_headings_font=='Maiden+Orange'){echo $selected2;} ?>>Maiden Orange</option>
              <option value="Mako" <?php if($ULTIMATUMControl_headings_font=='Mako'){echo $selected2;} ?>>Mako</option>
              <option value="Maven+Pro" <?php if($ULTIMATUMControl_headings_font=='Maven+Pro'){echo $selected2;} ?>> Maven Pro</option>
              <option value="Meddon" <?php if($ULTIMATUMControl_headings_font=='Meddon'){echo $selected2;} ?>>Meddon</option>
              <option value="MedievalSharp" <?php if($ULTIMATUMControl_headings_font=='MedievalSharp'){echo $selected2;} ?>>MedievalSharp</option>
              <option value="Megrim" <?php if($ULTIMATUMControl_headings_font=='Megrim'){echo $selected2;} ?>>Megrim</option>
              <option value="Merriweather" <?php if($ULTIMATUMControl_headings_font=='Merriweather'){echo $selected2;} ?>>Merriweather</option>
              <option value="Metrophobic" <?php if($ULTIMATUMControl_headings_font=='Metrophobic'){echo $selected2;} ?>>Metrophobic</option>
              <option value="Michroma" <?php if($ULTIMATUMControl_headings_font=='Michroma'){echo $selected2;} ?>>Michroma</option>
              <option value="Miltonian+Tattoo" <?php if($ULTIMATUMControl_headings_font=='Miltonian+Tattoo'){echo $selected2;} ?>>Miltonian Tattoo</option>
              <option value="Miltonian" <?php if($ULTIMATUMControl_headings_font=='Miltonian'){echo $selected2;} ?>>Miltonian</option>
              <option value="Modern+Antiqua" <?php if($ULTIMATUMControl_headings_font=='Modern+Antiqua'){echo $selected2;} ?>>Modern Antiqua</option>
              <option value="Monofett" <?php if($ULTIMATUMControl_headings_font=='Monofett'){echo $selected2;} ?>>Monofett</option>
              <option value="Molengo" <?php if($ULTIMATUMControl_headings_font=='Molengo'){echo $selected2;} ?>>Molengo</option>
              <option value="Mountains+of+Christmas" <?php if($ULTIMATUMControl_headings_font=='Mountains+of+Christmas'){echo $selected2;} ?>>Mountains of Christmas</option>
              <option value="Muli" <?php if($ULTIMATUMControl_headings_font=='Muli'){echo $selected2;} ?>>Muli Regular</option>
              <option value="Neucha" <?php if($ULTIMATUMControl_headings_font=='Neucha'){echo $selected2;} ?>>Neucha</option>
              <option value="Neuton" <?php if($ULTIMATUMControl_headings_font=='Neuton'){echo $selected2;} ?>>Neuton</option>
              <option value="News+Cycle" <?php if($ULTIMATUMControl_headings_font=='News+Cycle'){echo $selected2;} ?>>News Cycle</option>
              <option value="Nixie+One" <?php if($ULTIMATUMControl_headings_font=='Nixie+One'){echo $selected2;} ?>>Nixie One</option>
              <option value="Nobile" <?php if($ULTIMATUMControl_headings_font=='Nobile'){echo $selected2;} ?>>Nobile</option>
              <option value="Nova+Cut" <?php if($ULTIMATUMControl_headings_font=='Nova+Cut'){echo $selected2;} ?>>Nova Cut</option>
              <option value="Nova+Flat" <?php if($ULTIMATUMControl_headings_font=='Nova+Flat'){echo $selected2;} ?>>Nova Flat</option>
              <option value="Nova+Mono" <?php if($ULTIMATUMControl_headings_font=='Nova+Mono'){echo $selected2;} ?>>Nova Mono</option>
              <option value="Nova+Oval" <?php if($ULTIMATUMControl_headings_font=='Nova+Oval'){echo $selected2;} ?>>Nova Oval</option>
              <option value="Nova+Round" <?php if($ULTIMATUMControl_headings_font=='Nova+Round'){echo $selected2;} ?>>Nova Round</option>
              <option value="Nova+Script" <?php if($ULTIMATUMControl_headings_font=='Nova+Script'){echo $selected2;} ?>>Nova Script</option>
              <option value="Nova+Slim" <?php if($ULTIMATUMControl_headings_font=='Nova+Slim'){echo $selected2;} ?>>Nova Slim</option>
              <option value="Nova+Square" <?php if($ULTIMATUMControl_headings_font=='Nova+Square'){echo $selected2;} ?>>Nova Square</option>
              <option value="Nunito" <?php if($ULTIMATUMControl_headings_font=='Nunito'){echo $selected2;} ?>> Nunito Regular</option>
              <option value="OFL+Sorts+Mill+Goudy+TT" <?php if($ULTIMATUMControl_headings_font=='OFL+Sorts+Mill+Goudy+TT'){echo $selected2;} ?>>OFL Sorts Mill Goudy TT</option>
              <option value="Old+Standard+TT" <?php if($ULTIMATUMControl_headings_font=='Old+Standard+TT'){echo $selected2;} ?>>Old Standard TT</option>
              <option value="Open+Sans" <?php if($ULTIMATUMControl_headings_font=='Open+Sans'){echo $selected2;} ?>>Open Sans regular</option>
              <option value="Open+Sans+Condensed:300,700" <?php if($ULTIMATUMControl_headings_font=='Open+Sans+Condensed:300,700'){echo $selected2;} ?>>Open Sans Condensed</option>
              <option value="Orbitron" <?php if($ULTIMATUMControl_headings_font=='Orbitron'){echo $selected2;} ?>>Orbitron Regular (400)</option>
              <option value="Oswald" <?php if($ULTIMATUMControl_headings_font=='Oswald'){echo $selected2;} ?>>Oswald</option>
              <option value="Over+the+Rainbow" <?php if($ULTIMATUMControl_headings_font=='Over+the+Rainbow'){echo $selected2;} ?>>Over the Rainbow</option>
              <option value="Reenie+Beanie" <?php if($ULTIMATUMControl_headings_font=='Reenie+Beanie'){echo $selected2;} ?>>Reenie Beanie</option>
              <option value="Pacifico" <?php if($ULTIMATUMControl_headings_font=='Pacifico'){echo $selected2;} ?>>Pacifico</option>
              <option value="Patrick+Hand" <?php if($ULTIMATUMControl_headings_font=='Patrick+Hand'){echo $selected2;} ?>>Patrick Hand</option>
              <option value="Paytone+One" <?php if($ULTIMATUMControl_headings_font=='Paytone+One'){echo $selected2;} ?>>Paytone One</option>
              <option value="Permanent+Marker" <?php if($ULTIMATUMControl_headings_font=='Permanent+Marker'){echo $selected2;} ?>>Permanent Marker</option>
              <option value="Philosopher" <?php if($ULTIMATUMControl_headings_font=='Philosopher'){echo $selected2;} ?>>Philosopher</option>
              <option value="Play" <?php if($ULTIMATUMControl_headings_font=='Play'){echo $selected2;} ?>>Play</option>
              <option value="Playfair+Display" <?php if($ULTIMATUMControl_headings_font=='Playfair+Display'){echo $selected2;} ?>> Playfair Display </option>
              <option value="Podkova" <?php if($ULTIMATUMControl_headings_font=='Podkova'){echo $selected2;} ?>> Podkova </option>
              <option value="PT+Sans" <?php if($ULTIMATUMControl_headings_font=='PT+Sans'){echo $selected2;} ?>>PT Sans</option>
              <option value="PT+Sans+Narrow" <?php if($ULTIMATUMControl_headings_font=='PT+Sans+Narrow'){echo $selected2;} ?>>PT Sans Narrow</option>
              <option value="PT+Serif" <?php if($ULTIMATUMControl_headings_font=='PT+Serif'){echo $selected2;} ?>>PT Serif</option>
              <option value="Puritan" <?php if($ULTIMATUMControl_headings_font=='Puritan'){echo $selected2;} ?>>Puritan</option>
              <option value="Quattrocento" <?php if($ULTIMATUMControl_headings_font=='Quattrocento'){echo $selected2;} ?>>Quattrocento</option>
              <option value="Quattrocento+Sans" <?php if($ULTIMATUMControl_headings_font=='Quattrocento+Sans'){echo $selected2;} ?>>Quattrocento Sans</option>
              <option value="Radley" <?php if($ULTIMATUMControl_headings_font=='Radley'){echo $selected2;} ?>>Radley</option>
              <option value="Raleway" <?php if($ULTIMATUMControl_headings_font=='Raleway'){echo $selected2;} ?>>Raleway</option>
              <option value="Redressed" <?php if($ULTIMATUMControl_headings_font=='Redressed'){echo $selected2;} ?>>Redressed</option>
              <option value="Rock+Salt" <?php if($ULTIMATUMControl_headings_font=='Rock+Salt'){echo $selected2;} ?>>Rock Salt</option>
              <option value="Rokkitt" <?php if($ULTIMATUMControl_headings_font=='Rokkitt'){echo $selected2;} ?>>Rokkitt</option>
              <option value="Ruslan+Display" <?php if($ULTIMATUMControl_headings_font=='Ruslan+Display'){echo $selected2;} ?>>Ruslan Display</option>
              <option value="Schoolbell" <?php if($ULTIMATUMControl_headings_font=='Schoolbell'){echo $selected2;} ?>>Schoolbell</option>
              <option value="Shadows+Into+Light" <?php if($ULTIMATUMControl_headings_font=='Shadows+Into+Light'){echo $selected2;} ?>>Shadows Into Light</option>
              <option value="Shanti" <?php if($ULTIMATUMControl_headings_font=='Shanti'){echo $selected2;} ?>>Shanti</option>
              <option value="Sigmar+One" <?php if($ULTIMATUMControl_headings_font=='Sigmar+One'){echo $selected2;} ?>>Sigmar One</option>
              <option value="Six+Caps" <?php if($ULTIMATUMControl_headings_font=='Six+Caps'){echo $selected2;} ?>>Six Caps</option>
              <option value="Slackey" <?php if($ULTIMATUMControl_headings_font=='Slackey'){echo $selected2;} ?>>Slackey</option>
              <option value="Smythe" <?php if($ULTIMATUMControl_headings_font=='Smythe'){echo $selected2;} ?>>Smythe</option>
              <option value="Sniglet" <?php if($ULTIMATUMControl_headings_font=='Sniglet'){echo $selected2;} ?>>Sniglet</option>
              <option value="Special+Elite" <?php if($ULTIMATUMControl_headings_font=='Special+Elite'){echo $selected2;} ?>>Special Elite</option>
              <option value="Stardos+Stencil" <?php if($ULTIMATUMControl_headings_font=='Stardos+Stencil'){echo $selected2;} ?>>Stardos Stencil</option>
              <option value="Sue+Ellen+Francisco" <?php if($ULTIMATUMControl_headings_font=='Sue+Ellen+Francisco'){echo $selected2;} ?>>Sue Ellen Francisco</option>
              <option value="Sunshiney" <?php if($ULTIMATUMControl_headings_font=='Sunshiney'){echo $selected2;} ?>>Sunshiney</option>
              <option value="Swanky+and+Moo+Moo" <?php if($ULTIMATUMControl_headings_font=='Swanky+and+Moo+Moo'){echo $selected2;} ?>>Swanky and Moo Moo</option>
              <option value="Syncopate" <?php if($ULTIMATUMControl_headings_font=='Syncopate'){echo $selected2;} ?>>Syncopate</option>
              <option value="Tangerine" <?php if($ULTIMATUMControl_headings_font=='Tangerine'){echo $selected2;} ?>>Tangerine</option>
              <option value="Tenor+Sans" <?php if($ULTIMATUMControl_headings_font=='Tenor+Sans'){echo $selected2;} ?>> Tenor Sans </option>
              <option value="Terminal+Dosis+Light" <?php if($ULTIMATUMControl_headings_font=='Terminal+Dosis+Light'){echo $selected2;} ?>>Terminal Dosis Light</option>
              <option value="The+Girl+Next+Door" <?php if($ULTIMATUMControl_headings_font=='The+Girl+Next+Door'){echo $selected2;} ?>>The Girl Next Door</option>
              <option value="Tinos" <?php if($ULTIMATUMControl_headings_font=='Tinos'){echo $selected2;} ?>>Tinos</option>
              <option value="Ubuntu+Condensed" <?php if($ULTIMATUMControl_headings_font=='Ubuntu+Condensed'){echo $selected2;} ?>>Ubuntu Condensed</option>
              <option value="Ultra" <?php if($ULTIMATUMControl_headings_font=='Ultra'){echo $selected2;} ?>>Ultra</option>
              <option value="Unkempt" <?php if($ULTIMATUMControl_headings_font=='Unkempt'){echo $selected2;} ?>>Unkempt</option>
              <option value="UnifrakturCook:bold" <?php if($ULTIMATUMControl_headings_font=='UnifrakturCook:bold'){echo $selected2;} ?>>UnifrakturCook</option>
              <option value="UnifrakturMaguntia" <?php if($ULTIMATUMControl_headings_font=='UnifrakturMaguntia'){echo $selected2;} ?>>UnifrakturMaguntia</option>
              <option value="Varela" <?php if($ULTIMATUMControl_headings_font=='Varela'){echo $selected2;} ?>>Varela</option>
              <option value="Varela+Round" <?php if($ULTIMATUMControl_headings_font=='Varela+Round'){echo $selected2;} ?>>Varela Round</option>
              <option value="Vibur" <?php if($ULTIMATUMControl_headings_font=='Vibur'){echo $selected2;} ?>>Vibur</option>
              <option value="Vollkorn" <?php if($ULTIMATUMControl_headings_font=='Vollkorn'){echo $selected2;} ?>>Vollkorn</option>
              <option value="Waiting+for+the+Sunrise" <?php if($ULTIMATUMControl_headings_font=='Waiting+for+the+Sunrise'){echo $selected2;} ?>>Waiting for the Sunrise</option>
              <option value="Wallpoet" <?php if($ULTIMATUMControl_headings_font=='Wallpoet'){echo $selected2;} ?>>Wallpoet</option>
              <option value="Walter+Turncoat" <?php if($ULTIMATUMControl_headings_font=='Walter+Turncoat'){echo $selected2;} ?>>Walter Turncoat</option>
              <option value="Wire+One" <?php if($ULTIMATUMControl_headings_font=='Wire+One'){echo $selected2;} ?>>Wire One</option>
              <option value="Yanone+Kaffeesatz" <?php if($ULTIMATUMControl_headings_font=='Yanone+Kaffeesatz'){echo $selected2;} ?>>Yanone Kaffeesatz</option>
              <option value="Yeseva+One" <?php if($ULTIMATUMControl_headings_font=='Yeseva+One'){echo $selected2;} ?>>Yeseva One</option>
              <option value="Yellowtail" <?php if($ULTIMATUMControl_headings_font=='Yellowtail'){echo $selected2;} ?>>Yellowtail</option>
              <option value="Zeyada" <?php if($ULTIMATUMControl_headings_font=='Zeyada'){echo $selected2;} ?>>Zeyada</option>
              <option value="Rochester" <?php if($ULTIMATUMControl_headings_font=='Rochester'){echo $selected2;} ?>>Rochester</option>
              <?php } else { ?>
              <option value="Arial">Arial</option>
              <option value="Aclonica">Aclonica</option>
              <option value="Allan">Allan</option>
              <option value="Annie+Use+Your+Telescope">Annie Use Your Telescope</option>
              <option value="Anonymous+Pro">Anonymous Pro</option>
              <option value="Allerta+Stencil">Allerta Stencil</option>
              <option value="Allerta">Allerta</option>
              <option value="Amaranth">Amaranth</option>
              <option value="Anton">Anton</option>
              <option value="Architects+Daughter">Architects Daughter</option>
              <option value="Arimo">Arimo</option>
              <option value="Artifika">Artifika</option>
              <option value="Arvo">Arvo</option>
              <option value="Asset">Asset</option>
              <option value="Astloch">Astloch</option>
              <option value="Bangers">Bangers</option>
              <option value="Bentham">Bentham</option>
              <option value="Bevan">Bevan</option>
              <option value="Bigshot+One">Bigshot One</option>
              <option value="Bowlby+One">Bowlby One</option>
              <option value="Bowlby+One+SC">Bowlby One SC</option>
              <option value="Brawler">Brawler </option>
              <option value="Buda">Buda</option>
              <option value="Cabin">Cabin</option>
              <option value="Calligraffitti">Calligraffitti</option>
              <option value="Candal">Candal</option>
              <option value="Cantarell">Cantarell</option>
              <option value="Cardo">Cardo</option>
              <option value="Carter+One">Carter One</option>
              <option value="Caudex">Caudex</option>
              <option value="Cedarville+Cursive">Cedarville Cursive</option>
              <option value="Cherry+Cream+Soda">Cherry Cream Soda</option>
              <option value="Chewy">Chewy</option>
              <option value="Coda">Coda</option>
              <option value="Coming+Soon">Coming Soon</option>
              <option value="Copse">Copse</option>
              <option value="Corben">Corben</option>
              <option value="Cousine">Cousine</option>
              <option value="Covered+By+Your+Grace">Covered By Your Grace</option>
              <option value="Crafty+Girls">Crafty Girls</option>
              <option value="Crimson+Text">Crimson Text</option>
              <option value="Crushed">Crushed</option>
              <option value="Cuprum">Cuprum</option>
              <option value="Damion">Damion</option>
              <option value="Dancing+Script">Dancing Script</option>
              <option value="Dawning+of+a+New+Day">Dawning of a New Day</option>
              <option value="Didact+Gothic">Didact Gothic</option>
              <option value="Droid+Sans">Droid Sans</option>
              <option value="Droid+Sans+Mono">Droid Sans Mono</option>
              <option value="Droid+Serif">Droid Serif</option>
              <option value="EB+Garamond">EB Garamond</option>
              <option value="Expletus+Sans">Expletus Sans</option>
              <option value="Fontdiner+Swanky">Fontdiner Swanky</option>
              <option value="Forum">Forum</option>
              <option value="Francois+One">Francois One</option>
              <option value="Federo">Federo</option>
              <option value="Geo">Geo</option>
              <option value="Give+You+Glory">Give You Glory</option>
              <option value="Goblin+One">Goblin One</option>
              <option value="Goudy+Bookletter+1911">Goudy Bookletter 1911</option>
              <option value="Gravitas+One">Gravitas One</option>
              <option value="Gruppo">Gruppo</option>
              <option value="Hammersmith+One">Hammersmith One</option>
              <option value="Holtwood+One+SC">Holtwood One SC</option>
              <option value="Homemade+Apple">Homemade Apple</option>
              <option value="Inconsolata">Inconsolata</option>
              <option value="Indie+Flower">Indie Flower</option>
              <option value="IM+Fell+DW+Pica">IM Fell DW Pica</option>
              <option value="IM+Fell+DW+Pica+SC">IM Fell DW Pica SC</option>
              <option value="IM+Fell+Double+Pica">IM Fell Double Pica</option>
              <option value="IM+Fell+Double+Pica+SC">IM Fell Double Pica SC</option>
              <option value="IM+Fell+English">IM Fell English</option>
              <option value="IM+Fell+English+SC">IM Fell English SC</option>
              <option value="IM+Fell+French+Canon">IM Fell French Canon</option>
              <option value="IM+Fell+French+Canon+SC">IM Fell French Canon SC</option>
              <option value="IM+Fell+Great+Primer">IM Fell Great Primer</option>
              <option value="IM+Fell+Great+Primer+SC">IM Fell Great Primer SC</option>
              <option value="Irish+Grover">Irish Grover</option>
              <option value="Irish+Growler">Irish Growler</option>
              <option value="Istok+Web">Istok Web</option>
              <option value="Josefin+Sans">Josefin Sans Regular 400</option>
              <option value="Josefin+Slab">Josefin Slab Regular 400</option>
              <option value="Judson">Judson</option>
              <option value="Jura"> Jura Regular</option>
              <option value="Just+Another+Hand">Just Another Hand</option>
              <option value="Just+Me+Again+Down+Here">Just Me Again Down Here</option>
              <option value="Kameron">Kameron</option>
              <option value="Kenia">Kenia</option>
              <option value="Kranky">Kranky</option>
              <option value="Kreon">Kreon</option>
              <option value="Kristi">Kristi</option>
              <option value="La+Belle+Aurore">La Belle Aurore</option>
              <option value="Lato">Lato</option>
              <option value="League+Script">League Script</option>
              <option value="Lekton"> Lekton </option>
              <option value="Limelight"> Limelight </option>
              <option value="Lobster">Lobster</option>
              <option value="Lobster+Two">Lobster Two</option>
              <option value="Lora">Lora</option>
              <option value="Love+Ya+Like+A+Sister">Love Ya Like A Sister</option>
              <option value="Loved+by+the+King">Loved by the King</option>
              <option value="Luckiest+Guy">Luckiest Guy</option>
              <option value="Maiden+Orange">Maiden Orange</option>
              <option value="Mako">Mako</option>
              <option value="Maven+Pro"> Maven Pro</option>
              <option value="Meddon">Meddon</option>
              <option value="MedievalSharp">MedievalSharp</option>
              <option value="Megrim">Megrim</option>
              <option value="Merriweather">Merriweather</option>
              <option value="Metrophobic">Metrophobic</option>
              <option value="Michroma">Michroma</option>
              <option value="Miltonian+Tattoo">Miltonian Tattoo</option>
              <option value="Miltonian">Miltonian</option>
              <option value="Modern+Antiqua">Modern Antiqua</option>
              <option value="Monofett">Monofett</option>
              <option value="Molengo">Molengo</option>
              <option value="Mountains+of+Christmas">Mountains of Christmas</option>
              <option value="Muli">Muli Regular</option>
              <option value="Neucha">Neucha</option>
              <option value="Neuton">Neuton</option>
              <option value="News+Cycle">News Cycle</option>
              <option value="Nixie+One">Nixie One</option>
              <option value="Nobile">Nobile</option>
              <option value="Nova+Cut">Nova Cut</option>
              <option value="Nova+Flat">Nova Flat</option>
              <option value="Nova+Mono">Nova Mono</option>
              <option value="Nova+Oval">Nova Oval</option>
              <option value="Nova+Round">Nova Round</option>
              <option value="Nova+Script">Nova Script</option>
              <option value="Nova+Slim">Nova Slim</option>
              <option value="Nova+Square">Nova Square</option>
              <option value="Nunito"> Nunito Regular</option>
              <option value="OFL+Sorts+Mill+Goudy+TT">OFL Sorts Mill Goudy TT</option>
              <option value="Old+Standard+TT">Old Standard TT</option>
              <option value="Open+Sans" selected="selected">Open Sans</option>
              <option value="Open+Sans+Condensed">Open Sans Condensed</option>
              <option value="Orbitron">Orbitron Regular (400)</option>
              <option value="Oswald">Oswald</option>
              <option value="Over+the+Rainbow">Over the Rainbow</option>
              <option value="Reenie+Beanie">Reenie Beanie</option>
              <option value="Pacifico">Pacifico</option>
              <option value="Patrick+Hand">Patrick Hand</option>
              <option value="Paytone+One">Paytone One</option>
              <option value="Permanent+Marker">Permanent Marker</option>
              <option value="Philosopher">Philosopher</option>
              <option value="Play">Play</option>
              <option value="Playfair+Display"> Playfair Display </option>
              <option value="Podkova"> Podkova </option>
              <option value="PT+Sans">PT Sans</option>
              <option value="PT+Sans+Narrow">PT Sans Narrow</option>
              <option value="PT+Serif">PT Serif</option>
              <option value="Puritan">Puritan</option>
              <option value="Quattrocento">Quattrocento</option>
              <option value="Quattrocento+Sans">Quattrocento Sans</option>
              <option value="Radley">Radley</option>
              <option value="Raleway">Raleway</option>
              <option value="Redressed">Redressed</option>
              <option value="Rock+Salt">Rock Salt</option>
              <option value="Rokkitt">Rokkitt</option>
              <option value="Ruslan+Display">Ruslan Display</option>
              <option value="Schoolbell">Schoolbell</option>
              <option value="Shadows+Into+Light">Shadows Into Light</option>
              <option value="Shanti">Shanti</option>
              <option value="Sigmar+One">Sigmar One</option>
              <option value="Six+Caps">Six Caps</option>
              <option value="Slackey">Slackey</option>
              <option value="Smythe">Smythe</option>
              <option value="Sniglet">Sniglet</option>
              <option value="Special+Elite">Special Elite</option>
              <option value="Stardos+Stencil">Stardos Stencil</option>
              <option value="Sue+Ellen+Francisco">Sue Ellen Francisco</option>
              <option value="Sunshiney">Sunshiney</option>
              <option value="Swanky+and+Moo+Moo">Swanky and Moo Moo</option>
              <option value="Syncopate">Syncopate</option>
              <option value="Tangerine">Tangerine</option>
              <option value="Tenor+Sans"> Tenor Sans </option>
              <option value="Terminal+Dosis+Light">Terminal Dosis Light</option>
              <option value="The+Girl+Next+Door">The Girl Next Door</option>
              <option value="Tinos">Tinos</option>
              <option value="Ubuntu+Condensed">Ubuntu Condensed</option>
              <option value="Ultra">Ultra</option>
              <option value="Unkempt">Unkempt</option>
              <option value="UnifrakturCook:bold">UnifrakturCook</option>
              <option value="UnifrakturMaguntia">UnifrakturMaguntia</option>
              <option value="Varela">Varela</option>
              <option value="Varela+Round">Varela Round</option>
              <option value="Vibur">Vibur</option>
              <option value="Vollkorn">Vollkorn</option>
              <option value="Waiting+for+the+Sunrise">Waiting for the Sunrise</option>
              <option value="Wallpoet">Wallpoet</option>
              <option value="Walter+Turncoat">Walter Turncoat</option>
              <option value="Wire+One">Wire One</option>
              <option value="Yanone+Kaffeesatz">Yanone Kaffeesatz</option>
              <option value="Yeseva+One">Yeseva One</option>
              <option value="Yellowtail">Yellowtail</option>
              <option value="Zeyada">Zeyada</option>
              <option value="Rochester">Rochester</option>
              <?php } ?>
            </select>
            <span class="default_value"><?php echo $text_default_value; ?>: Open Sans</span></td>
        </tr>
        <tr>
          <td><?php echo $text_headings1_size; ?>:</td>
          <td><input id="ULTIMATUMControl_headings1_size" type="text" name="ULTIMATUMControl_headings1_size" value="<?php echo $ULTIMATUMControl_headings1_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_headings2_size; ?>:</td>
          <td><input id="ULTIMATUMControl_headings2_size" type="text" name="ULTIMATUMControl_headings2_size" value="<?php echo $ULTIMATUMControl_headings2_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_headings3_size; ?>:</td>
          <td><input id="ULTIMATUMControl_headings3_size" type="text" name="ULTIMATUMControl_headings3_size" value="<?php echo $ULTIMATUMControl_headings3_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_headings4_size; ?>:</td>
          <td><input id="ULTIMATUMControl_headings4_size" type="text" name="ULTIMATUMControl_headings4_size" value="<?php echo $ULTIMATUMControl_headings4_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_price_size; ?>:</td>
          <td><input id="ULTIMATUMControl_price_size" type="text" name="ULTIMATUMControl_price_size" value="<?php echo $ULTIMATUMControl_price_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_module_title_size; ?>:</td>
          <td><input id="ULTIMATUMControl_module_title_size" type="text" name="ULTIMATUMControl_module_title_size" value="<?php echo $ULTIMATUMControl_module_title_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_column_title_size; ?>:</td>
          <td><input id="ULTIMATUMControl_column_title_size" type="text" name="ULTIMATUMControl_column_title_size" value="<?php echo $ULTIMATUMControl_column_title_size; ?>" class="spicy" >
            px</td>
        </tr>
        <tr>
          <td><?php echo $text_category_item_size; ?>:</td>
          <td><input id="ULTIMATUMControl_category_item_size" type="text" name="ULTIMATUMControl_category_item_size" value="<?php echo $ULTIMATUMControl_category_item_size; ?>" class="spicy" >
            px</td>
        </tr>
      </table>
      <h2 class="fonts"><span><?php echo $text_custom_font; ?></span></h2>
      <table class="form">
        <tr>
          <td><?php echo $text_custom_font_code; ?>:</td>
          <td><input id="ULTIMATUMControl_custom_font" type="text" name="ULTIMATUMControl_custom_font" value="<?php echo $ULTIMATUMControl_custom_font; ?>" class="spicy" >
            <span class="default_value">example: &lt;link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700&subset=latin,cyrillic,latin-ext,greek' rel='stylesheet' type='text/css'&gt;</pre></span></td>
        </tr>
        <tr>
          <td><?php echo $text_custom_font_family; ?>:</td>
          <td><input id="ULTIMATUMControl_custom_font_family" type="text" name="ULTIMATUMControl_custom_font_family" value="<?php echo $ULTIMATUMControl_custom_font_family; ?>" class="spicy" >
            <span class="default_value">example: Open Sans</span></td>
        </tr>
      </table>
    </div>
    <div class="htabs-content" id="tab_social">
      <div>
        <h2><span>Social icons in footer</span></h2>
        <table class="form">
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_twitter.png" alt="Twitter" /></td>
            <td><input id="ULTIMATUMControl_twitter_id" type="text" name="ULTIMATUMControl_twitter_id" value="<?php echo $ULTIMATUMControl_twitter_id ; ?>" class="spicy" >
              <span class="default_value">Link to twitter page</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_facebook.png" alt="Facebook" /></td>
            <td><input id="ULTIMATUMControl_facebook_id" type="text" name="ULTIMATUMControl_facebook_id" value="<?php echo $ULTIMATUMControl_facebook_id ; ?>" class="spicy" >
              <span class="default_value">Link to facebook page/profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_pinterest.png" alt="Pinterest" /></td>
            <td><input id="ULTIMATUMControl_pinterest_id" type="text" name="ULTIMATUMControl_pinterest_id" value="<?php echo $ULTIMATUMControl_pinterest_id ; ?>" class="spicy" >
              <span class="default_value">Link to pinterest profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_google.png" alt="Google+" /></td>
            <td><input id="ULTIMATUMControl_google_id" type="text" name="ULTIMATUMControl_google_id" value="<?php echo $ULTIMATUMControl_google_id ; ?>" class="spicy" >
              <span class="default_value">Link to google+ profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_youtube.png" alt="YouTube" /></td>
            <td><input id="ULTIMATUMControl_youtube_id" type="text" name="ULTIMATUMControl_youtube_id" value="<?php echo $ULTIMATUMControl_youtube_id ; ?>" class="spicy" >
              <span class="default_value">Link to youtube profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_vimeo.png" alt="Vimeo" /></td>
            <td><input id="ULTIMATUMControl_vimeo_id" type="text" name="ULTIMATUMControl_vimeo_id" value="<?php echo $ULTIMATUMControl_vimeo_id ; ?>" class="spicy" >
              <span class="default_value">Link to vimeo profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_linkedin.png" alt="LinkedIn" /></td>
            <td><input id="ULTIMATUMControl_linkedin_id" type="text" name="ULTIMATUMControl_linkedin_id" value="<?php echo $ULTIMATUMControl_linkedin_id ; ?>" class="spicy" >
              <span class="default_value">Link to linkedIn profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_dribbble.png" alt="Dribbble" /></td>
            <td><input id="ULTIMATUMControl_dribble_id" type="text" name="ULTIMATUMControl_dribble_id" value="<?php echo $ULTIMATUMControl_dribble_id ; ?>" class="spicy" >
              <span class="default_value">Link to Dribbble profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_skype.png" alt="Skype" /></td>
            <td><input id="ULTIMATUMControl_skype_id" type="text" name="ULTIMATUMControl_skype_id" value="<?php echo $ULTIMATUMControl_skype_id ; ?>" class="spicy" >
              <span class="default_value">Skype profile ID</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_picasa.png" alt="Picasa" /></td>
            <td><input id="ULTIMATUMControl_picasa_id" type="text" name="ULTIMATUMControl_picasa_id" value="<?php echo $ULTIMATUMControl_picasa_id ; ?>" class="spicy" >
              <span class="default_value">Link to Picasa profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_flickr.png" alt="Flickr" /></td>
            <td><input id="ULTIMATUMControl_flickr_id" type="text" name="ULTIMATUMControl_flickr_id" value="<?php echo $ULTIMATUMControl_flickr_id ; ?>" class="spicy" >
              <span class="default_value">Link to Flickr profile</span></td>
          </tr>
          <tr>
          <td style="width:40px;"><img src="view/stylesheet/images/icon_instagram.png" alt="Instagram" /></td>
            <td><input id="ULTIMATUMControl_instagram_id" type="text" name="ULTIMATUMControl_instagram_id" value="<?php echo $ULTIMATUMControl_instagram_id ; ?>" class="spicy" >
              <span class="default_value">Link to Instagram profile</span></td>
          </tr>
        </table>
      </div>   
    </div>
    <div class="htabs-content" id="tab_cards">
      <div>
        <h2 class="cards"><span><?php echo $text_icons; ?></span></h2>
        <table class="form">
          <tr>
            <td class="paypal" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_paypal" class="spicy">
                <?php if (isset($ULTIMATUMControl_paypal)) {
              $selected113 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_paypal=='0'){echo $selected113;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_paypal=='1'){echo $selected113;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="visa" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_visa" class="spicy">
                <?php if (isset($ULTIMATUMControl_visa)) {
              $selected111 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_visa=='0'){echo $selected111;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_visa=='1'){echo $selected111;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="electron" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_electron" class="spicy">
                <?php if (isset($ULTIMATUMControl_electron)) {
              $selected112 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_electron=='0'){echo $selected112;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_electron=='1'){echo $selected112;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="master" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_master" class="spicy">
                <?php if (isset($ULTIMATUMControl_master)) {
              $selected114 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_master=='0'){echo $selected114;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_master=='1'){echo $selected114;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="maestro" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_maestro" class="spicy">
                <?php if (isset($ULTIMATUMControl_maestro)) {
              $selected115 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_maestro=='0'){echo $selected115;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_maestro=='1'){echo $selected115;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="american" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_american" class="spicy">
                <?php if (isset($ULTIMATUMControl_american)) {
              $selected116 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_american=='0'){echo $selected116;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_american=='1'){echo $selected116;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="cirrus" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_cirrus" class="spicy">
                <?php if (isset($ULTIMATUMControl_cirrus)) {
              $selected117 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_cirrus=='0'){echo $selected117;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_cirrus=='1'){echo $selected117;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="two_checkout" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_2checkout" class="spicy">
                <?php if (isset($ULTIMATUMControl_2checkout)) {
              $selected118 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_2checkout=='0'){echo $selected118;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_2checkout=='1'){echo $selected118;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="delta" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_delta" class="spicy">
                <?php if (isset($ULTIMATUMControl_delta)) {
              $selected119 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_delta=='0'){echo $selected119;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_delta=='1'){echo $selected119;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="discover" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_discover" class="spicy">
                <?php if (isset($ULTIMATUMControl_discover)) {
              $selected120 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_discover=='0'){echo $selected120;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_discover=='1'){echo $selected120;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="google" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_google" class="spicy">
                <?php if (isset($ULTIMATUMControl_google)) {
              $selected121 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_google=='0'){echo $selected121;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_google=='1'){echo $selected121;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="moneybookers" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_moneybookers" class="spicy">
                <?php if (isset($ULTIMATUMControl_moneybookers)) {
              $selected122 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_moneybookers=='0'){echo $selected122;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_moneybookers=='1'){echo $selected122;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="sage" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_sage" class="spicy">
                <?php if (isset($ULTIMATUMControl_sage)) {
              $selected123 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_sage=='0'){echo $selected123;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_sage=='1'){echo $selected123;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="solo" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_solo" class="spicy">
                <?php if (isset($ULTIMATUMControl_solo)) {
              $selected124 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_solo=='0'){echo $selected124;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_solo=='1'){echo $selected124;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="switch" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_switch" class="spicy">
                <?php if (isset($ULTIMATUMControl_switch)) {
              $selected125 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_switch=='0'){echo $selected125;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_switch=='1'){echo $selected125;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td class="western" style="width:40px;"></td>
            <td><select name="ULTIMATUMControl_western" class="spicy">
                <?php if (isset($ULTIMATUMControl_western)) {
              $selected126 = 'selected="selected"';
              ?>
                <option value="0" <?php if($ULTIMATUMControl_western=='0'){echo $selected126;} ?>><?php echo $text_disabled; ?></option>
                <option value="1" <?php if($ULTIMATUMControl_western=='1'){echo $selected126;} ?>><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="clear"></div>
  </form>
</div>
</div>
<script type="text/javascript">

$(document).ready(function() {

	$('#ULTIMATUMControl_headings_color, #ULTIMATUMControl_module_headings_background, #ULTIMATUMControl_module_headings_color, #ULTIMATUMControl_text_color, #ULTIMATUMControl_links_color, #ULTIMATUMControl_links_color_hover, #ULTIMATUMControl_body_bg_color, #ULTIMATUMControl_button_color, #ULTIMATUMControl_button_color_hover, #ULTIMATUMControl_price_color, #ULTIMATUMControl_footer_bg_color, #ULTIMATUMControl_header_top_color, #ULTIMATUMControl_header_top_border,  #ULTIMATUMControl_header_top_back, #ULTIMATUMControl_header_top_border, #ULTIMATUMControl_category_menu_back, #ULTIMATUMControl_menu_icon_back, #ULTIMATUMControl_cart_icon_back, #ULTIMATUMControl_main_menu_hover_background, #ULTIMATUMControl_main_menu_hover_color, #ULTIMATUMControl_content_background_color, #ULTIMATUMControl_powered_bg, #ULTIMATUMControl_prefooter_borders, #ULTIMATUMControl_prefooter_border_top, #ULTIMATUMControl_prefooter_titles, #ULTIMATUMControl_column_box_color, #ULTIMATUMControl_container_bg_color, #ULTIMATUMControl_column_box_title, #ULTIMATUMControl_footer_box_title, #ULTIMATUMControl_footer_link_color, #ULTIMATUMControl_footer_link_border, #ULTIMATUMControl_main_menu_color, #ULTIMATUMControl_cur_color,  #ULTIMATUMControl_cur_hover_color,#ULTIMATUMControl_category_menu_color, #ULTIMATUMControl_category_menu_hover_background, #ULTIMATUMControl_category_menu_hover_color, #ULTIMATUMControl_prefooter_bg, #ULTIMATUMControl_main_price_color, #ULTIMATUMControl_old_price_color, #ULTIMATUMControl_cart_button_color, #ULTIMATUMControl_buttons_color_hover, #ULTIMATUMControl_cat_title_background, #ULTIMATUMControl_cat_title_color, #ULTIMATUMControl_breadcrumb_color, #ULTIMATUMControl_new_label_color, #ULTIMATUMControl_sale_label_color, #ULTIMATUMControl_save_label_color, #ULTIMATUMControl_boxtop_border, #ULTIMATUMControl_Featuredtop_border, #ULTIMATUMControl_buttons_color, #ULTIMATUMControl_wish_button_color, #ULTIMATUMControl_compare_button_color, #ULTIMATUMControl_product_tab_color, #ULTIMATUMControl_countdown_color, #ULTIMATUMControl_header_bg_color, #ULTIMATUMControl_category_menu_border, #ULTIMATUMControl_powered_text, #ULTIMATUMControl_drop_border, #ULTIMATUMControl_headings_accent, #ULTIMATUMControl_featured_background_color, #ULTIMATUMControl_latest_background_color, #ULTIMATUMControl_bestseller_background_color, #ULTIMATUMControl_special_background_color, #ULTIMATUMControl_welcome_background_color, #ULTIMATUMControl_banners_background_color, #ULTIMATUMControl_slideshow_background_color, #ULTIMATUMControl_featured_title_color, #ULTIMATUMControl_latest_title_color, #ULTIMATUMControl_bestseller_title_color, #ULTIMATUMControl_special_title_color, #ULTIMATUMControl_welcome_title_color, #ULTIMATUMControl_banners_title_color, #ULTIMATUMControl_slideshow_title_color, #ULTIMATUMControl_ULTIMATUMtabs_background_color, #ULTIMATUMControl_ULTIMATUMtabs_title_color, #ULTIMATUMControl_ULTIMATUMaccordion_background_color, #ULTIMATUMControl_ULTIMATUMaccordion_title_color, #ULTIMATUMControl_ULTIMATUMtoggle_background_color, #ULTIMATUMControl_ULTIMATUMtoggle_title_color, #ULTIMATUMControl_deal_background_color, #ULTIMATUMControl_deal_title_color, #ULTIMATUMControl_tabbed_background_color, #ULTIMATUMControl_prod_name_color, #ULTIMATUMControl_iconboxes_background_color, #ULTIMATUMControl_iconboxes_title_color, #ULTIMATUMControl_iconboxes_icon_color, #ULTIMATUMControl_cat15_color, #ULTIMATUMControl_cat14_color, #ULTIMATUMControl_cat13_color, #ULTIMATUMControl_cat12_color, #ULTIMATUMControl_cat11_color, #ULTIMATUMControl_cat10_color, #ULTIMATUMControl_cat9_color, #ULTIMATUMControl_cat8_color, #ULTIMATUMControl_cat7_color, #ULTIMATUMControl_cat6_color, #ULTIMATUMControl_cat5_color, #ULTIMATUMControl_cat4_color, #ULTIMATUMControl_menu_bar_background, #ULTIMATUMControl_cat3_color, #ULTIMATUMControl_cat2_color, #ULTIMATUMControl_cat1_color, #ULTIMATUMControl_shop_cats_background, #ULTIMATUMControl_shop_cats_color, #ULTIMATUMControl_menu_bar_border_top, #ULTIMATUMControl_menu_bar_border_bottom, #ULTIMATUMControl_top_links_hover_color, #ULTIMATUMControl_default_cat_color, #ULTIMATUMControl_header_cms_block_background, #ULTIMATUMControl_default_cat_hover_color, #ULTIMATUMControl_top_links_hover_background, #ULTIMATUMControl_main_menu_hover_back, #ULTIMATUMControl_product1_cms_button_color, #ULTIMATUMControl_product1_cms_block_color, #ULTIMATUMControl_product2_cms_button_color, #ULTIMATUMControl_product2_cms_block_color,  #ULTIMATUMControl_header_cms_button_color, #ULTIMATUMControl_header_cms_block_color, #ULTIMATUMControl_pagetitle_title_color, #ULTIMATUMControl_product2_cms_block_background, #ULTIMATUMControl_cat_sort_color, #ULTIMATUMControl_cat_sort_back, #ULTIMATUMControl_product1_cms_block_background, #ULTIMATUMControl_prod_hold_back').ColorPicker({
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
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
function image_upload(field, previewImg) {
	
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + previewImg).replaceWith('<img src="' + data + '" alt="" class="PreviewImage" id="' + previewImg + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('.htabslang1_top a').tabs();
$('.htabslang2_top a').tabs();
$('.htabslang3_top a').tabs();
$('.htabslang1 a').tabs();
$('.htabslang2 a').tabs();
$('.htabslang3 a').tabs();
$('.htabslang1_1 a').tabs();
$('.htabslang2_1 a').tabs();
$('.htabslang3_1 a').tabs();
$('.htabslang4_1 a').tabs();
$('.htabslang5_1 a').tabs();
$('.htabslang1_2 a').tabs();
$('.htabslang2_2 a').tabs();
$('.htabslang3_2 a').tabs();
$('.htabslang7 a').tabs();
$('.htabslang8 a').tabs();
$('.htabslang9 a').tabs();
$('.htabslang7_1 a').tabs();
$('.htabslang8_1 a').tabs();
$('.htabslang9_1 a').tabs();
$('.htabslang7_2 a').tabs();
$('.htabslang8_2 a').tabs();
$('.htabslang9_2 a').tabs()
$('#tabsheader a').tabs();
$('#tabsmodule a').tabs();
$('#tabsmodule2 a').tabs();
$('.htabs_header_cms_1_1 a').tabs();
$('.htabs_product1_cms_1_1 a').tabs();
$('.htabs_product2_cms_1_1 a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_1<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_2<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_3<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_4<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_5<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_submenu_6<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
<?php } ?>				
//--></script>     

<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_custom_contact<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_seals<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_header_cms_block_content_1<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_product1_cms_block_content_1<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
				CKEDITOR.replace('ULTIMATUMControl_product2_cms_block_content_1<?php echo $language['language_id']; ?>', {
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
//--></script>    
<?php echo $footer; ?> 