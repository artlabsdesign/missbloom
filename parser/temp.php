<?php
$handle = fopen("cat_list.txt", "r"); 
$counter = 1;
while (!feof($handle)) {
	
	$string = fgets($handle, 4096);
	$string = $counter.";".$string;
	$counter++;
	$file_array[] = $string;
	
}
fclose($handle); 
$handle = fopen("cat_list.txt", "a");
fwrite($handle, "");
fclose($handle); 
$handle = fopen("cat_list.txt", "w");

foreach ($file_array as $element){
	fwrite($handle, $element);
	
}
?>