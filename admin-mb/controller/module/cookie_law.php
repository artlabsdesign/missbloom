<?php
class ControllerModuleCookieLaw extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/cookie_law');

		$this->document->setTitle($this->language->get('doc_title'));
		
		$this->load->model('setting/setting');
		$this->document->addStyle('view/stylesheet/css/ULTIMATUMControl2.css');
		$this->document->addStyle('view/stylesheet/css/font-awesome.min.css');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			if( $this->hasPermission() ) {
				$this->model_setting_setting->editSetting('cookie_law', $this->request->post);		

				$this->session->data['success'] = $this->language->get('text_success');
			} else {
				$this->session->data['warning'] = $this->language->get('error_permission');
			}
						
			$this->redirect($this->url->link('module/cookie_law', 'token=' . $this->session->data['token'], 'SSL'));
		}

		// Language
		$this->data = array_merge($this->data, $this->language->load('module/cookie_law'));

		// Warning
 		if( isset( $this->session->data['warning'] ) ) {
			$this->data['error_warning'] = $this->session->data['warning'];
			unset($this->session->data['warning']);
		} else {
			$this->data['error_warning'] = '';
		}

		// Success
 		if( isset( $this->session->data['success'] ) ) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		// Settings
		$this->data['settings'] = $this->config->get('cookie_law');

		// Breadcrumbs
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
			'href'      => $this->url->link('module/cookie_law', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		// Languages
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		// Actions
		$this->data['action']	= $this->url->link('module/cookie_law', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel']	= $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token']	= $this->session->data['token'];
				
		$this->template = 'module/cookie_law.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function install() {
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		
		$languages	= $this->model_localisation_language->getLanguages();
		$settings	= array(
			'cookie_law'	=> array(
				'position'		=> 'top',
				'margin_left'	=> '0',
				'margin_bottom'	=> '0',
				'border_radius'	=> '0',
				'transparency'	=> '0.7',
				'padding_top'	=> '15',
				'padding_bottom'=> '10',
				'padding_left'	=> '10',
				'padding_right'	=> '10'
			)
		);
		
		foreach( $languages as $lang ) {
			$settings['cookie_law']['text'][$lang['code']] = '<center><h3>European Cookie Policy</h3>This site uses cookies to improve your user experience and store<br />&nbsp;information on your computer.<br /><br />Happy to accept?</center>';
			$settings['cookie_law']['text_yes'][$lang['code']] = 'Yes, I accept';
			$settings['cookie_law']['text_no'][$lang['code']] = 'No thanks, take me to Google';
		}
			
		$this->model_setting_setting->editSetting('cookie_law', $settings);
		
		$this->redirect($this->url->link('module/cookie_law', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	public function uninstall() {
		if( $this->hasPermission() ) {
			$this->load->model('setting/setting');

			$this->model_setting_setting->deleteSetting('cookie_law');
		}
	}
	
	protected function hasPermission() {
		if( ! $this->user->hasPermission('modify', 'module/cookie_law') ) {
			return false;
		}
		
		return true;
	}
}
?>