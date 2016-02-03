<?php 
$api_key = "5kkym4rxjb5bcihdt1yy9zk5dyhgaodtgrmp7ako";

// Параметры сообщения
// Если скрипт в кодировке UTF-8, не используйте iconv
$sms_from = "MissBloom";
$sms_to = "79037241542";
$sms_text = "SMS-сообщение по-русски";

// Создаём POST-запрос
$POST = array (
  'api_key' => $api_key,
  'phone' => $sms_to,
  'sender' => $sms_from,
  'text' => $sms_text
);

// Устанавливаем соединение
$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $POST);
curl_setopt($ch, CURLOPT_TIMEOUT, 10);
curl_setopt($ch, CURLOPT_URL, 
            'http://api.unisender.com/ru/api/sendSms?format=json');
$result = curl_exec($ch);

if ($result) {
  // Раскодируем ответ API-сервера
  $jsonObj = json_decode($result);

  if(null===$jsonObj) {
    // Ошибка в полученном ответе
    echo "Invalid JSON";

  }
  elseif(!empty($jsonObj->error)) {
    // Ошибка отправки сообщения
    echo "An error occured: " . $jsonObj->error . "(code: " . $jsonObj->code . ")";

  } else {
    // Сообщение успешно отправлено
    echo "SMS message is sent. Message id " . $jsonObj->result->sms_id;
    echo "SMS cost is " . $jsonObj->result->price . " " . $jsonObj->result->currency;

  }
} else {
  // Ошибка соединения с API-сервером
  echo "API access error";
}
?>