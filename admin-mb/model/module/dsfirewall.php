<?php  
class ModelModuleDsfirewall extends Model {

	public function createTable() {

				$query = $this->db->query("CREATE TABLE IF NOT EXISTS  `" . DB_PREFIX . "ds_firewire_security`(
					 `id` int(11) NOT NULL AUTO_INCREMENT,
					 `security_name` varchar(32) NOT NULL,
					 `security_group` int(11) NOT NULL DEFAULT '0',
					PRIMARY KEY (`id`)
					 ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11;
				");
				
				
				$query = $this->db->query("INSERT IGNORE INTO `" . DB_PREFIX . "ds_firewire_security` (`id`,`security_name`, `security_group`)
									 VALUES (1,'dsfirewall_cookies','1'),
											(2,'dsfirewall_bots','1'),
											(3,'dsfirewall_xss','1'),
											(4,'dsfirewall_dos','1'),
											(5,'dsfirewall_sql','1'),
											(6,'dsfirewall_worm','1'),
											(7,'dsfirewall_get','2'),
											(8,'dsfirewall_post','2'),
											(9,'dsfirewall_server','2'),
											(10,'dsfirewall_protectionurl','2'),
											(11, 'dsfirewall_uploadfilemax', 3),
											(12, 'dsfirewall_uploadfile', 3),
											(13, 'dsfirewall_uploadfilesys', 3)
											");

				$query = $this->db->query("CREATE TABLE IF NOT EXISTS  `" . DB_PREFIX . "ds_firewire_incidents_log`(
					 `id` int(11) NOT NULL AUTO_INCREMENT,
					 `idsecurity` int(11) NOT NULL DEFAULT '0',
					 `date_lastincidents` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
					 `ip` varchar(255) NOT NULL,
					 `security_info` varchar(255) NOT NULL,
					 PRIMARY KEY (`id`)
					 ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;
				");
				

		
	return $query;
	}

	
	
	public function deleteTable() {
			$this->db->query("DROP TABLE IF EXISTS   " . DB_PREFIX . "ds_firewire_security");
			$this->db->query("DROP TABLE IF EXISTS   " . DB_PREFIX . "ds_firewire_incidents_log");
	return true;
	}
	
	
	
	public function getLastStat() {
			$incidents = array();
			/*шаг 1
			получение списка всех защит
			*/
			
			$query = $this->db->query("SELECT t2.*
			FROM `" . DB_PREFIX . "ds_firewire_security` t2
			");
			
			if ($query->num_rows > 0) {
			/*шаг 2
			получение инциндентов по каждой защите
			*/
				foreach ($query->rows as $result) {
				
					//var_dump($result);
					
					$query = $this->db->query("SELECT t1.*,
					(SELECT t21.security_name FROM `" . DB_PREFIX . "ds_firewire_security` t21 WHERE t21.id = ".$result['id'].") as security_name,
					(SELECT t22.security_group FROM `" . DB_PREFIX . "ds_firewire_security` t22 WHERE t22.id = ".$result['id'].") as security_group,
					(SELECT t23.id FROM `" . DB_PREFIX . "ds_firewire_security` t23 WHERE t23.id = ".$result['id'].") as security_id,
					(SELECT COUNT(t3.id) FROM `" . DB_PREFIX . "ds_firewire_incidents_log` t3 WHERE t3.idsecurity = ".$result['id'].") as num_incidents
					FROM `" . DB_PREFIX . "ds_firewire_incidents_log` t1 RIGHT  JOIN `" . DB_PREFIX . "ds_firewire_security` t2
					ON t1.idsecurity = ".$result['id']."
					ORDER BY t1.id DESC LIMIT 1
					");
					

					//var_dump($query->rows[0]);
					if (!isset($query->rows[0])){
								/*если нет инцидента - просто пишем ид защиты*/
								$incidents[] = array('0'=>array('security_id'=>$result['id'],'security_group'=>$result['security_group'],'security_name'=>$result['security_name'],'num_incidents'=>'0','date_lastincidents'=>'---','ip'=>'---','security_info'=>'---'));
								}	else	{	
                                             /*есть инциндент - пишем его */								
											$incidents[] = $query->rows;	
											}
									
				}
			
			}

	return $incidents;
	}
	
	
	
	
	
}
?>
