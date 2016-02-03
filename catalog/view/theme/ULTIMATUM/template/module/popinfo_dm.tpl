<div id="popinfo_<?php echo $module; ?>" class="popinfo_wrapper <?php echo $importance; ?>"  style="display:none;">
<div class="popinfo <?php echo $importance; ?>">
	<div class="close" id="popinfo-close-<?php echo $module; ?>"><i class="icon-remove"></i></div>
	
	<div class="product-data">
		<div class="description"><?php echo $message; ?> 
		<?php if ($link) { ?>
			<a href="<?php echo $link; ?>" class="button"><?php echo $text_more; ?></a>
		<?php } ?>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var target = '#popinfo_<?php echo $module; ?>';
	
	<?php if ($importance == "high") { ?>
	var ww = $(window).width();
	var pm = $(target).width();
	$(target).show("fade", {}, 1200);
	<?php } else { ?>
	$(target).show("fade", {}, 600);
	$(target).effect("pulsate", { times:2 }, 1500);
	<?php if ($sound == '1'){ ?>
	$('#note_sound')[0].play();
	<?php } ?>
	<?php } ?>
	
	$('#popinfo-close-<?php echo $module; ?>').bind('click', function(){
		 $(target).hide("fade", {}, 1000);
		 <?php if ($need_count) { ?>
			$.ajax({
				url: 'index.php?route=module/popinfo/countclose'
			});
		 <?php } ?>
	});
});
</script>
<?php if ($sound == '1'){ ?>
<audio id="note_sound" controls preload="auto" hidden="hidden">
  <source src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/note.wav" controls></source>
</audio>
<?php } ?>