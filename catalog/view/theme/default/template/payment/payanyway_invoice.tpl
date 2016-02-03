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
<?php echo $content_top; ?>
<div class="inner main_inner">
  <?php echo $column_left; ?><?php echo $column_right; ?>
  <?php if ($invoice['status'] == 'CREATED') {?>
	<?php if ($invoice['system'] == 'payanyway_post') {?>
		<p><?php echo str_replace(
				array('%transaction%', '%payment_url%'), 
				array($invoice['transaction'], $invoice['payment_url']), 
				$text_message); ?></p>
	<?php } else if ($invoice['system'] == 'payanyway_banktransfer'){?>
		<p><?php echo str_replace(
				array('%transaction%', '%payment_url%', '%unitid'), 
				array($invoice['transaction'], $invoice['payment_url'], $invoice['unitid']), 
				$text_message); ?></p>
	<?php } else if ($invoice['system'] == 'payanyway_sberbank'){?>
		<h3><?php echo $text_message[1].' '.$invoice['transaction']; ?></h3>
		<p><?php echo $text_message[2]; ?></p>
		<p><?php echo $invoice['transaction']; ?></p>
		<p><?php echo $text_message[6]; ?></p>
		<p><?php echo $text_message[3].' '.$invoice['amount']; ?></p>
		<p><?php echo $text_message[4].' '.$invoice['fee']; ?></p>
		<p><?php echo $text_message[5].' '.$invoice['payerAmount']; ?></p>
	<?php } else {?>
		<h3><?php echo $text_message[1].' '.$invoice['transaction']; ?></h3>
		<p><?php echo $text_message[2]; ?></p>
		<p><?php echo $invoice['transaction']; ?></p>
		<p><?php echo $text_message[3].' '.$invoice['amount']; ?></p>
		<p><?php echo $text_message[4].' '.$invoice['fee']; ?></p>
		<p><?php echo $text_message[5].' '.$invoice['payerAmount']; ?></p>
	<?php }?>
  <?php } else {?>
    <p><?php echo $invoice['error_message'];?></p>
  <?php }?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  </div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>