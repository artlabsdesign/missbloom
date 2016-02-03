<?php
class ModelBlogPost extends Model {
	public function updateViewed($post_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog_post SET viewed = (viewed + 1) WHERE post_id = '" . (int)$post_id . "'");
	}
	
	public function getPost($post_id) {
		$this->load->model('blog/author');
		
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "blog_review r1 WHERE r1.post_id = p.post_id AND r1.status = '1' GROUP BY r1.post_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_review r2 WHERE r2.post_id = p.post_id AND r2.status = '1' GROUP BY r2.post_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "blog_post p LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.post_id = '" . (int)$post_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return array(
				'post_id'          => $query->row['post_id'],
				'name'             => $query->row['name'],
				'seo_title'        => $query->row['seo_title'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'image'            => $query->row['image'],
				'author_id'        => $query->row['author_id'],
				'author_name'      => $this->model_blog_author->getPostAuthor($query->row['author_id']),
				'date_available'   => $query->row['date_available'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed']
			);
		} else {
			return false;
		}
	}

	public function getPosts($data = array()) {
		
		$cache = md5(http_build_query($data));
		
		$post_data = $this->cache->get('post.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache);
		
		if (!$post_data) {
			$sql = "SELECT p.post_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "blog_review r1 WHERE r1.post_id = p.post_id AND r1.status = '1' GROUP BY r1.post_id) AS rating FROM " . DB_PREFIX . "blog_post p LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id)"; 
						
			if (!empty($data['filter_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "blog_post_to_category p2c ON (p.post_id = p2c.post_id)";			
			}
			
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
			
			if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
				$sql .= " AND (";
				
				if (!empty($data['filter_name'])) {					
					if (!empty($data['filter_description'])) {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%' OR MATCH(pd.description) AGAINST('" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "')";
					} else {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
					}
				}
				
				if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
					$sql .= " OR ";
				}
				
				if (!empty($data['filter_tag'])) {
					$sql .= "LOWER(pd.tag) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%'";
				}
			
				$sql .= ")";
							
			}
			
			if (!empty($data['filter_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();
					
					$implode_data[] = (int)$data['filter_category_id'];
					
					$this->load->model('blog/category');
					
					$categories = $this->model_blog_category->getCategoriesByParentId($data['filter_category_id']);
										
					foreach ($categories as $category_id) {
						$implode_data[] = (int)$category_id;
					}
								
					$sql .= " AND p2c.category_id IN (" . implode(', ', $implode_data) . ")";			
				} else {
					$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
				}
			}		
					
			if (!empty($data['filter_author_id'])) {
				$sql .= " AND p.author_id = '" . (int)$data['filter_author_id'] . "'";
			}
			
			$sql .= " GROUP BY p.post_id";
			
			$sort_data = array(
				'pd.name',
				'rating',
				'p.sort_order',
				'p.date_added'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
				} else {
					$sql .= " ORDER BY " . $data['sort'];
				}
			} else {
				$sql .= " ORDER BY p.date_added";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC, LCASE(pd.name) DESC";
			} else {
				$sql .= " ASC, LCASE(pd.name) ASC";
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
			
			$post_data = array();
			
			$query = $this->db->query($sql);
		
			foreach ($query->rows as $result) {
				$post_data[$result['post_id']] = $this->getPost($result['post_id']);
			}
			
			$this->cache->set('post.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.'  . $cache, $post_data);
		}
		
		return $post_data;
	}
	
	public function getPostSpecials($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
				
		$sql = "SELECT DISTINCT ps.post_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "blog_review r1 WHERE r1.post_id = ps.post_id AND r1.status = '1' GROUP BY r1.post_id) AS rating FROM " . DB_PREFIX . "blog_post_special ps LEFT JOIN " . DB_PREFIX . "blog_post p ON (ps.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.post_id";

		$sort_data = array(
			'pd.name',
			'rating',
			'p.sort_order'
		);
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";	
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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

		$post_data = array();
		
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) { 		
			$post_data[$result['post_id']] = $this->getPost($result['post_id']);
		}
		
