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
      <h1 class="settings"><?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs htabs2">
		<a href="#tab-general"><?php echo $tab_general; ?></a>
		<a href="#tab-option"><?php echo $tab_option; ?></a>
		<a href="#tab-image"><?php echo $tab_image; ?></a>
	  </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></td>
              <td><input type="text" name="blog_name" value="<?php echo $blog_name; ?>" size="40" />
                <?php if ($error_name) { ?>
                <span class="error"><?php echo $error_name; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_title; ?></td>
              <td><input type="text" name="blog_title" value="<?php echo $blog_title; ?>" size="40" />
                <?php if ($error_title) { ?>
                <span class="error"><?php echo $error_title; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_meta_description; ?></td>
              <td><textarea name="blog_meta_description" cols="40" rows="5"><?php echo $blog_meta_description; ?></textarea></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_email; ?></td>
              <td><input type="text" name="blog_email" value="<?php echo $blog_email; ?>" size="40" />
                <?php if ($error_email) { ?>
                <span class="error"><?php echo $error_email; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-option">
          <h2 class="layout"><?php echo $text_items; ?></h2>
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_blog_limit; ?></td>
              <td><input type="text" name="blog_limit" value="<?php echo $blog_limit; ?>" size="3" />
                <?php if ($error_blog_limit) { ?>
                <span class="error"><?php echo $error_blog_limit; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <h2 class="layout"><?php echo $text_post; ?></h2>
          <table class="form">
		    <tr>
              <td><span class="required">*</span> <?php echo $entry_posted_by; ?></td>
              <td><select name="blog_posted_by">
			  <?php if ($blog_posted_by == 'firstname lastname') { ?>
				<option value="" selected="selected"></option>
				<option value="firstname lastname" selected="selected"><?php echo $text_pb_firstname_lastname; ?></option>
				<option value="lastname firstname"><?php echo $text_pb_lastname_firstname; ?></option>
				<option value="username"><?php echo $text_pb_username; ?></option>
			  
			  <?php } elseif ($blog_posted_by == 'lastname firstname') { ?>
				<option value="" selected="selected"></option>
				<option value="firstname lastname"><?php echo $text_pb_firstname_lastname; ?></option>
				<option value="lastname firstname" selected="selected"><?php echo $text_pb_lastname_firstname; ?></option>
				<option value="username"><?php echo $text_pb_username; ?></option>
			 
			 <?php } elseif($blog_posted_by == 'username') { ?>
				<option value="" selected="selected"></option>
				<option value="firstname lastname"><?php echo $text_pb_firstname_lastname; ?></option>
				<option value="lastname firstname"><?php echo $text_pb_lastname_firstname; ?></option>
				<option value="username" selected="selected"><?php echo $text_pb_username; ?></option>
			  
			  <?php } else { ?>
				<option value="" selected="selected"></option>
				<option value="firstname lastname"><?php echo $text_pb_firstname_lastname; ?></option>
				<option value="lastname firstname"><?php echo $text_pb_lastname_firstname; ?></option>
				<option value="username"><?php echo $text_pb_username; ?></option>
			  <?php } ?>
              </select>
			  <?php if ($error_blog_posted_by) { ?>
                <span class="error"><?php echo $error_blog_posted_by; ?></span>
              <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_comment; ?></td>
              <td><?php if ($blog_comment_status) { ?>
                <input type="radio" name="blog_comment_status" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="blog_comment_status" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="blog_comment_status" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="blog_comment_status" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_comment_require_approve; ?></td>
              <td><?php if ($blog_comment_require_approve) { ?>
                <input type="radio" name="blog_comment_require_approve" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="blog_comment_require_approve" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="blog_comment_require_approve" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="blog_comment_require_approve" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
          </table>
		  <h2 class="layout"><?php echo $text_account; ?></h2>
          <table class="form">
		    <tr>
              <td><span class="required">*</span> <?php echo $entry_admin_group; ?></td>
              <td><select name="blog_admin_group_id">
				<option value=""></option>
				<?php foreach($user_groups as $user_group) { ?>
				<?php if ($user_group['user_group_id'] == $blog_admin_group_id) { ?>
				<option value="<?php echo $user_group['user_group_id']; ?>" selected="selected"><?php echo $user_group['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $user_group['user_group_id']; ?>"><?php echo $user_group['name']; ?></option>
				<?php } ?>
				<?php } ?>
              </select>
			  <?php if ($error_blog_admin_group_id) { ?>
                <span class="error"><?php echo $error_blog_admin_group_id; ?></span>
              <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_author_group; ?></td>
              <td><select name="blog_author_group_id">
				<option value=""></option>
				<?php foreach($user_groups as $user_group) { ?>
				<?php if ($user_group['user_group_id'] == $blog_author_group_id) { ?> 
				<option value="<?php echo $user_group['user_group_id']; ?>" selected="selected"><?php echo $user_group['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $user_group['user_group_id']; ?>"><?php echo $user_group['name']; ?></option>
				<?php } ?>
				<?php } ?>
              </select>
			  <?php if ($error_blog_author_group_id) { ?>
                <span class="error"><?php echo $error_blog_author_group_id; ?></span>
              <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-image">
          <table class="form">
            <tr>
              <td><?php echo $entry_logo; ?></td>
              <td><div class="image"><img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
                  <input type="hidden" name="blog_logo" value="<?php echo $blog_logo; ?>" id="logo" />
                  <br />
                  <a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_icon; ?></td>
              <td><div class="image"><img src="<?php echo $icon; ?>" alt="" id="thumb-icon" />
                  <input type="hidden" name="blog_icon" value="<?php echo $blog_icon; ?>" id="icon" />
                  <br />
                  <a onclick="image_upload('icon', 'thumb-icon');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-icon').attr('src', '<?php echo $no_image; ?>'); $('#icon').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_thumb; ?></td>
              <td><input type="text" name="blog_image_thumb_width" value="<?php echo $blog_image_thumb_width; ?>" size="3" />
                x
                <input type="text" name="blog_image_thumb_height" value="<?php echo $blog_image_thumb_height; ?>" size="3" />
                <?php if ($error_image_thumb) { ?>
                <span class="error"><?php echo $error_image_thumb; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_popup; ?></td>
              <td><input type="text" name="blog_image_popup_width" value="<?php echo $blog_image_popup_width; ?>" size="3" />
                x
                <input type="text" name="blog_image_popup_height" value="<?php echo $blog_image_popup_height; ?>" size="3" />
                <?php if ($error_image_popup) { ?>
                <span class="error"><?php echo $error_image_popup; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_post; ?></td>
              <td><input type="text" name="blog_image_post_width" value="<?php echo $blog_image_post_width; ?>" size="3" />
                x
                <input type="text" name="blog_image_post_height" value="<?php echo $blog_image_post_height; ?>" size="3" />
                <?php if ($error_image_post) { ?>
                <span class="error"><?php echo $error_image_post; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_additional; ?></td>
              <td><input type="text" name="blog_image_additional_width" value="<?php echo $blog_image_additional_width; ?>" size="3" />
                x
                <input type="text" name="blog_image_additional_height" value="<?php echo $blog_image_additional_height; ?>" size="3" />
                <?php if ($error_image_additional) { ?>
                <span class="error"><?php echo $error_image_additional; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_related; ?></td>
              <td><input type="text" name="blog_image_related_width" value="<?php echo $blog_image_related_width; ?>" size="3" />
                x
                <input type="text" name="blog_image_related_height" value="<?php echo $blog_image_related_height; ?>" size="3" />
                <?php if ($error_image_related) { ?>
                <span class="error"><?php echo $error_image_related; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
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
$('#tabs a').tabs();
//--></script> 
<?php echo $footer; ?>