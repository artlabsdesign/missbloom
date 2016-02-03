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
      <h1 class="install"><?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<table class="form" style="text-align:center;">
			<tr>
				<td class="left">
                <span style="font-size:36px; background-color:#C00; font-weight:bold; display:block; margin:30px auto; color:#ffffff; padding:15px;">WARNING! READ CAREFULLY!</span>
                <br />
<span style="font-size:14px; color:#333333; font-weight:normal; display:block; margin:0 0 30px 0; line-height:20px;">The ULTIMATUM EasyBlog installation script will attempt to automaticaly create the required database tables</span><br />
<span style="font-size:14px; color:#333333; font-weight:normal; display:block; margin:0 0 30px 0; line-height:20px;">Before you proceed with the installation, make sure the mysql user associated with this store have CREATE TABLE permissions set! If you're not sure about this, <strong>CANCEL INSTALLATION</strong> and check with your hosting control panel database management tool (CPanel, phpMyAdmin etc.)</span><br />

                </td>
			</tr>
            <tr>

				<td class="left">
				<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_install_now; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
				</td>
			</tr>
		</table>
        <div class="scrollbox" style="display:none;"><?php echo $tables_sql; ?></div>
    </form> 
    </div>
  </div>
</div>


<?php echo $footer; ?>