<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="title-holder">
<div class="inner">
	<div class="breadcrumb">
		<a href="/">Главная</a> » <a href="/news">Новости</a> » <a><?php echo $heading_title; ?></a>
	</div>
<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>
</div>
</div>

<div id="content_wrap" class="inner main_inner"><?php echo $content_top; ?>
  
  <div class="pav-blog">
		<?php if( $blog['thumb_large'] ) { ?>
			<div class="image">
				<img src="<?php echo $blog['thumb_large'];?>" title="<?php echo $blog['title'];?>"/>
			</div>
			<?php } ?>
			
		 <div class="description clearfix"><?php echo $description;?></div>
		 <div class="blog-content clearfix">
				<div class="content-wrap clearfix">
				<?php echo $content;?>
				</div>
			<?php if( $blog['video_code'] ) { ?>
			<div class="pav-video clearfix"><?php echo html_entity_decode($blog['video_code'], ENT_QUOTES, 'UTF-8');?></div>
			<?php } ?>
		
		
		
		 </div>
		 
		
		 <?php if( !empty($tags) ) { ?>
		 <div class="blog-tags">
			<?php foreach( $tags as $tag => $tagLink ) { ?>
				<a href="<?php echo $tagLink; ?>" title="<?php echo $tag; ?>"><?php echo $tag; ?></a>
			<?php } ?>
		 </div>
		 <?php } ?>


		
		 <div class="pav-comment">
			<?php if( $config->get('blog_show_comment_form') ) { ?>
				<?php if( $config->get('comment_engine') == 'diquis' ) { ?>
			    <div id="disqus_thread"></div>
					<script type="text/javascript">
						/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
						var disqus_shortname = '<?php echo $config->get('diquis_account');?>'; // required: replace example with your forum shortname

						/* * * DON'T EDIT BELOW THIS LINE * * */
						(function() {
							var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
							dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
							(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
						})();
					</script>
					<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
					<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    
				<?php } elseif( $config->get('comment_engine') == 'facebook' ) { ?>
				<div id="fb-root"></div>
					<script>(function(d, s, id) {
					  var js, fjs = d.getElementsByTagName(s)[0];
					  if (d.getElementById(id)) {return;}
					  js = d.createElement(s); js.id = id;
					  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=<?php echo $config->get("facebook_appid");?>";
					  fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));</script>
					<div class="fb-comments" data-href="<?php echo $link; ?>" 
							data-num-posts="<?php echo $config->get("comment_limit");?>" data-width="<?php echo $config->get("facebook_width")?>">
					</div>
				<?php }else { ?>
					<?php if( count($comments) ) { ?>
					<h4><?php echo $this->language->get('text_list_comments'); ?></h4>
					<div class="pave-listcomments">
						<?php foreach( $comments as $comment ) {  $default='';?>
						<div class="comment-item clearfix" id="comment<?php echo $comment['comment_id'];?>">
							
							<img src="<?php echo "http://www.gravatar.com/avatar/" . md5( strtolower( trim( $comment['email'] ) ) ) . "?d=" . urlencode( $default ) . "&s=60" ?>" align="left"/>
							<div class="comment-wrap">
								<div class="comment-meta">
								<span class="comment-created"><?php echo $this->language->get('text_created');?> <span><?php echo $comment['created'];?></span></span>
								<span class="comment-postedby"><?php echo $this->language->get('text_postedby');?> <span><?php echo $comment['user'];?></span></span>
								<span class="comment-link"><a href="<?php echo $link;?>#comment<?php echo $comment['comment_id'];?>"><?php echo $this->language->get('text_comment_link');?></a></span>
								</div>
								<?php echo $comment['comment'];?>
							</div>
						</div>
						<?php } ?>
						<div class="pagination">
							<?php echo $pagination;?>
						</div>
					</div>
					<?php } ?>
					<h4><?php echo $this->language->get("text_leave_a_comment");?></h4>
					<form action="<?php echo $comment_action;?>" method="post" id="comment-form">
						<div class="message" style="display:none"></div>
						<div class="input-group">
							<label for="comment-user"><?php echo $this->language->get('entry_name');?></label>
							<input type="text" name="comment[user]" value="" id="comment-user"/>
						</div>
						<div class="input-group">
							<label for="comment-email"><?php echo $this->language->get('entry_email');?></label>
							<input type="text" name="comment[email]" value="" id="comment-email"/>
						</div>
						<div class="input-group">
							<label for="comment-comment"><?php echo $this->language->get('entry_comment');?></label>
							<textarea name="comment[comment]"  id="comment-comment"></textarea>
						</div>
						<?php if( $config->get('enable_recaptcha') ) { ?>
						<div class="recaptcha">
							 <p><b><?php echo $entry_captcha; ?></b> </p>
							
						  
						    <img src="index.php?route=pavblog/blog/captcha" alt="" aligh="left"/>
						    <input type="text" name="captcha" value="<?php echo $captcha; ?>" size="10" />
						</div>
						<?php } ?>
						<input type="hidden" name="comment[blog_id]" value="<?php echo $blog['blog_id']; ?>" />
						<br/>
						<div class="buttons-wrap">
							<button class="btn btn-submit" type="submit">
								<span><?php echo $this->language->get('text_submit');?></span>
							</button>
						</div>
					</form>
					<script type="text/javascript">
						$( "#comment-form .message" ).hide();
						$("#comment-form").submit( function(){
							$.ajax( {type: "POST",url:$("#comment-form").attr("action"),data:$("#comment-form").serialize(), dataType: "json",}).done( function( data ){
								if( data.hasError ){
									$( "#comment-form .message" ).html( data.message ).show();	
								}else {
									location.href='<?php echo str_replace("&amp;","&",$link);?>';
								}
							} );
							return false;
						} );
						
					</script>
				<?php } ?>
			<?php } ?>
		 </div>
  </div>

  
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
