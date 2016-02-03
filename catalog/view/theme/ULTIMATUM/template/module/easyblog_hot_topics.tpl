<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content fixed">
    <div id="chooser<?php echo $module; ?>" class="chooser fixed">
		<?php if ($recent_posts) { ?>
		<a href="#tab-recent<?php echo $module; ?>" title="<?php echo $tab_recent; ?>"><i class="icon-bell"></i></a>
		<?php } ?>
		
		<?php if ($most_viewed) { ?>
		<a href="#tab-viewed<?php echo $module; ?>" title="<?php echo $tab_viewed; ?>"><i class="icon-eye-open"></i></a>
		<?php } ?>
		
		<?php if ($most_discussed) { ?>
		<a href="#tab-commented<?php echo $module; ?>" title="<?php echo $tab_discussed; ?>"><i class="icon-comments"></i></a>
		<?php } ?>
	</div>
	
	<?php if ($recent_posts) { ?>
	<div id="tab-recent<?php echo $module; ?>" class="chooser-content">
		<ul class="hot-topics">
			<?php foreach($recent_posts as $post) { ?>
			<li><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['pic']; ?>" title="<?php echo $post['name']; ?>" alt="<?php echo $post['name']; ?>" /><?php echo $post['name']; ?></a></li>	
			<?php } ?>
		</ul>
	</div>
	<?php } ?>
	
	<?php if ($most_viewed) { ?>
	<div id="tab-viewed<?php echo $module; ?>" class="chooser-content">
		<ul class="hot-topics">
			<?php foreach($most_viewed as $post) { ?>
			<li><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['pic']; ?>" title="<?php echo $post['name']; ?>" alt="<?php echo $post['name']; ?>" /><?php echo $post['name']; ?><small><?php echo $post['viewed']; ?></small></a></li>	
			<?php } ?>
		</ul>
	</div>
	<?php } ?>
	
	<?php if ($most_discussed) { ?>
	<div id="tab-commented<?php echo $module; ?>" class="chooser-content">
		<ul class="hot-topics">
			<?php foreach($most_discussed as $post) { ?>
			<li><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['pic']; ?>" title="<?php echo $post['name']; ?>" alt="<?php echo $post['name']; ?>" /><?php echo $post['name']; ?><small><?php echo $post['reviews']; ?></small></a></li>	
			<?php } ?>
		</ul>
	</div>
	<?php } ?>
	
  </div>
</div>
<script type="text/javascript"><!--
$('#chooser<?php echo $module; ?> a').tabs();
//--></script>
