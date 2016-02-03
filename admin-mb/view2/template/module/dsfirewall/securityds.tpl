<div class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend><?php echo $ds_firewall_securityds_1;?></legend>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_cookies"><?php echo $ds_firewall_securityds_2;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_cookies-0">
	<?php isset($modules[1]['dsfirewall_cookies'])?$v_cookies = $modules[1]['dsfirewall_cookies']:$v_cookies = '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_cookies]" id="dsfirewall_cookies-0" value="0"  <?php if ($v_cookies == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_cookies-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_cookies]" id="dsfirewall_cookies-1" value="1"  <?php if ($v_cookies == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>
<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_bots"><?php echo $ds_firewall_securityds_3;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_bots-0">
	<?php isset($modules[1]['dsfirewall_bots'])?$v_bots = $modules[1]['dsfirewall_bots']:$v_bots = '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_bots]" id="dsfirewall_bots-0" value="0"  <?php if ($v_bots == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_worm-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_bots]" id="dsfirewall_bots-1" value="1"  <?php if ($v_bots == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>
<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_xss"> <?php echo $ds_firewall_securityds_4;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_xss-0">
	<?php isset($modules[1]['dsfirewall_xss'])?$v_xss = $modules[1]['dsfirewall_xss']:$v_xss= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_xss]" id="dsfirewall_xss-0" value="0"  <?php if ($v_xss == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_xss-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_xss]" id="dsfirewall_xss-1" value="1"  <?php if ($v_xss == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_dos"> <?php echo $ds_firewall_securityds_5;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_dos-0">
	<?php isset($modules[1]['dsfirewall_dos'])?$v_dos = $modules[1]['dsfirewall_dos']:$v_dos= '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_dos]" id="dsfirewall_dos-0" value="0"   <?php if ($v_dos == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_dos-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_dos]" id="dsfirewall_dos-1" value="1"   <?php if ($v_dos == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_sql"><?php echo $ds_firewall_securityds_6;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_sql-0">
	<?php isset($modules[1]['dsfirewall_sql'])?$v_sql = $modules[1]['dsfirewall_sql']:$v_sql = '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_sql]" id="dsfirewall_sql-0" value="0" <?php if ($v_sql == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_sql-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_sql]" id="dsfirewall_sql-1" value="1" <?php if ($v_sql == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="dsfirewall_worm"> <?php echo $ds_firewall_securityds_7;?></label>
  <div class="col-md-4">
  <div class="radio">
    <label for="dsfirewall_worm-0">
	<?php isset($modules[1]['dsfirewall_worm'])?$v_worm = $modules[1]['dsfirewall_worm']:$v_worm = '0'; ?>
      <input type="radio" name="dsfirewall_module[1][dsfirewall_worm]" id="dsfirewall_worm-0" value="0" <?php if ($v_worm == '0'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_8;?>
    </label>
	</div>
  <div class="radio">
    <label for="dsfirewall_worm-1">
      <input type="radio" name="dsfirewall_module[1][dsfirewall_worm]" id="dsfirewall_worm-1" value="1" <?php if ($v_worm == '1'){echo 'checked="checked"';}?>>
      <?php echo $ds_firewall_securityds_9;?>
    </label>
	</div>
  </div>
</div>

</fieldset>
</div>
