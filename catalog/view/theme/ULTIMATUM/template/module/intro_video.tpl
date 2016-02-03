<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_click_start = $this->language->get('text_click_start');
?>
<!-- Home Section -->
	<div id="fullscreen_slider">
    
    
    
    	
		
        <?php if ($videourl){ ?>
        <!-- Video Background -->        
        
        <a id="bgndVideo" class="player" data-property="{videoURL:'<?php echo $videourl; ?>',containment:'#fullscreen_slider', showControls:false, autoPlay:true, loop:true, mute:<?php echo $mute; ?>, startAt:<?php echo $start; ?>, <?php if ($stop){ ?>stopAt:<?php echo $stop; ?>,<?php } ?> opacity:.9, addRaster:true, quality:'default'}"> </a>
        <!--/Video Background -->
		<?php } ?>

        <?php if ($mute == "false"){ ?>
        <div class="video_controlls">
        <a id="video-volume" href="#" onclick="jQuery('#bgndVideo').toggleVolume()"><i class="icon-volume-up"></i></a>
        <a id="video-play" href="#" onclick="jQuery('#bgndVideo').playYTP()"><i class="icon-play"></i></a>
        <a id="video-pause" href="#" onclick="jQuery('#bgndVideo').pauseYTP()"><i class="icon-pause"></i></a>
        </div>
        <?php } ?>

<div id="slides">
        
        
       <ul class="slides-container"> 
      
      <?php foreach($sections as $section){ ?> 
       <li>
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
						<a href="#header_top" onclick="$('#bgndVideo').getPlayer().pauseVideo()">
                        <i class="icon-double-angle-down"></i>
                        <span class="textlink"><?php echo $text_click_start; ?></span></a>
					</div>
</div>      
<script>
$(document).ready(function() {
$("html.no-touch .player").mb_YTPlayer();
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