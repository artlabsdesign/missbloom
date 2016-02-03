<?php
$old_handle = fopen("product_list.csv", "r");
$new_handle = fopen("products_unique.csv", "w");
fwrite ($new_handle, "");
fclose ($new_handle);
$new_handle = fopen("products_unique.csv", "a");
$counter = 0;
$unique = 0;
$old_array = array();
$new_array = array();
while (!feof($old_handle)) {
$string = fgetcsv($old_handle, 0 , ";"); 
$counter++;
$new_array[$string[0]] =  $string;

}
echo "<p>В исходном файле обработано ". $counter ."строк</p>";
echo "<p>Найдено ".count($new_array). " уникальных артикулов!</p>";
echo "<p>Начинаю запись в новый файл!</p>";
flush();
ob_flush();


foreach ($new_array as $index => $n_sting ){
	
	fputcsv($new_handle, $n_sting, ';');
	
}
?>