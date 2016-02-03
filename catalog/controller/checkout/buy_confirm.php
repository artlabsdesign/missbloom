<?php
class ControllerCheckoutBuyConfirm extends Controller {
	public function index() {
            $redirect = '';
            $this->load->model('setting/setting');

            if ($this->cart->hasShipping()) {
                    // Validate if shipping address has been set.
                    $this->load->model('account/address');

                    if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {
                            $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                    } elseif (isset($this->session->data['guest'])) {
                            $shipping_address = $this->session->data['guest']['shipping'];
                    }

                    if (empty($shipping_address)) {
                            $redirect = $this->url->link('checkout/buy', '', 'SSL');
                    }

                    // Validate if shipping method has been set.
                    if (!isset($this->session->data['shipping_method'])) {
                            $redirect = $this->url->link('checkout/buy', '', 'SSL');
                    }
            } else {
                    unset($this->session->data['shipping_method']);
                    unset($this->session->data['shipping_methods']);
            }

            // Validate if payment address has been set.
            $this->load->model('account/address');

            if ($this->customer->isLogged() && isset($this->session->data['payment_address_id'])) {
                    $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
            } elseif (isset($this->session->data['guest'])) {
                    $payment_address = $this->session->data['guest']['payment'];
            }

            if (empty($payment_address)) {
                    $redirect = $this->url->link('checkout/buy', '', 'SSL');
            }

            // Validate if payment method has been set.
            if (!isset($this->session->data['payment_method'])) {
                    $redirect = $this->url->link('checkout/buy', '', 'SSL');
            }

            // Validate cart has products and has stock.
            if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
                    $redirect = $this->url->link('checkout/cart');
            }

            // Validate minimum quantity requirments.
            $products = $this->cart->getProducts();

