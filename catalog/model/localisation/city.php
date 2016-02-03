<?php
class ModelLocalisationCity extends Model {
	
	public function getCities() {
		$city_data = $this->cache->get('city.status');
		
		if (!$city_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "city ORDER BY sort_order ASC, city_name ASC");
	
			$city_data = $query->rows;
		
			$this->cache->set('city.status', $city_data);
		}

		return $city_data;
	}
}
?>