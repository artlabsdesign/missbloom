<?php echo $header; ?>
<div class="title-holder">
<div class="inner">


<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?>
			<?php } ?>
 </div>




<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1> 
</div>
</div>

<?php echo $content_top_fullwidth; ?>

<div id="content_wrap" class="inner main_inner"> <?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content">
  <div id="content_sections">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>

<div class="box">
  <div class="box-content">
    <span class="blog-meta">
    	<i class="icon-user"></i><?php echo $text_by_author; ?> | 
		<?php if ($posted_in_categories) {?>
		<i class="icon-folder-open"></i><?php echo $text_posted_in; ?><?php echo $posted_in_categories; ?> | 
		<?php } ?>
		<i class="icon-comments"></i><?php echo $text_comments; ?> | 
		<i class="icon-eye-open"></i><?php echo $text_views; ?>
	</span> 
  </div>
</div>

		<div class="page-description"><?php echo $description; ?></div>
		<?php if ($tags) { ?>
		<div class="post-tags"><b><i class="icon-tags"></i><?php echo $text_tags; ?></b>
		<?php foreach ($tags as $tag) { ?>
		<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
		<?php } ?>
		</div>
		<?php } ?>
        
        <?php if ($images) { ?>
	<div class="box-gallery">
      <h3 class="heading_title"><span><i class="icon-picture"></i><?php echo $tab_photo_gallery; ?> (<?php echo count($images); ?>)</span></h3>

		<?php foreach ($images as $image) { ?>
			<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="ilightbox" data-type="image"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
		<?php } ?>

	</div>	
    <?php } ?>
     
    <div style="margin:10px auto 30px auto; padding:5px 0; overflow:hidden;"> 
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addthis_32x32_style">
<a class="addthis_button_facebook"></a>
<a class="addthis_button_twitter"></a>
<a class="addthis_button_pinterest_share"></a>
<a class="addthis_button_vk"></a>
<a class="addthis_button_google_plusone_share"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>

<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
<!-- AddThis Button END -->
 <div class="clear"></div>         
          </div>
     
     <?php if ($posts) { ?>

	<div class="box box-related-posts fixed">
	<h2 class="heading_title"><span><i class="icon-list"></i><?php echo $tab_related; ?> (<?php echo count($posts); ?>)</span></h2>

		<div class="related-posts">
		<?php foreach($posts as $post) { ?>
		<div class="related-post-item element_from_bottom">
			<div class="image"><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['thumb']; ?>" alt="<?php echo $post['name']; ?>"></a></div>
			<div class="name"><a href="<?php echo $post['href']; ?>"><?php echo $post['name']; ?></a></div>
			<div class="short-description"><?php echo $post['short_description']; ?></div>
		</div>
		<?php } ?>
	</div>
    </div>
    <?php } ?>

	
	<?php if ($comment_status) { ?>
    <div class="box box-post-comments">
	<h3 class="heading_title"><span><i class="icon-comments"></i><?php echo $tab_comment; ?></span></h3>

		<div id="post_comments"></div>
		<div class="comment-form fixed">
			<h4 id="review-title"><span><?php echo $text_write; ?></span></h4>
            <div class="comment_left element_from_left">
			<?php echo $entry_name; ?><br />
			<input type="text" name="name" value="" />
			<br />
			<br />
			<?php echo $entry_rating; ?> <span><?php echo $entry_bad; ?></span>&nbsp;
			<input type="radio" name="rating" value="1" />
			&nbsp;
			<input type="radio" name="rating" value="2" />
			&nbsp;
			<input type="radio" name="rating" value="3" />
			&nbsp;
			<input type="radio" name="rating" value="4" />
			&nbsp;
			<input type="radio" name="rating" value="5" />
			&nbsp;<span><?php echo $entry_good; ?></span><br />
			<br />
			<?php echo $entry_captcha; ?><br />
			<input type="text" name="captcha" value="" />
			<br /><br />
			<img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
			<br />
            </div>
            <div class="comment_right element_from_right">
            <?php echo $entry_review; ?>
			<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
			<span style="font-size: 11px;"><?php echo $text_note; ?></span>
            <div class="buttons">
			  <div class="right"><a id="button-review" class="button"><span><?php echo $button_send_comment; ?></span></a></div>
			</div>
            </div>
            <div class="clear"></div>
		</div>	

    </div>
    <?php } ?>  
    <div class="clear"></div>    
	<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
	

<script type="text/javascript">
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script>
jQuery(document).ready(function($) {
$('div.box-gallery .ilightbox').iLightBox({
skin: 'metro-black',
path: 'horizontal'
});
});
</script> 

<script type="text/javascript"><!--
$('#post_comments .pagination a').live('click', function() {
	$('#post_comments').fadeOut('slow');
		
	$('#post_comments').load(this.href);
	
	$('#post_comments').fadeIn('slow');
	
	return false;
});			

$('#post_comments').load('index.php?route=blog/post/review&post_id=<?php echo $post_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=blog/post/write&post_id=<?php echo $post_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
			

		}
	});
});
//--></script>  


  <?php if ($prev_post) { ?>
	<div id="prev-post">
		<a href="<?php echo $prev_post['href']; ?>" title="<?php echo $text_prev_post; ?>">
			<div class="prev1"><img src="<?php echo $prev_post['prev_thumb']; ?>" alt="<?php echo $prev_post['name']; ?>"><small><?php echo $text_prev_post; ?></small><span><?php echo $prev_post['name']; ?></span>
            <span class="arrow_prev_post"><i class="icon-double-angle-left"></i></span>
            </div>
		</a>
	</div>
  <?php } ?>

  <?php if ($next_post) { ?>
	<div id="next-post">
		<a href="<?php echo $next_post['href']; ?>" title="<?php echo $text_next_post; ?>">
			<div class="next1"><img src="<?php echo $next_post['next_thumb']; ?>" alt="<?php echo $next_post['name']; ?>"><small><?php echo $text_next_post; ?></small><span><?php echo $next_post['name']; ?></span>
            <span class="arrow_next_post"><i class="icon-double-angle-right"></i></span>
            </div>
		</a>
	</div>
  <?php } ?>	

<?php echo $footer; ?>