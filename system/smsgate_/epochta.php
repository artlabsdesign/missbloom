<?php
require_once(DIR_SYSTEM . 'smsgate/smssending.php');
//final class Smssending extends SmsGate {
class Epochta extends Smssending {
    
    function process($data) {
        
        $src = '<?xml version="1.0" encoding="UTF-8"?>   
                <SMS>
                <operations> 
                <operation>SEND</operation>
                </operations>
                <authentification>   
                <username>'.$data['login'].'</username>  
                <password>'.$data['password'].'</password>  
                </authentification>  
                <message>
                <sender>'.$data['space'].'</sender>   
                <text>'.urldecode($data['text']).'</text>  
                </message>   
                <numbers>
                <number>'.str_replace("%2B", "", $data['subno']).'</number>  
                </numbers>   
                </SMS>';
    
        $Curl = curl_init();
        $CurlOptions = array(CURLOPT_URL=>'http://atompark.com/members/sms/xml.php',
                            CURLOPT_FOLLOWLOCATION=>false,
                            CURLOPT_POST=>true,
                            CURLOPT_HEADER=>false,
                            CURLOPT_RETURNTRANSFER=>true,
                            CURLOPT_CONNECTTIMEOUT=>15,
                            CURLOPT_TIMEOUT=>100,
                            CURLOPT_POSTFIELDS=>array('XML'=>$src)); 
        curl_setopt_array($Curl, $CurlOptions);
        if(false === ($Result = curl_exec($Curl))) {   
            return false;
        }
            
        curl_close($Curl);
            
        return $Result;
        
    }
  
}

?>