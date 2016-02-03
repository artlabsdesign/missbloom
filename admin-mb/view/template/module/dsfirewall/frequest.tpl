<div class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend><?php echo $ds_firewall_frequest_1;?></legend>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_get"><?php echo $ds_firewall_frequest_2;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_get-0">
	<?php isset($modules[1]['dsfirewall_get'])?$v_get = $modules[1]['dsfirewall_get']:$v_get= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_get]" id="dsfirewall_get-0" value="0"   <?php if ($v_get == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_6;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_get-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_get]" id="dsfirewall_get-1" value="1"   <?php if ($v_get == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_7;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_post"> <?php echo $ds_firewall_frequest_3;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_post-0">
	<?php isset($modules[1]['dsfirewall_post'])?$v_post = $modules[1]['dsfirewall_post']:$v_post= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_post]" id="dsfirewall_post-0" value="0"  <?php if ($v_post == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_6;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_post-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_post]" id="dsfirewall_post-1" value="1"   <?php if ($v_post == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_7;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_server"><?php echo $ds_firewall_frequest_4;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_server-0">
	<?php isset($modules[1]['dsfirewall_server'])?$v_server = $modules[1]['dsfirewall_server']:$v_server= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_server]" id="dsfirewall_server-0" value="0"   <?php if ($v_server == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_6;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_server-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_server]" id="dsfirewall_server-1" value="1"  <?php if ($v_server == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_7;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_protectionurl"><?php echo $ds_firewall_frequest_5;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_protectionurl-0">
	<?php isset($modules[1]['dsfirewall_protectionurl'])?$v_protectionurl = $modules[1]['dsfirewall_protectionurl']:$v_protectionurl= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_protectionurl]" id="dsfirewall_protectionurl-0" value="0"   <?php if ($v_protectionurl == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_6;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_protectionurl-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_protectionurl]" id="dsfirewall_protectionurl-1" value="1"   <?php if ($v_protectionurl == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_frequest_7;?>
    </label>
	</div>
  </div>
</div>

</fieldset>
</div>
