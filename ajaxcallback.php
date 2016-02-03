<?php

// Configuration
if (file_exists('config.php')) {
	require_once('config.php');
}

require_once DIR_SYSTEM . 'startup.php';
require_once DIR_SYSTEM . 'library/sms.php';
require $_SERVER['DOCUMENT_ROOT'].'/PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output
/*
$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp1.example.com;smtp2.example.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'user@example.com';                 // SMTP username
$mail->Password = 'secret';                           // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;                                    // TCP port to connect to
*/
/*
$mail->From = 'info@missbloom.ru';
$mail->FromName = 'Обратный звонок';
$mail->addAddress('zakaz@missbloom.ru');
$mail->addAddress('leeto@belikolepno.ru');


$mail->isHTML(true);
$mail->Subject = 'Обратный звонок';
$mail->Body    = "Телефон:".$_POST['phone']."<br>Время:".$_POST['time'];
$mail->AltBody = "Телефон:".$_POST['phone']."<br>Время:".$_POST['time'];
*/

$mailText = "Телефон:".$_POST['phone']."\n Время:".$_POST['time'];

$smsText = "Перезвоните на телефон:".$_POST['phone']."\n Удобное время:".$_POST['time'];

mail_utf8('zakaz@missbloom.ru', 'info@missbloom.ru', 'Обратный звонок. Перезвоните на номер:'.$_POST['phone'] , $mailText);


if(!$mail->send()) {
    echo 0;
} else {
    echo 1;
}


			// Send Admins SMS if configure
			//if ($this->config->get('config_sms_alert')) {
				$options = array(
					'to'       => $this->config->get('config_sms_to'),
					'copy'     => $this->config->get('config_sms_copy'),
					'from'     => $this->config->get('config_sms_from'),
					'username' => $this->config->get('config_sms_gate_username'),
					'password' => $this->config->get('config_sms_gate_password'),
					'message'  => $smsText
				);

				$this->load->library('sms');

				$sms = new Sms($this->config->get('config_sms_gatename'), $options);
				$sms->send();
			//}



function mail_utf8($to, $from, $subject, $message)
{
    $subject = '=?UTF-8?B?' . base64_encode($subject) . '?=';
 
    $headers  = "MIME-Version: 1.0\r\n"; 
    $headers .= "Content-type: text/plain; charset=utf-8\r\n";
    $headers .= "From: $from\r\n";
 
    return mail($to, $subject, $message, $headers);
}


/*
$headers  = 'From: info@missbloom.ru'. "\n";
$headers .= 'MIME-Version: 1.0' . "\n";
$headers .= 'Content-Type: text/html; charset="utf-8"' . "\n";

$result = mail('zakaz@missbloom.ru', 'Обратный звонок', "Телефон:".$_POST['phone']."<br>Время:".$_POST['time'], $headers);

if($result)
{
    echo 1;
}
else
{
    echo 0;
}
*/
?>