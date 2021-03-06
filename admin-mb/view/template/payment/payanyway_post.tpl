<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_mnt_server; ?></td>
            <td><input type="text" name="payanyway[payanyway_mnt_server]" value="<?php echo $payanyway_mnt_server; ?>" /></td>
          </tr>        
          <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td><select name="payanyway[payanyway_order_status_id]">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $payanyway_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_payed_order_status; ?></td>
            <td><select name="payanyway[payanyway_payed_order_status_id]">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $payanyway_payed_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_mnt_id; ?></td>
            <td><input type="text" name="payanyway[payanyway_mnt_id]" value="<?php echo $payanyway_mnt_id; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_mnt_dataintegrity_code; ?></td>
            <td><input type="text" name="payanyway[payanyway_mnt_dataintegrity_code]" value="<?php echo $payanyway_mnt_dataintegrity_code; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_mnt_currency_code; ?></td>
            <td><select name="payanyway[payanyway_mnt_currency_code]">
                <?php foreach ($currencies as $currecy) { ?>
                <?php if ($currecy['code'] == $payanyway_mnt_currency_code) { ?>
                <option value="<?php echo $currecy['code']; ?>" selected="selected"><?php echo $currecy['code']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $currecy['code']; ?>"><?php echo $currecy['code']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_mnt_test_mode; ?></td>
            <td><select name="payanyway[payanyway_mnt_test_mode]">
                <?php if ($payanyway_mnt_test_mode) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="payanyway_post[payanyway_post_status]">
                <?php if ($payanyway_post_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="payanyway_post[payanyway_post_sort_order]" value="<?php echo $payanyway_post_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 