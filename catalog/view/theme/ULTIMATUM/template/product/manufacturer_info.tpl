<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_wish = $this->language->get('text_wish');
$text_compare = $this->language->get('text_compare');
$text_save = $this->language->get('text_save');
$text_new_prod = $this->language->get('text_new_prod');
$text_left = $this->language->get('text_left');
$text_purchased = $this->language->get('text_purchased');
$text_limited = $this->language->get('text_limited');
?>
<?php echo $header; ?>
<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>  
</div>
</div>
<?php echo $content_top; ?>
<div class="inner main_inner">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">

  
  <?php if ($products) { ?>
  <div class="product-filter">
    
    <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="clear"></div>
  </div>
  
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div class="prod_hold">
          <?php if ($product['thumb']) { ?>
          <div class="image">
          <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
          <a href="<?php echo $product['href']; ?>">
          <?php if (($product['thumb_2']) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_listing_hover_mode') == '1')) { ?>
          <img class="thumb1" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <img class="thumb2" src="<?php echo $product['thumb_2']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <?php } else { ?>
          <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <?php } ?>
          </a> <a class="add_to_wishlist_small" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $text_wish; ?>"><i class="icon-gift"></i></a> <a class="add_to_compare_small" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $text_compare; ?>"><i class="icon-tasks"></i></a> </div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>">
          <?php  
                $charCounter = strlen($product['name']);
                ?>
          
          <?php if ($charCounter > 40) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 36) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $product['name']; ?>
                <?php } ?>
                
                <?php echo $newTitle; ?>
          </a></div>
          <?php if ($product['rating']) { ?>
          <div class="rating"><img src="catalog/view/theme/ULTIMATUM/image/stars-<?php echo round($product['rating']); ?>.png" title="<?php echo round($product['rating'],1); ?> (<?php echo $product['reviews']; ?>)" alt="<?php echo $product['reviews']; ?>" /></div>
          <?php } ?>
          <?php
        $startDate1 = strtotime(mb_substr($product['startdate'], 0, 10));
        $endDate2 = strtotime(date("Y-m-d"));
        $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
        ?>
            <div class="sale_save_holder">
              <?php if($this->config->get('ULTIMATUMControl_status') == '1'){ ?>
              <?php $numeroNew = $this->config->get('ULTIMATUMControl_new_label'); ?>
              <?php } else { ?>
              <?php $numeroNew = 30; ?>
              <?php } ?>
              <?php if ($days < $numeroNew) { ?>
              <span class="new_prod"><b><?php echo $text_new_prod; ?></b></span>
              <?php } ?>
              <?php if ($product['price'] && $product['special']) { ?>
              <?php 
        $val1 = preg_replace("/[^0-9.]/", "", $product['special']);
		$val2 = preg_replace("/[^0-9.]/", "", $product['price']);
        ?>
              <?php
        $res = ($val1 / $val2) * 100;
        $res = 100 - $res;
        $res = round($res, 1);
        ?>
              <span class="save"><b><i class="icon-tags"></i> -<?php echo $res; ?>%</b></span>
              <?php } ?>
            </div>
            <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              Цена: <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
              <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
              <div class="count_holder_small">
                <div class="count_info"><?php echo $text_limited; ?></div>
                <div id="ULTIMATUMCountSmallmanufacturer<?php echo $product['product_id']; ?>"></div>
                <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmallmanufacturer<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false, layout: '<span class="countdown_time_small">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
					});
		</script>
                <div class="clear"></div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <div class="clear"></div>
            </div>
            <?php } ?>
            <div class="cart"> <a class="add_to_cart_small" title="<?php echo $button_cart; ?>" onclick="<?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?><?php } else { ?>addToCart('<?php echo $product['product_id']; ?>');<?php } ?>"><i class="icon-shopping-cart"></i> <?php echo $button_cart; ?></a> </div>
        <?php if($this->config->get('ULTIMATUMControl_listing_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?>
				<!-- OCFilter start -->
				<?php if ($product['ocfilter_products_options']) { ?>
			  <?php if (is_array($product['ocfilter_products_options'])) { ?>
			  <ul class="product-ocfilter-options">
			    <?php foreach ($product['ocfilter_products_options'] as $ocfilter_option) { ?>
			    <li><span class="product-ocfilter-option"><?php echo $ocfilter_option['name']; ?>:</span> <span class="product-ocfilter-value"><?php echo $ocfilter_option['values']; ?></span></li>
			    <?php } ?>
			  </ul>
			  <?php } else { ?>
			  <?php echo $product['ocfilter_products_options']; ?>
			  <?php } ?>
			  <?php } ?>
				<!-- OCFilter end -->
			</div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .product-list div.prod_hold').each(function() {        
        var tip = $(this).find('div.flydesc');

        $(this).hover(
            function() { tip.appendTo('body'); },
            function() { tip.appendTo(this); }
        ).mousemove(function(e) {
            var x = e.pageX + 60,
                y = e.pageY - 40,
                w = tip.width(),
                h = tip.height(),
                dx = $(window).width() - (x + w),
                dy = $(window).height() - (y + h);

            if ( dx < 50 ) x = e.pageX - w - 60;
            if ( dy < 50 ) y = e.pageY - h + 50;

            tip.css({ left: x, top: y });
        	});         
    	});

		});
          </script>
          <?php } ?>     
        </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
  
  </div>
 
<?php echo $footer; ?>