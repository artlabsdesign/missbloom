<?php
class ModelBlogInstall extends Model {
	
	public function createBlogLayout(){
	
		$store_id = (int)$this->config->get('config_store_id');
		
		$blog_layouts = array(
					array(
						'name'   =>  'EasyBlog - Home',
						array(
							'store_id'  => $store_id,
							'route'     => 'blog/home'
						)
					),
					array(
						'name'   =>  'EasyBlog - Post',
						array(
							'store_id'  => $store_id,
							'route'     => 'blog/post'
						)
					),
					array(
						'name'   =>  'EasyBlog - Search',
						array(
							'store_id'  => $store_id,
							'route'     => 'blog/search'
						)
					),
					array(
						'name'   =>  'EasyBlog - Category',
						array(
							'store_id'  => $store_id,
							'route'     => 'blog/category'
						)
					)
		);
	
	
		foreach($blog_layouts as $blog_layout) {
			if ( $this->getLayoutByRoute($blog_layout[0]['route']) == 0 ) {  // check if route already exist
				$this->load->model('design/layout');
				
				$layout_route = array();
				$layout_route[0] =  array (
						'store_id' => $store_id,
						'route'    => $blog_layout[0]['route']
					);
				
				$data = array(
					'name'         => $blog_layout['name'],
					'layout_route' => $layout_route
				);
				
				$this->model_design_layout->addLayout($data);
			}
		}	
	}
	
	public function getLayoutByRoute($route){
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "layout_route WHERE route='" . $route . "'";
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function createBlogTables($show = false){
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category` (
				  `category_id` int(11) NOT NULL AUTO_INCREMENT,
				  `image` varchar(255) COLLATE utf8_bin NOT NULL,
				  `parent_id` int(11) NOT NULL DEFAULT '0',
				  `top` tinyint(1) NOT NULL,
				  `column` int(3) NOT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL,
				  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  PRIMARY KEY (`category_id`)
				) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
				
		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command = $sql ."<br /><br />";
		
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_description` (
				  `category_id` int(11) NOT NULL,
				  `language_id` int(11) NOT NULL,
				  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
				  `description` text COLLATE utf8_bin NOT NULL,
				  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
				  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
				  PRIMARY KEY (`category_id`,`language_id`),
				  KEY `name` (`name`)
				) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
				
		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";		


		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_layout` (
				  `category_id` int(11) NOT NULL,
				  `store_id` int(11) NOT NULL,
				  `layout_id` int(11) NOT NULL,
				  PRIMARY KEY (`category_id`,`store_id`)
				) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
				
		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";


		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_store` (
				  `category_id` int(11) NOT NULL,
				  `store_id` int(11) NOT NULL,
				  PRIMARY KEY (`category_id`,`store_id`)
				) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post` (
				  `post_id` int(11) NOT NULL AUTO_INCREMENT,
				  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
				  `author_id` int(11) NOT NULL,
				  `date_available` date NOT NULL,
				  `sort_order` int(11) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL DEFAULT '0',
				  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  `viewed` int(5) NOT NULL DEFAULT '0',
				  PRIMARY KEY (`post_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_description` (
				  `post_id` int(11) NOT NULL AUTO_INCREMENT,
				  `language_id` int(11) NOT NULL,
				  `name` varchar(255) COLLATE utf8_bin NOT NULL,
				  `description` text COLLATE utf8_bin NOT NULL,
				  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
				  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
				  `tag` text COLLATE utf8_bin NOT NULL,
				  PRIMARY KEY (`post_id`,`language_id`),
				  KEY `name` (`name`),
				  FULLTEXT KEY `description` (`description`),
				  FULLTEXT KEY `tag` (`tag`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_image` (
				  `post_image_id` int(11) NOT NULL AUTO_INCREMENT,
				  `post_id` int(11) NOT NULL,
				  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  PRIMARY KEY (`post_image_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_related` (
				  `post_id` int(11) NOT NULL,
				  `related_id` int(11) NOT NULL,
				  PRIMARY KEY (`post_id`,`related_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";
		
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_to_category` (
				  `post_id` int(11) NOT NULL,
				  `category_id` int(11) NOT NULL,
				  PRIMARY KEY (`post_id`,`category_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_to_layout` (
				  `post_id` int(11) NOT NULL,
				  `store_id` int(11) NOT NULL,
				  `layout_id` int(11) NOT NULL,
				  PRIMARY KEY (`post_id`,`store_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_post_to_store` (
				  `post_id` int(11) NOT NULL,
				  `store_id` int(11) NOT NULL DEFAULT '0',
				  PRIMARY KEY (`post_id`,`store_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";

		if (!$show){
			$this->db->query($sql);
		}
		
		$sql_command .= $sql ."<br /><br />";

		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_review` (
				  `review_id` int(11) NOT NULL AUTO_INCREMENT,
				  `post_id` int(11) NOT NULL,
				  `customer_id` int(11) NOT NULL,
				  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
				  `text` text COLLATE utf8_bin NOT NULL,
				  `rating` int(1) NOT NULL,
				  `status` tinyint(1) NOT NULL DEFAULT '0',
				  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
				  PRIMARY KEY (`review_id`),
				  KEY `post_id` (`post_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		
		if (!$show){
			$this->db->query($sql);
		}
		
		if (!$show){
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('blog_install_date', array('blog_install_date' => date('Y-m-d')));
		}
		
		$sql_blog_install_key = "INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$this->config->get('store_id') . "', `group` = '" . $this->db->escape('blog_install_date') . "', `key` = '" . $this->db->escape('blog_install_date') . "', `value` = '" . $this->db->escape(date('Y-m-d')) . "';";
		
		$sql_command .= $sql_blog_install_key;
		
		return $sql_command;
	}
}
?>