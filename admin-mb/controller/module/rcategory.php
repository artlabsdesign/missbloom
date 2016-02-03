<?php
class ControllerModuleRcategory extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/rcategory');
		
		$autor = '<span style="float:right;">by <b>zubovd</b> (<a href="http://opencart-module.com" target="_blank">opencart-module.com</a>)</span>';
		$this->document->setTitle(strip_tags(str_replace($autor,'',$this->language->get('heading_title'))));
		
		//$this->document->addScript('//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js');
		//$this->document->addStyle('//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css');
		$this->document->addScript('view/javascript/jquery/rcategory/toastr/toastr.min.js');
		$this->document->addStyle('view/javascript/jquery/rcategory/toastr/toastr.min.css');
		
		$this->document->addStyle('view/stylesheet/rcategory.css');
		
		$this->load->model('setting/setting');

		$this->createTable();

		$this->load->model('module/rcategory');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('rcategory', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			if(!isset($this->request->post['apply'])) {
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));			
			}
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->request->post['rcategory'])) {
			$this->data['rcategory'] = $this->request->post['rcategory'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['rcategory'] = $this->model_module_rcategory->getRcategories($this->request->get['category_id']);
		} else {
			$this->data['rcategory'] = array();
		}

		$this->load->model('catalog/category');
		$this->data['categories'] = $this->model_catalog_category->getCategories(0);

		$heading_title = strip_tags(str_replace($autor,'',$this->language->get('heading_title')));
		
		$this->data['heading_title'] = $heading_title;

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->data['text_select_category'] = $this->language->get('text_select_category');
		$this->data['text_add_rcategory'] = $this->language->get('text_add_rcategory');
		$this->data['text_remove_rcategory'] = $this->language->get('text_remove_rcategory');
		$this->data['text_update_rcategory_limit'] = $this->language->get('text_update_rcategory_limit');
		$this->data['text_hint'] = $this->language->get('text_hint');
		$this->data['text_move_category'] = $this->language->get('text_move_category');
		$this->data['text_rcategory'] = $this->language->get('text_rcategory');
		$this->data['text_add_category'] = $this->language->get('text_add_category');
		$this->data['text_remove_category'] = $this->language->get('text_remove_category');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_replace_hint'] = $this->language->get('text_replace_hint');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_settings'] = $this->language->get('text_settings');
		$this->data['text_show_link'] = $this->language->get('text_show_link');
		$this->data['text_show_link_title'] = $this->language->get('text_show_link_title');
		$this->data['text_show_link_hint'] = $this->language->get('text_show_link_hint');
		$this->data['text_show_pcount'] = $this->language->get('text_show_pcount');
		$this->data['text_close'] = $this->language->get('text_close');
		$this->data['text_confirm'] = $this->language->get('text_confirm');		
		$this->data['text_default'] = $this->language->get('text_default');		
		$this->data['text_order_by_name_asc'] = $this->language->get('text_order_by_name_asc');
		$this->data['text_order_by_name_desc'] = $this->language->get('text_order_by_name_desc');
		$this->data['text_order_by_model_asc'] = $this->language->get('text_order_by_model_asc');
		$this->data['text_order_by_model_desc'] = $this->language->get('text_order_by_model_desc');
		$this->data['text_order_by_quantity_asc'] = $this->language->get('text_order_by_quantity_asc');
		$this->data['text_order_by_quantity_desc'] = $this->language->get('text_order_by_quantity_desc');
		$this->data['text_order_by_price_asc'] = $this->language->get('text_order_by_price_asc');
		$this->data['text_order_by_price_desc'] = $this->language->get('text_order_by_price_desc');
		$this->data['text_order_by_rating_asc'] = $this->language->get('text_order_by_rating_asc');
		$this->data['text_order_by_rating_desc'] = $this->language->get('text_order_by_rating_desc');
		$this->data['text_order_by_date_added_asc'] = $this->language->get('text_order_by_date_added_asc');
		$this->data['text_order_by_date_added_desc'] = $this->language->get('text_order_by_date_added_desc');
		$this->data['text_order_by_viewed_asc'] = $this->language->get('text_order_by_viewed_asc');
		$this->data['text_order_by_viewed_desc'] = $this->language->get('text_order_by_viewed_desc');
		$this->data['text_order_by_rand'] = $this->language->get('text_order_by_rand');
		$this->data['text_clear_table'] = $this->language->get('text_clear_table');

		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_order_type'] = $this->language->get('entry_order_type');
		$this->data['entry_show_link'] = $this->language->get('entry_show_link');
		$this->data['entry_use_carousel'] = $this->language->get('entry_use_carousel');
		$this->data['entry_tab_color'] = $this->language->get('entry_tab_color');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_action'] = $this->language->get('entry_action');

		//buttons
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_empty'] = $this->language->get('button_empty');

		//errors
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
       		'text'      => $heading_title,
			'href'      => $this->url->link('module/rcategory', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('module/rcategory', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['rcategory_module'])) {
			$this->data['modules'] = $this->request->post['rcategory_module'];
		} elseif ($this->config->get('rcategory_module')) {
			$this->data['modules'] = $this->config->get('rcategory_module');
		}
//echo "<pre>",print_r($this->data['modules']);
		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->template = 'module/rcategory.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->data['token'] = $this->session->data['token'];

		$this->response->setOutput($this->render());
	}

	private function createTable(){
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "category_related` (`category_id` INT(11) NOT NULL, `rcategory_id` INT(11) NOT NULL, `limit` INT(4) NOT NULL, PRIMARY KEY (`category_id`, `rcategory_id`))");
	
		$check_field_limit = $this->db->query("show columns from `" . DB_PREFIX . "category_related` where `field`='limit'");
		if(!$check_field_limit->num_rows){
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "category_related` ADD COLUMN `limit` INT(4) NOT NULL");
		}
	}
	
	public function emptyTable(){
		$this->db->query("DELETE FROM `" . DB_PREFIX . "category_related`");
	}

	public function getRcategories() {
		$this->load->model('module/rcategory');		
		$rcategories = $this->model_module_rcategory->getRcategories($this->request->get['category_id']);
		
		return $this->response->setOutput(json_encode($rcategories));
	}

	public function addRelated() {
		$this->load->model('module/rcategory');
		if( (isset($this->request->post['category_id']) && $this->request->post['category_id']) && (isset($this->request->post['rcategory_id']) && $this->request->post['rcategory_id']) && (isset($this->request->post['rcategory_limit']) && $this->request->post['rcategory_limit']) ) {
			$this->model_module_rcategory->addRelated($this->request->post['category_id'],$this->request->post['rcategory_id'],$this->request->post['rcategory_limit']);
		}
	}

	public function removeRelated() {
		$this->load->model('module/rcategory');
		if( (isset($this->request->post['category_id']) && $this->request->post['category_id']) && (isset($this->request->post['rcategory_id']) && $this->request->post['rcategory_id']) ) {
			$this->model_module_rcategory->removeRelated($this->request->post['category_id'],$this->request->post['rcategory_id']);
		}
	}

	public function updateRcategoryLimit() {
		$this->load->model('module/rcategory');
		if( (isset($this->request->post['category_id']) && $this->request->post['category_id']) && (isset($this->request->post['rcategory_id']) && $this->request->post['rcategory_id']) && (isset($this->request->post['rcategory_limit']) && $this->request->post['rcategory_limit']) ) {
			$this->model_module_rcategory->updateRcategoryLimit($this->request->post['category_id'],$this->request->post['rcategory_id'],$this->request->post['rcategory_limit']);
		}
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/rcategory')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>
