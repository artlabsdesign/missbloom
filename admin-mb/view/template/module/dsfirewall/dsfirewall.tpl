<style>
.on{
color:green;
}
.off{
color:red;
}
</style>
<div class="table-responsive">
<div style="text-align: right;">
<a target="_blank" href="http://<?php echo $_SERVER['HTTP_HOST']; ?>/logs_<?php echo md5($_SERVER['HTTP_HOST']);?>.txt"><span style="color:rgb(0, 121, 252)"><?php echo $ds_firewall_statistic_00;?></span></a>
</div>
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th><?php echo $ds_firewall_statistic_1;?></th>
            <th><?php echo $ds_firewall_statistic_2;?></th>
            <th><?php echo $ds_firewall_statistic_3;?></th>
            <th><?php echo $ds_firewall_statistic_4;?></th>
            <th><?php echo $ds_firewall_statistic_5;?></th>
            <th><?php echo $ds_firewall_statistic_6;?></th>
          </tr>
        </thead>
        <tbody>
		<?php
		$i_string  = 0;
		foreach ($data_stat as $key => $value) {$i_string++; 
		if ($value[0]['security_name'] == "dsfirewall_uploadfilemax"){ continue;}
		if ($value[0]['security_name'] == "dsfirewall_uploadfile"){ continue;}
		if ($value[0]['security_name'] == "dsfirewall_uploadfilesys"){ continue;}
		?>
		<tr>
		    <th scope="row"><?php echo $i_string;?></th>
			
            <td><?php echo $$value[0]['security_name'];?></td>
			
        
			<?php
			$n_setting = $value[0]['security_name'];
			/*
			echo"<pre>"; 
			print_r($n_setting);
			echo"</pre>";
			*/
			switch ($n_setting ) {
				case 'dsfirewall_uploadfilemax':
					{
						 if (!isset($modules[1]['dsfirewall_size'])){
						$modules[1]['dsfirewall_size']="";
						}
						
						if (is_numeric($modules[1]['dsfirewall_size'])){
						echo '<td class="on" >'.$ds_firewall_statistic_7.'</td>';
						} else {
						echo '<td class="off">'.$ds_firewall_statistic_8.'</td>';
						}
					}
					break;
				case 'dsfirewall_uploadfile':
					{
					isset($modules[1]['dsfirewall_allow'])?$v_allow_select = $modules[1]['dsfirewall_allow']:$v_allow_select = '0';
					
						if ($v_allow_select == "0")
						{
						echo '<td class="off">'.$ds_firewall_statistic_8.'</td>';
						}
						if ($v_allow_select == "1")
						{
						echo '<td class="off">'.$ds_firewall_statistic_8.'</td>';
						} 
						if ($v_allow_select == "2")
						{
						echo '<td class="on" >'.$ds_firewall_statistic_7.'</td>';
						} 
					
					
					}
					break;
				case 'dsfirewall_uploadfilesys':
					{
					isset($modules[1]['dsfirewall_allow'])?$v_allow_select = $modules[1]['dsfirewall_allow']:$v_allow_select = '0';
						
						if ($v_allow_select == "0")
						{
						echo '<td class="off">'.$ds_firewall_statistic_8.'</td>';
						}
						if ($v_allow_select == "1")
						{
						echo '<td class="on" >'.$ds_firewall_statistic_7.'</td>';
						} 
						if ($v_allow_select == "2")
						{
						echo '<td class="on" >'.$ds_firewall_statistic_7.'</td>';
						} 
					}
					break;
				default:
				   {
				    if (!isset($modules[1][$n_setting])){
					$modules[1][$n_setting]="0";
					}
					
					if ($modules[1][$n_setting]){
					echo '<td class="on" >'.$ds_firewall_statistic_7.'</td>';
					} else {
					echo '<td class="off">'.$ds_firewall_statistic_8.'</td>';
					}
				   }
			}
			
			
		
			//var_dump($n_setting);

?>
            <td><?php echo $value[0]['num_incidents'];?></td>
            <td><?php echo $value[0]['date_lastincidents'];?></td>
            <td><?php echo $value[0]['ip'];?></td>
            <td><?php echo $value[0]['security_info'];?></td>	
		</tr>	
		<?php } ?>
		
        </tbody>
      </table>
    </div>