<?php
class ControllerModuleOrderstatus extends Controller {
	private $error = array(); 
    
    public function install() {       
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "order_status_color` (
          `order_status_id` int(11) NOT NULL,
          `color` char(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
          PRIMARY KEY (`order_status_id`)
        )");
        $location = str_replace('admin','vqmod/xml',DIR_APPLICATION);
        rename($location."vqmod_order_status_color.xml.bak", $location."vqmod_order_status_color.xml");
        
        
    }
    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "order_status_color`;");
        $location = str_replace('admin','vqmod/xml',DIR_APPLICATION);
        rename($location."vqmod_order_status_color.xml", $location."vqmod_order_status_color.xml.bak");
    }
	public function index() {   
		$this->language->load('module/order_status');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('order_status', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/order_status', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/order_status', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        
        if (isset($this->request->post['order_status'])) {
			foreach ($this->request->post['order_status'] as $key => $value) {
				$this->data['data']['order_status'][$key] = $this->request->post['order_status'][$key];
			}
		} else {
			$configValue = $this->config->get('order_status');
			$this->data['data']['order_status'] = $configValue;
		}
		$this->data['modules'] = array();

		if (isset($this->request->post['order_status_module'])) {
			$this->data['modules'] = $this->request->post['order_status_module'];
		} elseif ($this->config->get('order_status_module')) { 
			$this->data['modules'] = $this->config->get('order_status_module');
		}	

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/order_status.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/order_status')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>