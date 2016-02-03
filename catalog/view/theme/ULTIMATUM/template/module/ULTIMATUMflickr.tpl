<?php if (($setting['position'] == 'column_left') || ($setting['position'] == 'column_right')){ ?>
<div id="ULTIMATUMflickr-box" class="box" >
<div class="box-heading"><?php echo $heading_title; ?></div>
	<div id="ULTIMATUflickr-content" class="box-content">
		<div class="flickr_widget_wrapper">
                            <script src="https://www.flickr.com/badge_code_v2.gne?count=<?php echo $limit; ?>&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=<?php echo $username; ?>"></script>
                            <div class="clear"></div>
                        </div>
	</div>
</div>
<?php } ?>
<?php if ($setting['position'] == 'content_footer'){ ?>
<div id="ULTIMATUMflickr-box" class="box" >
<div class="box-heading"><?php echo $heading_title; ?></div>
	<div id="ULTIMATUflickr-content" class="box-content">
		<div class="flickr_widget_wrapper">
                            <script src="https://www.flickr.com/badge_code_v2.gne?count=<?php echo $limit; ?>&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=<?php echo $username; ?>"></script>
                            <div class="clear"></div>
                        </div>
	</div>
</div>
<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function(){
 $(".flickr_widget_wrapper a").attr('target','_blank');
});
</script> 