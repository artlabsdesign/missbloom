<?php  
class ControllerBlogPost extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->language->load('blog/post');
	
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('blog/home'),			
			'separator' => false
		);
		
		$this->load->model('blog/category');	
		
		if (isset($this->request->get['path'])) {
			$path = '';
				
			foreach (explode('_', $this->request->get['path']) as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
				
				$category_info = $this->model_blog_category->getCategory($path_id);
				
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('blog/category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
		}
		
		$this->load->model('blog/author');	
		
		if (isset($this->request->get['author_id'])) {
			$this->data['breadcrumbs'][] = array( 
				'text'      => $this->language->get('text_author'),
				'href'      => $this->url->link('blog/author'),
				'separator' => $this->language->get('text_separator')
			);	
				
			$author_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($author_info) {	
				$this->data['breadcrumbs'][] = array(
					'text'	    => $author_info['name'],
					'href'	    => $this->url->link('blog/search', 'author_id=' . $this->request->get['author_id']),					
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_tag'])) {
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
						
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
						
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}
			
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}	
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('blog/search', $url),
				'separator' => $this->language->get('text_separator')
			); 	
		}
		
		if (isset($this->request->get['post_id'])) {
			$post_id = (int)$this->request->get['post_id'];
		} else {
			$post_id = 0;
		}
		
		$this->load->model('blog/post');
		
		$post_info = $this->model_blog_post->getPost($post_id);
		
		if ($post_info) {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['author_id'])) {
				$url .= '&author_id=' . $this->request->get['author_id'];
			}			

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
						
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
			
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}	
						
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
												
			$this->data['breadcrumbs'][] = array(
				'text'      => $post_info['name'],
				'href'      => $this->url->link('blog/post', $url . '&post_id=' . $this->request->get['post_id']),
				'separator' => $this->language->get('text_separator')
			);			
			
			if (isset($post_info['seo_title'])) {
			$this->document->setTitle($post_info['seo_title']);
			} else {
			$this->document->setTitle($post_info['name']);	
			}

			$this->document->setDescription($post_info['meta_description']);
			$this->document->setKeywords($post_info['meta_keyword']);
			$this->document->addLink($this->url->link('blog/post', 'post_id=' . $this->request->get['post_id']), 'canonical');
			
			$this->data['heading_title'] = $post_info['name'];
			
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_author'] = $this->language->get('text_author');
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			$this->data['text_tweet'] = $this->language->get('text_tweet');
			$this->data['text_next_post'] = $this->language->get('text_next_post');
			$this->data['text_prev_post'] = $this->language->get('text_prev_post');
			
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['button_send_comment'] = $this->language->get('button_send_comment');
			
			$this->load->model('blog/review');

			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_comment'] = sprintf($this->language->get('tab_comment'), $this->model_blog_review->getTotalReviewsByPostId($this->request->get['post_id']));
			$this->data['tab_related'] = $this->language->get('tab_related');
			$this->data['tab_photo_gallery'] = $this->language->get('tab_photo_gallery');
			
			$this->data['post_id'] = $this->request->get['post_id'];
			$this->data['author_id'] = $post_info['author_id'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'author_id=' . $post_info['author_id']);
						
			$this->load->model('tool/image');

			if ($post_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($post_info['image'], $this->config->get('blog_image_popup_width'), $this->config->get('blog_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}
			
			if ($post_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($post_info['image'], $this->config->get('blog_image_thumb_width'), $this->config->get('blog_image_thumb_height'));
			} else {
				$this->data['thumb'] = '';
			}
			
			$this->data['images'] = array();
			
			$results = $this->model_blog_post->getPostImages($this->request->get['post_id']);
			
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('blog_image_popup_width'), $this->config->get('blog_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('blog_image_additional_width'), $this->config->get('blog_image_additional_height'))
				);
			}	
						
			$this->data['comment_status'] = $this->config->get('blog_comment_status');
			$this->data['comments'] = sprintf($this->language->get('text_comments'), (int)$post_info['reviews']);
			$this->data['rating'] = (int)$post_info['rating'];
			$this->data['description'] = html_entity_decode($post_info['description'], ENT_QUOTES, 'UTF-8');
	
			$this->data['posts'] = array();
			
			$results = $this->model_blog_post->getPostRelated($this->request->get['post_id']);
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('blog_image_related_width'), $this->config->get('blog_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('blog_no_image.jpg', $this->config->get('blog_image_related_width'), $this->config->get('blog_image_related_height'));
				}
				
				
				if ($this->config->get('blog_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
							
				$this->data['posts'][] = array(
					'post_id' 			=> $result['post_id'],
					'thumb'   	 		=> $image,
					'name'    	 		=> $result['name'],
					'short_description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 80) . '..',
					'rating'     		=> $rating,
					'reviews'    		=> sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 		=> $this->url->link('blog/post', 'post_id=' . $result['post_id']),
				);
			}	
			
			$this->data['tags'] = array();
					
			$tags = explode(',', $post_info['tag']);
			
			foreach ($tags as $tag) {
				$this->data['tags'][] = array(
					'tag'  => trim($tag),
					'href' => $this->url->link('blog/search', 'filter_tag=' . trim($tag))
				);
			}
			
			if (isset($this->request->get['to_comments'])){
				$this->data['to_comments'] = true;
			} else {
				$this->data['to_comments'] = false;
			}
			
			$this->data['prev_post'] = array();
			
			$prev_post_id = $this->model_blog_post->getPrevPostId($this->request->get['post_id']);
			
			if ($prev_post_id) {
				$prev_post_info = $this->model_blog_post->getPost($prev_post_id);
				
				if ($prev_post_info){
					$this->data['prev_post'] = array (
						'post_id' => $prev_post_info['post_id'],
						'name'    => $prev_post_info['name'],
						'prev_thumb'   	 		=> $this->model_tool_image->resize($prev_post_info['image'], 50, 50),
						'href'    => $this->url->link('blog/post', 'post_id=' . $prev_post_info['post_id'])
					);
				}
			}
			
			$this->data['next_post'] = array();
			
			$next_post_id = $this->model_blog_post->getNextPostId($this->request->get['post_id']);
			
			if ($next_post_id) {
				$next_post_info = $this->model_blog_post->getPost($next_post_id);
				
				if ($next_post_info){
					$this->data['next_post'] = array (
						'post_id' => $next_post_info['post_id'],
						'name'    => $next_post_info['name'],
						'next_thumb'   	 		=> $this->model_tool_image->resize($next_post_info['image'], 50, 50),
						'href'    => $this->url->link('blog/post', 'post_id=' . $next_post_info['post_id'])
					);
				}
			}
			
			$this->model_blog_post->updateViewed($this->request->get['post_id']);
			
			$post_info = $this->model_blog_post->getPost($this->request->get['post_id']);
			$categories = $this->model_blog_category->getCategoriesByPostId($this->request->get['post_id']);
			
			$posted_in = array();
			
			if ($categories){
				foreach($categories as $category){
					$posted_in[] = sprintf($this->language->get('text_posted_categories'), $category['href'], $category['name']);
				}				
			}
			
			$this->data['posted_in_categories'] = implode(",", $posted_in);
			$href_author_posts = $this->url->link('blog/search', 'filter_author_id=' . $post_info['author_id'], 'SSL');
			$this->data['text_by_author'] = sprintf($this->language->get('text_by_author'), $href_author_posts, $post_info['author_name']);
			$this->data['text_posted_in']= $this->language->get('text_posted_in');
			if ($post_info['reviews'] > 0){
			$this->data['text_comments'] = sprintf($this->language->get('text_comments'), $post_info['reviews']);
			} else {
			$this->data['text_comments']= $this->language->get('text_no_comments');	
			}
			
			$this->data['text_views']    = sprintf($this->language->get('text_views'), $post_info['viewed']);
			
			// Search
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/post.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/blog/post.tpl';
			} else {
				$this->template = 'default/template/blog/post.tpl';
			}
			
			
			
			$this->children = array(
				'blog/column_left',
				'blog/column_right',
				'blog/content_top',
				'blog/content_bottom',
				'blog/footer',
				'blog/header'
			);
						
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['author_id'])) {
				$url .= '&author_id=' . $this->request->get['author_id'];
			}			

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}	
					
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
							
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}
					
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
								
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('blog/post', $url . '&post_id=' . $post_id),
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('blog/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/blog/not_found.tpl';
			} else {
				$this->template = 'default/template/blog/not_found.tpl';
			}
			
			$this->children = array(
				'blog/column_left',
				'blog/column_right',
				'blog/content_top',
				'blog/content_bottom',
				'blog/footer',
				'blog/header'
			);
						
			$this->response->setOutput($this->render());
    	}
  	}
	
	public function review() {
    	$this->language->load('blog/post');
		
		$this->load->model('blog/review');

		$this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['reviews'] = array();
		
		$review_total = $this->model_blog_review->getTotalReviewsByPostId($this->request->get['post_id']);
			
		$results = $this->model_blog_review->getReviewsByPostId($this->request->get['post_id'], ($page - 1) * 5, 5);
      		
		foreach ($results as $result) {
        	$this->data['reviews'][] = array(
        		'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
        		'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
        		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        	);
      	}			
			
		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('blog/post/review', 'post_id=' . $this->request->get['post_id'] . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/review.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/review.tpl';
		} else {
			$this->template = 'default/template/blog/review.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
	
	public function write() {
		$this->language->load('blog/post');
		
		$this->load->model('blog/review');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}
	
			if (empty($this->request->post['rating'])) {
				$json['error'] = $this->language->get('error_rating');
			}
	
			if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
				$json['error'] = $this->language->get('error_captcha');
			}
				
			if (!isset($json['error'])) {
				$this->model_blog_review->addReview($this->request->get['post_id'], $this->request->post);
				
				if ($this->config->get('blog_comment_require_approve')) {
					$json['success'] = $this->language->get('text_success_approve_required');
				} else {
					$json['success'] = $this->language->get('text_success_no_approve_required');
				}
				
				$json['require_approve'] = $this->config->get('blog_comment_require_approve');
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
	
	public function upload() {
		$this->language->load('blog/post');
		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}	  	
			
			$allowed = array();
			
			$filetypes = explode(',', $this->config->get('blog_upload_allowed'));
			
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
       		}	
						
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!$json) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$file = basename($filename) . '.' . md5(mt_rand());
				
				// Hide the uploaded file name so people can not link to it directly.
				$json['file'] = $this->encryption->encrypt($file);
				
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
			}
						
			$json['success'] = $this->language->get('text_upload');
		}	
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>