<?php
class ControllerBlogSetting extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('blog/setting'); 

		$this->document->setTitle($this->language->get('doc_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('blog', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_select'] 		          = $this->language->get('text_select');
		$this->data['text_none'] 		          = $this->language->get('text_none');
		$this->data['text_yes'] 		  		  = $this->language->get('text_yes');
		$this->data['text_no'] 			  		  = $this->language->get('text_no');
		$this->data['text_items'] 		  		  = $this->language->get('text_items');
		$this->data['text_pb_firstname_lastname'] = $this->language->get('text_pb_firstname_lastname');
		$this->data['text_pb_lastname_firstname'] = $this->language->get('text_pb_lastname_firstname');
		$this->data['text_pb_username'] 		  = $this->language->get('text_pb_username');
		$this->data['text_post'] 		          = $this->language->get('text_post');
		$this->data['text_account'] 		      = $this->language->get('text_account');
		$this->data['text_image_manager'] 		  = $this->language->get('text_image_manager');
 		$this->data['text_browse']        		  = $this->language->get('text_browse');
		$this->data['text_clear']                 = $this->language->get('text_clear');	
		$this->data['text_other_tools']           = $this->language->get('text_other_tools');	
		
		$this->data['entry_name']             = $this->language->get('entry_name');
		$this->data['entry_title']            = $this->language->get('entry_title');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_email']            = $this->language->get('entry_email');	
		
		$this->data['entry_blog_limit']       = $this->language->get('entry_blog_limit');
		$this->data['entry_posted_by'] 		  = $this->language->get('entry_posted_by');
		$this->data['entry_comment'] 		  = $this->language->get('entry_comment');
		$this->data['entry_comment_require_approve'] = $this->language->get('entry_comment_require_approve');
		
		$this->data['entry_admin_group'] 	  = $this->language->get('entry_admin_group');
		$this->data['entry_author_group'] 	  = $this->language->get('entry_author_group');
		
		$this->data['entry_logo'] 			  = $this->language->get('entry_logo');
		$this->data['entry_icon'] 			  = $this->language->get('entry_icon');
		$this->data['entry_image_category']   = $this->language->get('entry_image_category');
		$this->data['entry_image_thumb'] 	  = $this->language->get('entry_image_thumb');
		$this->data['entry_image_popup'] 	  = $this->language->get('entry_image_popup');
		$this->data['entry_image_post'] 	  = $this->language->get('entry_image_post');
		$this->data['entry_image_additional'] = $this->language->get('entry_image_additional');
		$this->data['entry_image_related']    = $this->language->get('entry_image_related');

		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_option'] = $this->language->get('tab_option');
		$this->data['tab_image'] = $this->language->get('tab_image');
		$this->data['tab_social'] = $this->language->get('tab_social');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
  		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}
		
 		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}	
				
 		if (isset($this->error['image_thumb'])) {
			$this->data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$this->data['error_image_thumb'] = '';
		}
		
 		if (isset($this->error['image_popup'])) {
			$this->data['error_image_popup'] = $this->error['image_popup'];
		} else {
			$this->data['error_image_popup'] = '';
		}
		
 		if (isset($this->error['image_post'])) {
			$this->data['error_image_post'] = $this->error['image_post'];
		} else {
			$this->data['error_image_post'] = '';
		}
		
 		if (isset($this->error['image_additional'])) {
			$this->data['error_image_additional'] = $this->error['image_additional'];
		} else {
			$this->data['error_image_additional'] = '';
		}	
		
 		if (isset($this->error['image_related'])) {
			$this->data['error_image_related'] = $this->error['image_related'];
		} else {
			$this->data['error_image_related'] = '';
		}
		
		if (isset($this->error['blog_limit'])) {
			$this->data['error_blog_limit'] = $this->error['blog_limit'];
		} else {
			$this->data['error_blog_limit'] = '';
		}
		
		if (isset($this->error['blog_posted_by'])) {
			$this->data['error_blog_posted_by'] = $this->error['blog_posted_by'];
		} else {
			$this->data['error_blog_posted_by'] = '';
		}
		
		if (isset($this->error['blog_admin_group_id'])) {
			$this->data['error_blog_admin_group_id'] = $this->error['blog_admin_group_id'];
		} else {
			$this->data['error_blog_admin_group_id'] = '';
		}
		
		if (isset($this->error['blog_author_group_id'])) {
			$this->data['error_blog_author_group_id'] = $this->error['blog_author_group_id'];
		} else {
			$this->data['error_blog_author_group_id'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('blog/setting', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['action'] = $this->url->link('blog/setting', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->post['blog_name'])) {
			$this->data['blog_name'] = $this->request->post['blog_name'];
		} else {
			$this->data['blog_name'] = $this->config->get('blog_name');
		}

		if (isset($this->request->post['blog_title'])) {
			$this->data['blog_title'] = $this->request->post['blog_title'];
		} else {
			$this->data['blog_title'] = $this->config->get('blog_title');
		}
		
		if (isset($this->request->post['blog_meta_description'])) {
			$this->data['blog_meta_description'] = $this->request->post['blog_meta_description'];
		} else {
			$this->data['blog_meta_description'] = $this->config->get('blog_meta_description');
		}
		
		if (isset($this->request->post['blog_email'])) {
			$this->data['blog_email'] = $this->request->post['blog_email'];
		} else {
			$this->data['blog_email'] = $this->config->get('blog_email');
		}
		
		if (isset($this->request->post['blog_limit'])) {
			$this->data['blog_limit'] = $this->request->post['blog_limit'];
		} else {
			$this->data['blog_limit'] = $this->config->get('blog_limit');
		}	
		
		if (isset($this->request->post['blog_posted_by'])) {
			$this->data['blog_posted_by'] = $this->request->post['blog_posted_by'];
		} else {
			$this->data['blog_posted_by'] = $this->config->get('blog_posted_by');
		}
		
		if (isset($this->request->post['blog_comment_status'])) {
			$this->data['blog_comment_status'] = $this->request->post['blog_comment_status'];
		} else {
			$this->data['blog_comment_status'] = $this->config->get('blog_comment_status');
		}
		
		if (isset($this->request->post['blog_comment_require_approve'])) {
			$this->data['blog_comment_require_approve'] = $this->request->post['blog_comment_require_approve'];
		} else {
			$this->data['blog_comment_require_approve'] = $this->config->get('blog_comment_require_approve');
		}
		
		if (isset($this->request->post['blog_admin_group_id'])) {
			$this->data['blog_admin_group_id'] = $this->request->post['blog_admin_group_id'];
		} else {
			$this->data['blog_admin_group_id'] = $this->config->get('blog_admin_group_id');
		}
		
		if (isset($this->request->post['blog_author_group_id'])) {
			$this->data['blog_author_group_id'] = $this->request->post['blog_author_group_id'];
		} else {
			$this->data['blog_author_group_id'] = $this->config->get('blog_author_group_id');
		}
			
		$this->load->model('tool/image');

		if (isset($this->request->post['blog_logo'])) {
			$this->data['blog_logo'] = $this->request->post['blog_logo'];
		} else {
			$this->data['blog_logo'] = $this->config->get('blog_logo');			
		}

		if ($this->config->get('blog_logo') && file_exists(DIR_IMAGE . $this->config->get('blog_logo')) && is_file(DIR_IMAGE . $this->config->get('blog_logo'))) {
			$this->data['logo'] = $this->model_tool_image->resize($this->config->get('blog_logo'), 100, 100);		
		} else {
			$this->data['logo'] = $this->model_tool_image->resize('blog_no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['blog_icon'])) {
			$this->data['blog_icon'] = $this->request->post['blog_icon'];
		} else {
			$this->data['blog_icon'] = $this->config->get('blog_icon');			
		}
		
		if ($this->config->get('blog_icon') && file_exists(DIR_IMAGE . $this->config->get('blog_icon')) && is_file(DIR_IMAGE . $this->config->get('blog_icon'))) {
			$this->data['icon'] = $this->model_tool_image->resize($this->config->get('blog_icon'), 100, 100);		
		} else {
			$this->data['icon'] = $this->model_tool_image->resize('blog_no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('blog_no_image.jpg', 100, 100);
				
		if (isset($this->request->post['blog_image_thumb_width'])) {
			$this->data['blog_image_thumb_width'] = $this->request->post['blog_image_thumb_width'];
		} else {
			$this->data['blog_image_thumb_width'] = $this->config->get('blog_image_thumb_width');
		}
		
		if (isset($this->request->post['blog_image_thumb_height'])) {
			$this->data['blog_image_thumb_height'] = $this->request->post['blog_image_thumb_height'];
		} else {
			$this->data['blog_image_thumb_height'] = $this->config->get('blog_image_thumb_height');
		}
		
		if (isset($this->request->post['blog_image_popup_width'])) {
			$this->data['blog_image_popup_width'] = $this->request->post['blog_image_popup_width'];
		} else {
			$this->data['blog_image_popup_width'] = $this->config->get('blog_image_popup_width');
		}
		
		if (isset($this->request->post['blog_image_popup_height'])) {
			$this->data['blog_image_popup_height'] = $this->request->post['blog_image_popup_height'];
		} else {
			$this->data['blog_image_popup_height'] = $this->config->get('blog_image_popup_height');
		}
		
		if (isset($this->request->post['blog_image_post_width'])) {
			$this->data['blog_image_post_width'] = $this->request->post['blog_image_post_width'];
		} else {
			$this->data['blog_image_post_width'] = $this->config->get('blog_image_post_width');
		}
		
		if (isset($this->request->post['blog_image_post_height'])) {
			$this->data['blog_image_post_height'] = $this->request->post['blog_image_post_height'];
		} else {
			$this->data['blog_image_post_height'] = $this->config->get('blog_image_post_height');
		}

		if (isset($this->request->post['blog_image_additional_width'])) {
			$this->data['blog_image_additional_width'] = $this->request->post['blog_image_additional_width'];
		} else {
			$this->data['blog_image_additional_width'] = $this->config->get('blog_image_additional_width');
		}
		
		if (isset($this->request->post['blog_image_additional_height'])) {
			$this->data['blog_image_additional_height'] = $this->request->post['blog_image_additional_height'];
		} else {
			$this->data['blog_image_additional_height'] = $this->config->get('blog_image_additional_height');
		}
		
		if (isset($this->request->post['blog_image_related_width'])) {
			$this->data['blog_image_related_width'] = $this->request->post['blog_image_related_width'];
		} else {
			$this->data['blog_image_related_width'] = $this->config->get('blog_image_related_width');
		}
		
		if (isset($this->request->post['blog_image_related_height'])) {
			$this->data['blog_image_related_height'] = $this->request->post['blog_image_related_height'];
		} else {
			$this->data['blog_image_related_height'] = $this->config->get('blog_image_related_height');
		}
		
		$this->load->model('user/user_group');
		
		$this->data['user_groups'] = $this->model_user_user_group->getUserGroups();
		$this->document->addStyle('view/stylesheet/css/ULTIMATUMControl2.css');
		$this->document->addStyle('view/stylesheet/css/font-awesome.min.css');				
		$this->template = 'blog/setting.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'blog/setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['blog_name']) {
			$this->error['name'] = $this->language->get('error_name');
		}	
		
		if (!$this->request->post['blog_title']) {
			$this->error['title'] = $this->language->get('error_title');
		}	
		
    	if ((utf8_strlen($this->request->post['blog_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['blog_email'])) {
      		$this->error['email'] = $this->language->get('error_email');
    	}
				
		if (!$this->request->post['blog_image_thumb_width'] || !$this->request->post['blog_image_thumb_height']) {
			$this->error['image_thumb'] = $this->language->get('error_image_thumb');
		}	
		
		if (!$this->request->post['blog_image_popup_width'] || !$this->request->post['blog_image_popup_height']) {
			$this->error['image_popup'] = $this->language->get('error_image_popup');
		}	
		
		if (!$this->request->post['blog_image_post_width'] || !$this->request->post['blog_image_post_height']) {
			$this->error['image_post'] = $this->language->get('error_image_post');
		}
				
		if (!$this->request->post['blog_image_additional_width'] || !$this->request->post['blog_image_additional_height']) {
			$this->error['image_additional'] = $this->language->get('error_image_additional');
		}
		
		if (!$this->request->post['blog_image_related_width'] || !$this->request->post['blog_image_related_height']) {
			$this->error['image_related'] = $this->language->get('error_image_related');
		}
		
		if (!$this->request->post['blog_limit']) {
			$this->error['blog_limit'] = $this->language->get('error_limit');
		}
		
		if (utf8_strlen($this->request->post['blog_posted_by']) == 0) {
			$this->error['blog_posted_by'] = $this->language->get('error_posted_by');
		}
		
		if (utf8_strlen($this->request->post['blog_admin_group_id']) == 0) {
			$this->error['blog_admin_group_id'] = $this->language->get('error_admin_group_id');
		}
		
		if (utf8_strlen($this->request->post['blog_author_group_id']) == 0) {
			$this->error['blog_author_group_id'] = $this->language->get('error_author_group_id');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>