<?php
$this->language->load('common/footer');
$text_contact = $this->language->get('text_contact');
$text_information = $this->language->get('text_information');
$text_special = $this->language->get('text_special');
$user_welc = $this->customer->getFirstName();
$blog_link_header  = $this->url->link('blog/home');
?>
<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_toggle = $this->language->get('text_toggle');
$text_question = $this->language->get('text_question');
$text_facebook = $this->language->get('text_facebook');
$text_twitter = $this->language->get('text_twitter');
$text_payment = $this->language->get('text_payment');
$text_skype_click = $this->language->get('text_skype_click');
$text_compare = $this->language->get('text_compare');
$text_news = $this->language->get('text_news');
$text_brands = $this->language->get('text_brands');
$text_all_brands = $this->language->get('text_all_brands');
$text_cats = $this->language->get('text_cats');
$text_header_support = $this->language->get('text_header_support');
if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_site_mode') == '1')) {
$text_store_mode = $this->language->get('text_shop');
} else {
$text_store_mode = $this->language->get('text_catalog');
    }
$text_blog = $this->language->get('text_blog');
$text_special_custom = $this->language->get('text_special_custom');
?>
<div class="box box-ultimatum-column-category">
  <div class="box-content column-category">
    <?php 
 
$this->load->model('catalog/category');
$this->load->model('tool/image');
$ULTIMATUMControl_custom_menu_1 = $this->config->get('ULTIMATUMControl_custom_menu_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_1 = $this->config->get('ULTIMATUMControl_custom_submenu_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_2 = $this->config->get('ULTIMATUMControl_custom_menu_2' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_2 = $this->config->get('ULTIMATUMControl_custom_submenu_2' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_3 = $this->config->get('ULTIMATUMControl_custom_menu_3' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_3 = $this->config->get('ULTIMATUMControl_custom_submenu_3' . $this->config->get('config_language_id'));
 
$categories_1 = $this->model_catalog_category->getCategories(0);  											
 
if ($categories_1) {$output = '<ul id="topnav_column">';}  															
 
foreach ($categories_1 as $category_1) {																			
	$output .= '<li class="top_cat cat_item">';
    $testPath = $base.'image/';
	if ($category_1['image']) {
    $picCat = $this->model_tool_image->resize($category_1['image'],  70, 70);
    } else {
    $picCat = $base.'image/data/empty_pic_70x70.jpg';
    };
	$unrewritten  = $this->url->link('product/category', 'path=' . $category_1['category_id']);
    $output .= '<a href="'.($unrewritten).'">' . $category_1['name'] . '</a>';								
 	
	

	$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
 
	if ($categories_2) {
		
		$output .= '<span><ul class="children">';
		
		if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_menuthumb') == '1')) {
		
		$output .= '<span class="cat_preview"> <img src="'.$picCat.'" alt="' . $category_1['name'] . '"/><p>'. mb_substr(strip_tags(html_entity_decode($category_1['description'], ENT_QUOTES, 'UTF-8')), 0, 120) . '...' .'</p><div class="clear"></div></span>';
		
		}
		
		}												
 
	foreach ($categories_2 as $category_2) {
    	$subTestPath = $base.'image/';
    																	
		$output .= '<li class="subcat">';
		$sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id']);
		$output .= '<a href="'.($sub_unrewritten).'"><span>' . $category_2['name'] . '</span></a>';
 		
		$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
 
		if ($categories_3) {$output .= '<ul class="children2">';}
 
		foreach ($categories_3 as $category_3) {
			$output .= '<li class="sub_subcat">';
			$third_sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id']);
			$output .= '<a href="'.($third_sub_unrewritten).'">'.$category_3['name'].'</a>';
			$output .= '</li>';
		}
 
		if ($categories_3) {$output .= '</ul>';}
			$output .= '</li>';
	}
	
	if ($categories_2) {$output .= '</ul></span>';}
		$output .= '</li>';
}

if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_brand_custom_top') != null)){
	$brandCustomTop = '<span class="brand_custom_top">' . html_entity_decode($this->config->get('ULTIMATUMControl_brand_custom_top')) . '</span>';
	} else {
	$brandCustomTop = '<span class="brand_custom_top"></span>';	
	}
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_brand_custom_bottom') != null)){
	$brandCustomBottom = '<span class="brand_custom_bottom">' . html_entity_decode($this->config->get('ULTIMATUMControl_brand_custom_bottom')) . '</span>';
	} else {
	$brandCustomBottom = '<span class="brand_custom_bottom"></span>';	
	}

if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_specials_link') == '1')){
	$output .= '<li class="top_cat"><a href="'. $special . '">' .$text_special. '</a></li>';
}

