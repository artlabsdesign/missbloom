<?php  
class ControllerModuleDsfirewall extends Controller {
	protected function index($setting) {
		if (file_exists('catalog/view/ds.extension/dsfirewall/js/dsfirewalllib.js')) {
		$this->document->addScript('catalog/view/ds.extension/dsfirewall/js/dsfirewalllib.js');
		} 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/dsfirewall.tpl')) {
		$this->template = $this->config->get('config_template') . '/template/module/dsfirewall.tpl';
		} else {
			$this->template = 'default/template/module/dsfirewall.tpl';
		}
		
		$this->render();
	}
	
}



?>