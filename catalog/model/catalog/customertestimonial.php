<?php
class ModelCatalogcustomertestimonial extends Model {
	public function getcustomertestimonial($customertestimonial_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) WHERE t.customertestimonial_id = '" . (int)$customertestimonial_id . "' AND td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1'");
	
		return $query->rows;
	}
	
	public function getcustomertestimonials($start = 0, $limit = 20, $random = false) {
		if ($random == false)
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) WHERE td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1' ORDER BY t.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
		else
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) WHERE td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1' ORDER BY RAND() LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getTotalcustomertestimonials() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customertestimonial t LEFT JOIN " . DB_PREFIX . "customertestimonial_description td ON (t.customertestimonial_id = td.customertestimonial_id) WHERE td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1'");
			
		return $query->row['total'];
	}
	
	
	public function addcustomertestimonial($data, $status) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customertestimonial SET status = '".$status."', rating = '".$this->db->escape($data['rating'])."', name='".$this->db->escape($data['name'])."', email='".$this->db->escape($data['email'])."', date_added = NOW(), avatar='".$this->db->escape($data['avatar'])."'");

		$customertestimonial_id = $this->db->getLastId(); 
		
		$results = $this->db->query("SELECT * FROM " . DB_PREFIX . "language ORDER BY sort_order, name"); 

		foreach ($results->rows as $result) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "customertestimonial_description SET customertestimonial_id = '" . (int)$customertestimonial_id . "', language_id = '".(int)$result['language_id']."', title = '" . $this->db->escape($data['title']) . "', description = '" . $this->db->escape($data['description']) . "'");
		}

			
	}
}
?>