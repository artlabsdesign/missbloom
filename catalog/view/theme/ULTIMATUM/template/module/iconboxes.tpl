<?php if($this->config->get('ULTIMATUMControl_iconboxes_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #iconboxesVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_iconboxesBg1Img') || $this->config->get('ULTIMATUMControl_iconboxesBg2Img') != null && $this->config->get('ULTIMATUMControl_iconboxes_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$('html.no-touch .box-iconboxes').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<?php
  $number = count($sections);
  $start = 0;
  ?>
<?php if (count($sections) == 1) { ?>
  <?php $boxNum = "full_width"; ?>
<?php } ?>
<?php if (count($sections) == 2) { ?>
  <?php $boxNum = "one_half"; ?>
<?php } ?>
<?php if (count($sections) == 3) { ?>
  <?php $boxNum = "one_third"; ?>
<?php } ?>
<?php if (count($sections) == 4) { ?>
  <?php $boxNum = "one_fourth"; ?>
<?php } ?>
<?php if (count($sections) == 5) { ?>
  <?php $boxNum = "one_fifth"; ?>
<?php } ?>

<div class="box box-iconboxes <?php echo $parClass; ?>" id="iconboxes<?php echo $module; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_iconboxes_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_iconboxes_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="iconboxesVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_iconboxes_video'); ?>',containment:'#iconboxes<?php echo $module; ?> .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_iconboxes_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">
<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>
<?php foreach($sections as $section){ ?>

<div class="iconbox <?php echo $boxNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>">
<div class="icon_wrapper">
<span class="icon_inner"><i class="<?php echo $section['icon']; ?>"></i></span>
</div>
<div class="iconbox_content">
  
	  <?php if ($section['title'] != "..."){ ?>
      <span class="h3"><?php echo $section['title']; ?></span>
      <?php } ?> 
      <?php if ($section['description'] != "..."){ ?>
      <?php echo $section['description']; ?>
      <?php } ?>

</div>  
</div>
<?php $start = $start + 1; ?>
<?php } ?>
<div class="clear"></div>
</div>
</div>
