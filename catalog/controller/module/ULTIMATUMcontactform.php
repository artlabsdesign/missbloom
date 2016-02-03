<?php
class ControllerModuleULTIMATUMcontactform extends Controller {
	protected function index($setting) {
		
		$this->language->load('module/ULTIMATUMcontactform');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_message'] = $this->language->get('text_message');
		$this->data['text_submit'] = $this->language->get('text_submit');
		$this->data['text_captcha'] = $this->language->get('text_captcha');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ULTIMATUMcontactform.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/ULTIMATUMcontactform.tpl';
		} else {
			$this->template = 'default/template/module/ULTIMATUMcontactform.tpl';
		}
		
		$this->render();
	}
	
	public function validate() {
		$this->language->load('module/ULTIMATUMcontactform');
		
		$json = array();
		
		if ((strlen($this->request->post['ULTIMATUMcontactform_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['ULTIMATUMcontactform_email'])) {
			$json['error']['warning'] = $this->language->get('error_email');
		} elseif (strlen($this->request->post['ULTIMATUMcontactform_message']) < 3) {
			$json['error']['warning'] = $this->language->get('error_message');
		}
		
		if ($this->config->get('ULTIMATUMcontactform_captcha')) {
			if ($this->request->post['captcha'] != $this->session->data['captcha']) {
				$json['error']['warning'] = $this->language->get('error_captcha');
			}
		}
		
		if(!$json) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'));
	  		$mail->setFrom($this->request->post['ULTIMATUMcontactform_email']);
	  		$mail->setSender($this->request->post['ULTIMATUMcontactform_email']);
	  		$mail->setSubject(html_entity_decode($this->language->get('email_subject'), ENT_QUOTES, 'UTF-8'));
	  		$mail->setText(strip_tags(html_entity_decode($this->request->post['ULTIMATUMcontactform_message'], ENT_QUOTES, 'UTF-8')));
      		$mail->send();
			
			$json['success'] = $this->language->get('success');
		}
		
		$this->response->setOutput(json_encode($json));	
	}
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}	
}
?>
