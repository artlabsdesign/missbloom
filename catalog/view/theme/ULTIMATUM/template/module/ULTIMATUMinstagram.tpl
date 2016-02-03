<?php if (($setting['position'] == 'column_left') || ($setting['position'] == 'column_right')){ ?>
<?php
$inst_h = (69 * $grid_vertical) + $grid_vertical;
?>
<div id="ULTIMATUMinstagram-box" class="box" />
<div class="box-heading"><?php echo $heading_title; ?></div>
	<div id="ULTIMATUinstagram-content" class="box-content">
		<iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://widget.stagram.com/in/<?php echo $username; ?>/?s=59&w=<?php echo $grid_horizontal; ?>&h=<?php echo $grid_vertical; ?>&b=0&p=1" style="border:none;overflow:hidden;width:210px;height:<?php echo $inst_h; ?>px"></iframe>
	</div>
</div>
<?php } ?>
<?php if ($setting['position'] == 'content_footer'){ ?>
<?php
$inst_h = (83 * $grid_vertical) + $grid_vertical;
?>
<div id="ULTIMATUMinstagram-box" class="box" />
<div class="box-heading"><?php echo $heading_title; ?></div>
	<div id="ULTIMATUinstagram-content" class="box-content">
		<iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://widget.stagram.com/in/<?php echo $username; ?>/?s=73&amp;w=<?php echo $grid_horizontal; ?>&amp;h=<?php echo $grid_vertical; ?>&amp;b=0&amp;p=1" style="border:none;overflow:hidden;width:252px; height:<?php echo $inst_h; ?>px"></iframe>
	</div>
</div>
<?php } ?>