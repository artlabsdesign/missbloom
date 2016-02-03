<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="comment">
  <div class="author"><span class="icon-user"></span><b><?php echo $review['author']; ?></b><br /><span class="comment-date"><?php echo $review['date_added']; ?></span></div>
  <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" /></div>
  <div class="text"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>
