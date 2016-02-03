<?php
require 'simple_html_dom.php';
setlocale(LC_ALL, "ru_RU.UTF-8");
ini_set('display_errors','On');
error_reporting('E_ALL');
$start_time = time();
$product_counter = 0 ;
$product_pages_array = array();
set_time_limit(0);
$handle = fopen("cat_list.txt", "r"); 
$handle_array = array();
if($_GET[new_cat]){
			
	$handle_p = fopen("product_list.csv", "w"); 
	fwrite($handle_p, "");
	fclose($handle_p);
	
	}

while (!feof($handle)) {
	
	$string2 = fgets($handle, 4096);
	$handle_array[]  = $string2;	
}
fclose($handle);

foreach ($handle_array as $string){
	
	$string = explode(";", $string);
	$categ_numb = (integer)$string[0];
	$buffer = $string[1];
	$categ_name = $string[2];
	if(isset($_GET[cat])){
		if ($categ_numb < (integer)$_GET[cat]){
		continue;
		
	}
	}
	$page = "http://www.toy.ru" . rtrim($buffer);
    echo "<h3>Парсинг категории " . $page . "</h3><br\>";
    $cur_time = time();
    $delt_time =  $cur_time - $start_time;
    echo "<h4>Время работы скрипта: ".$delt_time." секунд</h4><br\>";
    ob_flush();
    flush();
	
    category_page_parcer($page, $categ_name);	
    
		
}
 

//функция обработки страницы подкатегории, включая пагинатор

	function category_page_parcer($p_link, $ct_name){
        echo "<p>Функция парсинга запустилась для категории <strong>". $ct_name . "</strong></p>";
        ob_flush();
        flush();
		
		if (isset($category_page)){
			
			//$category_page->clear();
			unset($category_page);
			
			
		}
	//создаем массив url товаров
	
	//выставляем счетчик пагинации
	$pag_counter = 1;
	//берем html первой страницы категории
	$category_page = file_get_html($p_link);
        echo "<p>Загрузили код категории <strong>". $p_link . "</strong></p>";
        ob_flush();
        flush();
        
		//проверяем есть ли в html ссылки на товары
		if(count($category_page->find('div.goods-item_i a'))){
            echo "Нашли товары в категории";
             ob_flush();
                flush();
			//находим ссылку на первый товар на первой странице пагинации
			$first_product = $category_page->find('div.goods-item_i', 0);
			$first_product = $first_product->find('a', 0);
			$first_link = trim($first_product->href);
			
		} else { 
            echo "<p>Не нашли товаров на странице категории!</p>";
                ob_flush();
                flush();
            }
		//очищаем html подкатегории
		//$category_page->clear();
		unset($category_page);
		
		//перебираем страницы пагинации
		do{
            echo "<p>Перебираем товары на странице пагинации: ". $pag_counter ;
                ob_flush();
              flush();
            
			$paginator_link = $p_link . "?PAGEN_3=".$pag_counter;
			$paginator_page = file_get_html($paginator_link);
			// перебираем каждую ссылку на товар на странице пагинации
			if(count($paginator_page->find('div.goods-item_i a'))){
				
								
			foreach ($paginator_page->find('div.goods-item_i') as $link ){
				//берем url 
				$t = $link->find('a', 0);
				//записываем url найденного товара в массив
				$product_pages_array[] =  "http://www.toy.ru" . $t->href;
				}
			}
			//$paginator_page->clear;
			unset($paginator_page);
			//получаем ссылку на первый продукт следующей страницы пагинации
            $temp_count = $pag_counter + 1;
			$paginator_link = $p_link . "?PAGEN_3=". $temp_count;
			$paginator_page = file_get_html($paginator_link);
			if(count($paginator_page->find('div.goods-item_i a'))){
					$first_pag_product = $paginator_page->find('div.goods-item_i', 0);
					$first_pag_product = $first_pag_product->find('a', 0);
					$first_pag_link = trim($first_pag_product->href);
					
			} else {
             echo "<p>Не нашел товаров на странице пагинации!</p>";
                ob_flush();
                flush();
            }
			//$paginator_page->clear;
			unset($paginator_page);
			$pag_counter++;
		}
		while($first_pag_link !== $first_link);
		  echo "<p>Массив товаров сформирован, передаем парсеру товара!</p>";
                ob_flush();
                flush();		
		product_page_parcer($product_pages_array, $ct_name);
	 }
	
