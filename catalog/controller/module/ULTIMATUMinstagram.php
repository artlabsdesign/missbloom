<?php
class ControllerModuleULTIMATUMinstagram extends Controller {
	protected function index($setting) {
		$this->load->model('setting/setting');
		$this->data['setting'] = $setting;
		$this->language->load('module/ULTIMATUMinstagram');
		
		$this->data['username']     = $setting['username'];
		$this->data['grid_vertical']     = $setting['grid_vertical'];
		$this->data['grid_horizontal']     = $setting['grid_horizontal'];
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUMinstagram.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUMinstagram.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUMinstagram.tpl';
		}
		
		$this->render();
	}	
}
?>
