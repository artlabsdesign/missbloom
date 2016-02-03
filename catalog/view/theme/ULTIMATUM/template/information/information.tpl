<?php echo $header; ?>


<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  
<?php if ($seo_h1) { ?>  
<h1 class="heading_title"><span><?php echo $seo_h1; ?></span></h1>
<? } else { ?>
<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>
<?php } ?> 
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


<div class="page-description">  
  <?php echo $description; ?>
</div>

<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?>