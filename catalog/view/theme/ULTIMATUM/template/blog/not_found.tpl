<?php echo $header; ?>

<div class="title-holder">
  <div class="inner">
    <h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>
    <div id="blog_menu">
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
		  
		  <div class="page-content">
			  <div class="content"><?php echo $text_error; ?></div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
			  </div>
		  </div>
          
          	  
	<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?>