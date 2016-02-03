<div class="latest-post-big fixed post_right">
	<?php if( $blog['thumb'] && $config->get('cat_show_image') )  { ?>
		<div class="news-post-img"><a href="/news/<?=$blog['keyword'];?>"><img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>"></a></div>
	<?php } ?>
	<div class="post_wrapper fixed">
		<?php 
		if( $config->get('cat_show_title') ) { ?>
		
		
		<?php if( $config->get('cat_show_created') ) { ?>
			<div class="post-date"><span><?php echo date("d",strtotime($blog['created']));?></span> <?php echo date("M",strtotime($blog['created']));?> <small><?php echo date("Y",strtotime($blog['created']));?></small></div>
			<?php } ?>
		<?php } ?>
		
			
			
			<?php if( $config->get('cat_show_description') ) {?>
			
			<h4 class="post-title-mod_2">	<a href="/news/<?=$blog['keyword'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h4>

			<p><?php echo $blog['description'];?></p>       


			<?php } ?>
	<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>

