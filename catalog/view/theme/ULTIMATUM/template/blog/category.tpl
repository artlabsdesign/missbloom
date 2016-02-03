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

<div class="category-info">
  
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
    </div>
    
    <?php if ($categories) { ?>  
  <div class="category-list">
  <h2 class="heading_title"><span><?php echo $text_refine; ?></span></h2>
  
   <ul class="sub_cats">
   
   
          <?php foreach ($categories as $category) { ?>
          
          <li class="cat_hold"><a href="<?php echo $category['href']; ?>">
        
          <?php if ($category['pic']) { ?>
          <img src="<?php echo $category['pic']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" />
          <?php } else { ?>
          <img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/cat_not_found.png" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" />
          
          <?php } ?>
        <?php echo $category['name']; ?>
        </a>
      </li>
          
          <?php } ?>
        </ul>
   
  </div>
  <?php } ?>
    
    			
			<?php if ($posts) { ?>
			<div class="post-list">
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
			  
			 <div class="pagination"><?php echo $pagination; ?></div>
			<?php } ?>
			  
			<?php if (!$categories && !$posts) { ?>
			<div class="content"><?php echo $text_empty; ?></div>
			<div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
			</div>
			<?php } ?>
    <?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?>
<script type="text/javascript">
$(document).ready(function() {
$(".post-list div.latest-post-big:nth-child(even)").addClass('post_right');
});
</script> 