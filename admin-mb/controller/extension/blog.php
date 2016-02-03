<?php 
class ControllerExtensionBlog extends Controller { 
	private $error = array();
 
	public function index() {
		$this->load->language('extension/blog');

		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('extension/blog');
		 
		$this->getList();
	}

	public function post() {
		
		$this->load->language('extension/blog');
		
        $this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('extension/blog');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();

			$data['author_id'] = $_SESSION['user_id'];
			
			$this->model_extension_blog->addPost(array_merge($this->request->post, $data));

			$this->session->data['success'] = $this->language->get('text_post_added');
			
			$this->redirect($this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('extension/blog');

		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('extension/blog');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();

			$this->model_extension_blog->editPost($this->request->get['post_id'], array_merge($this->request->post, $data));
			
			$this->session->data['success'] = $this->language->get('text_post_updated');
			
			$this->redirect($this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('extension/blog');

		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('extension/blog');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			$this->model_extension_blog->deleteCategories($this->request->post['selected']);
			
			$this->session->data['success'] = $this->language->get('text_posts_deleted');

			$this->redirect($this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
   		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
									
		$this->data['add'] = $this->url->link('extension/blog/post', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('extension/blog/delete', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['posts'] = array();
		
		$results = $this->model_extension_blog->getPosts();

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('extension/blog/update&post_id=' .$result['post_id'] , 'token=' . $this->session->data['token'], 'SSL'));
					
			$this->data['posts'][] = array(
				'post_id' => $result['post_id'],
				'subject'        => $result['subject'],
				'status'        => ucfirst($result['status']),
				'date_posted'  => $result['date_posted'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['post_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_subject'] = $this->language->get('column_subject');
		$this->data['column_date_posted'] = $this->language->get('column_date_posted');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_add'] = $this->language->get('button_add');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['confirm_delete'] = $this->language->get('confirm_delete');
		$this->data['blog_published'] = $this->language->get('blog_published');
		$this->data['blog_draft'] = $this->language->get('blog_draft');
		$this->data['footblog'] = $this->language->get('footblog');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		$this->template = 'extension/blog_list.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	private function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_subject'] = $this->language->get('entry_subject');
		$this->data['entry_content'] = $this->language->get('entry_content');
		$this->data['blog_published'] = $this->language->get('blog_published');
		$this->data['blog_draft'] = $this->language->get('blog_draft');
		$this->data['footblog'] = $this->language->get('footblog');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['author_name'] = $this->language->get('author_name');
		$this->data['tab_general'] = $this->language->get('tab_general');
		
       $this->data['author'] =$this->model_extension_blog->getAuthor($_SESSION['user_id']);

		$this->data['error_warning'] = '';
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		}
	
		$this->data['error_subject'] = '';
 		if (isset($this->error['subject'])) {
			$this->data['error_subject'] = $this->error['subject'];
		}
	
		$this->data['error_content'] = '';
 		if (isset($this->error['content'])) {
			$this->data['error_content'] = $this->error['content'];
		}

  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['post_id'])) {
			$this->data['status'] = 'published';
			$this->data['action'] = $this->url->link('extension/blog/post', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$thisPost = $this->model_extension_blog->getPost($this->request->get['post_id']);
			$this->data = array_merge($this->data, $thisPost);
			$this->data['action'] = $this->url->link('extension/blog/update&post_id=' . $this->request->get['post_id'], 'token=' . $this->session->data['token'], 'SSL');
		}

		if (isset($this->request->post['subject'])) {
			$this->data['subject'] = $this->request->post['subject'];
		}
 		
		if (isset($this->request->post['content'])) {
			$this->data['content'] = $this->request->post['content'];
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		}
				
		$this->data['cancel'] = $this->url->link('extension/blog', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->template = 'extension/blog_post.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	private function validateForm() {
		
		if (!$this->user->hasPermission('modify', 'extension/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
   
  		if (empty($this->request->post['subject'])) {
			$this->error['subject'] = $this->language->get('error_subject');
		}
  		
		if (empty($this->request->post['content'])) {
			$this->error['content'] = $this->language->get('error_content');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return TRUE; 
		} else {
			return FALSE;
		}
	}
}
?>