<?php

require_once(DIR_SYSTEM . 'smsgate/smssending.php');

class sms_sending_ru extends Smssending {

    function process($data) {
        
    		$data['to'] = str_replace("%2B", "", $data['phone']);
    		$data['from'] = $data['source'];
    		$data['text'] = urldecode($data['txt']);
        
       return $this->sendNew($data['login'], $data['password'], $data['to'], $data['text'], $data['from']);
       
    }



  private function sendNew($login, $password, $number, $message, $sender) {
        return $this->_read_url('http://lcab.sms-sending.ru/lcabApi/sendSms.php?login='. urlencode($login) .'&password='. urlencode($password) .'&txt='. urlencode($message) .'&to='.urlencode($number) . ($sender ? '&source='.urlencode($sender) : ''));
  		
        /*return $this->_read_url('http://lcab.sms-sending.ru/sys/send.php?login='.urlencode($login).'&psw='.md5($password).
  							'&phones='.urlencode($number).'&mes='.urlencode($message).
  							($sender ? '&sender='.urlencode($sender) : '').'&cost=3&fmt=1&charset=utf-8');*/
  }

	// Функция чтения URL. Для работы должно быть доступно:
	// curl или fsockopen (только http) или включена опция allow_url_fopen для file_get_contents

	private function _read_url($url) {
		$ret = "";

		if (function_exists("curl_init"))
		{
			static $c = 0; // keepalive

			if (!$c) {
				$c = curl_init();
				curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($c, CURLOPT_CONNECTTIMEOUT, 10);
				curl_setopt($c, CURLOPT_TIMEOUT, 10);
				curl_setopt($c, CURLOPT_SSL_VERIFYPEER, 0);
			}

			curl_setopt($c, CURLOPT_URL, $url);

			$ret = curl_exec($c);
		}
		elseif (function_exists("fsockopen") && strncmp($url, 'http:', 5) == 0) // not https
		{
			$m = parse_url($url);

			$fp = fsockopen($m["host"], 80, $errno, $errstr, 10);

			if ($fp) {
				fwrite($fp, "GET $m[path]?$m[query] HTTP/1.1\r\nHost: lcab.sms-sending.ru\r\nUser-Agent: PHP\r\nConnection: Close\r\n\r\n");

				while (!feof($fp))
					$ret = fgets($fp, 1024);

				fclose($fp);
			}
		}
		else
			$ret = file_get_contents($url);

		return $ret;
	}
    
}
?>