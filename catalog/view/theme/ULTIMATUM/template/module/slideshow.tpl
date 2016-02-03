<?php if(($this->config->get('ULTIMATUMControl_slideshowBg1Img') || $this->config->get('ULTIMATUMControl_slideshowBg2Img') != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-slideshow').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<?php if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom') || ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')){ ?>

<div class="slideshow box box-slideshow <?php echo $parClass; ?>">
  <div class="bg"></div>
  <div class="inner">
    <div id="slideshow<?php echo $module; ?>" class="nivoSlider">
      <?php foreach ($banners as $banner) { ?>
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
      <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>
<?php } else { ?>
<div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider({
        effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
        animSpeed: 600, // Slide transition speed
        pauseTime: 5000, // How long each slide will show
        directionNav: true, // Next & Prev navigation
        controlNav: false, // 1,2,3... navigation
        pauseOnHover: true, // Stop animation while hovering
    });
});
--></script>