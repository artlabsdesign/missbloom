<?php
class ModelModuleRcategory extends Model {
	public function getRcategories($category_id) {
		$category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_related WHERE `category_id` = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_data[] = array(
				'rcategory_id' 	=> $result['rcategory_id'],
				'name'        	=> $this->getPath($result['rcategory_id'], $this->config->get('config_language_id')),
				'limit'			=> $result['limit']
			);			
		}
		
		return $category_data;
	}
	
	public function addRelated($category_id,$rcategory_id,$limit) {
		$query = $this->db->query("INSERT IGNORE INTO " . DB_PREFIX . "category_related SET `category_id` = '" . (int)$category_id . "', `rcategory_id` = '" . (int)$rcategory_id . "', `limit` = '" . (int)$limit . "'");
	}
	
	public function removeRelated($category_id,$rcategory_id) {
		$query = $this->db->query("DELETE FROM " . DB_PREFIX . "category_related WHERE `category_id` = '" . (int)$category_id . "' AND rcategory_id = '" . (int)$rcategory_id . "'");
	}
	
	public function updateRcategoryLimit($category_id,$rcategory_id,$limit) {
		$query = $this->db->query("UPDATE " . DB_PREFIX . "category_related SET `limit` = '" . (int)$limit . "' WHERE `category_id` = '" . (int)$category_id . "' AND `rcategory_id` = '" . (int)$rcategory_id . "'");
	}

	public function getPath($category_id) {
		
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getPath($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}	
	
}
?>
