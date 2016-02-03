<?php
class ControllerModuleEasyBlogFeatured extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/easyblog_featured');

		$this->document->setTitle($this->language->get('doc_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('easyblog_featured', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->document->addStyle('view/stylesheet/css/ULTIMATUMControl.css');
		$this->document->addStyle('view/stylesheet/css/font-awesome.min.css');
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_post'] = $this->language->get('entry_post');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
				
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/easyblog_featured', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/easyblog_featured', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->post['easyblog_featured_post'])) {
			$this->data['easyblog_featured_post'] = $this->request->post['easyblog_featured_post'];
		} else {
			$this->data['easyblog_featured_post'] = $this->config->get('easyblog_featured_post');
		}	
				
		$this->load->model('blog/post');
				
		if (isset($this->request->post['easyblog_featured_post'])) {
			$posts = explode(',', $this->request->post['easyblog_featured_post']);
		} else {		
			$posts = explode(',', $this->config->get('easyblog_featured_post'));
		}
		
		$this->data['posts'] = array();
		
		foreach ($posts as $post_id) {
			$post_info = $this->model_blog_post->getPost($post_id);
			
			if ($post_info) {
				$this->data['posts'][] = array(
					'post_id'    => $post_info['post_id'],
					'name'       => $post_info['name']
				);
			}
		}	
			
		$this->data['modules'] = array();
		
		if (isset($this->request->post['easyblog_featured_module'])) {
			$this->data['modules'] = $this->request->post['easyblog_featured_module'];
		} elseif ($this->config->get('easyblog_featured_module')) { 
			$this->data['modules'] = $this->config->get('easyblog_featured_module');
		}		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/easyblog_featured.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/easyblog_featured')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['easyblog_featured_module'])) {
			foreach ($this->request->post['easyblog_featured_module'] as $key => $value) {
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$key] = $this->language->get('error_image');
				}
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>