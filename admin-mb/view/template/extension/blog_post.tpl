<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
<div class="heading">
     <h1 style="background-image: url('view/image/module.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location='<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
</div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
  <div id="tab_general" class="page">
    <table class="form">
    <tr>
            <td width="25%"><?=$author_name; ?></td>
            <td><?=$author; ?></td>
    </tr>
      <?php foreach ($languages as $language) { ?>
      <tr>
        <td width="25%"><?php echo $entry_status; ?></td>
        <td><select name="status">
			<option value="published" <?php echo ($status == "published") ? "selected" : ""; ?>><? echo $blog_published; ?></option>
			<option value="draft" <?php echo ($status == "draft") ? "selected" : ""; ?>><? echo $blog_draft; ?></option>
			</select>
      </tr>
	<?php if ($error_subject) { ?>
		<tr class="warning"><td colspan='2'><?php echo $error_subject; ?></td></tr>
	<?php } ?>
      <tr>
        <td width="25%"><span class="required">*</span> <?php echo $entry_subject; ?></td>
        <td><input size="75" name="subject" value="<?php echo isset($subject) ? $subject : ''; ?>" />
      </tr>
	<?php if ($error_content) { ?>
		<tr class="warning"><td colspan='2'><?php echo $error_content; ?></td></tr>
	<?php } ?>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_content; ?></td>
        <td><textarea name="content" id="description<?php echo $language['language_id']; ?>"><?php echo isset($content) ? $content : ''; ?></textarea>
          <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /></td>
      </tr>
      <?php } ?>
    </table>
  </div>
</form>
<br />
<div class="success"><? echo $footblog;?></div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>');
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
<?php echo $footer; ?>