<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #ULTIMATUMtabsVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg1Img') || $this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg2Img') != null && $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-ULTIMATUMtabs').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>

<?php
  $number = count($sections);
  $start = 0;
  ?>
<div class="box box-ULTIMATUMtabs <?php echo $parClass; ?>" id="ULTIMATUMtabs<?php echo $module; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="ULTIMATUMtabsVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video'); ?>',containment:'.box-ULTIMATUMtabs .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">
<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>
<div id="tabs<?php echo $module; ?>" class="htabs"></div>

<?php foreach($sections as $section){ ?>
<?php $start = $start + 1; ?>
<a href="#tab-<?php echo $start; ?>" class="tabberro">
<i class="<?php echo $section['icon']; ?>"></i>
<?php if ($section['title'] != "..."){ ?>
<?php echo $section['title']; ?>
      <?php } ?> 
</a>
<div id="tab-<?php echo $start; ?>" class="tab-content">  
	  
      <?php if ($section['description'] != "..."){ ?>
      <?php echo $section['description']; ?>
      <?php } ?>
</div>

<?php } ?>
<div class="clear"></div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){	
	$('.tabberro').prependTo('#tabs<?php echo $module; ?>');
	$('#tabs<?php echo $module; ?> a').tabs();
})
</script>
