<?php if ($reviews) { ?>
<div itemprop="review" itemscope itemtype="http://schema.org/Review">
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author" itemprop="author"><b><?php echo $review['author']; ?></b> <?php echo $text_on; ?> <meta itemprop="datePublished" content="<?php echo $review['date_added']; ?>"><?php echo $review['date_added']; ?></div>
  <div class="rating" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
  <img src="catalog/view/theme/default/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" /><meta itemprop="worstRating" content = "1"> <span style="display:none;">( <span itemprop="ratingValue"><?php echo $review['rating']; ?></span> / <span itemprop="bestRating">5</span> )</span></div>
  <div class="text" itemprop="description"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
</div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>
