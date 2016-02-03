<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #ULTIMATUMtoggleVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg1Img') || $this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg2Img') != null && $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$('html.no-touch .box-ULTIMATUMtoggle').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>

<?php
  $number = count($sections);
  $start = 0;
  ?>
<div class="box box-ULTIMATUMtoggle <?php echo $parClass; ?>" id="ULTIMATUMtoggle<?php echo $module; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="ULTIMATUMtoggleVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video'); ?>',containment:'.box-ULTIMATUMtoggle .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">



<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>
<div class="toggling toggling<?php echo $module; ?>" id="toggling<?php echo $module; ?>">
<?php foreach($sections as $section){ ?>
<?php $start = $start + 1; ?>
  <div class="togg-header">
  <i class="<?php echo $section['icon']; ?>"></i>
<?php if ($section['title'] != "..."){ ?>
<?php echo $section['title']; ?>
      <?php } ?> 
  </div>
  <div class="togg-content">
  <?php if ($section['description'] != "..."){ ?>
      <?php echo $section['description']; ?>
      <?php } ?>
  </div>
  <?php } ?>
</div>
<div class="clear"></div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
   $(".toggling<?php echo $module; ?> .togg-header").click(function() {
     // For active header definition
     $('.togg-header').removeClass('on');
     $(this).addClass('on');
     
     // Accordion actions
     if($(this).next("div").is(":visible")){
       $(this).next("div").slideUp("slow");
     } else {
       $(this).next("div").slideToggle("slow");
     }
  });
});
</script>
