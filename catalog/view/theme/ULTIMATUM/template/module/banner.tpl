<?php if($this->config->get('ULTIMATUMControl_banners_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #bannersVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>

<?php if(($this->config->get('ULTIMATUMControl_bannersBg1Img') || $this->config->get('ULTIMATUMControl_bannersBg2Img') != null) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-banners').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<?php
  $number = count($banners);
  $start = 0;
  ?>

<?php if (count($banners) == 1) { ?>
  <?php $banNum = "full_width"; ?>
<?php } ?>
<?php if (count($banners) == 2) { ?>
  <?php $banNum = "one_half"; ?>
<?php } ?>
<?php if (count($banners) == 3) { ?>
  <?php $banNum = "one_third"; ?>
<?php } ?>
<?php if (count($banners) == 4) { ?>
  <?php $banNum = "one_fourth"; ?>
<?php } ?>
<?php if (count($banners) == 5) { ?>
  <?php $banNum = "one_fifth"; ?>
<?php } ?>


<?php if (($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<div class="box box-banners <?php echo $parClass; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_banners_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_banners_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="bannersVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_banners_video'); ?>',containment:'.box-banners .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_banners_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">
<div id="banner<?php echo $module; ?>" class="banner">

  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div class="<?php echo $banNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>"><span class="ban_mask"></span><a class="roll" href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
  <?php if(($this->config->get('ULTIMATUMControl_banner_name_mode') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?><span class="ban_name"><?php echo $banner['title']; ?></span><?php } ?></div>
  <?php } else { ?>
  <div class="<?php echo $banNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><?php if(($this->config->get('ULTIMATUMControl_banner_name_mode') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?><span class="ban_name"><?php echo $banner['title']; ?></span><?php } ?></div>
  <?php } ?>
  
  
  <?php $start = $start + 1; ?>
  <?php } ?>
<div class="clear"></div>  
</div>
</div>
</div>
<?php } ?>

<?php if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom') || ($setting['position'] == 'content_top_two_third') || ($setting['position'] == 'content_top_one_third_last')) { ?>
<div class="box box-banners">
<div class="inner">
<div id="banner<?php echo $module; ?>" class="banner">

  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div class="<?php echo $banNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>"><span class="ban_mask"></span><a class="roll" href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
  <?php if(($this->config->get('ULTIMATUMControl_banner_name_mode') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?><span class="ban_name"><?php echo $banner['title']; ?></span><?php } ?></div>
  <?php } else { ?>
  <div class="<?php echo $banNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><?php if(($this->config->get('ULTIMATUMControl_banner_name_mode') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?><span class="ban_name"><?php echo $banner['title']; ?></span><?php } ?></div>
  <?php } ?>
  <?php $start = $start + 1; ?>
  <?php } ?>
  <div class="clear"></div>
</div>
</div>
</div>
<?php } ?>

<?php if (($setting['position'] == 'column_left') || ($setting['position'] == 'column_right') || ($setting['position'] == 'content_footer') || ($setting['position'] == 'header_icon_teaser')) { ?>
<div id="banner<?php echo $module; ?>" class="banner">
  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><div class="clear"></div></a></div>
  <?php } else { ?>
  <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><div class="clear"></div></div>
  <?php } ?>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#banner<?php echo $module; ?> div:first-child').css('display', 'block');
});
var banner = function() {
	$('#banner<?php echo $module; ?>').cycle({
		before: function(current, next) {
			$(next).parent().height($(next).outerHeight());
			$(next).parent().width($(next).outerWidth());
		}
	});
}

setTimeout(banner, 2500);
//--></script>
<?php } ?>