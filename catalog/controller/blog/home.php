<?php  
class ControllerBlogHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('blog_title'));
		$this->document->setDescription($this->config->get('blog_meta_description'));

		$this->data['heading_title'] = $this->config->get('blog_title');
		
		// Search
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/home.tpl';
		} else {
			$this->template = 'default/template/blog/home.tpl';
		}
		
		$this->children = array(
			'blog/column_left',
			'blog/column_right',
			'blog/content_top',
			'blog/content_bottom',
			'blog/footer',
			'blog/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>