<?php  
class ControllerModulecustomcontent extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->language->load('module/custom_content');
		
		$this->load->model('setting/setting');
		
		$this->data['setting'] = $setting;
		
		$this->data['module_title']     = $setting['module_title'];
		
    	if (isset($setting['module_title'][$this->config->get('config_language_id')])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
    	
		$this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		
		$this->data['module'] = $module++;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/custom_content.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/custom_content.tpl';
		} else {
			$this->template = 'default/template/module/custom_content.tpl';
		}
		
		$this->render();
	}
}
?>