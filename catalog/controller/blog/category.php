<?php 
class ControllerBlogCategory extends Controller {  
	public function index() { 
		$this->language->load('blog/category');
		
		$this->load->model('blog/category');
		
		$this->load->model('blog/post');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('blog_limit');
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('blog/home'),
       		'separator' => false
   		);	
			
		if (isset($this->request->get['bpath'])) {
			$path = '';
		
			$parts = explode('_', (string)$this->request->get['bpath']);
		
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}
									
				$category_info = $this->model_blog_category->getCategory($path_id);
				
				if ($category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $category_info['name'],
						'href'      => $this->url->link('blog/category', 'bpath=' . $path),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}		
		
			$category_id = (int)array_pop($parts);
		} else {
			$category_id = 0;
		}
		
		$category_info = $this->model_blog_category->getCategory($category_id);
	
		if ($category_info) {
	  		$this->document->setTitle($category_info['name']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			
			$this->data['heading_title'] = $category_info['name'];
			
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			
			$this->data['button_continue'] = $this->language->get('button_continue');
					
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = '';
			}
									
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('post/compare');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
								
			$this->data['categories'] = array();
			
			$results = $this->model_blog_category->getCategories($category_id);
			
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);
				
				$post_total = $this->model_blog_post->getTotalPosts($data);				
				
				$this->data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_post_count') ? ' (' . $post_total . ')' : ''),
					'href'  => $this->url->link('blog/category', 'bpath=' . $this->request->get['bpath'] . '_' . $result['category_id'] . $url),
					'pic'	=> $this->model_tool_image->resize($result['image'], 80, 80)
				);
			}
			
			$this->data['posts'] = array();
			
			$data = array(
				'filter_category_id' => $category_id, 
				'filter_sub_category'=> true,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
					
			$post_total = $this->model_blog_post->getTotalPosts($data); 
			
			$results = $this->model_blog_post->getPosts($data);
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('blog_image_post_width'), $this->config->get('blog_image_post_height'));
				} else {
					$image = $this->model_tool_image->resize('blog_no_image.jpg', $this->config->get('blog_image_post_width'), $this->config->get('blog_image_post_height'));
				}		
				
				if ($this->config->get('blog_comment_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
								
				$this->data['posts'][] = array(
					'post_id'  	  => $result['post_id'],
					'author_name' => $result['author_name'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'short_description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 450) . '..',
					'very_short_description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
					'rating'      => $result['rating'],
					'views'       => sprintf($this->language->get('text_views'), (int)$result['viewed']),
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('blog/post', 'bpath=' . $this->request->get['bpath'] . '&post_id=' . $result['post_id']),
					'comments_href'=> $this->url->link('blog/post', 'post_id=' . $result['post_id'] . '&to_comments=1'),
					'author_href' => $this->url->link('blog/search', '&filter_author_id=' . $result['author_id']),
					'date_added' => date('<\s\p\a\n>j<\/\s\p\a\n> M <\s\m\a\l\l>Y<\/\s\m\a\l\l>', strtotime($result['date_added']))	
				);
			}
						
						
			$url = '';
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $post_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('blog/category', 'bpath=' . $this->request->get['bpath'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('blog/home');
			
			// Search
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/category.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/blog/category.tpl';
			} else {
				$this->template = 'default/template/blog/category.tpl';
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
			
			if (isset($this->request->get['bpath'])) {
				$url .= '&bpath=' . $this->request->get['bpath'];
			}
									
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('post/category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('blog/home');
			
			// Search
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}

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
}
?>