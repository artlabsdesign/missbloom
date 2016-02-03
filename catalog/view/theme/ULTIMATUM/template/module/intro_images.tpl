<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_click_start = $this->language->get('text_click_start');
?>
<!-- Home Section -->
	<div id="fullscreen_slider">
    
<?php
  $number = count($sections);
  $start = 0;
  ?>    
    
    	
		

		<div id="slides">
        
        
       <ul class="slides-container"> 
      
      <?php foreach($sections as $section){ ?> 
       <li>
       <img src="<?php echo $section['image']; ?>" />
       <div class="pattern"></div>
        <div class="inner">
        

        
        
        
        <div class="slide">
        <?php if ($section['title'] != "..."){ ?>
      	<h2><?php echo $section['title']; ?></h2>
      	<?php } ?>
        <?php if ($section['description'] != ""){ ?>
        <div class="full_desc_holder">
      <?php echo $section['description']; ?>
      </div>
      <?php } ?>
      
      
      <?php if ($section['sub_title'] != "..."){ ?>
      	<h5><?php echo $section['sub_title']; ?></h5>
      	<?php } ?>
        </div>
        
        
        </div>
        
</li>
<?php } ?>        
        
        
        </ul>    
             
        </div>
        
        
		<div class="arrow">
						<a href="#header_top">
                        <i class="icon-double-angle-down"></i>
                        <span class="textlink"><?php echo $text_click_start; ?></span></a>
		</div>		
	</div>

        
<script>
$(document).ready(function() {
$(function() {
      $('#slides').superslides({
		pagination: false,
        <?php if (count($sections) > 1) { ?>
        play: 5000,
		<?php } ?>
		animation: 'fade',
        inherit_width_from: '#fullscreen_slider',
        inherit_height_from: '#fullscreen_slider'
      });
    });
$(".arrow a").click(function(e){var full_url=this.href;var parts=full_url.split("#");var trgt=parts[1];var target_offset=$("#"+trgt).offset();var target_top=target_offset.top;$("html,body").animate({scrollTop:target_top},800);return false;});     
    });

</script>

	
	<!-- End Home Section -->
    <style type="text/css">
	@media screen and (max-width: 767px) {
    #fullscreen_slider {
		background:url(<?php echo $poster; ?>) center center no-repeat;
	}
	}
    </style>