//функция обработки карточки товара
function product_page_parcer($product_pages_array, $ct_name_pr){
    $handle_p = fopen("product_list.csv", "a"); 
					foreach ($product_pages_array as $link) {
                        
                        echo "<p>Парсим товар: ".$link."</p>";
                        ob_flush();
                        flush();
                        
					//берем html страницы товара
					$product = file_get_html($link);
					//записываем url этого товара в переменную
										
					//проверяем есть ли на странице товара блок характеристик
					if(count($product->find('div.characters-block'))){
						//перебираем блоки характеристик
						foreach ($product->find('div.characters-block') as $char ){
							// проверяем есть ли второй список в блоке характеристик
							if (count($ch = $char->find('ul',1))){
							//ищем четвертый пункт во втором списке
							$ch2 = $ch->find('li',3);
							// записываем текст этого пункта, как артикул
							$articul = $ch2->plaintext;
							$ch3 = $ch->find('li',2);
							if (count($ch3->find('a'))){
									$ch3 = $ch3->find('a',0);
								}
							$brandname = $ch3->plaintext;
								//echo "<p>".$brandname;"</p>";	
								//ob_flush();
								//flush();							
								//если в артикуле есть слово lego, то это не артикул
								if (substr($articul,12) == "LEGO"){
								//берем  тогда пятый пункт
								$ch2 = $ch->find('li',4);
								// записываем текст этого пункта, как артикул
								$articul = $ch2->plaintext;
								$ch3 = $ch->find('li',3);
								if (count($ch3->find('a'))){
									$ch3 = $ch3->find('a',0);
								}
								$brandname = $ch3->plaintext;
								
								//echo "<p>".$brandname;"</p>";
								//ob_flush();
								//flush();
							
								}
							//убираем из артикула ненужные символы
							$art = preg_replace('/^\S*\:\s/u', '', $articul);
							if (strlen($art)> 12){
								echo "<h4>Странный артикул: ".$art ."</h4>";
								ob_flush();
								flush();
								
							}
							
                           //находим название игрушки
                             if(count($product->find('h1.title'))){ 
                             $product_title = $product->find('h1.title', 0);    
                             
                            $product_title = $product_title->plaintext;  
                             }
                                
                                //парсим описание
                                 if(count($product->find('span[itemprop=description]'))){ 
                             $product_desc = $product->find('span[itemprop=description]', 0);    
                             $product_desc = $product_desc->innertext;  
                             } elseif (count($product->find('div[itemprop=description]'))){
                                  $product_desc = $product->find('div[itemprop=description]', 0);    
                             $product_desc = $product_desc->innertext;  
                                   
                                 }
                                else $product_desc = "Не смогли спарсить";
                                
                                //Парсим картинки
                                    //главная картинка
                                
                                if(count($product->find('div#Zoomer'))){ 
                            $mainimg_url =  $product->find('div#Zoomer',0);                                             
                            $mainimg_url = $mainimg_url->href;        
                            $mainimg_url = "http://www.toy.ru" . $mainimg_url;
                                    
                            }
                            
                                //Доп картинки
                                $img_url_list = array();
                                if(count($product->find('div.img-and-video'))){ 
                                    $vidimg_url =  $product->find('div.img-and-video',0);
                                        for ($x=-1; $x++<4;){
                                        $img_url = "";                                    
                                        if($vidimg_url->find('li',$x)){
                                        $img_url = $vidimg_url->find('li',$x);
                                        $img_url = $img_url->find('a', 0);
                                        $img_url = $img_url->href;                                                                       
                                        $img_url = "http://www.toy.ru" .  $img_url;                                    
                                                                
                                            
                                    } else 
                                    {
                                    $img_url = "";
                                    }
                                   
                                                                      
                                    $img_url_list[] = $img_url ; 
                                        
                                    }
                                    
                                    $video_url = ""; 
                                
                                    if(count($vidimg_url->find('a.fancy-video'))){
                                        $video_url = $vidimg_url->find('a.fancy-video', 0);
                                        $video_url = $video_url->{'data-url'};
                                        
                                    
                                                                    
                                                    
                                                     
                                        }                                   
                                   //$vidimg_url->clear;
									unset($vidimg_url);
                                }
                                
                                 if(count($product->find('span[itemprop=price]'))){ 
									//echo "<p>Нашли цену!</p>";
									$price =  $product->find('span[itemprop=price]',0);
									//echo "Цена с тегом:".$price."</p>";
									$price =  $price->plaintext;
									//echo "Цена без тега:".$price."</p>";
									//ob_flush();
									//flush();
									
								 } else{
									 
									 echo "<p><strong>НЕ</strong> Нашли цену!</p>";
								 }
                                
                     
                                
                                
                             
                             
							$art_array = array( trim($art), trim($link),iconv("utf-8","cp1251//IGNORE",$brandname) ,$price, trim(iconv("utf-8","cp1251//IGNORE",$ct_name_pr)), trim(iconv("utf-8","cp1251//IGNORE",$product_title)), strip_tags(trim(iconv("utf-8","cp1251//IGNORE",$product_desc)),'<p><ul><li>'), trim($mainimg_url),  trim($video_url) );
                            $art_array2 = array_merge($art_array, $img_url_list);    
							//пишем массив в csv
                                echo "<p>Пишем данные товара в csv...</p>";
                                ob_flush();
                                flush();
							fputcsv($handle_p, $art_array2, ';');
				}
			}
		}
		//$product->clear();	
		unset($product);
	
	}	
	fclose($handle_p);
}


 

//закрываем поток 1

?>