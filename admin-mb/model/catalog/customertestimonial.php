<?php
class ModelCatalogcustomertestimonial extends Model {

	public function addcustomertestimonial($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customertestimonial SET name='".$this->db->escape($data['name'])."', status = '" . (int)$data['status'] . "',rating = '".(int)$data['rating'] . "',date_added = '" . $this->db->escape($data['date_added']) . "',email='" . $this->db->escape($data['email']) . "' , avatar='". $this->db->escape($data['avatar']).  "'");

		$customertestimonial_id = $this->db->getLastId(); 
			
		foreach ($data['customertestimonial_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customertestimonial_description SET customertestimonial_id = '" . (int)$customertestimonial_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

	}
	
	public function editcustomertestimonial($customertestimonial_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customertestimonial SET name='".$this->db->escape($data['name'])."', status = '" . (int)$data['status'] . "',date_added = '".$this->db->escape($data['date_added']). "',rating = '".(int)$data['rating']."',email='". $this->db->escape($data['email']) . "', avatar='". $this->db->escape($data['avatar']) ."' WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "customertestimonial_description WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");
					
		foreach ($data['customertestimonial_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customertestimonial_description SET customertestimonial_id = '" . (int)$customertestimonial_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
	}
	
	public function deletecustomertestimonial($customertestimonial_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customertestimonial WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customertestimonial_description WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");
	}	

	public function getcustomertestimonial($customertestimonial_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customertestimonial WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");
		
		return $query->row;
	}
		
	public function getcustomertestimonials($data = array()) {
	
		if ($data) {
			if (!isset($data['language_id']))  $data['language_id']=$this->config->get('config_language_id');
			$sql = "SELECT * FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) where language_id = " . $data['language_id'];
		
			$sort_data = array(
				'td.description',				
				'td.title',
				't.name',
				't.date_added',
				't.status'
			);		
		
		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY td.description";	
			}
		
	
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			//print_r($sql);exit;
			$query = $this->db->query($sql);
			
			
			
			return $query->rows;
		} else {
		
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) WHERE td.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY td.title");
	
				$customertestimonial_data = $query->rows;
			
	
			return $customertestimonial_data;			
		}
	}
	
	public function getcustomertestimonialDescriptions($customertestimonial_id) {
		$customertestimonial_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customertestimonial_description WHERE customertestimonial_id = '" . (int)$customertestimonial_id . "'");

		foreach ($query->rows as $result) {
			$customertestimonial_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'description' => $result['description']
			);
		}
		
		return $customertestimonial_description_data;
	}

	public function isTableExists() {

		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "customertestimonial'");
		if (count($query->rows) == 0)
	      	return FALSE;
		else
	      	return TRUE;
		

	}
	
	public function getTotalcustomertestimonials() {
		if ($this->isTableExists() == false)
			return -1;

      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customertestimonial");
		
		return $query->row['total'];
	}	

	public function getCurrentDateTime() {
      	$query = $this->db->query("SELECT NOW() AS cdatetime ");
		
		return $query->row['cdatetime'];
	}	



	public function createDatabaseTables() {
		$sql  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."customertestimonial` ( ";
		$sql .= "`customertestimonial_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`parent_testimonial_id` int(11) DEFAULT NULL , ";
		$sql .= "`name` varchar(64) COLLATE utf8_bin NOT NULL, ";
  		$sql .= "`avatar` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL, ";
		$sql .= "`email` varchar(96) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '0', ";
		$sql .= "`rating` int(1) NOT NULL DEFAULT '0', ";
		$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "PRIMARY KEY (`customertestimonial_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
		$this->db->query($sql);

		$sql  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."customertestimonial_description` ( ";
		$sql .= "`customertestimonial_id` int(11) NOT NULL, ";
		$sql .= "`language_id` int(11) NOT NULL, ";
		$sql .= "`title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`description` text COLLATE utf8_unicode_ci NOT NULL, ";
		$sql .= "PRIMARY KEY (`customertestimonial_id`,`language_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($sql);
	}
	
	
	public function dropDatabaseTables() {
		$sql = "DROP TABLE IF EXISTS `".DB_PREFIX."customertestimonial`;";
		$this->db->query($sql);
		$sql = "DROP TABLE IF EXISTS `".DB_PREFIX."customertestimonial_description`;";
		$this->db->query($sql);
	}

}
?>