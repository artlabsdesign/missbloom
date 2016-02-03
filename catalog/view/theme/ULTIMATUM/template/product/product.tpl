<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_wish = $this->language->get('text_wish');
$text_compare = $this->language->get('text_compare');
$text_save = $this->language->get('text_save');
$text_new_prod = $this->language->get('text_new_prod');
$text_left = $this->language->get('text_left');
$text_only = $this->language->get('text_only');
$text_purchased = $this->language->get('text_purchased');
$text_limited = $this->language->get('text_limited');
$text_onsale = $this->language->get('text_onsale');
$text_general_info = $this->language->get('text_general_info');
$text_PrevProduct = $this->language->get('text_PrevProduct');
$text_NextProduct = $this->language->get('text_NextProduct');
$text_more_by_manufacturer = $this->language->get('text_more_by_manufacturer');
$ULTIMATUMControl_product1_cms_block_content_1 = $this->config->get('ULTIMATUMControl_product1_cms_block_content_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_product2_cms_block_content_1 = $this->config->get('ULTIMATUMControl_product2_cms_block_content_1' . $this->config->get('config_language_id'));
?>
<?php echo $header; ?>

<div class="title-holder">
  <div class="inner">
    <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
    </div>
    <?php
        $startDate1 = strtotime(mb_substr($startdate, 0, 10));
        $endDate2 = strtotime(date("Y-m-d"));
        $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
        ?>
    <h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>
  </div>
</div>
<?php echo $content_top_fullwidth; ?> <?php echo $content_top; ?>
<div itemscope itemtype="http://schema.org/Product" class="inner main_inner" id="content_wrap"> <?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content">
    <div id="content_sections"> <?php echo $content_top_two_third; ?> <?php echo $content_top_one_third_last; ?>
      <div class="clear"></div>
    </div>
    <?php echo $content_top; ?> <span itemprop="name" class="name-out"><?php echo $heading_title; ?></span>
    <div class="product-info" itemprop="brand" content="<?php if ($manufacturer) { ?><?php echo $manufacturer; ?><?php } ?>">
      <?php if ($thumb || $images) { ?>
      <div class="left">
	 
        <?php $imagePreviewType = $this->config->get('ULTIMATUMControl_preview'); if(($this->config->get('ULTIMATUMControl_preview') != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { include(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/' . $imagePreviewType); } else { include(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/zoom.php'); } ?>
        <?php if ($tags) { ?>
        <div class="tags"><b><?php echo $text_tags; ?></b>
			
          <?php for ($i = 0; $i < count($tags); $i++) { ?>
          <?php if ($i < (count($tags) - 1)) { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
          <?php } else { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
          <?php } ?>
          <?php } ?>
        </div>
		
        <?php } ?>
      </div>
      <?php } ?>
      <div class="right">
	  <!--<div class="g-plusone"></div>-->
	  
        <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_custom_column') == '1')){ ?>
        <div id="custom_column">
          <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_custom_column_logo') == '1')){ ?>
          <div class="brand_logo_and_link">
            <?php if ($manufacturer) { ?>
            <?php echo ($brand_logo) ? '<img src="'.$brand_logo.'" title="'.$manufacturer.'" />' : $manufacturers ;?> <a href="<?php echo $manufacturers; ?>"><?php echo $text_more_by_manufacturer; ?> <?php echo $manufacturer; ?></a>
            <?php } ?>
          </div>
          <?php } ?>
          <?php echo $icon_teaser; ?> </div>
        <?php } ?>
        <div class="right_default">
           <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($quantity < '1')) { ?>
          <span class="sold_out">SOLD OUT</span>
          <?php } ?>
          <?php if ($price) { ?>
          <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><link itemprop="availability" href="http://schema.org/<?php if ($stockqty>0) {echo "InStock"; } ?>" />
            <div class="sale_save_holder">
              <?php if($this->config->get('ULTIMATUMControl_status') == '1'){ ?>
              <?php $numeroNew = $this->config->get('ULTIMATUMControl_new_label'); ?>
              <?php } else { ?>
              <?php $numeroNew = 3000; ?>
              <?php } ?>
              <?php if ($days < $numeroNew) { ?>
              <span class="new_prod"><b><?php echo $text_new_prod; ?></b></span>
              <?php } ?>
              <?php if ($price && $special) { ?>
              <?php 
        $val1 = preg_replace("/[^0-9.]/", "", $special);
		$val2 = preg_replace("/[^0-9.]/", "", $price);
        ?>
              <?php
        $res = ($val1 / $val2) * 100;
        $res = 100 - $res;
        $res = round($res, 1);
        ?>
              <span class="save"><?php echo $text_onsale; ?> -<?php echo $res; ?>%</span>
              <?php } ?>
              <div class="clear"></div>
            </div>
            <?php if(($special) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
            <?php if ($date_end != '0000, 00 - 1, 00') { ?>
            <div class="count_holder"> <span class="offer_title"><i class="icon-time"></i><?php echo $text_limited; ?></span>
              <div id="ULTIMATUMCount"></div>
              <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCount').countdown({until: new Date(<?php echo $date_end; ?>), compact: false, layout: '<span class="countdown_time_prodpage">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
					});
			</script>
              <?php if ($quantity_left) { ?>
              <div class="count_info info_prod_left"><?php echo $text_only; ?> <b><?php echo $quantity; ?></b> <?php echo $text_left; ?>!</div>
              <?php } ?>
              <?php if ($quantity_start) { ?>
              <div class="count_info info_prod_sold"><b><?php echo $quantity_start; ?></b> <?php echo $text_purchased; ?></div>
              <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <div class="pricetag"> <span class="price-new"><i class="icon-tag"></i><meta itemprop="priceCurrency" content="<?php echo $currencycode; ?>" /></span>
              <?php if (!$special) { ?>
              <span itemprop="price" class="price-new"><?php echo $price; ?></span>
              <?php } else { ?>
              <span class="price-old"><?php echo $price; ?></span> <span itemprop="price" class="price-new"><?php echo $special; ?></span>
              <?php } ?>
            </div>
			  <span><?php echo $text_stock; ?></span> 
            <span><?php echo $stock; ?></span>
            <?php if ($tax) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
            <?php } ?>
            <?php if ($points) { ?>
            <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
            <?php } ?>
            <?php if ($discounts) { ?>
            <br />
            <div class="discount">
              <?php foreach ($discounts as $discount) { ?>
              <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
              <?php } ?>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
          <?php if ($review_status) { ?>
          <div class="rating"></div>
          <?php } ?>
   <div class="description">
				<h3 style="font-size:19px;" class="sub-title">Ближайшее время доставки:</h3>
				<span style="font-size:15px; color:#121212;">
				<?php include_once(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/time.php');
				echo StrRusTime($tomorrowTime);?>*
				</span>
				<h3  style="margin-top:25px; margin-bottom:5px; font-size:19px;"class="sub-title">Способы оплаты:</h3>
				<img class="my-payment-methods" src ="../image/paymentlogos.jpg"/>
   
           <!--  <?php if(($this->config->get('ULTIMATUMControl_status') == '0') || ($this->config->get('ULTIMATUMControl_custom_column') == '0') || ($this->config->get('ULTIMATUMControl_custom_column_logo') == '0') && ($this->config->get('ULTIMATUMControl_custom_column') == '1')){ ?>
            <?php if ($manufacturer) { ?>
            <span><?php echo $text_manufacturer; ?></span> <a itemprop="brand" content="<?php echo $manufacturer; ?>" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
            <?php } ?>
            <?php } ?>
            <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
            <?php if ($reward) { ?>
            <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
            <?php } ?> -->
          
			</div>
			
          <?php if ($profiles): ?>
          <div class="option">
            <h3 class="sub_title"><span class="required">*</span><?php echo $text_payment_profile ?></h3>
            <br />
            <select name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
            </select>
            <br />
            <br />
            <span id="profile-description"></span> <br />
            <br />
          </div>
          <?php endif; ?>
          <?php if ($options) { ?>
          <div class="options element_from_bottom">
            <h3 class="sub_title"><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <select name="option[<?php echo $option['product_option_id']; ?>]">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
              <?php } ?>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
              <?php } ?>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <table class="option-image">
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <tr>
                  <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label></td>
                </tr>
                <?php } ?>
              </table>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
            </div>
            <br />
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>
          <?php if(($ULTIMATUMControl_product1_cms_block_content_1 != null) && ($this->config->get('ULTIMATUMControl_product1_cms_block_state') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
          <div id="product1_cms_block">
            <div> <?php echo html_entity_decode($ULTIMATUMControl_product1_cms_block_content_1); ?> </div>
          </div>
          <?php } ?>
          <div class="cart element_from_bottom">
            <div class="buttons_holder">
              <div class="plus_minus_quantity">
                <input type="button" onclick="subtractQty(this)" value="-" class="qty-minus" />
                <input type="text" name="quantity" class="quantity" size="2" value="<?php echo $minimum; ?>" />
                <input type="button" onclick="addQty(this)" value="+" class="qty-plus" />
                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                &nbsp; </div>
              <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button button_cart_product"<?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($quantity < '1')) { ?> disabled<?php } ?> />
              <a onclick="addToWishList('<?php echo $product_id; ?>');" class="add_to_wishlist button" title="<?php echo $button_wishlist; ?>"><i class="icon-gift"></i></a> <a onclick="addToCompare('<?php echo $product_id; ?>');" class="add_to_compare button" title="<?php echo $button_compare; ?>"><i class="icon-tasks"></i></a> </div>
          
			<?php if ($minimum > 1) { ?>
            <div class="minimum"><?php echo $text_minimum; ?></div>
            <?php } ?>
           <div class="dostavka-desk">*Возможность доставки в день заказа Вы можете уточнить по телефону</div>
		  </div>
		   
          <?php if ($review_status) { ?>
          <div class="review"> </div>
          <?php } ?>
          <?php if ($this->config->get('ULTIMATUMControl_product_share_mode') != '0') { ?>
		


          <div class="share"> 
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style addthis_32x32_style"> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a> <a class="addthis_button_pinterest_share"></a> <a class="addthis_button_vk"></a><a class="addthis_button_compact"></a> <a class="addthis_counter addthis_bubble_style"></a> </div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script> 
            <!-- AddThis Button END --> 
            
          </div>
          <?php } ?>
          <div class="clear"></div>
        </div>
      </div>
    </div>
    <?php if(($ULTIMATUMControl_product2_cms_block_content_1 != null) && ($this->config->get('ULTIMATUMControl_product2_cms_block_state') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
    <div id="product2_cms_block" style="float:left;">
      <div> <?php echo html_entity_decode($ULTIMATUMControl_product2_cms_block_content_1); ?> </div>
    </div>
    <?php } ?>
    <div id="tabs" class="htabs"> <a href="#tab-description"><?php echo $tab_description; ?></a>
      <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
      <?php } ?>
      <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
      <?php } ?>
      <span class="tpoint"></span> </div>
    <div id="tab-description" class="tab-content" itemprop="description"><?php echo $description; ?> </div>
	
    <?php if ($attribute_groups) { ?>
    <div id="tab-attribute" class="tab-content">
      <table class="attribute">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
        <thead>
          <tr>
            <td colspan="2"><?php echo $attribute_group['name']; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
          <tr>
            <td><?php echo $attribute['name']; ?></td>
            <td><?php echo $attribute['text']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
        <?php } ?>
      </table>
    </div>
    <?php } ?>
    <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content">
      <div id="review"></div>
      <h4 id="review-title"><?php echo $text_write; ?></h4>
      <b><?php echo $entry_name; ?></b><br />
      <input type="text" name="name" value="" />
      <br />
      <br />
      <b><?php echo $entry_review; ?></b>
      <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
      <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
      <br />
      <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
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
      <b><?php echo $entry_captcha; ?></b><br />
      <input type="text" name="captcha" value="" />
      <br />
      <br />
      <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
      <br />
      <div class="buttons">
        <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
      </div>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <div class="box box-related">
      <div class="heading_title"><span><?php echo $tab_related; ?></span></div>
      <div class="box-content">
        <div class="box-product">
          <?php foreach ($products as $product) { ?>
          <div class="prod_hold element_from_bottom">
            <?php if ($product['thumb']) { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>">
              <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
              <span class="sold_out">SOLD OUT</span>
              <?php } ?>
              <img class="anotherimg" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a> <a class="add_to_wishlist_small" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $text_wish; ?>"><i class="icon-gift"></i></a> <a class="add_to_compare_small" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $text_compare; ?>"><i class="icon-tasks"></i></a> </div>
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
              <?php echo $newTitle; ?> </a></div>
            <?php
        $startDate1 = strtotime(mb_substr($product['startdate'], 0, 10));
        $endDate2 = strtotime(date("Y-m-d"));
        $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
        ?>
            <div class="prod-info-fly">
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
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
                <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
                <div class="count_holder_small">
                  <div class="count_info"><?php echo $text_limited; ?></div>
                  <div id="ULTIMATUMCountSmallRelated<?php echo $product['product_id']; ?>"></div>
                  <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmallRelated<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false, layout: '<span class="countdown_time_small">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
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
            </div>
            <?php if($this->config->get('ULTIMATUMControl_listing_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?></div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .box-related div.prod_hold').each(function() {        
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
      </div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?> </div>
  <div class="clear"></div>
</div>
<?php echo $content_bottom_fullwidth; ?> 
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script>
jQuery(document).ready(function($) {
$('div.product-info .left .ilightbox').iLightBox({
skin: 'metro-black',
path: 'horizontal'
});
});
</script> 
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    var stopDoubleFunction=0;
$('#button-cart').bind('click', function() {
if (stopDoubleFunction%2==0){

  $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {

			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			/*if (json['success']) {
				$('#cart_add_sound')[0].play && $('#cart_add_sound')[0].play();
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}*/
                        if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 8)) {
                            if (json['success']) {
                              $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');  
                              $('.success').fadeIn('slow');

                              $('#cart-total').html(json['total']);

                              $('html, body').animate({ scrollTop: 0 }, 'slow'); 
                            } 
                          } else {
                            if (json['success']) {
                              $('#showcart').trigger('click');
                              $('#cart-total').html(json['total']);
                            } 
                          }
		}
	});
}
else{
  console.log("double");
}
stopDoubleFunction++;
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
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
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script>
<?php if ($prev_product_name) { ?>
<div id="prev-post"> <a href="<?php echo $prev_product_href; ?>" title="<?php echo $prev_product_name; ?>">
  <div class="prev1"><img src="<?php echo $prev_product_thumb; ?>" alt="<?php echo $prev_product_name; ?>"><small><?php echo $text_PrevProduct; ?></small><span><?php echo $prev_product_name; ?></span> <span class="arrow_prev_post"><i class="icon-double-angle-left"></i></span> </div>
  </a> </div>
<?php } ?>
<?php if ($next_product_name) { ?>
<div id="next-post"> <a href="<?php echo $next_product_href; ?>" title="<?php echo $next_product_name; ?>">
  <div class="next1"><img src="<?php echo $next_product_thumb; ?>" alt="<?php echo $next_product_name; ?>"><small><?php echo $text_NextProduct; ?></small><span><?php echo $next_product_name; ?></span> <span class="arrow_next_post"><i class="icon-double-angle-right"></i></span> </div>
  </a> </div>
<?php } ?>

<script type="text/javascript">
if (!window.console) {var console = {};}
if (!console.log) {console.log = function() {};}

function updatePx() {

  console.log('OPU: updatePx() called');
  <?php if (defined('_JEXEC')) { ?>
  var ajaxurl = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=product/option_price_update/updatePrice';
  <?php } else { ?>
  var ajaxurl = 'index.php?route=product/option_price_update/updatePrice';
  <?php } ?>

  jQuery.ajax({
    type: 'post',
    url: ajaxurl,
    dataType: 'json',
    data: jQuery(':input[name^="option"][type=\'checkbox\']:checked, :input[type=\'hidden\'], :input[name^="option"][type=\'radio\']:checked, select[name^="option"], :input[name=\'quantity\']'),

    success: function (mydata) {
      console.log('OPU: mydate.price'+mydata.price);
      console.log('OPU: mydate.special'+mydata.special);
      console.log('OPU: mydate.tax'+mydata.tax);
      
      // Update the main price with the new price.
      <?php if (!$this->config->get('config_customer_price') || ($this->config->get('config_customer_price') && $this->customer->isLogged())) { ?>
      <?php if ($price != 'Price On Enquiry') { ?>
      jQuery('#opu_price').fadeOut(400).queue(function(n){jQuery(this).html(mydata.price); n();}).fadeIn(400);
      jQuery('#opu_special').fadeOut(400).delay(100).queue(function(n){jQuery(this).html(mydata.special); n();}).fadeIn(400);
      jQuery('#opu_tax').fadeOut(400).delay(200).queue(function(n){jQuery(this).html(mydata.tax); n();}).fadeIn(400);
      <?php } ?>
      <?php } ?>
    },
    error: function(xhr, ajaxOptions, thrownError) {
      console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

jQuery(document).ready(function () {
  console.log('OPU: initialized');
  var $updateOnLoad = true; // Change to true if using 1.4.x or want to force an update on page load
  
   //Update on initial page load for 1.4.x only
  if ($updateOnLoad) {
    updatePx();
  }

  // Update whenever the triggerable page inputs are changed
  jQuery(':input[name^="option"],:input[name^="quantity"]').change(function(){
    updatePx();
  });

});
</script>

<?php echo $footer; ?>