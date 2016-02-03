<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #ULTIMATUMaccordionVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg1Img') || $this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg2Img') != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$('html.no-touch .box-ULTIMATUMaccordion').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>

<?php
  $number = count($sections);
  $start = 0;
  ?>
<div class="box box-ULTIMATUMaccordion <?php echo $parClass; ?>" id="ULTIMATUMaccordion<?php echo $module; ?>">
<div class="bg">

<?php if((($this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_video') != null) && ($setting['position'] == 'content_top_fullwidth')) || (($this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_video') != null) && ($setting['position'] == 'content_bottom_fullwidth'))) { ?>
<div class="pattern"></div>
<a id="ULTIMATUMaccordionVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_video'); ?>',containment:'.box-ULTIMATUMaccordion .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>

</div>
<div class="inner">



<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>
<div class="accordion accordion<?php echo $module; ?>" id="accordion<?php echo $module; ?>">
<?php foreach($sections as $section){ ?>
<?php $start = $start + 1; ?>
  <div class="accord-header" id="accord-header<?php echo $module; ?>-header<?php echo $start; ?>">
  <i class="<?php echo $section['icon']; ?>"></i>
<?php if ($section['title'] != "..."){ ?>
<?php echo $section['title']; ?>
      <?php } ?> 
  </div>
  <div class="accord-content" id="accordion<?php echo $module; ?>div<?php echo $start; ?>">
  <?php if ($section['description'] != "..."){ ?>
      <?php echo $section['description']; ?>
      <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
   $(".accordion<?php echo $module; ?> .accord-header").click(function() {
     // For active header definition
     $('.accord-header').removeClass('on');
     $(this).addClass('on');
     
     // Accordion actions
     if($(this).next("div").is(":visible")){
       $(this).next("div").slideUp("slow");
     } else {
       $(".accordion<?php echo $module; ?> .accord-content").slideUp("slow");
       $(this).next("div").slideToggle("slow");
     }
  });
});
</script>
<script type="text/javascript">
$(document).ready(function() {
document.getElementById("accordion<?php echo $module; ?>div1").style.display = 'block';
$("#accord-header<?php echo $module; ?>-header1").addClass('on');
});
</script>
