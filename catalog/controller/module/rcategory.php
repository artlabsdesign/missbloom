<?php
class ControllerModuleRcategory extends Controller {

	public function index($setting) {

		$this->language->load('module/rcategory');
		
		static $module = 1;
				
		$this->data['button_cart'] = $this->language->get('button_cart');

		$this->data['setting'] = $setting;

		$this->data['text_goto_category'] = $this->language->get('text_goto_category');

		$this->load->model('module/rcategory');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$this->data['products'] = array();
		
		if($setting['use_carousel']) {
			if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom')) {
				$this->document->addScript('catalog/view/javascript/rcategory/owl-carousel/owl.carousel.js');
				$this->document->addStyle('catalog/view/javascript/rcategory/owl-carousel/owl.carousel.css');
				$this->document->addStyle('catalog/view/javascript/rcategory/owl-carousel/owl.theme.css');				
			} else {
				$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			}
		}
		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/rcategory/rcategory.css')) {
			$css = 'catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/rcategory/rcategory.css';
		} else {
			$css = 'catalog/view/theme/default/stylesheet/rcategory/rcategory.css';
		}		
		
		//$this->document->addStyle('catalog/view/theme/default/stylesheet/rcategory/rcategory.css');
		$this->document->addStyle($css);
		
		if(isset($this->request->get['path'])){
			$parts = explode('_', $this->request->get['path']);
			$category_id = end($parts);
			
			$category_name = $this->model_module_rcategory->getCategoryName($category_id);
			$replace = array(
				'{cname}' => $category_name,
			);
			
			if(isset($this->request->get['product_id'])){
				$product_name = $this->model_module_rcategory->getProductName($this->request->get['product_id']);
				if($product_name){
					$replace['{pname}'] = $product_name;
				}			
			}

			$title = isset($setting['title']) ? strtr($setting['title'][$this->config->get('config_language_id')],$replace) : $this->language->get('heading_title');

			$this->data['heading_title'] = $title;
			$this->data['rcatproducts'] = array();
			
			$rcategories = $this->model_module_rcategory->getRcategories($category_id);
			
			if($rcategories) {

				foreach($rcategories as $rcategory) {

					$rproducts = array();

					$products = $this->model_module_rcategory->getRproducts($rcategory['rcategory_id'],$rcategory['limit'],$setting);
					
					foreach($products as $result){

						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
						} else {
							$image = false;
						}

						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}

						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}

						if ($this->config->get('config_review_status')) {
							$rating = $result['rating'];
						} else {
							$rating = false;
						}

						$rproducts[] = array(
							'product_id' 	=> $result['product_id'],
							'thumb'   	 	=> $image,
							'name'    	 	=> $result['name'],
							'price'   	 	=> $price,
							'special' 	 	=> $special,
							'rating'     	=> $rating,
							'reviews'       => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
							'href'    	 	=> $this->url->link('product/product', 'product_id=' . $result['product_id'])
						);
					}
					
					if($rproducts) {							
						$this->data['products'] = $rproducts;

						$rcategory_path = $this->url->link('product/category', 'path=' . $this->model_module_rcategory->getRcategoryLink($rcategory['rcategory_id']));
						
						if($setting['show_link']['status']) {
							$product_total = '';
								
							if($setting['show_link']['show_pcount']) {
								$data = array(
									'filter_category_id'  => $rcategory['rcategory_id'],
									'filter_sub_category' => false
								);						
								$product_total = $this->model_catalog_product->getTotalProducts($data);
							}						
							
							$rcategory_path = $this->url->link('product/category', 'path=' . $this->model_module_rcategory->getRcategoryLink($rcategory['rcategory_id']));
													
							$replace = array(
								'{cname}'	=> sprintf($this->language->get('text_category_link'), $rcategory_path, $rcategory['name']),
								'{pqnt}' 	=> $product_total
							);
														
							$goto_rcategory = strtr($setting['show_link']['text'][$this->config->get('config_language_id')],$replace);
						} else {
							$goto_rcategory = '';
						}

						$this->data['rcatproducts'][] = array(
							'rcategory_id'		=>	$rcategory['rcategory_id'],
							'rcategory_name'	=>	$rcategory['name'],
							'goto_rcategory'	=> 	$goto_rcategory,
							'rproducts'			=>	$this->data['products']
						);
					}
				}
			}
		}
		
		$this->data['module'] = $module;
		$module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/rcategory.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/rcategory.tpl';
		} else {
			$this->template = 'default/template/module/rcategory.tpl';
		}

		$this->render();
	}
}
?>
