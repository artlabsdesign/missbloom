<?php
class ControllerModuleDsfirewall extends Controller {
	private $error = array(); 
	 
	public function index() { 
	
	$this->language->load('module/dsfirewall');
	
	$this->document->setTitle(strip_tags($this->language->get('heading_title')) );
	
	$this->load->model('setting/setting');
	

		$version 	= '<span class="v" style="float: right;font-weight: bold;color: grey;">v 1.1</span>';
		$avtor 		= 'Romeo WebDS';
		$urlds 		= 'http://webds.net';
		$this->data['lds'] = '<img class="lds" src="view/image/dsfirewall64.png"  alt="WebDS" />';		


		if (file_exists('view/ds.extension/dsfirewall/css/dsfirewall.css')) {
		$this->document->addStyle('view/ds.extension/dsfirewall/css/dsfirewall.css');
		} 
		/*bootstrap 3*/
		if (file_exists('view/ds.extension/dsfirewall/js/jquery.min.js')) {
		$this->document->addScript('view/ds.extension/dsfirewall/js/jquery.min.js');
		} 
		if (file_exists('view/ds.extension/dsfirewall/js/bootstrap3.1.1.min.js')) {
		$this->document->addScript('view/ds.extension/dsfirewall/js/bootstrap3.1.1.min.js');
		} 
		if (file_exists('view/ds.extension/dsfirewall/css/bootstrap3.1.1.min.css')) {
		$this->document->addStyle('view/ds.extension/dsfirewall/css/bootstrap3.1.1.min.css');
		} 
		if (file_exists('view/ds.extension/dsfirewall/css/bootstrap-theme.min.css')) {
		$this->document->addStyle('view/ds.extension/dsfirewall/css/bootstrap-theme.min.css');
		} 
		

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$action = $this->request->post['dsfirewall_module'][1]['action'];	
			unset( $this->request->post['dsfirewall_module'][1]['action'] );
			//var_dump($this->request->post);
			
			$this->model_setting_setting->editSetting('dsfirewall', $this->request->post);	
			$this->session->data['success'] = $this->language->get('text_success');
			
			if( $action == 'saveedit' ){
				$this->redirect($this->url->link('module/dsfirewall', 'token=' . $this->session->data['token'], 'SSL'));
			}else {		
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
			
	
		}
		
		$this->data['version'] = $version;
		$this->data['avtor'] = $avtor;
		$this->data['urlds'] = $urlds;
		$this->data['heading_title'] = $this->language->get('heading_title');

		
/*
Языковые переменные: Статистика
*/
		$ds_firewall_statistic = array(
				'ds_button_cancel',
				'ds_button_save',
		        'ds_firewall_statistic_00',
				'ds_firewall_statistic_0',
				'ds_firewall_statistic_1',
				'ds_firewall_statistic_2',
				'ds_firewall_statistic_3',
				'ds_firewall_statistic_4',
				'ds_firewall_statistic_5',
				'ds_firewall_statistic_6',
				'ds_firewall_statistic_7',
				'ds_firewall_statistic_8',
				'ds_firewall_statistic_9',
				'ds_firewall_statistic_10',
				'ds_firewall_statistic_11',
				'ds_firewall_statistic_12',
				'ds_firewall_statistic_13',
				'ds_firewall_statistic_14',
				'ds_firewall_statistic_15',
				'ds_firewall_statistic_16',
				'ds_firewall_statistic_17',
				'ds_firewall_statistic_18',
				'dsfirewall_cookies',
				'dsfirewall_bots',
				'dsfirewall_xss',
				'dsfirewall_dos',
				'dsfirewall_sql',
				'dsfirewall_worm',
				'dsfirewall_get',
				'dsfirewall_post',
				'dsfirewall_server',
				'dsfirewall_protectionurl',
				'dsfirewall_uploadfilemax',
				'dsfirewall_uploadfile',
				'dsfirewall_uploadfilesys'
				
		);
		
/*
//Языковые переменные: Защита Firewall DS
*/
		$ds_firewall_securityds = array(
				'ds_firewall_securityds_0',
				'ds_firewall_securityds_1',
				'ds_firewall_securityds_2',
				'ds_firewall_securityds_3',
				'ds_firewall_securityds_4',
				'ds_firewall_securityds_5',
				'ds_firewall_securityds_6',
				'ds_firewall_securityds_7',
				'ds_firewall_securityds_8',
				'ds_firewall_securityds_9'
				
		);
/*
//Языковые переменные: Фильтр загрузки файлов
*/
		$ds_firewall_fileupload = array(
				'ds_firewall_fileupload_0',
				'ds_firewall_fileupload_1',
				'ds_firewall_fileupload_2',
				'ds_firewall_fileupload_3',
				'ds_firewall_fileupload_4',
				'ds_firewall_fileupload_5',
				'ds_firewall_fileupload_6',
				'ds_firewall_fileupload_7',
				'ds_firewall_fileupload_8'
		);
/*
//Языковые переменные: Фильтр запросов
*/
		$ds_firewall_freques = array(
				'ds_firewall_frequest_0',
				'ds_firewall_frequest_1',
				'ds_firewall_frequest_2',
				'ds_firewall_frequest_3',
				'ds_firewall_frequest_4',
				'ds_firewall_frequest_5',
				'ds_firewall_frequest_6',
				'ds_firewall_frequest_7'
		);

/*
//Языковые переменные: Фильтр IP
*/
		$ds_firewall_fip = array(
				'ds_firewall_fip_0'
		);
/*
//Языковые переменные: Менеджер условий 
*/
		$ds_firewall_mcondition = array(
				'ds_firewall_mcondition_0'
		);
/*
//Языковые переменные: Настройки
*/
		$ds_firewall_settings= array(
				'ds_firewall_settings_0',
				'ds_firewall_settings_1',
				'ds_firewall_settings_2',
				'ds_firewall_settings_3',
				'ds_firewall_settings_4',
				'ds_firewall_settings_5',
				'ds_firewall_settings_6',
				'ds_firewall_settings_7',
				'ds_firewall_settings_8',
				'ds_firewall_settings_9',
				'ds_firewall_settings_10',
				'ds_firewall_settings_11',
				'ds_firewall_settings_12',
				'ds_firewall_settings_13',
				'ds_firewall_settings_14',
				'ds_firewall_settings_15',
				'ds_firewall_settings_16',
				'ds_firewall_settings_17',
				'ds_firewall_settings_18',
				'ds_firewall_settings_191',
				'ds_firewall_settings_192',
				'ds_firewall_settings_20',
				'ds_firewall_settings_30'
		);
		
		
		foreach ($ds_firewall_statistic as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_securityds as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_fileupload as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_freques as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_fip as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_mcondition as $text) {
			$this->data[$text] = $this->language->get($text);
		};
		foreach ($ds_firewall_settings as $text) {
			$this->data[$text] = $this->language->get($text);
		};

		
		
		
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

		//$this->load->model('setting/store');
		/*
		$action = array();
		$action[] = array(
			'text' => $this->language->get('text_edit'),
			'href' => $this->url->link('setting/setting', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$store_default = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default'),
			'url'      => HTTP_CATALOG,
		);
		*/
		//$stores = $this->model_setting_store->getStores();
		//array_unshift($stores, $store_default);
		/*
		foreach ($stores as &$store) {
			$url = '';
			if ($store['store_id'] > 0 ) {
				$url = '&store_id='.$store['store_id'];
			}
			$store['option'] = $this->url->link('module/dsfirewall', $url.'&token=' . $this->session->data['token'], 'SSL');
		}
		*/
		//$this->data['stores'] = $stores;
		//$store_id = isset($this->request->get['store_id'])?$this->request->get['store_id']:0;
		//$this->data['store_id'] = $store_id;

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
			'href'      => $this->url->link('module/dsfirewall', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
	
		$this->data['action'] = $this->url->link('module/dsfirewall', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];

		$this->data['modules'] = array();
		
		//$this->data['positions'] = array( 'content_bottom');
	
		/*получение или с ПОСТ данных, или с базы*/
		/*
		if (isset($this->request->post['dsfirewall_module'])) {
			$this->data['modules'] = $this->request->post['dsfirewall_module'];
		} else {
			//$setting = $this->model_setting_setting->getSetting("dsfirewall", $store_id);
			$this->data['modules'] =  = $this->model_setting_setting->getSetting("dsfirewall");
			//$this->data['modules'] = isset($setting['dsfirewall_module'])?$setting['dsfirewall_module']:array();
		}
		*/
		if (isset($this->request->post['dsfirewall_module'])) {
			$this->data['modules'] = $this->request->post['dsfirewall_module'];
		} elseif ($this->config->get('dsfirewall_module')) { 
			$this->data['modules'] = $this->config->get('dsfirewall_module');
		}
		
		
		
		/*FOR old version*/
		/*
		if (!count($this->data['modules'])){
			if ($this->config->get('dsfirewall_module_id')) { 
			$this->data['modules'] = $this->config->get('dsfirewall_module');
			}	
		}
		*/
		
		 
		
		/*получение данных о статистике*/
	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->template = 'module/dsfirewall.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		
		
		
		/* получение статистики
		dsfirewall
		**************************/
	   $this->load->model('module/dsfirewall');
	   
	   /* 1. получение статистики */
	   $this->data['data_stat'] = $this->model_module_dsfirewall->getLastStat();

	   $this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/dsfirewall')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	

	
	
			
	public function install() {
       $this->load->model('module/dsfirewall');
	   $this->model_module_dsfirewall->createTable();
	   
	   
	   
	   //$class_methods = get_class_methods(new ModelModuleDsfirewall());
	   /*
	   $class_methods = get_class_methods($this->model_module_dsfirewall);
	   
foreach ($class_methods as $method_name) {
    echo "$method_name\n  <br/>";
}
*/
       //$this->model_module_ds_firewall->install();
	 //  var_dump (get_class_vars('ModelModuleDsFirewall'));
	//    var_dump(ModelModuleDsFirewall::ttds());
       // var_dump($this->load->model('setting/setting'));
	   /*
       $this->model_setting_setting->editSetting('dsfirewall', 
	   array(
	   'security_name'=>array('dsfirewall_cookies','dsfirewall_bots','dsfirewall_xss','dsfirewall_dos','dsfirewall_sql','dsfirewall_worm','dsfirewall_get','dsfirewall_post','dsfirewall_server','dsfirewall_protectionurl'),
	   'security_name'=>array('dsfirewall_cookies','dsfirewall_bots','dsfirewall_xss','dsfirewall_dos','dsfirewall_sql','dsfirewall_worm'),
	   )
	  
	   );
	    */
	   
   }
	public function uninstall() {
        $this->load->model('module/dsfirewall');
		$this->model_module_dsfirewall->deleteTable();
		//$this->load->model('setting/setting');
		//$this->model_setting_setting->editSetting('dsfirewall', array('dsfirewall_status'=>0));
	}
}
?>
