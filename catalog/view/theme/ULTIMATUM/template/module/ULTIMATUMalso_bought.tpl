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
<?php if ($products) { ?>
<?php if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom')){ ?>

<div class="box box-also no-paralax">
<div class="inner">
  <h2 class="heading_title"><span><?php echo $heading_title; ?></span></h2>
  <div class="box-content">
  
  
 
    <div class="box-product" id="also_module">
    
     
    
      <?php foreach ($products as $product) { ?>
      <div class="prod_hold element_from_bottom">
        <?php if ($product['thumb']) { ?>
        <div class="image">
        <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a> <a class="add_to_wishlist_small" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $text_wish; ?>"><i class="icon-gift"></i></a> <a class="add_to_compare_small" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $text_compare; ?>"><i class="icon-tasks"></i></a> </div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>">
        <?php  
                $charCounter = strlen($product['name']);
                ?>
          
          <?php if ($charCounter > 47) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 42) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $product['name']; ?>
                <?php } ?>
                
                <?php echo $newTitle; ?>
        </a></div>
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
            <?php if ($product['special']) { ?>
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
              <div id="ULTIMATUMCountSmallalso<?php echo $product['product_id']; ?>"></div>
              <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmallalso<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false, layout: '<span class="countdown_time_small">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
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
          <div class="cart">
            
            <a class="add_to_cart_small" title="<?php echo $button_cart; ?>" onclick="<?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?><?php } else { ?>addToCart('<?php echo $product['product_id']; ?>');<?php } ?>"><?php echo $button_cart; ?></a>
            
          </div>
        </div>
        <?php if($this->config->get('ULTIMATUMControl_listing_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?></div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .box-also div.prod_hold').each(function() {        
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
    
<script type="text/javascript">
    $(document).ready(function() {
    
	if (document.getElementById("column-left")!= null) {
    var myNumber = 3;
	var myNumber2 = 2;
	var myNumber3 = 1;
	}
	else if (document.getElementById("column-left")!= null && document.getElementById("column-right")!= null)
  {
  var myNumber = 2;
  var myNumber2 = 2;
  var myNumber3 = 1;
  }
	else {
  var myNumber = 5;
  var myNumber2 = 3;
  var myNumber3 = 2;
  }
	 
    var owl = $("#also_module");
     
    owl.owlCarousel({
    items : myNumber, //10 items above 1000px browser width
    itemsDesktop : [1199,myNumber2], //5 items between 1000px and 901px
    itemsDesktopSmall : [979,myNumber3], // betweem 900px and 601px
    itemsTablet: [767,1], //2 items between 600 and 0
    itemsMobile : [600,1], // itemsMobile disabled - inherit from itemsTablet option
	pagination: false,
	navigation: true
    });
     
    // Custom Navigation Events
    $(".next").click(function(){
    owl.trigger('owl.next');
    })
    $(".prev").click(function(){
    owl.trigger('owl.prev');
    })
     
    });
	</script>  
    
  </div>
</div>

</div>

<?php } else { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <?php foreach ($products as $product) { ?>
    <div class="prod_hold">
      <?php if ($product['thumb']) { ?>
      <div class="image">
      <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>">
      <?php  
                $charCounter = strlen($product['name']);
                ?>
          
          <?php if ($charCounter > 40) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 37) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $product['name']; ?>
                <?php } ?>
              <?php echo $newTitle; ?>
      </a></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
</div>
<?php } ?>
<?php } ?>

