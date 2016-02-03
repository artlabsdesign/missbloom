<?php if($this->config->get('ULTIMATUMControl_deal_video') != null) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$("html.no-touch #dealVideo<?php echo $module; ?>").mb_YTPlayer();
})
</script>
<?php } ?>
<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_wish = $this->language->get('text_wish');
$text_compare = $this->language->get('text_compare');
$text_sale = $this->language->get('text_sale');
$text_save = $this->language->get('text_save');
$text_new_prod = $this->language->get('text_new_prod');
$text_left = $this->language->get('text_left');
$text_purchased = $this->language->get('text_purchased');
$text_limited = $this->language->get('text_limited');
?>
<?php if(($this->config->get('ULTIMATUMControl_dealBg1Img') || $this->config->get('ULTIMATUMControl_dealBg2Img') != null && $this->config->get('ULTIMATUMControl_deal_video') == null) && ($this->config->get('ULTIMATUMControl_status') == '1') && ($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){	
	$('html.no-touch .box-deal').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>

<div class="box box-deal <?php echo $parClass; ?>">
  <div class="bg">
  <?php if($this->config->get('ULTIMATUMControl_deal_video') != null) { ?>
<div class="pattern"></div>
<a id="dealVideo<?php echo $module; ?>" class="domplayer" data-property="{videoURL:'<?php echo $this->config->get('ULTIMATUMControl_deal_video'); ?>',containment:'.box-deal .bg', showControls:false, autoPlay:true, loop:true, mute:true, startAt:<?php echo $this->config->get('ULTIMATUMControl_deal_video_start'); ?>, opacity:1, addRaster:true, quality:'default'}">My video</a>
<?php } ?>
  
  </div>
  <?php $moduleMode = $this->config->get('ULTIMATUMControl_deal_mode'); ?>
  
  <div class="inner">
  
    <span class="h2 heading_title"><span><?php echo $heading_title; ?></span></span>
    
    <div class="box-content box-pad20" id="deal_module<?php echo $module; ?>">

        <?php foreach ($products as $product) { ?>

          <?php
        $startDate1 = strtotime(mb_substr($product['startdate'], 0, 10));
        $endDate2 = strtotime(date("Y-m-d"));
        $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
        ?>
        <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
          <div class="deal-item">
          
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
        <div class="post-date">
          
          <strong>-<?php echo $res; ?>%</strong>
          </div>
        <?php } ?>  
          
          
            
            <div class="deal-img">
              <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>">
              <?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?>
            <span class="sold_out">SOLD OUT</span>
            <?php } ?>
              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
              <?php } ?>
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
                  <span class="save"><b><i class="icon-tags"></i><?php echo $text_sale; ?></b></span>
                  <?php } ?>
                </div>               
            </div>
            
            
            
              <div class="deal-info">
              
              <?php  
                $charCounter = strlen($product['name']);
                ?>
          
          <?php if ($charCounter > 25) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 25) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $product['name']; ?>
                <?php } ?>
              
              
              <h3> <a href="<?php echo $product['href']; ?>"><?php echo $newTitle; ?></a> </h3>
                       
                <?php if ($product['price']) { ?>
                
                <?php if (!$product['special']) { ?>
                <div class="price"> <?php echo $product['price']; ?> </div>
                <?php } else { ?>
                
                
                <?php if(($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown') == '1')){ ?>
                <?php if ($product['date_end'] != '0000, 00 - 1, 00') { ?>
                <div class="count_deal">
                  <div id="ULTIMATUMCountSmalldeal<?php echo $product['product_id']; ?>"></div>
                  <script type="text/javascript">
					$(function () {	
						$('#ULTIMATUMCountSmalldeal<?php echo $product['product_id']; ?>').countdown({until: new Date(<?php echo $product['date_end']; ?>), compact: false});
					});
		</script>
                  <div class="clear"></div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                
                <div class="price"> <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span> </div>
                <?php } ?>
                
                <?php } ?>
                
                <a class="add_to_cart_small" title="<?php echo $button_cart; ?>" onclick="<?php if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_countdown_sold') == '1') && ($product['quantity'] < '1')) { ?><?php } else { ?>addToCart('<?php echo $product['product_id']; ?>');<?php } ?>"><?php echo $button_cart; ?></a>
              <div class="clear"></div>
            </div>
            <?php if($this->config->get('ULTIMATUMControl_deal_flydesc_mode') == '1'){ ?>
          <div class="flydesc"><?php echo $product['description']; ?></div>
          <script type="text/javascript">
          $(function() {

    	$('html.no-touch .box-deal div.deal-item').each(function() {        
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
        <?php } ?>




    </div>
    
    
    
  </div>

</div>

<?php if (($setting['position'] == 'content_top_fullwidth') || ($setting['position'] == 'content_bottom_fullwidth')){ ?>
<script type="text/javascript">
    $(document).ready(function() {
    
  var myNumber = 4;
  var myNumber2 = 3;
  var myNumber3 = 2;
	 
    var owl = $("#deal_module<?php echo $module; ?>");
     
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
    <?php } else { ?>
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
  var myNumber = 4;
  var myNumber2 = 3;
  var myNumber3 = 2;
  }
	 
    var owl = $("#deal_module<?php echo $module; ?>");
     
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
    <?php } ?>