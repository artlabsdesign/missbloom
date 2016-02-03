<?php  
class ControllerModuleBlogsearch extends Controller {
	protected function index($setting) {
		$this->language->load('module/blog_search');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		// Search
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog_search.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog_search.tpl';
		} else {
			$this->template = 'default/template/module/blog_search.tpl';
		}
		
		$this->render();
  	}
}
?>