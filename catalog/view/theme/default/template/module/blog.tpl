<style type="text/css">
	.blog_subject {
		font-size: 15px;
		font-weight: bold;
	}
	.blog_tagline {
		font-size: 10px;
		margin-bottom: 10px;
	}
	.blog_content {
		margin-bottom: 25px;
	}
</style>
<div id="blog">
<?php foreach ($posts as $post) {?>
	  <div class="heading"><?php echo $post['subject']; ?></div>
	<div class="blog_tagline"><?php echo $post['date_posted']." ".$by." ".$post['author']; ?></div>
	<div class="blog_content"><?php echo $post['content']; ?></div>
<?php } ?>
</div>