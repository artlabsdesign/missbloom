<?php  
class ControllerModulecustomertestimonial extends Controller {

	protected function index($setting) {
		$this->language->load('module/customertestimonial');
		static $module = 0;

		$this->data['customertestimonial_title'] = html_entity_decode($setting['customertestimonial_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

      	$this->data['heading_title'] = $this->language->get('heading_title');
      	$this->data['text_more'] = $this->language->get('text_more');
      	$this->data['text_more2'] = $this->language->get('text_more2');
		$this->data['send_customertestimonial'] = $this->language->get('send_customertestimonial');
		$this->data['send_customertestimonial_lr'] = $this->language->get('send_customertestimonial_lr');
		$this->data['show_all'] = $this->language->get('show_all');
		$this->data['showall_url'] = $this->url->link('product/customertestimonial', '', 'SSL'); 
		$this->data['more'] = $this->url->link('product/customertestimonial', 'customertestimonial_id=' , 'SSL'); 
		$this->data['sendtests'] = $this->url->link('product/sendcustomertestimonial', '', 'SSL');

		$this->load->model('catalog/customertestimonial');
		
		$this->data['customertestimonials'] = array();
		
		$this->data['total'] = $this->model_catalog_customertestimonial->getTotalcustomertestimonials();
		$results = $this->model_catalog_customertestimonial->getcustomertestimonials(0, $setting['customertestimonial_limit'], (isset($setting['customertestimonial_random']))?true:false);

		$this->load->model('tool/image');
		$this->data['setting'] = $setting;

		foreach ($results as $result) {
			
			
			$result['description'] = '<span>"</span> '.trim($result['description']).' <span>"</span>';
			$result['description'] = str_replace('<span>"</span><p>', '<span>"</span> ', $result['description']);
			$result['description'] = str_replace('</p><span>"</span>', ' <span>"</span>', $result['description']);


			if (!isset($setting['customertestimonial_character_limit']))
				$setting['customertestimonial_character_limit'] = 0;

			if ($setting['customertestimonial_character_limit']>0)
			{
				$lim = $setting['customertestimonial_character_limit'];

				if (mb_strlen($result['description'],'UTF-8')>$lim) 
					$result['description'] = mb_substr($result['description'], 0, $lim-3, 'UTF-8'). ' ' .'<a href="'.$this->data['more']. $result['customertestimonial_id'] .'" title="'.$this->data['text_more2'].'">'. $this->data['text_more'] . '</a>' . ' <span>"</span>';

			}


			$result['title'] = $result['title'];

			$result['name'] = $result['name'];


			if ($result['avatar']!="")
			{
				$avatar = $this->model_tool_image->resize($result['avatar'], 70, 70);
			}
			else
			{
				$avatar = "";
			}


			$this->data['customertestimonials'][] = array(
				'id'			=> $result['customertestimonial_id'],											  
				'title'		=> $result['title'],
				'description'	=> $result['description'],
				'rating'		=> $result['rating'],
				'name'		=> $result['name'],
				'date_added'	=> $result['date_added'],
				'avatar'		=> $avatar
			);
		}

		

		$this->id = 'customertestimonial';
		$this->data['module'] = $module++;
		
		$template_file = 'customertestimonial.tpl';
		
		if ($setting['position'] == 'column_right' || $setting['position'] == 'column_left' || $setting['position'] == 'content_footer') {
			$template_file = 'customertestimonial_lr.tpl';
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