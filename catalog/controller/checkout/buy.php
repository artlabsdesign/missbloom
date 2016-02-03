<?php
class ControllerCheckoutBuy extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('checkout/buy');
                $this->load->model('setting/setting');
                $settings = $this->model_setting_setting->getSetting('buy');
                $this->data['firstname_status']     = $settings['firstname_status'];
                $this->data['firstname_required']    = $settings['firstname_required'];
                $this->data['lastname_status']      = $settings['lastname_status'];
                $this->data['lastname_required']    = $settings['lastname_required'];
                $this->data['email_status']         = $settings['email_status'];
                $this->data['email_required']       = $settings['email_required'];
                $this->data['telephone_status']     = $settings['telephone_status'];
                $this->data['telephone_required']   = $settings['telephone_required'];
                $this->data['fax_status']           = $settings['fax_status'];
                $this->data['fax_required']         = $settings['fax_required'];
                $this->data['company_status']       = $settings['company_status'];
                $this->data['company_required']     = $settings['company_required'];
                $this->data['address_1_status']     = $settings['address_1_status'];
                $this->data['address_1_required']   = $settings['address_1_required'];
                $this->data['address_2_status']     = $settings['address_2_status'];
                $this->data['address_2_required']   = $settings['address_2_required'];
                $this->data['city_status']          = $settings['city_status'];
                $this->data['city_required']        = $settings['city_required'];
                $this->data['postcode_status']      = $settings['postcode_status'];
                $this->data['postcode_required']    = $settings['postcode_required'];
                $this->data['country_status']       = $settings['country_status'];
                $this->data['country_required']     = $settings['country_required'];
                $this->data['postcode_required']    = $settings['postcode_required'];
                $this->data['zone_status']          = $settings['zone_status'];
                $this->data['zone_required']        = $settings['zone_required'];
                $this->data['comment_status']       = $settings['comment_status'];
                $this->data['comment_required']     = $settings['comment_required'];

                $this->data['settings'] = $settings;
		if (!isset($this->session->data['vouchers'])) {
			$this->session->data['vouchers'] = array();
		}
                // Remove
		if (isset($this->request->get['remove'])) {
			$this->cart->remove($this->request->get['remove']);

			unset($this->session->data['vouchers'][$this->request->get['remove']]);

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			$this->redirect($this->url->link('checkout/buy'));
		}



            if ($this->request->server['REQUEST_METHOD'] == 'POST') {
		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			$this->redirect($this->url->link('checkout/buy'));
		}


		// Coupon
		if (isset($this->request->post['coupon'])) {
                                        if($this->validateCoupon()){
			$this->session->data['coupon'] = $this->request->post['coupon'];

			$this->session->data['success'] = $this->language->get('text_coupon');
                                        }
                                        $this->redirect($this->url->link('checkout/buy'));
		}

		// Voucher
		if (isset($this->request->post['voucher']) && $this->validateVoucher()) {
			$this->session->data['voucher'] = $this->request->post['voucher'];

			$this->session->data['success'] = $this->language->get('text_voucher');

			$this->redirect($this->url->link('checkout/buy'));
		}

		// Reward
		if (isset($this->request->post['reward']) && $this->validateReward()) {
			$this->session->data['reward'] = abs($this->request->post['reward']);

			$this->session->data['success'] = $this->language->get('text_reward');

			$this->redirect($this->url->link('checkout/buy'));
		}

		// Shipping
		if (isset($this->request->post['shipping_method1']) && $this->validateShipping()) {
			$shipping = explode('.', $this->request->post['shipping_method1']);

			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

			$this->session->data['success'] = $this->language->get('text_shipping');

			$this->redirect($this->url->link('checkout/buy'));
		}

                 $json = array();


                 $this->language->load('checkout/buy');
                 if (!$json) {
                    //First name required
                    if(isset($settings['firstname_required']) && $settings['firstname_required']){
                        if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
                            $json['error']['firstname'] = $this->language->get('error_firstname');
                        }
                    }
                    //Last name required
                    if(isset($settings['lastname_required']) && $settings['lastname_required']){
                        if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
                            $json['error']['lastname'] = $this->language->get('error_lastname');
                        }
                    }
                    //E-mail required
                    if(isset($settings['email_required']) && $settings['email_required'] && isset($this->request->post['auth']) && $this->request->post['auth'] == 1){
                        if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
                                $json['error']['email'] = $this->language->get('error_email');
                        }
                    }
                    //Telephone required
                    if(isset($settings['telephone_required']) && $settings['telephone_required']){
                        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
                                $json['error']['telephone'] = $this->language->get('error_telephone');
                        }
                    }
                    //Fax required
                    if(isset($settings['fax_required']) && $settings['fax_required']){
                        if ((utf8_strlen($this->request->post['fax']) < 3) || (utf8_strlen($this->request->post['fax']) > 32)) {
                                $json['error']['fax'] = $this->language->get('error_fax');
                        }
                    }
                    //Address 1 required
                    if(isset($settings['address_1_required']) && $settings['address_1_required']){
                        if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
                                $json['error']['address_1'] = $this->language->get('error_address_1');
                        }
                    }
                    //Address 2 required
                    if(isset($settings['address_2_required']) && $settings['address_2_required']){
                        if ((utf8_strlen($this->request->post['address_2']) < 3) || (utf8_strlen($this->request->post['address_2']) > 128)) {
                                $json['error']['address_2'] = $this->language->get('error_address_2');
                        }
                    }
                    //City required
                    if(isset($settings['city_required']) && $settings['city_required']){
                        if (((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) && (utf8_strlen($this->request->post['cities']) < 2) || (utf8_strlen($this->request->post['cities']) > 128)) {
                                $json['error']['city'] = $this->language->get('error_city');
                        }
                    }
                    //Country required
                    if(isset($settings['country_required']) && $settings['country_required']){
                        if ($this->request->post['country_id'] == '') {
                            $json['error']['country'] = $this->language->get('error_country');
                        }
                    }
                    //Postcode required
                    if(isset($settings['postcode_required']) && $settings['postcode_required']){
                        if ((utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
                            $json['error']['postcode'] = $this->language->get('error_postcode');
                        }
                    }
                    //Company required
                    if(isset($settings['company_required']) && $settings['company_required']){
                        if ($this->request->post['company'] == '') {
                            $json['error']['company'] = $this->language->get('error_company');
                        }
                    }
                    //Zone required
                    if ($settings['zone_required'] && $this->request->post['zone_id'] == '') {
                        $json['error']['zone'] = $this->language->get('error_zone');
                    }
                    //Comment required
                    if ($settings['comment_required'] && $this->request->post['comment'] == '') {
                        $json['error']['comment'] = $this->language->get('error_comment');
                    }
                    
                    /*
					if (!isset($this->request->post['rt']) || $this->request->post['rt'] == '') {
                        $json['error']['rt'] = $this->language->get('error_rt');
                    }
                    
					
                    if(isset($this->request->post['rt'])){
                        if($this->request->post['rt'] == 2){
                            if(!isset($this->request->post['rt_name']) || empty($this->request->post['rt_name'])){
                                $json['error']['rt_name'] = $this->language->get('error_rt_name');
                            }
                            if(!isset($this->request->post['rt_telephone']) || empty($this->request->post['rt_telephone'])){
                                $json['error']['rt_telephone'] = $this->language->get('error_rt_telephone');
                            }
                        }
                    }
                    */
                    

                    /*Shipping errors*/
                    if (!isset($this->request->post['shipping_method'])) {
                            $json['error']['warning'] = $this->language->get('error_shipping');
                    } else {
                            $shipping = explode('.', $this->request->post['shipping_method']);

                            if (!isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
                                    $json['error']['warning'] = $this->language->get('error_shipping');
                            }
                    }

                    /*Payment errors*/
                    if (!isset($this->request->post['payment_method'])) {
                            $json['error']['warning'] = $this->language->get('error_payment');
                    } else {
                            if (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
                                $json['error']['warning'] = $this->language->get('error_payment');
                            } elseif ($this->cart->getTotal() < ((float)$settings['min_order_sum'])) {
				$json['error']['warning'] = $this->language->get('min_order_sum'). $this->currency->format($settings['min_order_sum']);
                            } elseif (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                                $json['error']['warning'] = $this->language->get('error_stock');
                            }
                    }

                    if ($this->config->get('config_checkout_id')) {
                            $this->load->model('catalog/information');

                            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

                            if ($information_info && !isset($this->request->post['agree'])) {
                                    $json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
                            }
                    }

                    if(!$this->customer->isLogged() && isset($this->request->post['auth']) && $this->request->post['auth'] == 1){
                        if (isset($this->request->post['password1']) && ((utf8_strlen($this->request->post['password1']) < 4) || (utf8_strlen($this->request->post['password1']) > 20))) {
                                $json['error']['password'] = $this->language->get('error_password');
                        }

                        if (isset($this->request->post['password1']) && isset($this->request->post['password2']) && $this->request->post['password1'] != $this->request->post['password2']) {
                                $json['error']['password'] = $this->language->get('error_confirm');
                        }
                        $this->load->model('account/customer');
                        if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
                                $json['error']['email'] = $this->language->get('error_exists');
                        }
                    }
                    
                 }
                 if (!$json) {
                    $p = '';

                    $uinfo = array();
                    $uinfo['firstname'] = isset($this->request->post['firstname'])?$this->request->post['firstname']:$p;
                    $uinfo['lastname'] = isset($this->request->post['lastname'])?$this->request->post['lastname']:'';
                    $uinfo['email'] = isset($this->request->post['email'])?$this->request->post['email']:$p;
                    $uinfo['telephone'] = isset($this->request->post['telephone'])?$this->request->post['telephone']:$p;
                    $uinfo['fax'] = isset($this->request->post['fax'])?$this->request->post['fax']:$p;
                    $uinfo['company'] = isset($this->request->post['company'])?$this->request->post['company']:$p;
                    $uinfo['address_1'] = isset($this->request->post['address_1'])?$this->request->post['address_1']:$p;
                    $uinfo['address_2'] = isset($this->request->post['address_2'])?$this->request->post['address_2']:$p;
                    $uinfo['city'] = (isset($this->request->post['city']) && $this->request->post['city'])?$this->request->post['city']:(!empty($this->request->post['cities'])?$this->request->post['cities']:'');
                    $uinfo['country_id'] = isset($this->request->post['country_id'])?$this->request->post['country_id']:$this->config->get('config_country_id');
                    $uinfo['zone_id'] = isset($this->request->post['zone_id'])?$this->request->post['zone_id']:$p;
                    $uinfo['postcode'] = isset($this->request->post['postcode'])?$this->request->post['postcode']:$p;
                    
                    $uinfo['discount_card'] = isset($this->request->post['discount_card'])?$this->request->post['discount_card']:$p;
                    $uinfo['postcard'] = isset($this->request->post['postcard'])?$this->request->post['postcard']:$p;
                    $uinfo['signature'] = isset($this->request->post['signature'])?$this->request->post['signature']:$p;
                    $uinfo['photo_free'] = isset($this->request->post['photo_free'])?$this->request->post['photo_free']:$p;
                    $uinfo['photo_site'] = isset($this->request->post['photo_site'])?$this->request->post['photo_site']:$p;
                    $uinfo['rt'] = isset($this->request->post['rt'])?$this->request->post['rt']:$p;
                    $uinfo['rt_name'] = isset($this->request->post['rt_name'])?$this->request->post['rt_name']:$p;
                    $uinfo['rt_telephone'] = isset($this->request->post['rt_telephone'])?$this->request->post['rt_telephone']:$p;
                    $uinfo['rt_clarify'] = isset($this->request->post['rt_clarify'])?$this->request->post['rt_clarify']:$p;
                    $uinfo['address_type'] = isset($this->request->post['address_type'])?$this->request->post['address_type']:$p;
                    $uinfo['street'] = isset($this->request->post['street'])?$this->request->post['street']:$p;
                    $uinfo['house'] = isset($this->request->post['house'])?$this->request->post['house']:$p;
                    $uinfo['building'] = isset($this->request->post['building'])?$this->request->post['building']:$p;
                    $uinfo['office'] = isset($this->request->post['office'])?$this->request->post['office']:$p;
                    $uinfo['flat'] = isset($this->request->post['flat'])?$this->request->post['flat']:$p;
                    $uinfo['room'] = isset($this->request->post['room'])?$this->request->post['room']:$p;
                    $uinfo['ward'] = isset($this->request->post['ward'])?$this->request->post['ward']:$p;
                    $uinfo['shipping_date'] = isset($this->request->post['shipping_date'])?$this->request->post['shipping_date']:$p;
                    $uinfo['shipping_time'] = isset($this->request->post['shipping_time'])?$this->request->post['shipping_time']:$p;
                    $uinfo['remind'] = isset($this->request->post['remind'])?$this->request->post['remind']:$p;
                    $uinfo['order_status_sms'] = isset($this->request->post['order_status_sms'])?$this->request->post['order_status_sms']:$p;
                    $uinfo['order_status_email'] = isset($this->request->post['order_status_email'])?$this->request->post['order_status_email']:$p;
                    $uinfo['newsletter'] = isset($this->request->post['newsletter'])?$this->request->post['newsletter']:$p;

                    $this->session->data['guest']['firstname'] = $uinfo['firstname'];
                    $this->session->data['guest']['lastname'] = $uinfo['lastname'];
                    $this->session->data['guest']['email'] = $uinfo['email'];
                    $this->session->data['guest']['telephone'] = $uinfo['telephone'];
                    $this->session->data['guest']['fax'] = $uinfo['fax'];
                    $this->session->data['guest']['company'] = $uinfo['company'];
                    $this->session->data['guest']['payment']['firstname'] = $uinfo['firstname'];
                    $this->session->data['guest']['payment']['lastname'] = $uinfo['lastname'];
                    $this->session->data['guest']['payment']['address_1'] = $uinfo['address_1'];
                    $this->session->data['guest']['payment']['address_2'] = $uinfo['address_2'];
                    $this->session->data['guest']['payment']['city'] = $uinfo['city'];
                    $this->session->data['guest']['payment']['postcode'] = $uinfo['postcode'];
                    $this->session->data['guest']['payment']['country_id'] = $uinfo['country_id'];
                    $this->session->data['guest']['payment']['zone_id'] = $uinfo['zone_id'];
                    $this->session->data['guest']['password'] = isset($this->request->post['password1'])?$this->request->post['password1']:'';
                    $this->session->data['guest']['register'] = isset($this->request->post['register'])?1:0;
                    $this->session->data['guest']['discount_card'] = $uinfo['discount_card'];
                    $this->session->data['guest']['postcard'] = $uinfo['postcard'];
                    $this->session->data['guest']['signature'] = $uinfo['signature'];
                    $this->session->data['guest']['photo_free'] = $uinfo['photo_free'];
                    $this->session->data['guest']['photo_site'] = $uinfo['photo_site'];
                    $this->session->data['guest']['rt'] = $uinfo['rt'];
                    $this->session->data['guest']['rt_name'] = $uinfo['rt_name'];
                    $this->session->data['guest']['rt_telephone'] = $uinfo['rt_telephone'];
                    $this->session->data['guest']['rt_clarify'] = $uinfo['rt_clarify'];
                    $this->session->data['guest']['address_type'] = $uinfo['address_type'];
                    $this->session->data['guest']['street'] = $uinfo['street'];
                    $this->session->data['guest']['house'] = $uinfo['house'];
                    $this->session->data['guest']['building'] = $uinfo['building'];
                    $this->session->data['guest']['office'] = $uinfo['office'];
                    $this->session->data['guest']['flat'] = $uinfo['flat'];
                    $this->session->data['guest']['room'] = $uinfo['room'];
                    $this->session->data['guest']['ward'] = $uinfo['ward'];
                    $this->session->data['guest']['shipping_date'] = $uinfo['shipping_date'];
                    $this->session->data['guest']['shipping_time'] = $uinfo['shipping_time'];
                    $this->session->data['guest']['remind'] = $uinfo['remind'];
                    $this->session->data['guest']['order_status_sms'] = $uinfo['order_status_sms'];
                    $this->session->data['guest']['order_status_email'] = $uinfo['order_status_email'];
                    $this->session->data['guest']['newsletter'] = $uinfo['newsletter'];

                    $this->load->model('localisation/country');
                    $country_id = isset($this->request->post['country_id'])?$this->request->post['country_id']:$this->config->get('config_country_id');
                    $country_info = $this->model_localisation_country->getCountry($country_id);

                    if ($country_info) {
                        $this->session->data['guest']['payment']['country'] = $country_info['name'];
                        $this->session->data['guest']['payment']['iso_code_2'] = $country_info['iso_code_2'];
                        $this->session->data['guest']['payment']['iso_code_3'] = $country_info['iso_code_3'];
                        $this->session->data['guest']['payment']['address_format'] = $country_info['address_format'];
                    } else {
                        $this->session->data['guest']['payment']['country'] = '';
                        $this->session->data['guest']['payment']['iso_code_2'] = '';
                        $this->session->data['guest']['payment']['iso_code_3'] = '';
                        $this->session->data['guest']['payment']['address_format'] = '';
                    }

				$this->load->model('localisation/zone');

				$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

				if ($zone_info) {
					$this->session->data['guest']['payment']['zone'] = $zone_info['name'];
					$this->session->data['guest']['payment']['zone_code'] = $zone_info['code'];
				} else {
					$this->session->data['guest']['payment']['zone'] = '';
					$this->session->data['guest']['payment']['zone_code'] = '';
				}

                                $this->session->data['guest']['shipping_address'] = true;

				if ($this->session->data['guest']['shipping_address']) {
                                    $this->session->data['guest']['shipping']['firstname'] = $uinfo['firstname'];
                                    $this->session->data['guest']['shipping']['lastname'] = $uinfo['lastname'];
                                    $this->session->data['guest']['shipping']['address_1'] = $uinfo['address_1'];
                                    $this->session->data['guest']['shipping']['address_2'] = $uinfo['address_2'];
                                    $this->session->data['guest']['shipping']['postcode'] = $uinfo['postcode'];
                                    $this->session->data['guest']['shipping']['city'] = $uinfo['city'];
                                    $this->session->data['guest']['shipping']['country_id'] = $uinfo['country_id'];
                                    $this->session->data['guest']['shipping']['zone_id'] = $uinfo['zone_id'];

                                    if ($country_info) {
                                            $this->session->data['guest']['shipping']['country'] = $country_info['name'];
                                            $this->session->data['guest']['shipping']['iso_code_2'] = $country_info['iso_code_2'];
                                            $this->session->data['guest']['shipping']['iso_code_3'] = $country_info['iso_code_3'];
                                            $this->session->data['guest']['shipping']['address_format'] = $country_info['address_format'];
                                    } else {
                                            $this->session->data['guest']['shipping']['country'] = '';
                                            $this->session->data['guest']['shipping']['iso_code_2'] = '';
                                            $this->session->data['guest']['shipping']['iso_code_3'] = '';
                                            $this->session->data['guest']['shipping']['address_format'] = '';
                                    }

                                    if ($zone_info) {
                                            $this->session->data['guest']['shipping']['zone'] = $zone_info['name'];
                                            $this->session->data['guest']['shipping']['zone_code'] = $zone_info['code'];
                                    } else {
                                            $this->session->data['guest']['shipping']['zone'] = '';
                                            $this->session->data['guest']['shipping']['zone_code'] = '';
                                    }
				}


                                $shipping = explode('.', $this->request->post['shipping_method']);

				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
                                $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
                                $this->session->data['comment'] = strip_tags($this->request->post['comment']);
                    }
                        $this->response->setOutput(json_encode($json));
            }


