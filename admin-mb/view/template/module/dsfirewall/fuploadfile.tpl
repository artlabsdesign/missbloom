<div class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend><?php echo $ds_firewall_fileupload_1;?></legend>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="radios"><?php echo $ds_firewall_fileupload_2;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="radios-0">
	<?php isset($modules[1]['dsfirewall_allow'])?$v_allow = $modules[1]['dsfirewall_allow']:$v_allow = '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_allow]" id="radios-0" value="0"  <?php if ($v_allow == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_fileupload_3;?>
    </label>
	</div>
  <div class="radio">
    <label for="radios-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_allow]" id="radios-1" value="1"  <?php if ($v_allow == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_fileupload_4;?>
    </label>
	</div>
  <div class="radio">
    <label for="radios-2">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_allow]" id="radios-2" value="2"  <?php if ($v_allow == '2'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_fileupload_5;?>
    </label>
	</div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput"><?php echo $ds_firewall_fileupload_6;?></label>  
  <div class="col-md-5">
  <input id="textinput" name="dsfirewall_module[1][dsfirewall_size]" value="<?php echo isset($modules[1]['dsfirewall_size'])?$modules[1]['dsfirewall_size']:'1024';?>" type="text" placeholder="<?php echo $ds_firewall_fileupload_8;?>" class="form-control input-md">
  <span class="help-block"><?php echo $ds_firewall_fileupload_7;?></span>  
  </div>
</div>

</fieldset>
</div>
