<?php  
class ControllerModuleULTIMATUMCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/ULTIMATUM_category');
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['base'] = $server;
		$this->data['special'] = $this->url->link('product/special');
		$this->data['brand'] = $this->url->link('product/manufacturer');
		$this->load->model('catalog/manufacturer');	
		
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array( 
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);	
				
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {	
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id']),					
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUM_category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUM_category.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUM_category.tpl';
		}
		
		$this->render();
  	}
}
?>