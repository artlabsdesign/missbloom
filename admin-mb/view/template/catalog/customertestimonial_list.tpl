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
	  <h1><?php echo $heading_title; ?></h1>
    	  <div class="buttons"><a href="<?php echo $module_settings_path; ?>" class="button"><span><?php echo $text_module_settings; ?></span></a><a onclick="location='<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a><a onclick="$('form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
    </div>

  <div class="content">
    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>

            <td class="left"><?php if ($sort == 'td.description') { ?>
              <a href="<?php echo $sort_description; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_description; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_description; ?>"><?php echo $column_description; ?></a>
              <?php } ?></td>


            <td class="left"><?php if ($sort == 'td.title') { ?>
              <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
              <?php } ?></td>
            <td class="left"><?php if ($sort == 't.name') { ?>
              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
              <?php } ?></td>
            <td class="right"><?php if ($sort == 't.date_added') { ?>
              <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
              <?php } ?></td>
            <td class="right"><?php if ($sort == 't.status') { ?>
              <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
              <?php } ?></td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($customertestimonials) { ?>
          <?php foreach ($customertestimonials as $customertestimonial) { ?>
          <tr>
            <td style="align: center;"><?php if ($customertestimonial['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $customertestimonial['customertestimonial_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $customertestimonial['customertestimonial_id']; ?>" />
              <?php } ?></td>
            <td class="left">

<?php if ($customertestimonial['avatar']!="") { ?>
<img style="float: left; padding: 0px 10px 0px 0px;" src="<?php echo $customertestimonial['avatar']; ?>">
<?php } else { ?>
<img style="float: left; padding: 0px 10px 0px 0px;" src="view/image/no_avatar.jpg">
<?php } ?>

<?php echo $customertestimonial['description']; ?></td>
            <td class="left"><?php echo $customertestimonial['title']; ?></td>
            <td class="left">


		<?php if ($customertestimonial['name']!="") echo $customertestimonial['name']; ?>


		</td>

            <td class="right"><?php echo $customertestimonial['date_added']; ?></td>
            <td class="right"><?php echo $customertestimonial['status']; ?></td>
            <td class="right"><?php foreach ($customertestimonial['action'] as $action) { ?>
              [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php if ($customertestimonial_total!=-1) echo $text_no_results; else echo $entry_install_first; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </form>
    <div class="pagination"><?php echo $pagination; ?></div>
  </div>
</div>
<?php echo $footer; ?>