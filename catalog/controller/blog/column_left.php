<?php  
class ControllerBlogColumnLeft extends Controller {
	public function index() {
		$this->load->model('design/layout');
		$this->load->model('blog/category');
		$this->load->model('blog/post');
		
		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'blog/home';
		}
		
		$layout_id = 0;
		
		if ($route == 'blog/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);
				
			$layout_id = $this->model_blog_category->getCategoryLayoutId(end($path));			
		}
		
		if ($route == 'blog/post' && isset($this->request->get['post_id'])) {
			$layout_id = $this->model_blog_post->getPostLayoutId($this->request->get['post_id']);
		}
		
		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}
						
		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$module_data = array();
		
		$this->load->model('setting/extension');
		
		$extensions = $this->model_setting_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
		
			if ($modules) {
				foreach ($modules as $module) {
					if ($module['layout_id'] == $layout_id && $module['position'] == 'column_left' && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);				
					}
				}
			}
		}
		
		$sort_order = array(); 
	  
		foreach ($module_data as $key => $value) {
      		$sort_order[$key] = $value['sort_order'];
    	}
		
		array_multisort($sort_order, SORT_ASC, $module_data);
		
		$this->data['modules'] = array();
		
		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);
			
			if ($module) {
				$this->data['modules'][] = $module;
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/column_left.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/column_left.tpl';
		} else {
			$this->template = 'default/template/common/column_left.tpl';
		}
								
		$this->render();
	}
}
?>