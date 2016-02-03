<?php  
class ControllerModulepricetables extends Controller {
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/pricetables');
		$this->load->model('tool/image');
		$this->data['text_more'] = $this->language->get('text_more');
		
		$this->data['module_title']     = $setting['module_title'];
		if (isset($setting['module_title'][$this->config->get('config_language_id')])){
				$this->data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$this->data['module_title'] = false;
			}
		$number_sections = count($setting['sections']);	
		
		$this->data['sections'] = array();
		
		$section_row = 0;
		
		foreach($setting['sections'] as $section){
			if (isset($section['title'][$this->config->get('config_language_id')])){
				$title = html_entity_decode($section['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$title = false;
			}
			if (isset($section['line_price'][$this->config->get('config_language_id')])){
				$line_price = html_entity_decode($section['line_price'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_price = false;
			}
			if (isset($section['line_period'][$this->config->get('config_language_id')])){
				$line_period = html_entity_decode($section['line_period'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_period = false;
			}
			if (isset($section['line_option1'][$this->config->get('config_language_id')])){
				$line_option1 = html_entity_decode($section['line_option1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option1 = false;
			}
			if (isset($section['line_option2'][$this->config->get('config_language_id')])){
				$line_option2 = html_entity_decode($section['line_option2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option2 = false;
			}
			if (isset($section['line_option3'][$this->config->get('config_language_id')])){
				$line_option3 = html_entity_decode($section['line_option3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option3 = false;
			}
			if (isset($section['line_option4'][$this->config->get('config_language_id')])){
				$line_option4 = html_entity_decode($section['line_option4'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option4 = false;
			}
			if (isset($section['line_option5'][$this->config->get('config_language_id')])){
				$line_option5 = html_entity_decode($section['line_option5'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option5 = false;
			}
			if (isset($section['line_option6'][$this->config->get('config_language_id')])){
				$line_option6 = html_entity_decode($section['line_option6'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option6 = false;
			}
			if (isset($section['line_option7'][$this->config->get('config_language_id')])){
				$line_option7 = html_entity_decode($section['line_option7'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option7 = false;
			}
			if (isset($section['line_option8'][$this->config->get('config_language_id')])){
				$line_option8 = html_entity_decode($section['line_option8'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$line_option8 = false;
			}
			if (isset($section['icon_color'])){
				$icon_color = $section['icon_color'];
			} else {
				$icon_color = false;
			}
			
			if (isset($section['description'][$this->config->get('config_language_id')])){
				$description = html_entity_decode($section['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			} else {
				$description = false;
			}

			$this->data['sections'][] = array(
				'id'          => 'table-' . $module . '-' . $section_row,
				'title'       => $title,
				'line_price'       => $line_price,
				'line_period'       => $line_period,
				'line_option1'       => $line_option1,
				'line_option2'       => $line_option2,
				'line_option3'       => $line_option3,
				'line_option4'       => $line_option4,
				'line_option5'       => $line_option5,
				'line_option6'       => $line_option6,
				'line_option7'       => $line_option7,
				'line_option8'       => $line_option8,
				'icon_color' => $icon_color,
				'state'       => $section['state'],
				'line_button'       => $section['line_button'],
				'icon'       => $section['icon']
			);
			$this->data['id'] = $section_row++;
			
		}

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pricetables.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pricetables.tpl';
		} else {
			$this->template = 'default/template/module/pricetables.tpl';
		}
		
		$this->render();
	}
}
?>