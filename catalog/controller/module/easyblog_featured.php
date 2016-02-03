<?php
class ControllerModuleEasyBlogFeatured extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->data['setting'] = $setting;
		$this->language->load('module/easyblog_featured');	
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_read_more'] = $this->language->get('text_read_more');
		$this->data['text_posted_by'] = $this->language->get('text_posted_by');
		
		$this->load->model('blog/post'); 
		
		$this->load->model('tool/image');

		$this->data['posts'] = array();

		$posts = explode(',', $this->config->get('easyblog_featured_post'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$posts = array_slice($posts, 0, (int)$setting['limit']);
		
		foreach ($posts as $post_id) {
			$post_info = $this->model_blog_post->getPost($post_id);
			
			if ($post_info) {
				if ($post_info['image']) {
					$image = $this->model_tool_image->resize($post_info['image'], $setting['image_width'], $setting['image_height']);
					$image_small = $this->model_tool_image->resize($post_info['image'], 50, 50);
				} else {
					$image = $this->model_tool_image->resize('blog_no_image.jpg', $setting['image_width'], $setting['image_height']);
					$image_small = $this->model_tool_image->resize('blog_no_image.jpg', 50, 50);
				}
					
				$this->data['posts'][] = array(
					'post_id' 		    => $post_info['post_id'],
					'author_name'       => $post_info['author_name'],
					'thumb'   	 		=> $image,
					'thumb_small'   	 		=> $image_small,
					'name'    	 		=> $post_info['name'],
					'short_description' => utf8_substr(strip_tags(html_entity_decode($post_info['description'], ENT_QUOTES, 'UTF-8')), 0, 120) . '..',
					'views'    		    => sprintf($this->language->get('text_views'), (int)$post_info['viewed']),
					'reviews'    		=> sprintf($this->language->get('text_reviews'), (int)$post_info['reviews']),
					'href'    	 		=> $this->url->link('blog/post', 'post_id=' . $post_info['post_id']),
					'comments_href'    	=> $this->url->link('blog/post', 'post_id=' . $post_info['post_id'] . '&to_comments=1'),
					'author_href'       => $this->url->link('blog/search', '&filter_author_id=' . $post_info['author_id']),
					'date_added' => date('<\s\p\a\n>j<\/\s\p\a\n> M <\s\m\a\l\l>Y<\/\s\m\a\l\l>', strtotime($post_info['date_added']))		
				);
			}
		}
		
		$this->data['module'] = $module++;

		$template_file = 'easyblog_featured.tpl';
		
		if ($setting['position'] == 'column_right' || $setting['position'] == 'column_left' || $setting['position'] == 'content_footer') {
			$template_file = 'easyblog_featured_clr.tpl';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $template_file)) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $template_file;
		} else {
			$this->template = 'default/template/module/' . $template_file;
		}

		$this->render();
	}
}
?>