<?php
// RegEx
define('EMAIL_PATTERN', '/^[^\@]+@.*\.[a-z]{2,6}$/i');
 
class ControllerProductcustomertestimonial extends Controller {
	
	private $error = array(); 

	protected function str_split_unicode($str, $l = 0) {
	    if ($l > 0) {
	        $ret = array();
	        $len = mb_strlen($str, "UTF-8");
	        for ($i = 0; $i < $len; $i += $l) {
	            $ret[] = mb_substr($str, $i, $l, "UTF-8");
	        }
	        return $ret;
	    }
	    return preg_split("//u", $str, -1, PREG_SPLIT_NO_EMPTY);
	}
	
	protected function addhttp($url) {
	    if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
	        $url = "http://" . $url;
	    }
	    return $url;
	}

	public function index() {  
    	$this->language->load('product/customertestimonial');
		$this->language->load('product/sendcustomertestimonial');
		$this->language->load('module/customertestimonial');
		
		$this->load->model('catalog/customertestimonial');

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', 'SSL'),
      		'separator' => false
   		);

		/* form */
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$this->data['data']=array();

			$this->data['data']['avatar'] = "";


			if (is_uploaded_file($this->request->files['avatar']['tmp_name'])) {

						//$filename = $this->request->files['avatar']['name'];

						$filename = md5(rand()) . '.' . $this->request->files['avatar']['name'];
							

							move_uploaded_file($this->request->files['avatar']['tmp_name'], DIR_IMAGE . 'data/customertestimonial/' . $filename);
			
							if (file_exists(DIR_IMAGE . 'data/customertestimonial/' . $filename)) {
								$this->data['data']['avatar'] = strip_tags(html_entity_decode('data/customertestimonial/' . $filename));
							}
						}


			$this->data['data']['name'] = strip_tags(html_entity_decode($this->request->post['name']));
			$this->data['data']['rating'] = $this->request->post['rating'];				
			$this->data['data']['email'] = strip_tags(html_entity_decode($this->request->post['email']));
			$this->data['data']['title'] = strip_tags(html_entity_decode($this->request->post['title']));

			$this->data['data']['description'] = strip_tags(html_entity_decode($this->request->post['description']));

			$descriptions = explode(" ", $this->data['data']['description']);
			$size = count($descriptions);
			for($i=0; $i<$size; $i++)
			{ 
				$w_arr = $this->str_split_unicode($descriptions[$i],14);
				$descriptions[$i] = implode(" ",$w_arr);

			}
			$this->data['data']['description'] = implode(" ",$descriptions);

			if ($this->config->get('customertestimonial_admin_approved')=='')
				$this->model_catalog_customertestimonial->addcustomertestimonial($this->data['data'], 1);
			else
				$this->model_catalog_customertestimonial->addcustomertestimonial($this->data['data'], 0);

			$this->session->data['success'] = $this->language->get('text_add');
			

			// send email
			if ($this->config->get('customertestimonial_send_to_admin')!='')
			{
				$store_name = $this->config->get('config_name');
	
				$subject = sprintf($this->language->get('text_subject'), $this->data['data']['name'], $store_name);
	
				$message  = '<html>'.$this->language->get('text_header') . "<br>";
				
								
				$message .= $this->data['data']['description']. "<br>";
	
	
				$message .= $this->language->get('text_footer')."</html>";
	
				$email = $this->data['data']['email'];
				if ($email == "") $email = "empty";


				$sender = $this->data['data']['name'];
				if ($sender == "") $sender = "empty";
				

				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setFrom($email);
				$mail->setTo($this->config->get('config_email'));
				$mail->setSender($sender);
				$mail->setSubject($subject);
				$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
			}


			$this->redirect($this->url->link('product/sendcustomertestimonial/success', '', 'SSL'));
		}
		
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_good'] = $this->language->get('entry_good');
		$this->data['entry_bad'] = $this->language->get('entry_bad');
		$this->data['text_note'] = $this->language->get('text_note');
		$this->data['text_conditions'] = $this->language->get('text_conditions');

		$this->data['entry_avatar'] = $this->language->get('entry_avatar');


		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}

		if (isset($this->error['avatar'])) {
			$this->data['error_avatar'] = $this->error['avatar'];
		} else {
			$this->data['error_avatar'] = '';
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
			
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}		
		
		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}	

			$this->data['button_continue'] = $this->language->get('button_continue');
	
			$this->data['action'] = $this->url->link('product/sendcustomertestimonial', '', 'SSL');

		if ($this->customer->isLogged()) 
			$this->data['need_captcha'] = false;
		else	
			$this->data['need_captcha'] = true;


		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {

		if ($this->customer->isLogged()) 
			$this->data['name'] = $this->customer->getFirstName();
		else	
			$this->data['name'] = '';

		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			if ($this->customer->isLogged()) 
				$this->data['email'] = $this->customer->getEmail();
			else	
				$this->data['email'] = '';

		}
		if (isset($this->request->post['title'])) {
			$this->data['title'] = $this->request->post['title'];
		} else {
			$this->data['title'] = '';
		}
		if (isset($this->request->post['rating'])) {
			$this->data['rating'] = $this->request->post['rating'];
		} else {
			if ($this->config->get('customertestimonial_default_rating')=='')
				$this->data['rating'] = '3';
			else
				$this->data['rating'] = $this->config->get('customertestimonial_default_rating');

		}
		
		if (isset($this->request->post['description'])) {
			$this->data['description'] = $this->request->post['description'];
		} else {
			$this->data['description'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}		
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/sendcustomertestimonial.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/sendcustomertestimonial.tpl';
		} else {
			$this->template = 'default/template/product/sendcustomertestimonial.tpl';
		}
		
		
		
		/* end form */
			
		$customertestimonial_total = $this->model_catalog_customertestimonial->getTotalcustomertestimonials();
			
		if ($customertestimonial_total) {

	  		$this->document->SetTitle ('Отзывы о студии Флористики Missbloom');
			$this->document->SetDescription ('➪Отзывы наших довольных клиентов о студии Флористики Missbloom: ☏ +7 (495) 726-76-83');
			
	   		$this->data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('product/customertestimonial', '', 'SSL'),
	      		'separator' => $this->language->get('text_separator')
	   		);

						
      		$this->data['heading_title'] = $this->language->get('heading_title');
      		$this->data['text_auteur'] = $this->language->get('text_auteur');
      		$this->data['button_continue'] = $this->language->get('button_continue');
      		$this->data['showall'] = $this->language->get('text_showall');
      		$this->data['write'] = $this->language->get('text_write');
      		$this->data['text_average'] = $this->language->get('text_average');
      		$this->data['text_stars'] = $this->language->get('text_stars');
      		$this->data['text_no_rating'] = $this->language->get('text_no_rating');
			
			$this->data['continue'] = $this->url->link('common/home', '', 'SSL');

			$this->page_limit = $this->config->get('config_catalog_limit');
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else { 
				$page = 1;
			}	

			$this->data['customertestimonials'] = array();
			
			if ( isset($this->request->get['customertestimonial_id']) ){
				$results = $this->model_catalog_customertestimonial->getcustomertestimonial($this->request->get['customertestimonial_id']);
			}
			else{
				$results = $this->model_catalog_customertestimonial->getcustomertestimonials(($page - 1) * $this->page_limit, $this->page_limit);
			}
			
			$this->load->model('tool/image');

			foreach ($results as $result) {
				
			$result['description'] = '<span>"</span> '.trim($result['description']).' <span>"</span>';
			$result['description'] = str_replace('<span>"</span><p>', '<span>"</span> ', $result['description']);
			$result['description'] = str_replace('</p><span>"</span>', ' <span>"</span>', $result['description']);


				if ($result['avatar']!="")
				{
					$avatar = $this->model_tool_image->resize($result['avatar'], 70, 70);	
				}
				else
				{
					$avatar = "";	
				}

				$this->data['customertestimonials'][] = array(
					'name'		=> $result['name'],
					'title'    		=> $result['title'],
					'rating'		=> $result['rating'],
					'description'	=> $result['description'],
					'avatar'		=> $avatar,
					'date_added'	=> date("m-d-Y", strtotime($result['date_added'])) //$result['date_added']



				);
			}
			
			$url = '';
	
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
				$this->data['write_url'] = $this->url->link('product/sendcustomertestimonial', '', 'SSL'); 	
			
			if ( isset($this->request->get['customertestimonial_id']) ){
				$this->data['showall_url'] = $this->url->link('product/customertestimonial', '', 'SSL'); 	
			}
			else{
				$pagination = new Pagination();
				$pagination->total = $customertestimonial_total;
				$pagination->page = $page;
				$pagination->limit = $this->page_limit; 
				$pagination->text = $this->language->get('text_pagination');
				$pagination->url = $this->url->link('product/customertestimonial', '&page={page}', 'SSL');
				$this->data['pagination'] = $pagination->render();				

			}


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/customertestimonial.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/customertestimonial.tpl';
			} else {
				$this->template = 'default/template/product/customertestimonial.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);		
			
	  		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    	} else {

				
	  		$this->document->SetTitle ( $this->language->get('text_error'));
			
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

	    		$this->data['continue'] = $this->url->link('common/home', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			
			
		
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
		
	  		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    	}
  	}
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
	
  	private function validate() {

		if ((strlen(utf8_decode($this->request->post['description'])) < 1) || (strlen(utf8_decode($this->request->post['description'])) > 999)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}

		if (!$this->customer->isLogged())	
	    	if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
	      		$this->error['captcha'] = $this->language->get('error_captcha');
	    	}


		if (is_uploaded_file($this->request->files['avatar']['tmp_name'])) {
			$size = getimagesize($this->request->files['avatar']['tmp_name']);
			if ($size==FALSE)
				$this->error['avatar'] = $this->language->get('error_avatar1');
			else
			{
				if ($size[0]>1000)
					$this->error['avatar'] = $this->language->get('error_avatar3');

				if ($size[1]>1000)
					$this->error['avatar'] = $this->language->get('error_avatar3');

				if ($this->request->files['avatar']['size']>1024*1024)
					$this->error['avatar'] = $this->language->get('error_avatar2');
			}
		}
		
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}  	  
  	}
}
?>