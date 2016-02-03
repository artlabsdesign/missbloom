<?php  
class ControllerModuleBlog extends Controller {
	
	protected function index() {
		$this->language->load('module/blog');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	$this->data['by'] = $this->language->get('by');
		$this->id = 'blog';
		$this->load->model('module/blog');
		$this->data['posts'] = $this->model_module_blog->getPosts();
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog.tpl';
		} else {
			$this->template = 'default/template/module/blog.tpl';
		}
		$this->render();
  	}
	
}
?>