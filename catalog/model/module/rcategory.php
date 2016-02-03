<?php

class ModelModuleRcategory extends Model {

	public function getRcategories($category_id){

		$query = $this->db->query("SELECT cr.rcategory_id, cr.limit, cd.name FROM " . DB_PREFIX . "category_related  cr LEFT JOIN " . DB_PREFIX . "category_description cd ON (cr.rcategory_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (cd.category_id = c2s.category_id) WHERE cr.category_id = " . (int)$category_id . " AND cd.language_id='" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY cd.name");

		return ($query->num_rows ? $query->rows : false);
	}

	public function getRproducts($category_id, $limit, $setting){

		$product_data = '';//$this->cache->get('rproduct' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . (int)$limit . '.' . (int)$category_id);

		if (!$product_data) {
				$product_data = array();
				
				$main_category = ($this->config->get('config_seo_url_type') == 'seo_pro') ? ' AND main_category = 1' : '';
				
				$sql = "SELECT p.product_id";
				
				if(isset($setting['order_type']) && strpos($setting['order_type'],"rating") !== false) {
					$sql .= ", (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating";
				}
				
				$sql .=  " FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id=p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
				
				if(isset($setting['order_type']) && strpos($setting['order_type'],"name")) {
					$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id)";
				}
				
				$sql .= " WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2c.category_id = '" . (int)$category_id . "'";
				
				if($this->config->get('config_seo_url_type') == 'seo_pro') {
					$sql .= " AND main_category = 1";
				}

				if(isset($setting['order_type'])){		
					$sort_data = array(
						'pd.name',
						'p.model',
						'p.quantity',
						'p.price',
						'rating',
						'p.sort_order',
						'p.date_added',
						'p.viewed',
						'rand()'
					);	
					
					$sort_type = explode(":",$setting['order_type']);
					if (isset($sort_type[0]) && in_array($sort_type[0], $sort_data)) {
						if ($sort_type[0] == 'pd.name' || $sort_type[0] == 'p.model') {
							$sql .= " ORDER BY LCASE(" . $sort_type[0] . ")";
						} else {
							$sql .= " ORDER BY " . $sort_type[0];
						}
					} else {
						$sql .= " ORDER BY p.sort_order";	
					}

					if (isset($sort_type[1]) && ($sort_type[1] == 'DESC')) {
						$sql .= " DESC";
					} else {
						$sql .= " ASC";
					}				
				}

				$sql .= " LIMIT " . (int)$limit;

				$this->load->model('catalog/product');
				$query = $this->db->query($sql);
				
				foreach ($query->rows as $result) {
					$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
				}

				//$this->cache->set('rproduct.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . (int)$limit . '.' . (int)$category_id, $product_data);

		}
		return $product_data;
	}

	public function getRcategoryLink($path){
		static $path_ = null;

		if(!is_array($path)){
			$category_id = $path;
			$path_ = $path;
		} else {
			$path_ = implode('_', $path);
			$category_id = array_shift($path);
		}

		$query = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$category_id . "'");

		if($query->row['parent_id'] == '0') {
			$cpath = $path_;
		} else {
			$ppath = $query->row['parent_id'] . "_" . $path_;
			$cpath = $this->getRcategoryLink(explode('_', $ppath));
		}

		return $cpath;
	}

	public function getCategoryName($category_id) {
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "' and language_id = '" . (int)$this->config->get('config_language_id') . "'");
		return $query->num_rows ? $query->row['name'] : false;
	}

	public function getProductName($product_id) {
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "' and language_id = '" . (int)$this->config->get('config_language_id') . "'");
		return $query->num_rows ? $query->row['name'] : false;
	}

}
