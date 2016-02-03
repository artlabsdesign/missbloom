<?php if(($this->config->get('ULTIMATUMControl_custom_contentBg1Img') || $this->config->get('ULTIMATUMControl_custom_contentBg2Img') != null) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$('html.no-touch .box-custom_content').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<?php if (($setting['position'] == 'column_left') || ($setting['position'] == 'column_right') || ($setting['position'] == 'content_footer')){ ?>

<div class="box box-custom_content" id="custom_content<?php echo $module; ?>">

<?php if ($module_title){ ?>
  <div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box-content">
<?php echo $message; ?>
</div>
</div>

<?php } else { ?>
<div class="box box-custom_content <?php echo $parClass; ?>" id="custom_content<?php echo $module; ?>">
<div class="bg"></div>
<div class="inner">
<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>
<div class="box-content">
<?php echo $message; ?>
</div>
<div class="clear"></div>
</div>
</div>
<?php } ?>