		return $post_data;
	}
		
	public function getLatestPosts($limit) {

		$post_data = $this->cache->get('post.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit);

		if (!$post_data) { 
			$query = $this->db->query("SELECT p.post_id FROM " . DB_PREFIX . "blog_post p LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);
		 	 
			foreach ($query->rows as $result) {
				$post_data[$result['post_id']] = $this->getPost($result['post_id']);
			}
			
			$this->cache->set('post.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . (int)$limit, $post_data);
		}
		
		return $post_data;
	}
	
	public function getPopularPosts($limit) {
		$post_data = array();
		
		$query = $this->db->query("SELECT p.post_id FROM " . DB_PREFIX . "blog_post p LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed DESC, p.date_added DESC LIMIT " . (int)$limit);
		
		foreach ($query->rows as $result) { 		
			$post_data[$result['post_id']] = $this->getPost($result['post_id']);
		}
					 	 		
		return $post_data;
	}
	
	public function getMostCommentedPosts($limit) {
		$post_data = array();
		
		$query = $this->db->query("SELECT r.post_id, COUNT(r.post_id) AS reviews FROM " . DB_PREFIX . "blog_review r LEFT JOIN " . DB_PREFIX. "blog_post p ON (r.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.status = '1' AND p.date_available <= NOW() AND r.status = 1 AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY r.post_id ORDER BY COUNT(r.post_id) DESC LIMIT " . (int)$limit);
		
		foreach ($query->rows as $result) { 		
			$post_data[$result['post_id']] = $this->getPost($result['post_id']);
		}
					 	 		
		return $post_data;
	}

	public function getBestSellerPosts($limit) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
				
		$post_data = $this->cache->get('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit);

		if (!$post_data) { 
			$post_data = array();
			
			$query = $this->db->query("SELECT op.post_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "blog_post` p ON (op.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.post_id ORDER BY total DESC LIMIT " . (int)$limit);
			
			foreach ($query->rows as $result) { 		
				$post_data[$result['post_id']] = $this->getPost($result['post_id']);
			}
			
			$this->cache->set('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit, $post_data);
		}
		
		return $post_data;
	}
	
	public function getPostAttributes($post_id) {
		$product_attribute_group_data = array();
		
		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "blog_post_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.post_id = '" . (int)$post_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");
		
		foreach ($product_attribute_group_query->rows as $product_attribute_group) {
			$product_attribute_data = array();
			
			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "blog_post_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.post_id = '" . (int)$post_id . "' AND a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");
			
			foreach ($product_attribute_query->rows as $product_attribute) {
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['name'],
					'text'         => $product_attribute['text']		 	
				);
			}
			
			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'attribute'          => $product_attribute_data
			);			
		}
		
		return $product_attribute_group_data;
	}
			
	public function getPostOptions($post_id) {
		$product_option_data = array();

		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.post_id = '" . (int)$post_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");
		
		foreach ($product_option_query->rows as $product_option) {
			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
				$product_option_value_data = array();
			
				$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.post_id = '" . (int)$post_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");
				
				foreach ($product_option_value_query->rows as $product_option_value) {
					$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'name'                    => $product_option_value['name'],
						'image'                   => $product_option_value['image'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
					);
				}
									
				$product_option_data[] = array(
					'product_option_id' => $product_option['product_option_id'],
					'option_id'         => $product_option['option_id'],
					'name'              => $product_option['name'],
					'type'              => $product_option['type'],
					'option_value'      => $product_option_value_data,
					'required'          => $product_option['required']
				);
			} else {
				$product_option_data[] = array(
					'product_option_id' => $product_option['product_option_id'],
					'option_id'         => $product_option['option_id'],
					'name'              => $product_option['name'],
					'type'              => $product_option['type'],
					'option_value'      => $product_option['option_value'],
					'required'          => $product_option['required']
				);				
			}
      	}
		
		return $product_option_data;
	}
	
	public function getPostDiscounts($post_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_discount WHERE post_id = '" . (int)$post_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

		return $query->rows;		
	}
		
	public function getPostImages($post_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_image WHERE post_id = '" . (int)$post_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}
	
	public function getPostRelated($post_id) {
		$post_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_related pr LEFT JOIN " . DB_PREFIX . "blog_post p ON (pr.related_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE pr.post_id = '" . (int)$post_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY pr.related_id DESC ");
		
		foreach ($query->rows as $result) { 
			$post_data[$result['related_id']] = $this->getPost($result['related_id']);
		}
		
		return $post_data;
	}
		
	public function getPostLayoutId($post_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_to_layout WHERE post_id = '" . (int)$post_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return  $this->config->get('config_layout_product');
		}
	}
	
	public function getCategories($post_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_post_to_category WHERE post_id = '" . (int)$post_id . "'");
		
		return $query->rows;
	}	
	
	public function getNextPostId($current_post_id) {
		$sql = "SELECT post_id FROM " . DB_PREFIX . "blog_post WHERE post_id > " . (int)$current_post_id . " AND status = 1 ORDER BY post_id ASC LIMIT 0,1" ;
		
		$query = $this->db->query($sql);
			
		if ($query->num_rows) {
			return $query->row['post_id'];
		}

		return 0;	
	}
	
	public function getPrevPostId($current_post_id) {
		$sql = "SELECT post_id FROM " . DB_PREFIX . "blog_post WHERE post_id < " . (int)$current_post_id . " AND status = 1 ORDER BY post_id DESC LIMIT 0,1" ;
		
		$query = $this->db->query($sql);
			
		if ($query->num_rows) {
			return $query->row['post_id'];
		}

		return 0;	
	}
	
	public function getCumulusTags() {
		$tags_data = array();
		
		$sql = "SELECT tag FROM " . DB_PREFIX . "blog_post_description WHERE language_id='" . (int)$this->config->get('config_language_id') . "'";
		
		$query = $this->db->query($sql);
		
		if ($query->num_rows){
			foreach($query->rows as $product_tags){
				$tags = explode(",", $product_tags['tag']);
				
				foreach($tags as $tag){
					if (!in_array($tag, $tags_data)){
						$tags_data[] = $tag;
					}
				}				
			}			
		}
		
		return $tags_data;
	}
		
	public function getTotalPosts($data = array()) {
				
		$cache = md5(http_build_query($data));
		
		$post_data = $this->cache->get('product.total.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache);
		
		if (!$post_data) {
			$sql = "SELECT COUNT(DISTINCT p.post_id) AS total FROM " . DB_PREFIX . "blog_post p LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id)";
	
			if (!empty($data['filter_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "blog_post_to_category p2c ON (p.post_id = p2c.post_id)";			
			}
						
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
			
			if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
				$sql .= " AND (";
				
				if (!empty($data['filter_name'])) {					
					if (!empty($data['filter_description'])) {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%' OR MATCH(pd.description) AGAINST('" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "')";
					} else {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
					}
				}
				
				if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
					$sql .= " OR ";
				}
				
				if (!empty($data['filter_tag'])) {
					$sql .= "MATCH(pd.tag) AGAINST('" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "')";
				}
			
				$sql .= ")";	
			}
						
			if (!empty($data['filter_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();
					
					$implode_data[] = (int)$data['filter_category_id'];
					
					$this->load->model('blog/category');
					
					$categories = $this->model_blog_category->getCategoriesByParentId($data['filter_category_id']);
										
					foreach ($categories as $category_id) {
						$implode_data[] = (int)$category_id;
					}
								
					$sql .= " AND p2c.category_id IN (" . implode(', ', $implode_data) . ")";			
				} else {
					$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
				}
			}		
			
			if (!empty($data['filter_author_id'])) {
				$sql .= " AND p.author_id = '" . (int)$data['filter_author_id'] . "'";
			}
			
			$query = $this->db->query($sql);
			
			$post_data = $query->row['total']; 
			
			$this->cache->set('post.total.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache, $post_data);
		}
		
		return $post_data;
	}
			
	public function getTotalPostSpecials() {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}		
		
		$query = $this->db->query("SELECT COUNT(DISTINCT ps.post_id) AS total FROM " . DB_PREFIX . "blog_post_special ps LEFT JOIN " . DB_PREFIX . "blog_post p ON (ps.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_to_store p2s ON (p.post_id = p2s.post_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");
		
		if (isset($query->row['total'])) {
			return $query->row['total'];
		} else {
			return 0;	
		}
	}
}
?>