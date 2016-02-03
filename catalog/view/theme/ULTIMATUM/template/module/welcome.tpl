<?php if($this->config->get('ULTIMATUMControl_welcome_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("#welcomeVideo").mb_YTPlayer();
})
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_welcomeBg1Img') || $this->config->get('ULTIMATUMControl_welcomeBg2Img') != null && $this->config->get('ULTIMATUMControl_welcome_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-welcome').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<div class="box box-welcome <?php echo $parClass; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_welcome_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_welcome_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="welcomeVideo" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_welcome_video'); ?>',containment:'.box-welcome .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_welcome_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">
<h2 class="heading_title"><span><?php echo $heading_title; ?></span></h2>
<div class="box-content">

<?php echo $message; ?>
</div>
</div>
</div>