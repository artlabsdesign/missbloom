<?php if($this->config->get('ULTIMATUMControl_slideshow_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #slideshowVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
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
  <div class="bg">
  <?php if((($this->config->get('ULTIMATUMControl_slideshow_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_slideshow_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="slideshowVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_slideshow_video'); ?>',containment:'.box-slideshow .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_slideshow_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>
  </div>
  <div class="inner">
    <div id="flexslideshow<?php echo $module; ?>" class="flexslider loading">
      <ul class="slides">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <li><a href="<?php echo $banner['link']; ?>"> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="slide_img" /> </a> </li>
        <?php } else { ?>
        <li> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="slide_img" /> </li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
    
  </div>
  <script type="text/javascript">
  $(window).load(function() {
    $('#flexslideshow<?php echo $module; ?>').flexslider({
          animation: "fade",
		  pauseOnHover: true,
		  pauseOnAction: false,
		  touch: true,
		  animationSpeed: 1300,
		  slideshowSpeed: 6000,
		  smoothHeight: false,
		  controlNav: false,
          directionNav: true,
		  start: function(slider) {
                        slider.removeClass('loading');
                }
    });
	function run() {
		  
          jQuery('.progress_bar').animate({'width': window.innerWidth+"px"}, 6000, run).width(0);
          }
          run();

         jQuery('.flexslider').hover(
         function() {
         jQuery('.progress_bar').stop();
         });

         jQuery('.flexslider').mouseout(
         function() {
         jQuery('.progress_bar').animate({'width': window.innerWidth+"px"}, 6000, run).width(0);
         });
  });
</script>
<div class="progress_bar_container">
      <div class="progress_bar"></div>
    </div> 
</div>
<?php } else { ?>
<div id="flexslideshow<?php echo $module; ?>" class="flexslider loading">
  <ul class="slides">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <li><a href="<?php echo $banner['link']; ?>"> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="slide_img" /> </a> </li>
    <?php } else { ?>
    <li> <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="slide_img" /> </li>
    <?php } ?>
    <?php } ?>
  </ul>
</div>
<script type="text/javascript">
  $(window).load(function() {
    $('#flexslideshow<?php echo $module; ?>').flexslider({
          animation: "fade",
		  pauseOnHover: true,
		  pauseOnAction: false,
		  touch: true,
		  animationSpeed: 1300,
		  slideshowSpeed: 5000,
		  smoothHeight: false,
		  controlNav: false,
          directionNav: true,
		  start: function(slider) {
                        slider.removeClass('loading');
                }
    });
  });
</script> 
<?php } ?>

