<?php   
class ControllerBlogHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['brand'] = $this->url->link('product/manufacturer');
		$this->data['special'] = $this->url->link('product/special');
		$this->data['contact'] = $this->url->link('information/contact');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->language->load('module/account');
		$this->data['text_logout'] = $this->language->get('text_logout');
		
		$this->language->load('ULTIMATUM_custom/login_drop_down');
		$this->data['text_email_address'] = $this->language->get('text_email_address');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_forgot'] = $this->language->get('text_forgot');
        $this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_new_account'] = $this->language->get('text_new_account');
		$this->data['text_register_account'] = $this->language->get('text_register_account');
		$this->data['text_existing_account'] = $this->language->get('text_existing_account');
				
		$this->language->load('blog/header');
		$this->language->load('common/header');
		$this->language->load('information/contact');
		
				
		if ($this->config->get('blog_icon') && file_exists(DIR_IMAGE . $this->config->get('blog_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('blog_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		$this->data['name'] = $this->config->get('blog_name');
				
		if ($this->config->get('blog_logo') && file_exists(DIR_IMAGE . $this->config->get('blog_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('blog_logo');
		} else {
			$this->data['logo'] = '';
		}
		
		$this->data['text_home']    = $this->language->get('text_home');
		$this->language->load('information/contact');
		$this->data['compare'] = $this->url->link('product/compare');
    	$this->data['text_search']  = $this->language->get('text_search');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_rss']     = $this->language->get('text_rss');
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
    	
		$this->data['home'] = $this->url->link('common/home');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['rss']  = $this->url->link('blog/rss', '', 'SSL');
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
		
		// Search
				
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}
		
		// Menu
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
		
		$this->children = array(
			'common/content_middle',
		);
					
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					$product_total = $this->model_catalog_product->getTotalProducts($data);
									
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);						
				}
				
				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		// Menu
		$this->load->model('blog/category');
		
		$this->data['blog_categories'] = array();
					
		$blog_categories = $this->model_blog_category->getCategories(0);
		
		foreach ($blog_categories as $blog_category) {
				$blog_children_data = array();
				
				$blog_children = $this->model_blog_category->getCategories($blog_category['category_id']);
				
				foreach ($blog_children as $blog_child) {
					$data = array(
						'filter_category_id'  => $blog_child['category_id'],
						'filter_sub_category' => true
					);
									
					$blog_children_data[] = array(
						'name'  => $blog_child['name'],
						'href'  => $this->url->link('blog/category', 'bpath=' . $blog_category['category_id'] . '_' . $blog_child['category_id'])	
					);						
				}
				
				// Level 1
				$this->data['categories'][] = array(
					'name'     => $blog_category['name'],
					'children' => $blog_children_data,
					'column'   => $blog_category['column'] ? $blog_category['column'] : 1,
					'href'     => $this->url->link('blog/category', 'bpath=' . $blog_category['category_id'])
				);
		}
		
		$this->children = array(
			'module/blog_language',
			'module/language',
			'module/currency',
			'module/cart'
		);
		
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		
		$layout_id = 0;
		
		if (substr($route, 0, 16) == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);
				
			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));			
		}
		
		if (substr($route, 0, 15) == 'product/product' && isset($this->request->get['product_id'])) {
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}
		
		if (substr($route, 0, 23) == 'information/information' && isset($this->request->get['information_id'])) {
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}
		
		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}
				
		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$module_data = array();
		
		$this->load->model('setting/extension');
		
		$extensions = $this->model_setting_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			
			if ($modules) {
				foreach ($modules as $module) {
					if ($module['layout_id'] == $layout_id && $module['position'] == 'content_header' && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);				
					}
				}
			}
		}
		
		$sort_order = array(); 
	  
		foreach ($module_data as $key => $value) {
      		$sort_order[$key] = $value['sort_order'];
    	}
		
		array_multisort($sort_order, SORT_ASC, $module_data);
		
		$this->data['modules'] = array();
		
		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);
			
			if ($module) {
				$this->data['modules'][] = $module;
			}
		}
		
		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
      		$this->data['informations'][] = array(
        		'title' => $result['title'],
	    		'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
      		);
    	}
		
		$this->load->model('catalog/manufacturer');	
		
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array( 
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);	
				
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {	
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id']),					
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['sitemap'] = $this->url->link('information/sitemap');
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	} 	
}
?>