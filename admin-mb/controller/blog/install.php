<?php
class ControllerBlogInstall extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('blog/install'); 

		$this->load->model('blog/install');
		
		$this->document->setTitle($this->language->get('doc_title'));
		
		$this->document->addStyle('view/stylesheet/easyblog_stylesheet.css');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_blog_install->createBlogLayout();
			$this->model_blog_install->createBlogTables();
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
	    $this->data['button_install_now'] = $this->language->get('button_install_now');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('blog/install', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['action'] = $this->url->link('blog/install', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['tables_sql'] = $this->model_blog_install->createBlogTables(true);
		
		$this->data['token'] = $this->session->data['token'];
		$this->document->addStyle('view/stylesheet/css/ULTIMATUMControl2.css');
		$this->document->addStyle('view/stylesheet/css/font-awesome.min.css');
		$this->template = 'blog/install.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'blog/install')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>