<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_wish = $this->language->get('text_wish');
$text_compare = $this->language->get('text_compare');
$text_sale = $this->language->get('text_sale');
$text_save = $this->language->get('text_save');
$text_new_prod = $this->language->get('text_new_prod');
$text_left = $this->language->get('text_left');
$text_purchased = $this->language->get('text_purchased');
$text_limited = $this->language->get('text_limited');
?>
<?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<div class="box box-testimonials <?php echo $parClass; ?>">
  <div class="bg"></div>
  <div class="inner">
    <span class="h2 heading_title"><span>
      <?php if ($customertestimonial_title=="") echo "<br>"; else echo 'Отзывы'; ?>
      </span></span>
    <div class="box-content">
      <div id="testimonials_module<?php echo $module; ?>">
        <?php foreach ($customertestimonials as $customertestimonial) { ?>
        <div class="testimoial_unit">
        <?php if ($customertestimonial['rating']) { ?>
          <div class="testimoial_rating"> <img src="catalog/view/theme/ULTIMATUM/image/testimonials/stars-<?php echo $customertestimonial['rating'] . '.png'; ?>" alt="rating" /> </div>
          <?php } ?>
        <div class="testimonial_title"><? if($customertestimonial['title']):?><h4><?php echo $customertestimonial['title']; ?></h4><? endif;?></div>
        
        <div class="testimonial_description"><?php echo $customertestimonial['description'] ; ?></div>
          
          <div class="testimoial_author_img">
          <?php if ($customertestimonial['avatar']!="") { ?>
          <img src="<?php echo $customertestimonial['avatar']; ?>" alt="user avatar" />
          <?php } else { ?>
          <img src="catalog/view/theme/ULTIMATUM/image/no_avatar.jpg"  alt="user avatar" />
          <?php } ?>
          </div>
          
          
          <div class="testimoial_author">
          
          <?php if ($customertestimonial['name']!="") echo $customertestimonial['name']; ?>
          </div>


        </div>
        <?php }  ?>
        
        
        
      </div>
      
      <div class="testimonial_buttons">
        <a href="<?php echo $showall_url;?>" class="button"><?php echo $show_all; ?> (<?php echo $total ?>)</a>
        <a href="<?php echo $sendtests; ?>" class="button"><?php echo $send_customertestimonial; ?></a>
        </div>
      
    </div>
  </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
     
    var owl = $("#testimonials_module<?php echo $module; ?>");
     
    owl.owlCarousel({
    items : 3, //10 items above 1000px browser width
    itemsDesktop : [979,2], //5 items between 1000px and 901px
    itemsDesktopSmall : [768,2], // betweem 900px and 601px
    itemsTablet: [480,1], //2 items between 600 and 0
    itemsMobile : [479,1], // itemsMobile disabled - inherit from itemsTablet option
	pagination: true,
	autoPlay : 4500,
	navigation: false
    });
     
    });
	</script>