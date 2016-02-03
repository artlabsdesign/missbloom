<?php
require 'simple_html_dom.php';
$cat_rem = fopen("cat_list.txt", "w");
fwrite ($cat_rem, "");
fclose ($cat_rem);

$cat_handle = fopen("cat_list.txt", "a");
$cat_counter = 0 ;

$cat_url = new simple_html_dom();
$cat_url->load_file('http://www.toy.ru/catalog/');
echo "<h4>Загрузили hmtl каталога товаров</h4>";
flush();
ob_flush();
 
if(count($cat_url->find('.category_list'))){
foreach ($cat_url->find('.category_list') as $catalog){
	foreach ($catalog->find('div.item a') as  $link) {
		$category = file_get_html("http://www.toy.ru" . $link->href);
		echo "<p>Загрузили hmtl категории http://www.toy.ru". $link->href ." </p>";
			flush();
			ob_flush();
		
		if(count($category->find('div.item a'))){
		foreach ($category->find('div.item a') as $link ){
				$link_title = "";
				if(count($link->find('img'))){
				$link_title = $link->find('img', 0)->title;	
				echo "<p>Название категории <strong>". $link_title ."</strong></p>";
				}
				
				fwrite ($cat_handle, $link->href .";".$link_title."\r\n");
				$cat_counter++;
				echo "<p>Записали url категории http://www.toy.ru". $link->href ." в файл </p>";
				$subcat1 = file_get_html("http://www.toy.ru" . $link->href);
				echo "<p>Загрузили hmtl подкатегории http://www.toy.ru". $link->href ." </p>";
					flush();
					ob_flush();
			
				if(count($subcat1->find('div.item a'))){
						foreach ($subcat1->find('div.item a') as $link ){
						$link_title = "";
							if(count($link->find('img'))){
							$link_title = $link->find('img', 0)->title;	
							echo "<p>Название категории <strong>". $link_title ."</strong></p>";
							}	
						fwrite ($cat_handle, $link->href .";".$link_title."\r\n");
						$cat_counter++;
						echo "<p>Записали url категории http://www.toy.ru". $link->href ." в файл </p>";
						$subcat2 = file_get_html("http://www.toy.ru" . $link->href);
						echo "<p>Загрузили hmtl подкатегории http://www.toy.ru". $link->href ." </p>";
							flush();
							ob_flush();
					
							if(count($subcat2->find('div.item a'))){
							foreach ($subcat2->find('div.item a') as $link ){
								$link_title = "";
									if(count($link->find('img'))){
									$link_title = $link->find('img', 0)->title;	
									echo "<p>Название категории <strong>". $link_title ."</strong></p>";
							}	
							fwrite ($cat_handle, $link->href .";".$link_title."\r\n");
							$cat_counter++;
							echo "<p>Записали url категории http://www.toy.ru". $link->href ." в файл </p>";
							
											flush();
											ob_flush();
							
									$subcat3 = file_get_html("http://www.toy.ru" . $link->href);
					
										if(count($subcat3->find('div.item a'))){
										foreach ($subcat3->find('div.item a') as $link ){
											$link_title = "";
											if(count($link->find('img'))){
											$link_title = $link->find('img', 0)->title;	
											echo "<p>Название категории <strong>". $link_title ."</strong></p>";
											}	
										fwrite ($cat_handle, $link->href .";".$link_title."\r\n");
										$cat_counter++;
										echo "<p>Записали url категории http://www.toy.ru". $link->href ." в файл </p>";
										
											flush();
											ob_flush();
							
											}
										}
										$subcat3->clear();
										unset($subcat3);
								}
							}
							$subcat2->clear();
							unset($subcat2);
						}
						
					}
					$subcat1->clear();
					unset($subcat1);
				}
				
			}	
			$category->clear();
			unset($category);
		}
	}
}
$cat_url->clear();
unset($cat_url);
echo "<p>Всего спарсили url ". $cat_counter ." категорий </p>";
fclose ($cat_handle);
/* if (($handle = fopen("price.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
       
        $articuls[] = $data[2];		 
    }
	foreach ($articuls as $articul){
	
	
    }
	fclose($handle);
}
 */


?>