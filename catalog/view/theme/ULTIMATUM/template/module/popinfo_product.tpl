<div id="popinfo_<?php echo $module; ?>" class="popinfo_wrapper <?php echo $importance; ?>"  style="display:none;">
<div class="popinfo <?php echo $importance; ?>">
	<div class="close" id="popinfo-close-<?php echo $module; ?>"><i class="icon-remove"></i></div>
    <h4><?php echo $text_promo_offer; ?></h4>
    <div class="clear"></div>
	<?php if ($image){ ?>
	<div class="image"><a href="<?php echo $link; ?>"><img src="<?php echo $image; ?>" /></a></div>
	<?php } ?>
	<div class="product-data <?php echo $product_data_class;?>">
		<div class="name"><a href="<?php echo $link; ?>"><?php echo $name; ?> - 
		<?php if ($special){ ?>
		<?php echo $special; ?>
		<?php } else { ?>
		<?php echo $price; ?>
		<?php } ?>
		</a>
		</div>
		<div class="description"><?php echo $description; ?> [<a href="<?php echo $link; ?>"><?php echo $text_more; ?></a>]</div>
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