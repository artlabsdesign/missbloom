
<?php if($this->config->get('ULTIMATUMControl_tabbed_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #tabbedVideo<?php echo $module_number; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
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
<?php if(($this->config->get('ULTIMATUMControl_tabbedBg1Img') || $this->config->get('ULTIMATUMControl_tabbedBg2Img') != null && $this->config->get('ULTIMATUMControl_tabbed_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-tabbed').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
<?php if (($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>

<div class="box box-tabbed <?php echo $parClass; ?>">
  <div class="bg">
  <?php if($this->config->get('ULTIMATUMControl_tabbed_video') != null) { ?>
<div class="pattern"></div>
<a id="tabbedVideo<?php echo $module_number; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_tabbed_video'); ?>',containment:'.box-tabbed .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_tabbed_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>
  </div>
  <div class="inner">
  
   <?php if ($tabs) {
   ?>
		<div id="tabs-<?php echo $module_number; ?>" class="ptabs">
		
  


 <!--div id="<?php //if($tab['title']!='Букет дня - доставим сегодня!'){echo($x['3']);} 
          //else
            //echo'#';?>"-->
 <!--<a href="tab-<?php //echo $module_number; ?>-<?php //echo $keyTab; ?>">-->


			<?php foreach ($tabs as $keyTab => $tab) {
    $x=(explode('/', $tab['products'][0]['href']));
      ?>
		    	<a href="tab-<?php echo $module_number; ?>-<?php echo $keyTab; ?>">
          <a href="<?php echo($x['3'])?>">
				<?php if($keyTab != 0){
					echo '<span>'.$tab['title'].'</span>';
					}else{
						echo'<h1 style="margin:0;padding:0;line-height: 22px;font-size: 22px;">ДОСТАВКА БУКЕТОВ И ЦВЕТОВ</h1>';
				} ?>
				</a>
			<?php } ?>
		</div>
		<?php foreach ($tabs as $keyTab => $tab) { ?>
		    <div id="<?php if($tab['title']!='Букет дня - доставим сегодня!'){echo($x['3']);} 
          else
            echo'#';?>" class="tab-content tab-content-prod">

					<?php foreach ($tab['products'] as $product) { ?>
						<div class="prod_hold">
          <?php if ($product['thumb']) { ?>
          <div class="image">
          <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
          <a href="<?php echo $product['href']; ?>">
          <?php if (($product['thumb_2']) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_sort_hover_mode') == '1')) { ?>
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
              Цена: <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
              <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
              <div class="count_holder_small">
                <div class="count_info"><?php echo $text_limited; ?></div>
                <div id="ULTIMATUMCountSmalltabbed-<?php echo $keyTab; ?>-<?php echo $product['product_id']; ?>"></div>
                <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmalltabbed-<?php echo $keyTab; ?>-<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false, layout: '<span class="countdown_time_small">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
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
          <?php if($this->config->get('ULTIMATUMControl_sort_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?></div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .box-tabbed .tab-content-prod div.prod_hold').each(function() {        
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
		<?php } ?>
	<?php } ?>
  </div>
</div>
<?php } else { ?>
<div class="box box-tabbed <?php echo $parClass; ?>">
  <div class="bg"></div>
  <div class="inner">
  <h2 class="heading_title"><span><?php echo $heading_title; ?></span></h2>
   <?php if ($tabs) { ?>
		<div id="tabs-<?php echo $module_number; ?>" class="ptabs">
			<?php foreach ($tabs as $keyTab => $tab) { ?>
		    	<a href="#tab-<?php echo $module_number; ?>-<?php echo $keyTab; ?>"><span><?php echo $tab['title']; ?></span></a>
			<?php } ?>
		</div>
		<?php foreach ($tabs as $keyTab => $tab) { ?>
		    <div id="tab-<?php echo $module_number; ?>-<?php echo $keyTab; ?>" class="tab-content tab-content-prod">

					<?php foreach ($tab['products'] as $product) { ?>
						<div class="prod_hold">
          <?php if ($product['thumb']) { ?>
          <div class="image">
          <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
          <a href="<?php echo $product['href']; ?>">
          <?php if (($product['thumb_2']) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_sort_hover_mode') == '1')) { ?>
          <img class="thumb1" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <img class="thumb2" src="<?php echo $product['thumb_2']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <?php } else { ?>
          <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          <?php } ?>
          </a> <a class="add_to_wishlist_small" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $text_wish; ?>"><i class="icon-gift"></i></a> <a class="add_to_compare_small" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $text_compare; ?>"><i class="icon-tasks"></i></a> </div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
              Цена: <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
              <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
              <div class="count_holder_small">
                <div class="count_info"><?php echo $text_limited; ?></div>
                <div id="ULTIMATUMCountSmalltabbed-<?php echo $keyTab; ?>-<?php echo $product['product_id']; ?>"></div>
                <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmalltabbed-<?php echo $keyTab; ?>-<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false, layout: '<span class="countdown_time_small">{dn} {dl} {hn}:{mnn}:{snn}</span>'});
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
          <?php if($this->config->get('ULTIMATUMControl_sort_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?></div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .box-tabbed .tab-content-prod div.prod_hold').each(function() {        
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
		<?php } ?>
	<?php } ?>
  </div>
</div>
<?php } ?>
 
<script type="text/javascript"><!--
	$('#tabs-<?php echo $module_number; ?> a').tabs();
//--></script> 