if (($this->config->get('ULTIMATUMControl_status') == '1') && ($this->config->get('ULTIMATUMControl_brands') == '1')) {
$brands_1 = $this->model_catalog_manufacturer->getManufacturers(0);
    if ($brands_1) {$output .= '<li class="top_cat top_brand"><a href="'. $brand . '">'.$text_brands.'</a><span><ul class="children children_brands">';} 
    foreach ($brands_1 as $brand_1) {
		if ($brand_1['image']) {
		$picBrand = $this->model_tool_image->resize($brand_1['image'],  40, 40);
		} else {
    $picBrand = $base.'image/data/empty_pic_40x40.jpg';
    };
    $output .= '<li>';
    $brands_unrewritten  = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $brand_1['manufacturer_id']);
    $output .= '<a href="'.($brands_unrewritten).'"><img src="'.$picBrand.'" alt="' . $brand_1['name'].'"/>' . $brand_1['name'] . '</a>';
    $output .= '</li>';
    }
    if ($brands_1) {$output .= '</ul></span></li>';}
	}
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_custom_menu_1_state') == '0')){
    $menuState1 = 'mega';
    } else {
    $menuState1 = 'drop';
    };
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $ULTIMATUMControl_custom_menu_1 != null)){
	$output .= '<li class="top_cat custom_link_one '. ($menuState1) .'">';
	$output .= '<a href="'.$this->config->get('ULTIMATUMControl_custom_link_1').'">' . $ULTIMATUMControl_custom_menu_1 . '</a>';
	if($ULTIMATUMControl_custom_submenu_1 != null){
		$output .= '<div class="children"><div class="inner">' . html_entity_decode($ULTIMATUMControl_custom_submenu_1) .'</div></div>';}
	$output .= '</li>';
	}
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_custom_menu_2_state') == '0')){
    $menuState2 = 'mega';
    } else {
    $menuState2 = 'drop';
    };
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $ULTIMATUMControl_custom_menu_2 != null)){
	$output .= '<li class="top_cat custom_link_two '. ($menuState2) .'">';
	$output .= '<a href="'.$this->config->get('ULTIMATUMControl_custom_link_2').'">' . $ULTIMATUMControl_custom_menu_2 . '</a>';
	if($ULTIMATUMControl_custom_submenu_2 != null){
		$output .= '<div class="children"><div class="inner">' . html_entity_decode($ULTIMATUMControl_custom_submenu_2) .'</div></div>';}
	$output .= '</li>';
	}
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $this->config->get('ULTIMATUMControl_custom_menu_3_state') == '0')){
    $menuState3 = 'mega';
    } else {
    $menuState3 = 'drop';
    };
	if(($this->config->get('ULTIMATUMControl_status') == '1') && ( $ULTIMATUMControl_custom_menu_3 != null)){
	$output .= '<li class="top_cat custom_link_three '. ($menuState3) .'">';
	$output .= '<a href="'.$this->config->get('ULTIMATUMControl_custom_link_3').'">' . $ULTIMATUMControl_custom_menu_3 . '</a>';
	if($ULTIMATUMControl_custom_submenu_3 != null){
		$output .= '<div class="children"><div class="inner">' . html_entity_decode($ULTIMATUMControl_custom_submenu_3) .'</div></div>';}
	$output .= '</li>';
	}


if ($categories_1) {$output .= '</ul>';}
echo $output;
?>
  </div>
</div>
