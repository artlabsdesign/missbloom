<?php  
class ControllerModuleULTIMATUMtabs extends Controller {
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/ULTIMATUMtabs');
		$this->load->model('tool/image');
		$this->data['setting'] = $setting;
		
		$this->data['module_title']     = $setting['module_title'];
		if (isset($setting['module_title'][$this->config->get('config_language_id')])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
		$this->data['tabsmode']     = $setting['tabsmode'];
		$number_sections = count($setting['sections']);	
		
		$this->data['sections'] = array();
		
		$section_row = 0;
		
		foreach($setting['sections'] as $section){
			if (isset($section['title'][$this->config->get('config_language_id')])){
				$title = html_entity_decode($section['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$title = false;
			}
			
			if (isset($section['description'][$this->config->get('config_language_id')])){
				$description = html_entity_decode($section['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$description = false;
			}

			$this->data['sections'][] = array(
				'id'          => 'slide-' . $module . '-' . $section_row,
				'title'       => $title,
				'description' => $description,
				'icon'       => $section['icon']
			);
			
		}

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUMtabs.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUMtabs.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUMtabs.tpl';
		}
		
		$this->render();
	}
}
?>