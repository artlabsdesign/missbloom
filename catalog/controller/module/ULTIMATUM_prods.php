<?php  
class ControllerModuleULTIMATUMProds extends Controller {
	protected function index($setting) {
    	$this->load->language('module/ULTIMATUM_prods');
    	$this->load->model('catalog/product');
		$this->data['setting'] = $setting;

		$this->document->addScript('catalog/view/theme/ULTIMATUM/js/isotope.js');
    	
    	$tabs = $this->config->get('ULTIMATUM_prods_tab');

    	$this->data['module_number'] = $setting['module_row'];

    	$this->data['tabs'] = array();

		$this->load->model('tool/image');

		$tabs_module = isset($setting['tabs']) ? $setting['tabs'] : array();
		$this->language->load('module/ULTIMATUM_prods');
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_all'] = $this->language->get('text_all');

    	foreach ($tabs_module as $keyTab ) {

			if ( isset($tabs[$keyTab]['title'][$this->config->get('config_language_id')]) && !empty($tabs[$keyTab]['title'][$this->config->get('config_language_id')])) {
				$this->data['tabs'][$keyTab]['title'] = $tabs[$keyTab]['title'][$this->config->get('config_language_id')];
			}else{
				$this->data['tabs'][$keyTab]['title']  = $this->language->get('heading_default');
			}	

			$products = array();

			switch ($tabs[$keyTab]['data_source']) {
				case 'SP': 
					$results = $this->getSelectProducts($tabs[$keyTab],$setting['limit']);
					break;
				case 'PG': 
					$results = $this->getProductGroups($tabs[$keyTab],$setting['limit']);
					break;
				case 'CQ': 
					$results = $this->getCustomQuery($tabs[$keyTab],$setting['limit']);
					break;
				default:
					$this->log->write('SHOW_IN_TAB::ERROR: The tab don\'t have product configured.');
					break;
			}

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				$hoverimages = $this->model_catalog_product->getProductImages($result['product_id']);
			    if ($hoverimages) {
			    	$hoverimage = $this->model_tool_image->resize($hoverimages[0]['image'], $setting['image_width'], $setting['image_height']);
			    } else {
			    	$hoverimage = false;
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
				
				/*------------------------------------------------------------------------
			  Countdown by Dimitar Koev
			-------------------------------------------------------------------------*/
			$this->load->model('catalog/ULTIMATUMGraboCount');
			
			
			
			$specials_date = $this->model_catalog_ULTIMATUMGraboCount->getProductDiscountDates($result['product_id']);
			$specials_purchased = $this->model_catalog_ULTIMATUMGraboCount->getVouchersBought($result['product_id']);
			
			$this->data['quantity_start'] = $result['quantity'];
			$this->data['quantity_left'] = $result['quantity'] - $specials_purchased['quantity_purchased'];
			
			if ($specials_date['date_end']) {				
				list($year,$month,$day)    =    explode('-',$specials_date['date_end']);
				$stringDate = $year.', '.$month.' - 1, '.$day;
			}else{
				$stringDate = 0;
			}
			
			/*------------------------------------------------------------------------
			
			-------------------------------------------------------------------------*/	
				
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
								
				$products[] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'thumb_2' => $hoverimage,
					'startdate'    	 => $result['date_added'],
					'name'    	 => $result['name'],
					'quantity' => $result['quantity'],
					'description' => mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '...',
					'date_end'  => $stringDate,
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}	

			$this->data['tabs'][$keyTab]['products'] = $products;
			
    	}

    	$this->data['button_cart'] = $this->language->get('button_cart');
		
		$template_file = 'ULTIMATUM_prods.tpl';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $template_file)) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $template_file;
		} else {
			$this->template = 'default/template/module/' . $template_file;
		}
		
		$this->render();
  	}

  	private function getProductGroups( $tabInfo , $limit ){
  		$results = array();

  		switch ( $tabInfo['product_group'] ) {
  			case 'BS':
  				$results = $this->model_catalog_product->getBestSellerProducts($limit);
  				break;
  			case 'LA':
  				$results = $this->model_catalog_product->getLatestProducts($limit);
  				break;
  			case 'SP':
  				$results = $this->model_catalog_product->getProductSpecials(array('start' => 0,'limit' => $limit));
  				break;
  			case 'PP':
  				$results = $this->model_catalog_product->getPopularProducts($limit);
  				break;
  		}

  		return $results;
  	}

  	private function getSelectProducts( $tabInfo , $limit ){
  		$results = array();

  		if(isset($tabInfo['products'])){
  			$limit_count = 0;
			foreach ( $tabInfo['products'] as $product ) {
				if ($limit_count++ == $limit) break;
				$results[$product['product_id']] = $this->model_catalog_product->getProduct($product['product_id']);
			}
		}

		return $results;
  	}

  	private function getCustomQuery( $tabInfo , $limit){
  		$results = array();

  		if ( $tabInfo['sort'] == 'rating' || $tabInfo['sort'] == 'p.date_added') {
  			$order = 'DESC';
  		}else{
  			$order = 'ASC';
  		}

  		$data = array(
  			'filter_category_id' => $tabInfo['filter_category']=='ALL' ? '' : $tabInfo['filter_category'], 
  			'filter_manufacturer_id' => $tabInfo['filter_manufacturer']=='ALL' ? '' : $tabInfo['filter_manufacturer'], 
  			'sort' => $tabInfo['sort'], 
  			'order' => $order,
  			'start' => 0,
  			'limit' => $limit
  		);

  		$results = $this->model_catalog_product->getProducts($data);

		return $results;
  	}

}
?>