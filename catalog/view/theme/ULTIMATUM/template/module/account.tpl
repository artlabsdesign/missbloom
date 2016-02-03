<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  	<div class="box-category">
    <ul>
      <?php if (!$logged) { ?>
      <li class="element_from_right"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li class="element_from_right"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li class="element_from_right"><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li class="element_from_right wishlist_header"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li class="element_from_right"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
    </div>
  </div>
</div>
