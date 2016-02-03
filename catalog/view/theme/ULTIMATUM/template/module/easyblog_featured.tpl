<div class="box box-featured-posts-carousel no-paralax">
  <div class="inner">
    <span class="h2 heading_title"><span><?php echo $heading_title; ?></span></span>
  
  <div class="box-content box-pad20" id="featured-posts<?php echo $module; ?>"> 
    

      <?php foreach ($posts as $post) { ?>

      <div class="featured-post-item element_from_bottom">
      <div class="post-date"><?php echo $post['date_added']; ?></div>
        <?php if ($post['thumb']) { ?>
        <div class="featured-post-img"><a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['thumb']; ?>" alt="<?php echo $post['name']; ?>" /></a></div>
        <?php } ?>
        
        <div class="featured-post-info">
        
        <?php  
                $charCounter = strlen($post['name']);
                ?>
          
          <?php if ($charCounter > 25) { ?> 
				<?php $newTitle = utf8_substr(strip_tags(html_entity_decode($post['name'], ENT_QUOTES, 'UTF-8')), 0, 25) . '...'; ?>
                <?php } else { ?>
                <?php $newTitle = $post['name']; ?>
                <?php } ?>
        
        <span class="h3"><a href="<?php echo $post['href']; ?>" title="<?php echo $post['name']; ?>"><?php echo $newTitle; ?></a></span>
        <p> <?php echo $post['short_description']; ?> </p>
        <span><?php echo $text_posted_by; ?><?php echo $post['author_name']; ?></span><span><i class="icon-eye-open"></i><?php echo $post['views']; ?></span><span><i class="icon-comments"></i><?php echo $post['reviews']; ?></span>
        </div>
        
       </div>
        
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

	 
    var owl = $("#featured-posts<?php echo $module; ?>");
     
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
	 
    var owl = $("#featured-posts<?php echo $module; ?>");
     
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