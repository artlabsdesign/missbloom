<?php  
class ControllerModulecustomblocks extends Controller {
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/customblocks');
		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/theme/ULTIMATUM/stylesheet/customblocks.css');
		
		$this->data['text_more']        = $this->language->get('text_more');
		$this->data['image_width']      = $setting['image_width'];
		$this->data['image_height']     = $setting['image_height'];
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
				'top'        => $section['top'],
				'color'        => $section['color'],
				'item_width'        => $section['item_width'],
				'item_height'        => $section['item_height'],
				'left_right'        => $section['left_right'],
				'title'       => $title,
				'description' => $description,
				'image'       => $this->model_tool_image->resize($section['image'], $setting['image_width'], $setting['image_height'])
			);
			
		}

		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/customblocks.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/customblocks.tpl';
		} else {
			$this->template = 'default/template/module/customblocks.tpl';
		}
		
		$this->render();
	}
}
?>