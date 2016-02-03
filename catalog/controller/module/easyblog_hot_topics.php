<?php  
class ControllerModuleEasyBlogHotTopics extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->language->load('module/easyblog_hot_topics');
		$this->data['setting'] = $setting;
		$this->load->model('blog/post');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['tab_recent']    = $this->language->get('tab_recent');
		$this->data['tab_viewed']    = $this->language->get('tab_viewed');
		$this->data['tab_discussed'] = $this->language->get('tab_discussed');
		
		$this->data['recent_posts'] = array();
		
		if ($setting['limit'] == 0){
			$limit = 10;
		} else {
			$limit = $setting['limit'];
		}
		
		$results = $this->model_blog_post->getLatestPosts($limit);
		$this->load->model('tool/image');
		if ($results){
			foreach($results as $result) {
				$this->data['recent_posts'][] = array(
					'post_id' => $result['post_id'],
					'name'    => $result['name'],
					'pic'    =>  $this->model_tool_image->resize($result['image'], 50, 50),
					'href'    => $this->url->link('blog/post', 'post_id=' . $result['post_id'], 'SSL')
				);
			}
		}
		
		$this->data['most_viewed'] = array();
		
		$results = $this->model_blog_post->getPopularPosts($limit);
		$this->load->model('tool/image');
		if ($results){
			foreach($results as $result) {
				$this->data['most_viewed'][] = array(
					'post_id' => $result['post_id'],
					'name'    => $result['name'],
					'pic'    =>  $this->model_tool_image->resize($result['image'], 50, 50),
					'href'    => $this->url->link('blog/post', 'post_id=' . $result['post_id'], 'SSL'),
					'viewed'  => sprintf($this->language->get('text_viewed_times'), $result['viewed'])
				);
			}
		}
		
		$this->data['most_discussed'] = array();
		
		$results = $this->model_blog_post->getMostCommentedPosts($limit);
		$this->load->model('tool/image');
		if ($results){
			foreach($results as $result) {
				$this->data['most_discussed'][] = array(
					'post_id' => $result['post_id'],
					'name'    => $result['name'],
					'pic'    =>  $this->model_tool_image->resize($result['image'], 50, 50),
					'href'    => $this->url->link('blog/post', 'post_id=' . $result['post_id'], 'SSL'),
					'reviews' => sprintf($this->language->get('text_discussed_times'), $result['reviews'])
				);
			}
		}
		$this->data['module'] = $module++;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/easyblog_hot_topics.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/easyblog_hot_topics.tpl';
		} else {
			$this->template = 'default/template/module/easyblog_hot_topics.tpl';
		}
		
		$this->render();
	}
}
?>