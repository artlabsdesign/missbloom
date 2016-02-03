<?php  
class ControllerModuleBlogCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/blog_category');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['bpath'])) {
			$parts = explode('_', (string)$this->request->get['bpath']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['blog_category_id'] = $parts[0];
		} else {
			$this->data['blog_category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
							
		$this->load->model('blog/category');

		$this->load->model('catalog/product');

		$this->data['blog_categories'] = array();

		$blog_categories = $this->model_blog_category->getCategories(0);

		foreach ($blog_categories as $blog_category) {

			$children_data = array();

			$children = $this->model_blog_category->getCategories($blog_category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'],
					'href'        => $this->url->link('blog/category', 'bpath=' . $blog_category['category_id'] . '_' . $child['category_id'])	
				);		
			}

			$this->data['blog_categories'][] = array(
				'blog_category_id' => $blog_category['category_id'],
				'name'        => $blog_category['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('blog/category', 'bpath=' . $blog_category['category_id'])
			);	
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog_category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog_category.tpl';
		} else {
			$this->template = 'default/template/module/blog_category.tpl';
		}
		
		$this->render();
  	}
}
?>