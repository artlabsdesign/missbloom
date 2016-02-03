<?php

class Modelcataloggls extends Model {
	
	public function loadData($setting, $module_id) {
		
		$res=$this->db->query("SELECT * FROM " . DB_PREFIX . "gls WHERE module_id='" . $module_id . "' && type=1");
		$arr_modules=$res->rows;
		$res=$this->db->query("SELECT * FROM " . DB_PREFIX . "gls WHERE module_id='" . $module_id . "' && type=2");
		$arr_slides=$res->rows;
		$res=$this->db->query("SELECT * FROM " . DB_PREFIX . "gls WHERE module_id='" . $module_id . "' && type=3");
		$arr_layers=$res->rows;
		foreach($arr_modules as $module) {
			$module_data=unserialize(html_entity_decode($module['data'], ENT_COMPAT, "UTF-8"));
			foreach ($module_data as $module_key => $module_val) $setting[$module_key]=$module_val;
			$setting['slides']=array();
		}
		foreach($arr_slides as $slide) {
			$slide_data=unserialize(html_entity_decode($slide['data'], ENT_COMPAT, "UTF-8"));
			foreach ($slide_data as $slide_key => $slide_val) $setting['slides'][$slide['slide_id']][$slide_key]=$slide_val;
			$setting['slides'][$slide['slide_id']]['layers']=array();
		}
		foreach($arr_layers as $layer) {
			$layer_data=unserialize(html_entity_decode($layer['data'], ENT_COMPAT, "UTF-8"));
			foreach ($layer_data as $layer_key => $layer_val) $setting['slides'][$layer['slide_id']]['layers'][$layer['layer_id']][$layer_key]=$layer_val;
		}
		return $setting;
	}
	
}

?>