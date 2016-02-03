<?php
class ControllerModuleEasyBlogLatest extends Controller {
	protected function index($setting) {
		$this->language->load('module/easyblog_latest');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->load->model('blog/post');
		
		$this->load->model('tool/image');
		
		$this->data['posts'] = array();
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_blog_post->getPosts($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				$image_small = $this->model_tool_image->resize($result['image'], 60, 60);
			} else {
				$image = $this->model_tool_image->resize('blog_no_image.jpg', $setting['image_width'], $setting['image_height']);
				$image_small = $this->model_tool_image->resize('blog_no_image.jpg', 60, 60);
			}
			
			$this->data['posts'][] = array(
				'post_id' 		    => $result['post_id'],
				'author_name'       => $result['author_name'],
				'thumb'   	 		=> $image,
				'thumb_small'   	 		=> $image_small,
				'name'    	 		=> $result['name'],
				'short_description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 450) . '..',
				'very_short_description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
				'views'    		    => sprintf($this->language->get('text_views'), (int)$result['viewed']),
				'reviews'    		=> sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 		=> $this->url->link('blog/post', 'post_id=' . $result['post_id']),
				'comments_href'    	=> $this->url->link('blog/post', 'post_id=' . $result['post_id'] . '&to_comments=1'),
				'author_href'       => $this->url->link('blog/search', '&filter_author_id=' . $result['author_id']),
				'date_added' => date('<\s\p\a\n>j<\/\s\p\a\n> M <\s\m\a\l\l>Y<\/\s\m\a\l\l>', strtotime($result['date_added']))		
			);
		}
		
		$template_file = 'easyblog_latest_ctb.tpl';
		
		if ($setting['position'] == 'column_right' || $setting['position'] == 'column_left' || $setting['position'] == 'content_footer') {
			$template_file = 'easyblog_latest_clr.tpl';
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