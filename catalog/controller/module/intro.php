<?php  
class ControllerModuleintro extends Controller {
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/intro');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/theme/' . $this->config->get('config_template') . '/js/jquery.superslides.min.js');
		$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/superslides.css');
		
		$this->data['mode']     = $setting['mode'];
		$this->data['videourl']     = $setting['videourl'];
		
		if ($setting['start']){
				$this->data['start'] = $setting['start'];
			} else {
				$this->data['start'] = '0';
			}
			if ($setting['stop']){
				$this->data['stop'] = $setting['stop'];
			} else {
				$this->data['stop'] = false;
			}
			if ($setting['image']){
				$this->data['poster'] = $this->model_tool_image->resize($setting['image'], 1920, 1200);
			} else {
				$this->data['poster'] = 'catalog/view/theme/' . $this->config->get('config_template') . '/image/poster.jpg';
			}
			if ($setting['mute']){
				$this->data['mute'] = $setting['mute'];
			} else {
				$this->data['mute'] = 'true';
			}
		
		$this->data['setting'] = $setting;
		
		$number_sections = count($setting['sections']);
		$this->data['image_width']      = $setting['image_width'];
		$this->data['image_height']     = $setting['image_height'];	
		
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

			$this->data['sections'][] = array(
				'id'          => 'slide-' . $module . '-' . $section_row,
				'title'       => $title,
				'sub_title'       => $sub_title,
				'description' => $description,
				'image'       => $this->model_tool_image->resize($section['image'], $setting['image_width'], $setting['image_height'])
			);
			
		}

		$this->data['module'] = $module++;
		
		$template_file = 'intro_video.tpl';
		
		if ($setting['mode'] == '0') {
			$template_file = 'intro_images.tpl';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $template_file)) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $template_file;
		} else {
			$this->template = 'default/template/module/' . $template_file;
		}
		
		$this->render();
	}
}
?>