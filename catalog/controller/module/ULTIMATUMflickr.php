<?php
class ControllerModuleULTIMATUMflickr extends Controller {
	protected function index($setting) {
		$this->load->model('setting/setting');
		$this->data['setting'] = $setting;
		$this->language->load('module/ULTIMATUMflickr');
		
		$this->data['username']     = $setting['username'];
		$this->data['limit']     = $setting['limit'];
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUMflickr.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUMflickr.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUMflickr.tpl';
		}
		
		$this->render();
	}	
}
?>
