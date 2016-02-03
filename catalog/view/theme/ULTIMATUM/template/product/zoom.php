<?php if ($thumb) { ?>
<div class="image"> <a href="<?php echo $popup; ?>" class="cloud-zoom" id="zoom1" rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4"><img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
<?php } ?>
<div class="clear"></div>
<?php if ($images) { ?>
<div class="image-additional fixed"> <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' "> <img src="<?php echo $thumbsmall; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /> </a>
  <?php foreach ($images as $image) { ?>
  <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $image['smallimage']; ?>' "> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /> </a>
  <?php } ?>
</div>
<?php } ?>
<div class="clear"></div>
<?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_additional_image_mode') == '1')){ ?>
<script type="text/javascript">
    $(document).ready(function() {
     
    var owl = $(".image-additional");
     
    owl.owlCarousel({
    items : 4, //10 items above 1000px browser width
    itemsDesktop : [979,4], //5 items between 1000px and 901px
    itemsDesktopSmall : [768,3], // betweem 900px and 601px
    itemsTablet: [480,3], //2 items between 600 and 0
    itemsMobile : [479,2], // itemsMobile disabled - inherit from itemsTablet option
	pagination: false,
	navigation: true
    });
     
    // Custom Navigation Events
    $(".next").click(function(){
    owl.trigger('owl.next');
    })
    $(".prev").click(function(){
    owl.trigger('owl.prev');
    })
     
    });
	</script>
<?php } ?>
