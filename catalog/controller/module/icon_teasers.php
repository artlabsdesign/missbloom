<?php  
class ControllerModuleiconteasers extends Controller {
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/icon_teasers');
		$this->load->model('tool/image');
		
		
		$this->data['module_title']     = $setting['module_title'];
		
		if (isset($setting['module_title'][$this->config->get('config_language_id')])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
		
		$this->data['setting'] = $setting;
		
		$number_sections = count($setting['sections']);	
		
		$this->data['sections'] = array();
		
		$section_row = 0;
		
		foreach($setting['sections'] as $section){
			if (isset($section['title'][$this->config->get('config_language_id')])){
				$title = html_entity_decode($section['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$title = false;
			}
			
			if (isset($section['sub_title'][$this->config->get('config_language_id')])){
				$sub_title = html_entity_decode($section['sub_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$sub_title = false;
			}
			
			if (isset($section['description'][$this->config->get('config_language_id')])){
				$description = html_entity_decode($section['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$description = false;
			}
			if (isset($section['icon_color'])){
				$icon_color = $section['icon_color'];
			} else {
				$icon_color = false;
			}
			if (isset($section['icon_link'])){
				$icon_link = $section['icon_link'];
			} else {
				$icon_link = false;
			}

			$this->data['sections'][] = array(
				'id'          => 'slide-' . $module . '-' . $section_row,
				'title'       => $title,
				'sub_title'       => $sub_title,
				'description' => $description,
				'icon_color' => $icon_color,
				'icon_link' => $icon_link,
				'icon'       => $section['icon']
			);
			$this->data['id'] = $section_row++;
			
		}

		$this->data['module'] = $module++;
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/icon_teasers.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/icon_teasers.tpl';
		} else {
			$this->template = 'default/template/module/icon_teasers.tpl';
		}
		
		$this->render();
	}
}
?>