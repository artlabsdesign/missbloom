<?php
/*------------------------------------------------------------------------
//-----------------------------------------------------
// Also Bought Module for ULTIMATUM Premium theme by Dimitar Koev 
// Copyright (C) 2012 Dimitar Koev. All Rights Reserved!
// Author: Dimitar Koev
// Author websites: http://www.althemist.com  /  http://www.dimitarkoev.com
// @license - Copyrighted Commercial Software                           
// support@althemist.com                         
//-----------------------------------------------------
-------------------------------------------------------------------------*/

class ControllerModuleULTIMATUMAlsoBought extends Controller {
	protected function index($setting) {
		
		$this->load->model('setting/setting');
		
			$plus_minus_quantity = $this->model_setting_setting->getSetting('plus_minus_quantity', $this->request->post);
			
			if (!empty($plus_minus_quantity)) {
				$this -> data['plus_minus_quantity'] = $plus_minus_quantity['plus_minus_quantity_module']['1']['enable_on_modules']['featured'];
				
				$this->document->addScript('catalog/view/javascript/plus_minus_quantity.js');
			}
		
      	$this->data['heading_title'] = $this->config->get('ULTIMATUMalso_bought_heading_title_'. $this->config->get('config_language_id'));
		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		$this->load->model('module/ULTIMATUMalso_bought');
		
		$this->load->model('tool/image');
		
		$this->data['setting'] = $setting;
		
		$this->data['show_add_to_cart_button'] = $setting['button_cart'];
		
		$this->data['products'] = array();
		
		if (isset($this->request->get['product_id'])){
		
			$data = array(
				'dc_period'            => $this->config->get('ULTIMATUMalso_bought_dc_period') * 60 * 60,
				'filter_product_id'    => $this->request->get['product_id'],
				'order_status_operand' => htmlspecialchars_decode($setting['order_status_operand']),
				'order_status_id'      => $setting['order_status_id'],
				'sort'  			   => $setting['sort'],
				'order' 			   => $setting['sort_type'],
				'start' 			   => 0,
				'limit' 			   => $setting['limit']
			);

			$results = $this->model_module_ULTIMATUMalso_bought->getAlsoBoughtProducts($data);
			
			if ($results){
				foreach ($results as $result) {
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
					
					$this->data['products'][] = array(
						'product_id' => $result['product_id'],
						'thumb'   	 => $image,
						'startdate'    	 => $result['date_added'],
						'date_end'  => $stringDate,
						'quantity' => $result['quantity'],
						'quantity_start' =>  $specials_purchased['quantity_purchased'],
						'description' => mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
						'name'    	 => $result['name'],
						'price'   	 => $price,
						'special' 	 => $special,
						'rating'     => $rating,
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUMalso_bought.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUMalso_bought.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUMalso_bought.tpl';
		}

		$this->render();
	}
}
?>