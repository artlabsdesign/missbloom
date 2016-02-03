<div class="box">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content fixed">
	<?php if ($posts) { ?>
	<ul class="hot-topics">
		<?php foreach($posts as $post) { ?>
		<li><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['thumb_small']; ?>" title="<?php echo $post['name']; ?>" alt="<?php echo $post['name']; ?>" /><?php echo $post['name']; ?></a></li>	
		<?php } ?>
	</ul>
	<?php } ?>
	</div>
</div>
