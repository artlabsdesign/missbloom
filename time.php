<?php
$todayTime=time();
$tomorrowTime=$todayTime+86400;
function StrRusTime($unix_time) {

  if(!$unix_time)
     return ""; 
$Days = array ("1"=>"Понедельник",
				"2"=>"Вторник",
				"3"=>"Среда",
				"4"=>"Четверг",
				"5"=>"Пятница",
				"6"=>"Суббота",
				"7"=>"Воскресенье",);
	 
	 
  $Months = array("01"=>"Января",
                  "02"=>"Февраля",
                  "03"=>"Марта",
                  "04"=>"Апреля",
                  "05"=>"Мая",
                  "06"=>"Июня", 
                  "07"=>"Июля",
                  "08"=>"Августа",
                  "09"=>"Сентября",
                  "10"=>"Октября",
                  "11"=>"Ноября",
                  "12"=>"Декабря");
 
  $day = strftime("%d", $unix_time);
  settype($day, "integer");
  $month = strftime("%m", $unix_time);
  $year = strftime("%Y", $unix_time);
  $dayNumber= strftime("%u", $unix_time);
  
  return $Days[$dayNumber].", ".$day." ".$Months[$month]." ".$year;
}   


?>

<h2><?php echo StrRusTime($tomorrowTime);?></h2>