            foreach ($products as $product) {
                    $product_total = 0;

                    foreach ($products as $product_2) {
                            if ($product_2['product_id'] == $product['product_id']) {
                                    $product_total += $product_2['quantity'];
                            }
                    }

                    if ($product['minimum'] > $product_total) {
                            $redirect = $this->url->link('checkout/cart');

                            break;
                    }
            }
                                $json = array();
            if (!$redirect) {
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

                    $sort_order = array();

                    foreach ($total_data as $key => $value) {
                            $sort_order[$key] = $value['sort_order'];
                    }

                    array_multisort($sort_order, SORT_ASC, $total_data);

                    $this->language->load('checkout/buy');

                    $data = array();

                    $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
                    $data['store_id'] = $this->config->get('config_store_id');
                    $data['store_name'] = $this->config->get('config_name');

                    if ($data['store_id']) {
                            $data['store_url'] = $this->config->get('config_url');
                    } else {
                            $data['store_url'] = HTTP_SERVER;
                    }

                    if (isset($this->session->data['guest'])) {
                        if($this->customer->isLogged())
                            $data['customer_id'] = $this->customer->getId();
                        else
                            $data['customer_id'] = 0;

                        if($this->customer->isLogged())
                            $data['customer_group_id'] = $this->customer->getCustomerGroupId();
                        else
                            $data['customer_group_id'] = $this->config->get('config_customer_group_id');
                        if($this->session->data['guest']['firstname'] != ''){
                            $data['firstname'] = $this->session->data['guest']['firstname'];
                        }else{
                            $data['firstname'] = '';
                        }
                        if($this->session->data['guest']['lastname'] != ''){
                            $data['lastname'] = $this->session->data['guest']['lastname'];
                        }else{
                            $data['lastname'] = '';
                        }
                        if($this->session->data['guest']['email'] != ''){
                            $data['email'] = $this->session->data['guest']['email'];
                        }else{
                            $data['email'] = '';
                        }
                        if($this->session->data['guest']['telephone'] != ''){
                            $data['telephone'] = $this->session->data['guest']['telephone'];
                        }else{
                            $data['telephone'] = '';
                        }
                        if($this->session->data['guest']['fax'] != ''){
                            $data['fax'] = $this->session->data['guest']['fax'];
                        }else{
                            $data['fax'] = '';
                        }
                        if($this->session->data['guest']['password'] != ''){
                            $data['password'] = $this->session->data['guest']['password'];
                        }else{
                            $data['password'] = '';
                        }

                        $this->load->model('account/address');

                        $payment_address = $this->session->data['guest']['payment'];
                    }

                    if($this->session->data['guest']['firstname'] != ''){
                        $data['payment_firstname'] = $payment_address['firstname'];
                    }else{
                        $data['payment_firstname'] = '';
                    }
                    if($this->session->data['guest']['lastname'] != ''){
                        $data['payment_lastname'] = $payment_address['lastname'];
                    }else{
                        $data['payment_lastname'] = '';
                    }
                    if($this->session->data['guest']['company'] != ''){
                        $data['payment_company'] = $this->session->data['guest']['company'];
                    }else{
                        $data['payment_company'] = '';
                    }
                    if($payment_address['address_1'] != ''){
                        $data['payment_address_1'] = $payment_address['address_1'];
                    }else{
                        $data['payment_address_1'] = '';
                    }
                    if($payment_address['address_2'] != ''){
                        $data['payment_address_2'] = $payment_address['address_2'];
                    }else{
                        $data['payment_address_2'] = '';
                    }
                    if($payment_address['city'] != ''){
                        $data['payment_city'] = $payment_address['city'];
                    }else{
                        $data['payment_city'] = '';
                    }
                    if($payment_address['postcode'] != ''){
                        $data['payment_postcode'] = $payment_address['postcode'];
                    }else{
                        $data['payment_postcode'] = '';
                    }
                    $data['payment_company_id'] = '';
                    $data['payment_tax_id'] = '';
                    $data['payment_zone'] = $payment_address['zone'];
                    $data['payment_zone_id'] = $payment_address['zone_id'];
                    $data['payment_country'] = $payment_address['country'];
                    $data['payment_country_id'] = $payment_address['country_id'];
                    $data['payment_address_format'] = $payment_address['address_format'];

                    if (isset($this->session->data['payment_method']['title'])) {
                            $data['payment_method'] = $this->session->data['payment_method']['title'];
                    } else {
                            $data['payment_method'] = '';
                    }

                    if (isset($this->session->data['payment_method']['code'])) {
                            $data['payment_code'] = $this->session->data['payment_method']['code'];
                    } else {
                            $data['payment_code'] = '';
                    }
                    
                    $data['discount_card'] = $this->session->data['guest']['discount_card'];
                    $data['postcard'] = $this->session->data['guest']['postcard'];
                    $data['signature'] = $this->session->data['guest']['signature'];
                    $data['photo_free'] = $this->session->data['guest']['photo_free'];
                    $data['photo_site'] = $this->session->data['guest']['photo_site'];
                    $data['rt'] = $this->session->data['guest']['rt'];
                    $data['rt_name'] = $this->session->data['guest']['rt_name'];
                    $data['rt_telephone'] = $this->session->data['guest']['rt_telephone'];
                    $data['rt_clarify'] = $this->session->data['guest']['rt_clarify'];
                    $data['address_type'] = $this->session->data['guest']['address_type'];
                    $data['street'] = $this->session->data['guest']['street'];
                    $data['house'] = $this->session->data['guest']['house'];
                    $data['flat'] = $this->session->data['guest']['flat'];
                    $data['room'] = $this->session->data['guest']['room'];
                    $data['building'] = $this->session->data['guest']['building'];
                    $data['office'] = $this->session->data['guest']['office'];
                    $data['ward'] = $this->session->data['guest']['ward'];
                    $data['shipping_date'] = $this->session->data['guest']['shipping_date'];
                    $data['shipping_time'] = $this->session->data['guest']['shipping_time'];
                    $data['remind'] = $this->session->data['guest']['remind'];
                    $data['order_status_sms'] = $this->session->data['guest']['order_status_sms'];
                    $data['order_status_email'] = $this->session->data['guest']['order_status_email'];
                    $data['newsletter'] = $this->session->data['guest']['newsletter'];

                    if ($this->cart->hasShipping()) {
                        if (isset($this->session->data['guest'])) {
                            $shipping_address = $this->session->data['guest']['shipping'];
                        }

                        if($shipping_address['firstname'] != ''){
                            $data['shipping_firstname'] = $shipping_address['firstname'];
                        }else{
                            $data['shipping_firstname'] = '';
                        }
                        if($shipping_address['lastname'] != ''){
                            $data['shipping_lastname'] = $shipping_address['lastname'];
                        }else{
                            $data['shipping_lastname'] = '';
                        }
                        if($this->session->data['guest']['company'] != ''){
                            $data['shipping_company'] = $this->session->data['guest']['company'];
                        }else{
                            $data['shipping_company'] = '';
                        }
                        if($shipping_address['address_1'] != ''){
                            $data['shipping_address_1'] = $shipping_address['address_1'];
                        }else{
                            $data['shipping_address_1'] = '';
                        }
                        if($shipping_address['address_2'] != ''){
                            $data['shipping_address_2'] = $shipping_address['address_2'];
                        }else{
                            $data['shipping_address_2'] = '';
                        }
                        if($shipping_address['city'] != ''){
                            $data['shipping_city'] = $shipping_address['city'];
                        }else{
                            $data['shipping_city'] = '';
                        }
                        $data['shipping_postcode'] = $shipping_address['postcode'];
                        $data['shipping_zone'] = $shipping_address['zone'];
                        $data['shipping_zone_id'] = $shipping_address['zone_id'];
                        $data['shipping_country'] = $shipping_address['country'];
                        $data['shipping_country_id'] = $shipping_address['country_id'];
                        $data['shipping_address_format'] = $shipping_address['address_format'];

                        if (isset($this->session->data['shipping_method']['title'])) {
                            $data['shipping_method'] = $this->session->data['shipping_method']['title'];
                        } else {
                            $data['shipping_method'] = '';
                        }

                        if (isset($this->session->data['shipping_method']['code'])) {
                            $data['shipping_code'] = $this->session->data['shipping_method']['code'];
                        } else {
                            $data['shipping_code'] = '';
                        }
                    } else {
                            $data['shipping_firstname'] = '';
                            $data['shipping_lastname'] = '';
                            $data['shipping_company'] = '';
                            $data['shipping_address_1'] = '';
                            $data['shipping_address_2'] = '';
                            $data['shipping_city'] = '';
                            $data['shipping_postcode'] = '';
                            $data['shipping_zone'] = '';
                            $data['shipping_zone_id'] = '';
                            $data['shipping_country'] = '';
                            $data['shipping_country_id'] = '';
                            $data['shipping_address_format'] = '';
                            $data['shipping_method'] = '';
                            $data['shipping_code'] = '';
                    }

                    $product_data = array();

                    foreach ($this->cart->getProducts() as $product) {
                            $option_data = array();

                            foreach ($product['option'] as $option) {
                                    if ($option['type'] != 'file') {
                                            $value = $option['option_value'];
                                    } else {
                                            $value = $this->encryption->decrypt($option['option_value']);
                                    }

                                    $option_data[] = array(
                                            'product_option_id'       => $option['product_option_id'],
                                            'product_option_value_id' => $option['product_option_value_id'],
                                            'option_id'               => $option['option_id'],
                                            'option_value_id'         => $option['option_value_id'],
                                            'name'                    => $option['name'],
                                            'value'                   => $value,
                                            'type'                    => $option['type']
                                    );
                            }

                            $product_data[] = array(
                                    'product_id' => $product['product_id'],
                                    'name'       => $product['name'],
                                    'model'      => $product['model'],
                                    'option'     => $option_data,
                                    'download'   => $product['download'],
                                    'quantity'   => $product['quantity'],
                                    'subtract'   => $product['subtract'],
                                    'price'      => $product['price'],
                                    'total'      => $product['total'],
                                    'tax'        => $this->tax->getTax($product['total'], $product['tax_class_id']),
                                    'reward'     => $product['reward']
                            );
                    }

                    // Gift Voucher
                    $voucher_data = array();

                    if (!empty($this->session->data['vouchers'])) {
                        foreach ($this->session->data['vouchers'] as $voucher) {
                            $voucher_data[] = array(
                                'description'      => $voucher['description'],
                                'code'             => substr(md5(rand()), 0, 7),
                                'to_name'          => $voucher['to_name'],
                                'to_email'         => $voucher['to_email'],
                                'from_name'        => $voucher['from_name'],
                                'from_email'       => $voucher['from_email'],
                                'voucher_theme_id' => $voucher['voucher_theme_id'],
                                'message'          => $voucher['message'],
                                'amount'           => $voucher['amount']
                            );
                        }
                    }

                    $data['products'] = $product_data;
                    $data['vouchers'] = $voucher_data;
                    $data['totals'] = $total_data;
                    $data['comment'] = $this->session->data['comment'];
                    $data['total'] = $total;

                    if (isset($this->request->cookie['tracking'])) {
                            $this->load->model('affiliate/affiliate');

                            $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
                            $subtotal = $this->cart->getSubTotal();

                            if ($affiliate_info) {
                                    $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                                    $data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                            } else {
                                    $data['affiliate_id'] = 0;
                                    $data['commission'] = 0;
                            }
                    } else {
                            $data['affiliate_id'] = 0;
                            $data['commission'] = 0;
                    }

                    $data['language_id'] = $this->config->get('config_language_id');
                    $data['currency_id'] = $this->currency->getId();
                    $data['currency_code'] = $this->currency->getCode();
                    $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
                    $data['ip'] = $this->request->server['REMOTE_ADDR'];

                    if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                            $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
                    } elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
                            $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
                    } else {
                            $data['forwarded_ip'] = '';
                    }

                    if (isset($this->request->server['HTTP_USER_AGENT'])) {
                            $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
                    } else {
                            $data['user_agent'] = '';
                    }

                    if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                            $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
                    } else {
                            $data['accept_language'] = '';
                    }

                    $this->load->model('checkout/order');

                    $this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);

                    /* Registration */
                    if($data['password'] != '' && $data['email'] != ''){
                        $register_data = array(
                            'firstname' => $data['firstname'],
                            'lastname' => $data['lastname'],
                            'email' => $data['email'],
                            'telephone' => $data['telephone'],
                            'fax' => $data['fax'],
                            'password' => $data['password'],
                            'company' => '',
                            'company_id' => '',
                            'tax_id' => '',
                            'address_1' => $shipping_address['address_1'],
                            'address_2' => $shipping_address['address_2'],
                            'city' => $shipping_address['city'],
                            'postcode' => $shipping_address['postcode'],
                            'country_id' => $shipping_address['country_id'],
                            'zone_id' => $shipping_address['zone_id'],
                        );
                        $this->load->model('account/customer');
                        $this->model_account_customer->addCustomer($register_data);
                    }
                    /* END Registration */

                    $this->data['column_name'] = $this->language->get('column_name');
                    $this->data['column_model'] = $this->language->get('column_model');
                    $this->data['column_quantity'] = $this->language->get('column_quantity');
                    $this->data['column_price'] = $this->language->get('column_price');
                    $this->data['column_total'] = $this->language->get('column_total');
                                                   $this->data['text_confirm'] = $this->language->get('text_confirm');
                                                    $this->data['text_change_data'] = $this->language->get('text_change_data');
                                                    $this->data['back_link'] = $this->url->link('checkout/cart');
                    $this->data['products'] = array();

                    foreach ($this->cart->getProducts() as $product) {
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

                            $this->data['products'][] = array(
                                    'product_id' => $product['product_id'],
                                    'name'       => $product['name'],
                                    'model'      => $product['model'],
                                    'option'     => $option_data,
                                    'quantity'   => $product['quantity'],
                                    'subtract'   => $product['subtract'],
                                    'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
                                    'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
                                    'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                            );
                    }

                    // Gift Voucher
                    $this->data['vouchers'] = array();

                    if (!empty($this->session->data['vouchers'])) {
                            foreach ($this->session->data['vouchers'] as $voucher) {
                                    $this->data['vouchers'][] = array(
                                            'description' => $voucher['description'],
                                            'amount'      => $this->currency->format($voucher['amount'])
                                    );
                            }
                    }

                    $this->data['totals'] = $total_data;

                    $this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
            } else {
                    $this->data['redirect'] = $redirect;
            }
        }
}
?>