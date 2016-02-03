<?php
final class Unisender extends SmsGate {

	public function send() {
		$results = array();

                $to = $this->cleanPhone($this->to);

		$data = array(
			'phone'               => $this->truncate($to),
			'text'                => $this->message,
			'sender'              => $this->from,
			'api_key'             => $this->password,
		);

		$result = $this->process($data);
		$results[] = json_decode($result);

                if ($this->copy) {
			$numbers = explode(',', $this->copy);
			foreach ($numbers as $number) {
                                $clear_number = $this->cleanPhone($number);
				$data['phone'] = $this->truncate($clear_number);
                                
				$result = $this->process($data);
				$results[] = json_decode($result);
			}
		}

		return $results;
	}

	private function process($data) {
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                curl_setopt($ch, CURLOPT_TIMEOUT, 10);
                curl_setopt($ch, CURLOPT_URL, 'http://api.unisender.com/ru/api/sendSms?format=json');

                $result = curl_exec($ch);



		curl_close($ch);

		return $result;
	}

	private function truncate($string) {
		if (preg_match('/[^0-9]/', $string)) {
			$string = utf8_truncate($string, 11, '');
		} else {
			$string = substr($string, 0, 15);
		}

		return $string;
	}

        private function cleanPhone($p){
            $clear_tel = preg_replace("([^0-9])", "", $p);
            $first_digit = substr($clear_tel,0,1);
            if($first_digit == 7){
                    return $clear_tel;
            }else if($first_digit == 8){
                    return '7'.substr($clear_tel,1,10);
            }else{
                    return $clear_tel;
            }
        }
}
?>