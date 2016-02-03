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

<?php echo $content_top_fullwidth; ?>

<div id="content_wrap" class="inner main_inner"> <?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content">
  <div id="content_sections">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>
			<div class="content search-content">
					<p><?php echo $entry_search; ?>
					<?php if ($filter_name) { ?>
					<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
					<?php } else { ?>
					<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
					<?php } ?>
					<select name="filter_category_id">
						<option value="0"><?php echo $text_category; ?></option>
						<?php foreach ($categories as $category_1) { ?>
						<?php if ($category_1['category_id'] == $filter_category_id) { ?>
						<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_1['children'] as $category_2) { ?>
						<?php if ($category_2['category_id'] == $filter_category_id) { ?>
						<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_2['children'] as $category_3) { ?>
						<?php if ($category_3['category_id'] == $filter_category_id) { ?>
						<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } ?>
						<?php } ?>
						<?php } ?>
						<?php } ?>
					</select></p>
					
					<?php if ($filter_sub_category) { ?>
					<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
					<?php } ?>
					<label for="sub_category" class="search-label"><?php echo $text_sub_category; ?></label>
					<?php if ($filter_description) { ?>
					<input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="filter_description" value="1" id="description" />
					<?php } ?>
					<label for="description" class="search-label"><?php echo $entry_description; ?></label>                	
		    </div>
            <div class="buttons">

				<div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
                </div>
		  
			<h2 class="heading_title"><span><?php echo $text_search; ?></span></h2>
			<?php if ($posts) { ?>
				<div class="post-list">
				<?php foreach ($posts as $post) { ?>
				<div class="latest-post-big fixed">
        <div class="post_wrapper fixed">
        <div class="post-date"><?php echo $post['date_added']; ?></div>
        <h3 class="post-title"><a href="<?php echo $post['href']; ?>"><?php echo $post['name']; ?></a></h3>
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
			</div>
			  
			 <div class="pagination"><?php echo $pagination; ?></div>
				
		  <?php } else { ?>
			    <div class="content"><?php echo $text_empty; ?></div>
		  <?php }?>
	    <?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<script type="text/javascript"><!--
$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'filter_category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'filter_sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'filter_sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'filter_sub_category\']').removeAttr('disabled');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=blog/search';
	
	var filter_name = $('#content input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	
	if (filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	
	if (filter_sub_category) {
		url += '&filter_sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&filter_description=true';
	}

	location = url;
});
//--></script>
<script type="text/javascript">
$(document).ready(function() {
$(".post-list div.latest-post-big:nth-child(even)").addClass('post_right');
});
</script> 
 
<?php echo $footer; ?>