<?php
?><div class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend><?php echo $ds_firewall_settings_1;?></legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_name"><?php echo $ds_firewall_settings_2;?></label>  
  <div class="col-md-6">
  <input id="dsfirewall_name" name="dsfirewall_module[1][dsfirewall_name]" value="<?php echo isset($modules[1]['dsfirewall_name'])?$modules[1]['dsfirewall_name']:'';?>" type="text" placeholder="..." class="form-control input-md">
  <span class="help-block"><?php echo $ds_firewall_settings_5;?></span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_email"><?php echo $ds_firewall_settings_3;?></label>  
  <div class="col-md-6">
  <input id="dsfirewall_email" name="dsfirewall_module[1][dsfirewall_email]" value="<?php echo isset($modules[1]['dsfirewall_email'])?$modules[1]['dsfirewall_email']:'';?>"  type="text" placeholder="..." class="form-control input-md">
  <span class="help-block"><?php echo $ds_firewall_settings_6;?></span>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_email"> <?php echo $ds_firewall_settings_20;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_email-0">
	<?php isset($modules[1]['dsfirewall_emailsend'])?$v_email = $modules[1]['dsfirewall_emailsend']:$v_email= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_emailsend]" id="dsfirewall_emailsend-0" value="0"  <?php if ($v_email == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_10;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_emailsend-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_emailsend]" id="dsfirewall_emailsend-1" value="1"   <?php if ($v_email == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_9;?>
    </label>
	</div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_log"> <?php echo $ds_firewall_settings_30;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_log-0">
	<?php isset($modules[1]['dsfirewall_log'])?$v_log = $modules[1]['dsfirewall_log']:$v_log= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_log]" id="dsfirewall_log-0" value="0"  <?php if ($v_log == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_10;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_log-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_log]" id="dsfirewall_log-1" value="1"   <?php if ($v_log == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_9;?>
    </label>
	</div>
  </div>
</div>
<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_debug"> <?php echo $ds_firewall_settings_8;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_debug-0">
	<?php isset($modules[1]['dsfirewall_debug'])?$v_debug = $modules[1]['dsfirewall_debug']:$v_debug= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_debug]" id="dsfirewall_debug-0" value="0"  <?php if ($v_debug == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_10;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_debug-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_debug]" id="dsfirewall_debug-1" value="1"   <?php if ($v_debug == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_settings_9;?>
    </label>
	  <span class="help-block"><a target="_blank" href="<?php echo "http://".$_SERVER['HTTP_HOST']."?debug=1&exec";?>">TEST</a></span>  
	</div>
  </div>
</div>


<div class="form-group">
<div class="col-md-12">
 <?php echo $ds_firewall_settings_11;?>
 <p><?php echo $ds_firewall_settings_12;?></p>
 <p><b><?php echo $ds_firewall_settings_13;?></b></p>
 <p><?php echo $ds_firewall_settings_14;?></p>
 <p><b><?php echo $ds_firewall_settings_15;?></b></p>
 <p><?php echo $ds_firewall_settings_16;?></p>
 <p><?php echo $ds_firewall_settings_191;?></p>
 <code>
<p>##DS Firewall##</p>
<p>php_value auto_prepend_file <?php echo $_SERVER['DOCUMENT_ROOT'] ?>/catalog/controller/module/dsfirewallserver.php</p>
<p>##DS Firewall##</p>
 </code>
 <p> </p>
  <p><?php echo $ds_firewall_settings_192;?></p>
  <code>
<p>##DS Firewall##</p>
<p>auto_prepend_file <?php echo $_SERVER['DOCUMENT_ROOT'] ?>/catalog/controller/module/dsfirewallserver.php</p>
<p>##DS Firewall##</p>
 </code>
 
 <p><b><?php echo $ds_firewall_settings_17;?></b></p>
 <p><?php echo $ds_firewall_settings_18;?></p>
 
 
</div>
</div>
</div>
