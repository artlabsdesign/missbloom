<?php echo $header; ?>
<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>  
</div>
</div>

<?php echo $content_top_fullwidth; ?>

<div id="content_wrap" class="inner main_inner"> <?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content">

<div id="content_sections">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>

<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

  
  <div class="login-content">
    <div class="left">
      <h3><?php echo $text_new_customer; ?></h3>
      <div class="content">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <h3><?php echo $text_returning_customer; ?></h3>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
          <b><?php echo $entry_email; ?></b><br />
          <input type="text" name="email" value="<?php echo $email; ?>" />
          <br />
          <br />
          <b><?php echo $entry_password; ?></b><br />
          <input type="password" name="password" value="<?php echo $password; ?>" />
          <br />
          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
      </form>
    </div>
    <div class="clear"></div>
  </div>
<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?> 
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script>