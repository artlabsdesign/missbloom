<?php 
class ControllerBlogRSS extends Controller {
	public function index() {

		$output  = '<?xml version="1.0" encoding="UTF-8" ?>';
		$output .= '<rss version="2.0" xmlns:g="http://base.google.com/ns/1.0">';
		$output .= '<channel>';
		$output .= '<title>' . $this->config->get('config_name') . '</title>'; 
		$output .= '<description>' . $this->config->get('config_meta_description') . '</description>';
		$output .= '<link>' . HTTP_SERVER . '</link>';
		
		$this->load->model('blog/category');
		
		$this->load->model('blog/post');
		
		$this->load->model('tool/image');
		
		$posts = $this->model_blog_post->getPosts();
		
		foreach ($posts as $post) {
			if ($post['description']) {
				$output .= '<item>';
				$output .= '<title>' . $post['name'] . '</title>';
				$output .= '<link>' . $this->url->link('blog/post', 'post_id=' . $post['post_id']) . '</link>';
				$output .= '<description>' . $post['description'] . '</description>';
				$output .= '<g:condition>new</g:condition>';
				$output .= '<g:id>' . $post['post_id'] . '</g:id>';
				
				if ($post['image']) {
					$output .= '<g:image_link>' . $this->model_tool_image->resize($post['image'], 500, 500) . '</g:image_link>';
				} else {
					$output .= '<g:image_link>' . $this->model_tool_image->resize('no_image.jpg', 500, 500) . '</g:image_link>';
				}
				
				$output .= '</item>';
			}
		}
		
		$output .= '</channel>'; 
		$output .= '</rss>';	
		
		$this->response->addHeader('Content-Type: application/rss+xml');
		$this->response->setOutput($output);
		
	}
	
	protected function getPath($parent_id, $current_path = '') {
		$category_info = $this->model_blog_category->getCategory($parent_id);
	
		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}	
		
			$path = $this->getPath($category_info['parent_id'], $new_path);
					
			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		}
	}		
}
?>