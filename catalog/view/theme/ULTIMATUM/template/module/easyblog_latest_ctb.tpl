<div class="box no-paralax">
  <div class="inner">
    <h2 class="heading_title"><span><?php echo $heading_title; ?></span></h2>
      <div class="box-content box-posts-holder">
        <?php foreach ($posts as $post) { ?>
        <div class="latest-post-big fixed">
        <div class="post_wrapper fixed">
        <div class="post-date"><?php echo $post['date_added']; ?></div>
        
        <?php  
                $charCounter = strlen($post['name']);
                ?>
          
          <?php if ($charCounter > 57) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($post['name'], ENT_QUOTES, 'UTF-8')), 0, 55) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $post['name']; ?>
                <?php } ?>
        
        <h3 class="post-title"><a href="<?php echo $post['href']; ?>"><?php echo $newTitle; ?></a></h3>
        <?php if ($post['thumb']) { ?>
          <div class="latest-post-image"><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['thumb']; ?>" title="<?php echo $post['name']; ?>" alt="<?php echo $post['name']; ?>" /></a></div>
          <?php } ?>
        <div class="blog-meta">
        <ul>
        <li><i class="icon-user"></i><a href="<?php echo $post['author_href']; ?>"><?php echo $post['author_name']; ?></a></li>
        <li><i class="icon-eye-open"></i> <?php echo $post['views']; ?></li>
        <li><i class="icon-comments"></i> <?php echo $post['reviews']; ?></li>
        </ul>
        </div>
          
          <div class="description_holding_div">
                    
          	<p class="very_short_description"><?php echo $post['very_short_description']; ?></p>       
          </div>
          <div class="clear"></div>
        </div>
        <div class="clear"></div>
        </div>
        <?php } ?>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
$(".box-posts-holder div.latest-post-big:nth-child(even)").addClass('post_right');
});
</script> 