if((empty($json) && $this->request->server['REQUEST_METHOD'] != 'POST') || (!$json && $this->request->server['REQUEST_METHOD'] != 'POST')){
		$this->document->setTitle($this->language->get('heading_title'));

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/buy'),
        	'text'      => $this->language->get('heading_title'),
        	'separator' => $this->language->get('text_separator')
      	);

    	if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			$points = $this->customer->getRewardPoints();

			$points_total = 0;

			foreach ($this->cart->getProducts() as $product) {
				if ($product['points']) {
					$points_total += $product['points'];
				}
			}

      		$this->data['heading_title'] = $this->language->get('heading_title');

                $this->data['text_next'] = $this->language->get('text_next');
                $this->data['text_next_choice'] = $this->language->get('text_next_choice');
     		$this->data['text_use_coupon'] = $this->language->get('text_use_coupon');
                $this->data['text_use_voucher'] = $this->language->get('text_use_voucher');
                $this->data['text_use_reward'] = sprintf($this->language->get('text_use_reward'), $points);
                $this->data['text_shipping_estimate'] = $this->language->get('text_shipping_estimate');
                $this->data['text_shipping_detail'] = $this->language->get('text_shipping_detail');
                $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
                $this->data['text_select'] = $this->language->get('text_select');

                $this->data['column_image'] = $this->language->get('column_image');
      		$this->data['column_name'] = $this->language->get('column_name');
      		$this->data['column_model'] = $this->language->get('column_model');
      		$this->data['column_quantity'] = $this->language->get('column_quantity');
                $this->data['column_price'] = $this->language->get('column_price');
      		$this->data['column_total'] = $this->language->get('column_total');

                $this->data['entry_coupon'] = $this->language->get('entry_coupon');
                $this->data['entry_voucher'] = $this->language->get('entry_voucher');
                $this->data['entry_reward'] = sprintf($this->language->get('entry_reward'), $points_total);
                $this->data['entry_country'] = $this->language->get('entry_country');
                $this->data['entry_zone'] = $this->language->get('entry_zone');
                $this->data['entry_postcode'] = $this->language->get('entry_postcode');
                $this->data['entry_password'] = $this->language->get('entry_password');
                $this->data['entry_confirm'] = $this->language->get('entry_confirm');

                $this->data['button_update'] = $this->language->get('button_update');
                $this->data['button_remove'] = $this->language->get('button_remove');
                $this->data['button_coupon'] = $this->language->get('button_coupon');
                $this->data['button_voucher'] = $this->language->get('button_voucher');
                $this->data['button_reward'] = $this->language->get('button_reward');
                $this->data['button_quote'] = $this->language->get('button_quote');
                $this->data['button_shipping'] = $this->language->get('button_shipping');
      		$this->data['button_shopping'] = $this->language->get('button_shopping');
      		$this->data['button_checkout'] = $this->language->get('button_checkout');

			if (isset($this->error['warning'])) {
				$this->data['error_warning'] = $this->error['warning'];
			} elseif (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
      			$this->data['error_warning'] = $this->language->get('error_stock');
			} else {
				$this->data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$this->data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$this->data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$this->data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$this->data['success'] = '';
			}

			$this->data['action'] = $this->url->link('checkout/buy');

			if ($this->config->get('config_cart_weight')) {
				$this->data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$this->data['weight'] = '';
			}

			$this->load->model('tool/image');

      		$this->data['products'] = array();

			$products = $this->cart->getProducts();

      		foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], 80, 80);
				} else {
					$image = '';
				}

				$option_data = array();

        		foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);

						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
        		}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				} else {
					$total = false;
				}

        		$this->data['products'][] = array(
          			'key'      => $product['key'],
          			'thumb'    => $image,
					'name'     => $product['name'],
          			'model'    => $product['model'],
          			'option'   => $option_data,
          			'quantity' => $product['quantity'],
          			'stock'    => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'   => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'    => $price,
					'total'    => $total,
					'href'     => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'remove'   => $this->url->link('checkout/buy', 'remove=' . $product['key'])
				);
      		}

			// Gift Voucher
			$this->data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$this->data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount']),
						'remove'      => $this->url->link('checkout/buy', 'remove=' . $key)
					);
				}
			}

			if (isset($this->request->post['next'])) {
				$this->data['next'] = $this->request->post['next'];
			} else {
				$this->data['next'] = '';
			}

			$this->data['coupon_status'] = $this->config->get('coupon_status');

			if (isset($this->request->post['coupon'])) {
				$this->data['coupon'] = $this->request->post['coupon'];
			} elseif (isset($this->session->data['coupon'])) {
				$this->data['coupon'] = $this->session->data['coupon'];
			} else {
				$this->data['coupon'] = '';
			}

			$this->data['voucher_status'] = $this->config->get('voucher_status');

			if (isset($this->request->post['voucher'])) {
				$this->data['voucher'] = $this->request->post['voucher'];
			} elseif (isset($this->session->data['voucher'])) {
				$this->data['voucher'] = $this->session->data['voucher'];
			} else {
				$this->data['voucher'] = '';
			}

			$this->data['reward_status'] = ($points && $points_total && $this->config->get('reward_status'));

			if (isset($this->request->post['reward'])) {
				$this->data['reward'] = $this->request->post['reward'];
			} elseif (isset($this->session->data['reward'])) {
				$this->data['reward'] = $this->session->data['reward'];
			} else {
				$this->data['reward'] = '';
			}

			$this->data['shipping_status'] = $this->config->get('shipping_status') && $this->cart->hasShipping();

			if (isset($this->request->post['country_id'])) {
				$this->data['country_id'] = $this->request->post['country_id'];
			} elseif (isset($this->session->data['guest']['shipping']['country_id'])) {
				$this->data['country_id'] = $this->session->data['guest']['shipping']['country_id'];
			} else {
				$this->data['country_id'] = $this->config->get('config_country_id');
			}

			$this->load->model('localisation/country');

			$this->data['countries'] = $this->model_localisation_country->getCountries();

			if (isset($this->request->post['zone_id'])) {
				$this->data['zone_id'] = $this->request->post['zone_id'];
			} elseif (isset($this->session->data['guest']['shipping']['zone_id'])) {
				$this->data['zone_id'] = $this->session->data['guest']['shipping']['zone_id'];
			} else {
				$this->data['zone_id'] = '';
			}

			if (isset($this->request->post['postcode'])) {
				$this->data['postcode'] = $this->request->post['postcode'];
			} elseif (isset($this->session->data['guest']['shipping']['postcode'])) {
				$this->data['postcode'] = $this->session->data['guest']['shipping']['postcode'];
			} else {
				$this->data['postcode'] = '';
			}

			if (isset($this->request->post['shipping_method'])) {
				$this->data['shipping_method'] = $this->request->post['shipping_method'];
			} elseif (isset($this->session->data['shipping_method'])) {
				$this->data['shipping_method'] = $this->session->data['shipping_method']['code'];
			} else {
				$this->data['shipping_method'] = '';
			}

			// Totals
			$this->load->model('setting/extension');

			$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();

			$sort_order = array();

			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}

				$sort_order = array();

				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $total_data);
			}

			$this->data['totals'] = $total_data;

			$this->data['continue'] = $this->url->link('common/home');

			$this->data['checkout'] = $this->url->link('checkout/buy', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/buy.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/buy.tpl';
			} else {
				$this->template = 'default/template/checkout/buy.tpl';
			}
                        /***************************************************/
                        /*Short checkout*/
                        /***************************************************/

                        /*Guest information*/
                        $this->language->load('checkout/buy');

                        $this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_your_details'] = $this->language->get('text_your_details');
			$this->data['text_your_address'] = $this->language->get('text_your_address');

			$this->data['entry_firstname'] = $this->language->get('entry_firstname');
                        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
			$this->data['entry_email'] = $this->language->get('entry_email');
			$this->data['entry_telephone'] = $this->language->get('entry_telephone');
                        $this->data['entry_fax'] = $this->language->get('entry_fax');
                        $this->data['entry_company'] = $this->language->get('entry_company');
			$this->data['entry_address_1'] = $this->language->get('entry_address_1');
                        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
			$this->data['entry_city'] = $this->language->get('entry_city');
			$this->data['entry_country'] = $this->language->get('entry_country');
			$this->data['entry_zone'] = $this->language->get('entry_zone');
			$this->data['entry_shipping'] = $this->language->get('entry_shipping');
                        $this->data['entry_password1'] = $this->language->get('entry_password1');
			$this->data['entry_password2'] = $this->language->get('entry_password2');
			$this->data['entry_password'] = $this->language->get('entry_password');
			$this->data['entry_discount_card'] = $this->language->get('entry_discount_card');
			$this->data['entry_postcard'] = $this->language->get('entry_postcard');
			$this->data['entry_postcard_descr'] = $this->language->get('entry_postcard_descr');
			$this->data['entry_signature'] = $this->language->get('entry_signature');
			$this->data['entry_photo_free'] = $this->language->get('entry_photo_free');
			$this->data['entry_photo_free_descr'] = $this->language->get('entry_photo_free_descr');
			$this->data['entry_photo_site'] = $this->language->get('entry_photo_site');
			$this->data['entry_rt'] = $this->language->get('entry_rt');
			$this->data['entry_rt_name'] = $this->language->get('entry_rt_name');
			$this->data['entry_rt_telephone'] = $this->language->get('entry_rt_telephone');
			$this->data['entry_rt_clarify'] = $this->language->get('entry_rt_clarify');
			$this->data['entry_address_type'] = $this->language->get('entry_address_type');
			$this->data['entry_street'] = $this->language->get('entry_street');
			$this->data['entry_house'] = $this->language->get('entry_house');
			$this->data['entry_building'] = $this->language->get('entry_building');
			$this->data['entry_office'] = $this->language->get('entry_office');
			$this->data['entry_flat'] = $this->language->get('entry_flat');
			$this->data['entry_room'] = $this->language->get('entry_room');
			$this->data['entry_ward'] = $this->language->get('entry_ward');
			$this->data['entry_shipping_date'] = $this->language->get('entry_shipping_date');
			$this->data['entry_shipping_time'] = $this->language->get('entry_shipping_time');
			$this->data['entry_remind'] = $this->language->get('entry_remind');

                        if (isset($this->session->data['guest']['firstname'])) {
                            $this->data['firstname'] = $this->session->data['guest']['firstname'];
			} else if($this->customer->isLogged() && $this->customer->getFirstName() != '') {
                            $this->data['firstname'] = $this->customer->getFirstName();
			} else {
                            $this->data['firstname'] = '';
			}
                        if (isset($this->session->data['guest']['lastname'])) {
                            $this->data['lastname'] = $this->session->data['guest']['lastname'];
			} else if($this->customer->isLogged() && $this->customer->getLastName() != '') {
                            $this->data['lastname'] = $this->customer->getLastName();
			} else {
                            $this->data['lastname'] = '';
			}

			if (isset($this->session->data['guest']['email'])) {
                            $this->data['email'] = $this->session->data['guest']['email'];
			} else if($this->customer->isLogged() && $this->customer->getEmail() != '') {
                            $this->data['email'] = $this->customer->getEmail();
			} else {
                            $this->data['email'] = '';
			}

			if (isset($this->session->data['guest']['telephone'])) {
				$this->data['telephone'] = $this->session->data['guest']['telephone'];
			} else if($this->customer->isLogged() && $this->customer->getTelephone() != '') {
				$this->data['telephone'] = $this->customer->getTelephone();
			} else {
				$this->data['telephone'] = '';
			}

			if (isset($this->session->data['guest']['fax'])) {
				$this->data['fax'] = $this->session->data['guest']['fax'];
			} else if($this->customer->isLogged() && $this->customer->getFax() != '') {
				$this->data['fax'] = $this->customer->getFax();
			} else {
				$this->data['fax'] = '';
			}

			if (isset($this->session->data['guest']['company'])) {
				$this->data['company'] = $this->session->data['guest']['company'];
			} else {
				$this->data['company'] = '';
			}

                        $this->load->model('account/address');
                        if ($this->customer->isLogged()) {
                                $cust_address = $this->model_account_address->getAddress($this->customer->getAddressId());
                        }

			if (isset($this->session->data['guest']['payment']['address_1'])) {
				$this->data['address_1'] = $this->session->data['guest']['payment']['address_1'];
			} else if($this->customer->isLogged() && $cust_address['address_1'] != '') {
				$this->data['address_1'] = $cust_address['address_1'].', '.$cust_address['address_2'];
			} else {
				$this->data['address_1'] = '';
			}

			if (isset($this->session->data['guest']['payment']['address_2'])) {
				$this->data['address_2'] = $this->session->data['guest']['payment']['address_2'];
			} else if($this->customer->isLogged() && $cust_address['address_2'] != '') {
				$this->data['address_2'] = $cust_address['address_2'];
			} else {
				$this->data['address_2'] = '';
			}

			if (isset($this->session->data['guest']['payment']['city'])) {
				$this->data['city'] = $this->session->data['guest']['payment']['city'];
			} else if($this->customer->isLogged() && $cust_address['city'] != '') {
				$this->data['city'] = $cust_address['city'];
			} else {
				$this->data['city'] = '';
			}

			if (isset($this->session->data['guest']['payment']['country_id'])) {
				$this->data['country_id'] = $this->session->data['guest']['payment']['country_id'];
			} else if($this->customer->isLogged() && $cust_address['country_id'] != '') {
				$this->data['country_id'] = $cust_address['country_id'];
			} else {
				$this->data['country_id'] = $this->config->get('config_country_id');
			}



			$this->load->model('localisation/country');

			$this->data['countries'] = $this->model_localisation_country->getCountries();

			$this->data['shipping_required'] = $this->cart->hasShipping();

			if (isset($this->session->data['guest']['shipping_address'])) {
				$this->data['shipping_address'] = $this->session->data['guest']['shipping_address'];
			} else {
				$this->data['shipping_address'] = true;
			}

                        /*Shipping address*/


                        if ($this->customer->isLogged()) {
                                $shipping_address = $this->model_account_address->getAddress($this->customer->getAddressId());
                        } elseif (isset($this->session->data['guest'])) {
                                $shipping_address = $this->session->data['guest']['shipping'];
                        }else{
                             $shipping_address = array();
                            $shipping_address['country_id'] = $this->config->get('config_country_id');
                            $shipping_address['zone_id'] = 0;
                        }

                        if (isset($this->session->data['guest']['payment']['zone_id'])) {
				$this->data['zone_id'] = $this->session->data['guest']['payment']['zone_id'];
			} else if($this->customer->isLogged() && $shipping_address['zone_id'] != '') {
				$this->data['zone_id'] = $shipping_address['zone_id'];
			} else {
				$this->data['zone_id'] = '';
			}
                        if (!isset($this->session->data['shipping_methods'])) {
                            $quote_data = array();

                            $this->load->model('setting/extension');

                            $results = $this->model_setting_extension->getExtensions('shipping');

                            foreach ($results as $result) {
                                if ($this->config->get($result['code'] . '_status')) {
                                    $this->load->model('shipping/' . $result['code']);


                                    $quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);
                                    if ($quote) {
                                        $quote_data[$result['code']] = array(
                                                'title'      => $quote['title'],
                                                'quote'      => $quote['quote'],
                                                'sort_order' => $quote['sort_order'],
                                                'error'      => $quote['error']
                                        );
                                    }
                                }
                            }

                            $sort_order = array();

                            foreach ($quote_data as $key => $value) {
                                    $sort_order[$key] = $value['sort_order'];
                            }

                            array_multisort($sort_order, SORT_ASC, $quote_data);


                            $this->session->data['shipping_methods'] = $quote_data;
                        }
			$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$this->data['text_comments'] = $this->language->get('text_comments');

			$this->data['button_continue'] = $this->language->get('button_buy');
                        $this->data['text_to_order'] = $this->language->get('text_to_order');

			if (isset($this->session->data['shipping_methods']) && !$this->session->data['shipping_methods']) {
				$this->data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			} else {
				$this->data['error_warning'] = '';
			}

			if (isset($this->session->data['shipping_methods'])) {
				$this->data['shipping_methods'] = $this->session->data['shipping_methods'];
			} else {
				$this->data['shipping_methods'] = array();
			}

			if (isset($this->session->data['shipping_method']['code'])) {
				$this->data['code'] = $this->session->data['shipping_method']['code'];
			} else {
				$this->data['code'] = '';
			}

			if (isset($this->session->data['comment'])) {
				$this->data['comment'] = $this->session->data['comment'];
			} else {
				$this->data['comment'] = '';
			}

                        /*Payment address*/

                        if ($this->customer->isLogged()) {
                                $payment_address = $this->model_account_address->getAddress($this->customer->getAddressId());
                        } elseif (isset($this->session->data['guest']['payment'])) {
                                $payment_address = $this->session->data['guest']['payment'];
                        } else {
                             $payment_address = array();
                            $payment_address['country_id'] = $this->config->get('config_country_id');
                            $payment_address['zone_id'] = 0;
                        }
                        if (!isset($this->session->data['payment_methods'])) {
				// Calculate Totals
				$total_data = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();

				$this->load->model('setting/extension');

				$sort_order = array();

				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);

						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}

				// Payment Methods
				$method_data = array();

				$this->load->model('setting/extension');

				$results = $this->model_setting_extension->getExtensions('payment');

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('payment/' . $result['code']);

						$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

						if ($method) {
							$method_data[$result['code']] = $method;
						}
					}
				}

				$sort_order = array();

				foreach ($method_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $method_data);

				$this->session->data['payment_methods'] = $method_data;
			}

			$this->data['text_payment_method'] = $this->language->get('text_payment_method');

			if (isset($this->session->data['payment_methods']) && !$this->session->data['payment_methods']) {
				$this->data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
			} elseif (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                                $this->data['error_warning'] = $this->language->get('error_stock');
                        } elseif ($this->cart->getTotal() < ((float)$settings['min_order_sum'])) {
				$this->data['error_warning'] = $this->language->get('min_order_sum'). $this->currency->format($settings['min_order_sum']);
                        } else if(isset($this->session->data['error_warning'])) {
                            $this->data['error_warning'] = $this->session->data['error_warning'];
                            unset($this->session->data['error_warning']);
			} else {
				$this->data['error_warning'] = '';
			}

			if (isset($this->session->data['payment_methods'])) {
				$this->data['payment_methods'] = $this->session->data['payment_methods'];
			} else {
				$this->data['payment_methods'] = array();
			}
                        if (isset($this->session->data['payment_method']['code'])) {
				$this->data['p_code'] = $this->session->data['payment_method']['code'];
			} else {
				$this->data['p_code'] = '';
			}
                        if ($this->config->get('config_checkout_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

				if ($information_info) {
					$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
				} else {
					$this->data['text_agree'] = '';
				}
			} else {
				$this->data['text_agree'] = '';
			}

			if (isset($this->session->data['agree'])) {
				$this->data['agree'] = $this->session->data['agree'];
			} else {
				$this->data['agree'] = '';
			}
                        
                        //New fields
                        if (isset($this->session->data['guest']['photo_free'])) {
                            $this->data['photo_free'] = $this->session->data['guest']['photo_free'];
			} else {
                            $this->data['photo_free'] = '';
			}
                        
                        if (isset($this->session->data['guest']['photo_site'])) {
                            $this->data['photo_site'] = $this->session->data['guest']['photo_site'];
			} else {
                            $this->data['photo_site'] = '';
			}
                        
                        if (isset($this->session->data['guest']['postcard_on'])) {
                            $this->data['postcard_on'] = $this->session->data['guest']['postcard_on'];
			} else {
                            $this->data['postcard_on'] = '';
			}
                        
                        if (isset($this->session->data['guest']['postcard'])) {
                            $this->data['postcard'] = $this->session->data['guest']['postcard'];
			} else {
                            $this->data['postcard'] = '';
			}
                        
                        if (isset($this->session->data['guest']['signature'])) {
                            $this->data['signature'] = $this->session->data['guest']['signature'];
			} else {
                            $this->data['signature'] = '';
			}
                        
                        if (isset($this->session->data['guest']['order_status_email'])) {
                            $this->data['order_status_email'] = $this->session->data['guest']['order_status_email'];
			} else {
                            $this->data['order_status_email'] = '';
			}
                        
                        if (isset($this->session->data['guest']['order_status_sms'])) {
                            $this->data['order_status_sms'] = $this->session->data['guest']['order_status_sms'];
			} else {
                            $this->data['order_status_sms'] = '';
			}
                        
                        if (isset($this->session->data['guest']['newsletter'])) {
                            $this->data['newsletter'] = $this->session->data['guest']['newsletter'];
			} else {
                            $this->data['newsletter'] = '';
			}
                        
                        if (isset($this->session->data['guest']['rt'])) {
                            $this->data['rt'] = $this->session->data['guest']['rt'];
			} else {
                            $this->data['rt'] = '';
			}
                        
                        if (isset($this->session->data['guest']['rt_name'])) {
                            $this->data['rt_name'] = $this->session->data['guest']['rt_name'];
			} else {
                            $this->data['rt_name'] = '';
			}
                        
                        if (isset($this->session->data['guest']['rt_telephone'])) {
                            $this->data['rt_telephone'] = $this->session->data['guest']['rt_telephone'];
			} else {
                            $this->data['rt_telephone'] = '';
			}
                        
                        if (isset($this->session->data['guest']['rt_clarify'])) {
                            $this->data['rt_clarify'] = $this->session->data['guest']['rt_clarify'];
			} else {
                            $this->data['rt_clarify'] = '';
			}
                        
                        if (isset($this->session->data['guest']['address_type'])) {
                            $this->data['address_type'] = $this->session->data['guest']['address_type'];
			} else {
                            $this->data['address_type'] = '';
			}
                        
                        if (isset($this->session->data['guest']['street'])) {
                            $this->data['street'] = $this->session->data['guest']['street'];
			} else {
                            $this->data['street'] = '';
			}
                        
                        if (isset($this->session->data['guest']['house'])) {
                            $this->data['house'] = $this->session->data['guest']['house'];
			} else {
                            $this->data['house'] = '';
			}
                        
                        if (isset($this->session->data['guest']['building'])) {
                            $this->data['building'] = $this->session->data['guest']['building'];
			} else {
                            $this->data['building'] = '';
			}
                        
                        if (isset($this->session->data['guest']['office'])) {
                            $this->data['office'] = $this->session->data['guest']['office'];
			} else {
                            $this->data['office'] = '';
			}
                        
                        if (isset($this->session->data['guest']['flat'])) {
                            $this->data['flat'] = $this->session->data['guest']['flat'];
			} else {
                            $this->data['flat'] = '';
			}
                        
                        if (isset($this->session->data['guest']['room'])) {
                            $this->data['room'] = $this->session->data['guest']['room'];
			} else {
                            $this->data['room'] = '';
			}
                        
                        if (isset($this->session->data['guest']['ward'])) {
                            $this->data['ward'] = $this->session->data['guest']['ward'];
			} else {
                            $this->data['ward'] = '';
			}
                        
                        if (isset($this->session->data['guest']['shipping_date'])) {
                            $this->data['shipping_date'] = $this->session->data['guest']['shipping_date'];
			} else {
                            $this->data['shipping_date'] = '';
			}
                        
                        if (isset($this->session->data['guest']['shipping_time'])) {
                            $this->data['shipping_time'] = $this->session->data['guest']['shipping_time'];
			} else {
                            $this->data['shipping_time'] = '';
			}
                        
                        if (isset($this->session->data['guest']['remind'])) {
                            $this->data['remind'] = $this->session->data['guest']['remind'];
			} else {
                            $this->data['remind'] = '';
			}
                        //END New fields

                        if(!$settings['zone_status']){
                            $this->data['config_zone_id'] = $this->config->get('config_zone_id');
                        }
                        if(!$settings['zone_status'] && !$settings['shipping_select'] && !$settings['payment_select'] && !$settings['comment_status']){
                            $this->data['right_status'] = false;
                        }else{
                            $this->data['right_status'] = true;
                        }
                        $this->data['customer_logged'] = $this->customer->isLogged();
                        $this->data['forgotten'] = $this->url->link('account/forgotten');
                        $this->data['login'] = $this->url->link('account/login');
                        
                        $this->load->model('localisation/city');
                        $this->data['cities'] = $this->model_localisation_city->getCities();
                        
                        /***************************************************/
                        /*END Short checkout*/
                        /***************************************************/

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_bottom',
				'common/content_top',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
    	} else {
      		$this->data['heading_title'] = $this->language->get('heading_title');

      		$this->data['text_error'] = $this->language->get('text_empty');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			unset($this->session->data['success']);

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
                        }
                    }
  	}

	private function validateCoupon() {
		$this->load->model('checkout/coupon');

		$coupon_info = $this->model_checkout_coupon->getCoupon($this->request->post['coupon']);

		if (!$coupon_info) {
			$this->error['warning'] = $this->language->get('error_coupon');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateVoucher() {
		$this->load->model('checkout/voucher');

		$voucher_info = $this->model_checkout_voucher->getVoucher($this->request->post['voucher']);

		if (!$voucher_info) {
			$this->error['warning'] = $this->language->get('error_voucher');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateReward() {
		$points = $this->customer->getRewardPoints();

		$points_total = 0;

		foreach ($this->cart->getProducts() as $product) {
			if ($product['points']) {
				$points_total += $product['points'];
			}
		}

		if (empty($this->request->post['reward'])) {
			$this->error['warning'] = $this->language->get('error_reward');
		}

		if ($this->request->post['reward'] > $points) {
			$this->error['warning'] = sprintf($this->language->get('error_points'), $this->request->post['reward']);
		}

		if ($this->request->post['reward'] > $points_total) {
			$this->error['warning'] = sprintf($this->language->get('error_maximum'), $points_total);
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateShipping() {
		if (!empty($this->request->post['shipping_method1'])) {
			$shipping = explode('.', $this->request->post['shipping_method1']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$this->error['warning'] = $this->language->get('error_shipping');
			}
		} else {
			$this->error['warning'] = $this->language->get('error_shipping');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function add() {
		$this->language->load('checkout/buy');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity'])) {
				$quantity = $this->request->post['quantity'];
			} else {
				$quantity = 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (!$json) {
				$this->cart->add($this->request->post['product_id'], $quantity, $option);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/buy'));

				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('setting/extension');

				$total_data = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();

				$sort_order = array();

				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);

						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}

					$sort_order = array();

					foreach ($total_data as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $total_data);
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function quote() {
		$this->language->load('checkout/buy');

		$json = array();

		if (!$this->cart->hasProducts()) {
			$json['error']['warning'] = $this->language->get('error_product');
		}

		if (!$this->cart->hasShipping()) {
			$json['error']['warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
		}

		if ($this->request->post['country_id'] == '') {
			$json['error']['country'] = $this->language->get('error_country');
		}

		if ($this->request->post['zone_id'] == '') {
			$json['error']['zone'] = $this->language->get('error_zone');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			$json['error']['postcode'] = $this->language->get('error_postcode');
		}

		if (!$json) {
			$this->tax->setShippingAddress($this->request->post['country_id'], $this->request->post['zone_id']);

			$this->session->data['guest']['shipping']['country_id'] = $this->request->post['country_id'];
			$this->session->data['guest']['shipping']['zone_id'] = $this->request->post['zone_id'];
			$this->session->data['guest']['shipping']['postcode'] = $this->request->post['postcode'];

			if ($country_info) {
				$country = $country_info['name'];
				$iso_code_2 = $country_info['iso_code_2'];
				$iso_code_3 = $country_info['iso_code_3'];
				$address_format = $country_info['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$this->load->model('localisation/zone');

			$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

			if ($zone_info) {
				$zone = $zone_info['name'];
				$code = $zone_info['code'];
			} else {
				$zone = '';
				$code = '';
			}

			$address_data = array(
				'firstname'      => '',
				'lastname'       => '',
				'company'        => '',
				'address_1'      => '',
				'address_2'      => '',
				'postcode'       => $this->request->post['postcode'],
				'city'           => '',
				'zone_id'        => $this->request->post['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $code,
				'country_id'     => $this->request->post['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
			);

			$quote_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($address_data);

					if ($quote) {
						$quote_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $quote_data);

			$this->session->data['shipping_methods'] = $quote_data;

			if ($this->session->data['shipping_methods']) {
				$json['shipping_method'] = $this->session->data['shipping_methods'];
			} else {
				$json['error']['warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			}
		}

		$this->response->setOutput(json_encode($json));
	}

  	public function zone() {
		$output = '<option value="">' . $this->language->get('text_select') . '</option>';

		$this->load->model('localisation/zone');

    	$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

      	foreach ($results as $result) {
        	$output .= '<option value="' . $result['zone_id'] . '"';

	    	if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
	      		$output .= ' selected="selected"';
	    	}

	    	$output .= '>' . $result['name'] . '</option>';
    	}

		if (!$results) {
		  	$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
		}

		$this->response->setOutput($output);
  	}
        public function getShippingMethods(){
		// Shipping Methods
		$this->load->model('account/address');

                if (isset($this->session->data['guest'])) {
                        $shipping_address = $this->session->data['guest'];
                        $shipping_address['country_id'] = $this->config->get('config_country_id');
                        $shipping_address['zone_id'] = $this->request->get['zone_id'];
                } else {
                     $shipping_address = array();
                    $shipping_address['country_id'] = $this->config->get('config_country_id');
                    $shipping_address['zone_id'] = $this->request->get['zone_id'];
                }
		$quote_data = array();
                $output = '';
                $this->load->model('setting/extension');

                $results = $this->model_setting_extension->getExtensions('shipping');

               foreach ($results as $result) {
                        if ($this->config->get($result['code'] . '_status')) {
                                $this->load->model('shipping/' . $result['code']);

                                $quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);

                                if ($quote) {
                                        $quote_data[$result['code']] = array(
                                                'title'      => $quote['title'],
                                                'quote'      => $quote['quote'],
                                                'sort_order' => $quote['sort_order'],
                                                'error'      => $quote['error']
                                        );
                                }
                        }
                }

                $sort_order = array();

                foreach ($quote_data as $key => $value) {
                        $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $quote_data);
                /*Output*/
                foreach($quote_data as $shipping_method){
                    if (!$shipping_method['error']) {
                      foreach ($shipping_method['quote'] as $quote) {
                          $code = $quote['code'];
                      $output .= '<tr>
                        <td style="width: 1px;">';
                          if ($quote['code'] == $code || !$code) {

                          $output .= '<input type="radio" name="shipping_method" value="'.$quote['code'].'" id="'.$quote['code'].'" checked="checked" />';
                          } else {
                          $output .= '<input type="radio" name="shipping_method" value="'.$quote['code'].'" id="'.$quote['code'].'" />';
                           }
                           $output .= '</td>
                        <td><label for="'.$quote['code'].'">'.$quote['title'].'</label></td>
                        <td style="text-align: right;"><label for="'.$quote['code'].'">'.$quote['text'].'</label></td>
                      </tr>';
                      }
                      } else {
                      $output .= '<tr>
                        <td colspan="3"><div class="error">'.$shipping_method['error'].'</div></td>
                      </tr>';
                     }
                }
                /*END Output*/

		$this->session->data['shipping_methods'] = $quote_data;
		$this->response->setOutput($output, $this->config->get('config_compression'));
	}

	public function getPaymentMethods(){
		// Payment Methods
		$this->load->model('account/address');

		if (isset($this->session->data['guest'])) {
			$payment_address = $this->session->data['guest'];
			$payment_address['country_id'] = $this->config->get('config_country_id');
			$payment_address['zone_id'] = $this->request->get['zone_id'];
		} else {
			$payment_address = array();
			$payment_address['country_id'] = $this->config->get('config_country_id');
			$payment_address['zone_id'] = $this->request->get['zone_id'];
		}

		// Calculate Totals
		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		$this->load->model('setting/extension');

		$sort_order = array();

		$results = $this->model_setting_extension->getExtensions('total');

		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $results);

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
		}

		// Get payment methods
		$method_data = array();

		$this->load->model('setting/extension');

		$results = $this->model_setting_extension->getExtensions('payment');

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('payment/' . $result['code']);

				$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

				if ($method) {
					$method_data[$result['code']] = $method;
				}
			}
		}

		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		$output = '';
		if (isset($this->session->data['payment_method']['code'])) {
			$p_code = $this->session->data['payment_method']['code'];
		} else {
			$p_code = '';
		}

		foreach($method_data as $payment_method){
			$output .= '<tr>
            <td style="width: 1px;">';
			if ($payment_method['code'] == $p_code || !$p_code) {
				$p_code = $payment_method['code'];
              $output .= '<input type="radio" name="payment_method" value="'.$payment_method['code'].'" id="'.$payment_method['code'].'" checked="checked" />';
              } else {
              $output .= '<input type="radio" name="payment_method" value="'.$payment_method['code'].'" id="'.$payment_method['code'].'" />';
              }
			  $output .= '</td>
            <td><label for="'.$payment_method['code'].'">'.$payment_method['title'].'</label></td>
            </tr>';

		}
		$this->session->data['payment_methods'] = $method_data;
		$this->response->setOutput($output, $this->config->get('config_compression'));
	}

        function getPaymentForm(){
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            if(isset($this->request->post['code'])){
                $json = array();
                $json['output'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
                $this->response->setOutput(json_encode($json));
            }
        }
}
?>