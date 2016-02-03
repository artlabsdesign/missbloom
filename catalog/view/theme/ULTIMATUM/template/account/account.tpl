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
  <?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
  <div id="content_sections" style="overflow:hidden;">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>



  
  <div class="content accountPage_content">
    <ul class="tiles">
      <li class="edit_info one_fifth"><a href="<?php echo $edit; ?>"><i class="icon-user"></i><br /><?php echo $text_edit; ?></a></li>
      <li class="edit_password one_fifth"><a href="<?php echo $password; ?>"><i class="icon-lock"></i><br /><?php echo $text_password; ?></a></li>
      <li class="edit_address one_fifth"><a href="<?php echo $address; ?>"><i class="icon-book"></i><br /><?php echo $text_address; ?></a></li>
      <li class="edit_wishlist one_fifth"><a href="<?php echo $wishlist; ?>"><i class="icon-edit"></i><br /><?php echo $text_wishlist; ?></a></li>
      <li class="edit_newsletter one_fifth last"><a href="<?php echo $newsletter; ?>"><i class="icon-envelope"></i><br /><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <h3><span><?php echo $text_my_orders; ?></span></h3>
  <div class="content accountPage_content">
    <ul class="tiles">
      <li class="edit_orders one_sixth"><a href="<?php echo $order; ?>"><i class="icon-shopping-cart"></i><br /><?php echo $text_order; ?></a></li>
      <li class="edit_downloads one_sixth"><a href="<?php echo $download; ?>"><i class="icon-download"></i><br /><?php echo $text_download; ?></a></li>
      <?php if ($reward) { ?>
      <li class="edit_reward one_sixth"><a href="<?php echo $reward; ?>"><i class="icon-trophy"></i><br /><?php echo $text_reward; ?></a></li>
      <?php } ?>
      <li class="edit_returns one_sixth"><a href="<?php echo $return; ?>"><i class="icon-retweet"></i><br /><?php echo $text_return; ?></a></li>
      <li class="edit_transactions one_sixth"><a href="<?php echo $transaction; ?>"><i class="icon-money"></i><br /><?php echo $text_transaction; ?></a></li>
      <li class="edit_transactions one_sixth last"><a href="<?php echo $recurring; ?>"><i class="icon-credit-card"></i><br /><?php echo $text_recurring; ?></a></li>
    </ul>
  </div>
<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?> 