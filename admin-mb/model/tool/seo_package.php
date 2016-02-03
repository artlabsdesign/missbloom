<?php
class ModelToolSeoPackage extends Model {
  
  public function getFriendlyUrls($lang) {

  }
  
	public function getProductCategoryName($product_id, $lang) {
		$query = $this->db->query("SELECT c.name FROM " . DB_PREFIX . "product_to_category pc LEFT JOIN " . DB_PREFIX . "category_description c ON c.category_id = pc.category_id WHERE pc.product_id = '" . (int)$product_id . "' AND c.language_id=".$lang." LIMIT 1")->row;
		
		if(isset($query['name']))
			return $query['name'];
		return'';
	}
	
	public function getProductCategoryId($product_id) {
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' LIMIT 1")->row;
		
		if(isset($query['category_id']))
			return $query['category_id'];
		return'';
	}
	
	public function getManufacturerName($manufacturer_id) {
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "manufacturer WHERE manufacturer_id = '" . (int)$manufacturer_id . "' LIMIT 1")->row;
		
		if(isset($query['name']))
			return $query['name'];
		return'';
	}
	
	public function transformProduct($pattern, $lang, $row) {
		if (!isset($row['name'])) {
			$row['name'] = $row['product_description'][$lang]['name'];
			$row['description'] = $row['product_description'][$lang]['description'];
		}
		
		$replace  = array();
		if(strpos($pattern, '[name]') !== false)
			$replace['[name]'] = trim($row['name']);
		if(strpos($pattern, '[model]') !== false)
			$replace['[model]'] = trim($row['model']);
		if(strpos($pattern, '[upc]') !== false)
			$replace['[upc]'] = trim($row['upc']);
		if(strpos($pattern, '[sku]') !== false)
			$replace['[sku]'] = trim($row['sku']);
		if(strpos($pattern, '[ean]') !== false)
			$replace['[ean]'] = trim($row['ean']);
		if(strpos($pattern, '[jan]') !== false)
			$replace['[jan]'] = trim($row['jan']);
		if(strpos($pattern, '[isbn]') !== false)
			$replace['[isbn]'] = trim($row['isbn']);
		if(strpos($pattern, '[mpn]') !== false)
			$replace['[mpn]'] = trim($row['mpn']);
		if(strpos($pattern, '[location]') !== false)
			$replace['[location]'] = trim($row['location']);
		if(strpos($pattern, '[prod_id]') !== false)
			$replace['[prod_id]'] = isset($row['product_id']) ? trim($row['product_id']) : '';
		if(strpos($pattern, '[cat_id]') !== false)
			$replace['[cat_id]'] = isset($row['product_id']) ? trim($this->getProductCategoryId($row['product_id'], $lang)) : '';
		if(strpos($pattern, '[lang_id]') !== false)
			$replace['[lang_id]'] = $lang;
		if(strpos($pattern, '[lang]') !== false)
			$replace['[lang]'] = $this->config->get('seo_current_lang');
		if(strpos($pattern, '[category]') !== false)
			$replace['[category]'] = isset($row['product_id']) ? trim($this->getProductCategoryName($row['product_id'], $lang)) : '';
		if(strpos($pattern, '[brand]') !== false)
			$replace['[brand]'] = (isset($row['product_id']) && $row['manufacturer_id']) ? trim($this->getManufacturerName($row['manufacturer_id'])) : '';
		if(strpos($pattern, '[desc]') !== false)
			$replace['[desc]'] = trim(preg_replace('/\s\s+/', ' ', substr(strip_tags(html_entity_decode($row['description'], ENT_QUOTES, 'UTF-8')), 0, 150)));
		// categories ?
			
		$value = str_replace(array_keys($replace), array_values($replace), $pattern);
		$value = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
		
		return $value;
	}
	
	public function transformCategory($pattern, $lang, $row) {
		if (!isset($row['name'])) {
			$row['name'] = $row['category_description'][$lang]['name'];
			$row['description'] = $row['category_description'][$lang]['description'];
		}
		
		$replace  = array();
		if(strpos($pattern, '[name]') !== false)
			$replace['[name]'] = trim($row['name']);
		if(strpos($pattern, '[desc]') !== false)
			$replace['[desc]'] = trim(preg_replace('/\s\s+/', ' ', substr(strip_tags(html_entity_decode($row['description'], ENT_QUOTES, 'UTF-8')), 0, 150)));
		if(strpos($pattern, '[cat_id]') !== false)
			$replace['[cat_id]'] = trim($row['category_id']);
		if(strpos($pattern, '[lang_id]') !== false)
			$replace['[lang_id]'] = $lang;
		if(strpos($pattern, '[lang]') !== false)
			$replace['[lang]'] = $this->config->get('seo_current_lang');
			/*
		if(strpos($pattern, '[parent]') !== false)
			$replace['[parent]'] = $this->model_tool_seo_package->getParentCategoryName($row['category_id'], $lang);
			*/
			
		$value = str_replace(array_keys($replace), array_values($replace), $pattern);
		$value = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
		
		return $value;
	}
	
	public function transformInformation($pattern, $lang, $row) {
		if (!isset($row['title'])) {
			$row['title'] = $row['information_description'][$lang]['title'];
			$row['description'] = $row['information_description'][$lang]['description'];
		}
		
		$replace  = array();
		if(strpos($pattern, '[name]') !== false)
			$replace['[name]'] = trim($row['title']);
		if(strpos($pattern, '[title]') !== false)
			$replace['[title]'] = trim($row['title']);
		if(strpos($pattern, '[desc]') !== false)
			$replace['[desc]'] = trim(preg_replace('/\s\s+/', ' ', substr(strip_tags(html_entity_decode($row['description'], ENT_QUOTES, 'UTF-8')), 0, 150)));
		if(strpos($pattern, '[lang_id]') !== false)
			$replace['[lang_id]'] = $lang;
		if(strpos($pattern, '[lang]') !== false)
			$replace['[lang]'] = $this->config->get('seo_current_lang');
			
		$value = str_replace(array_keys($replace), array_values($replace), $pattern);
		$value = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
		
		return $value;
	}
	
	public function transformManufacturer($pattern, $lang, $row) {
		$replace  = array();
		if(strpos($pattern, '[name]') !== false)
			$replace['[name]'] = trim($row['name']);
				
		$value = str_replace(array_keys($replace), array_values($replace), $pattern);
		$value = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
		
		return $value;
	}
	
	public function getParentCategoryName($category_id, $lang) {
		// todo
		//$query = $this->db->query("SELECT c.name FROM " . DB_PREFIX . "product_to_category pc LEFT JOIN " . DB_PREFIX . "category_description c ON c.category_id = pc.category_id WHERE pc.product_id = '" . (int)$product_id . "' AND c.language_id=".$lang." LIMIT 1")->row;
		
		if(isset($query['name']))
			return $query['name'];
		return'';
	}
	
	public function filter_seo($seo_kw, $type, $id, $lang = '')
	{
		$whitespace = $this->config->get('multilingual_seo_whitespace');
		if($this->config->get('multilingual_seo_lowercase')) $seo_kw = mb_convert_case($seo_kw, MB_CASE_LOWER, 'UTF-8');
		$seo_kw = str_replace(' ', $whitespace, $seo_kw);
		if($this->config->get('multilingual_seo_ascii_'.$lang)){
			// language specific tr
			$seo_kw = $this->mb_strtr($seo_kw, 'ÁáČčĎďĚěŇňŘřŠšŤťÚúŮůÝýŽžĐđ', 'AaCcDdEeNnRrSsTtUuUuYyZzDd'); // czech, croatian, slovenian
			$seo_kw = $this->mb_strtr($seo_kw, 'ĄČĘĖĮYŠŲŪŽąčęėįyšųūž', 'ACEEIYSUUZaceeiysuuz'); // lithunanian
			$seo_kw = $this->mb_strtr($seo_kw, 'ĀČĒĢĪĶĻŅŠŪŽāčēģīķļņšūž', 'ACEGIKLNSUZacegiklnsuz'); // latvian
			$seo_kw = $this->mb_strtr($seo_kw, 'ÇçĞğİıÖöŞşÜü', 'CcGgIiOoSsUu'); // turkish
			$seo_kw = $this->mb_strtr($seo_kw, 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûýýþÿŔŕ', 'AAAAAAACEEEEIIIIDNOOOOOOUUUUYBSaaaaaaaceeeeiiiidnoooooouuuyybyRr'); // russian
			$seo_kw = $this->mb_strtr($seo_kw, array('А','а','Б','б','В','в','Г','г','Д','д','Е','е','Ё' ,'ё' ,'Ж' ,'ж' ,'З','з','И','и','Й','й','К','к','Л','л','М','м','Н','н','О','о','П','п','Р','р','С','с','Т','т','У','у','Ф','ф','Х','х','Ц' ,'ц' ,'Ч' ,'ч' ,'Ш' ,'ш' ,'Щ'   ,'щ'   ,'Ы','ы','Э','э','Ю' ,'ю' ,'Я' ,'я' ),
																   array('A','a','B','b','V','v','G','g','D','d','E','e','Yo','yo','Zh','zh','Z','z','I','i','J','j','K','k','L','l','M','m','N','n','O','o','P','p','R','r','S','s','T','t','U','u','F','f','H','h','Ts','ts','Ch','ch','Sh','Sh','Shch','shch','Y','y','E','e','Yu','yu','Ya','ya')); // russian
			
			// entities autodetect method (works for western europe languages)
			$seo_kw = preg_replace('~&([a-z]{1,2})(?:acute|cedil|circ|grave|lig|orn|ring|slash|th|tilde|uml|caron);~i', '$1', htmlentities($seo_kw, ENT_QUOTES, 'UTF-8'));
			$seo_kw = html_entity_decode($seo_kw, ENT_QUOTES);
			$seo_kw = preg_replace(array('~[^0-9a-z]~i', '~[ -]+~'), $whitespace, $seo_kw);
			
			$seo_kw = trim($seo_kw, '_'.$whitespace);
		}
		$seo_kw = str_replace(array('"',"'",'&','(',')','.','+',',','*',':',';','=','?','@','$','/','%','#'), '', $seo_kw);
		$seo_kw = mb_ereg_replace($whitespace.$whitespace.'+', $whitespace, $seo_kw);
		
		$exists = array(1);
		while(count($exists))
		{
			if($this->config->get('multilingual_seo_absolute') && $this->config->get('multilingual_seo_duplicate') && $type == 'category') break;
			elseif($this->config->get('multilingual_seo_absolute') && $type == 'category')
					 $sql = "SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '".$type."_id=" . (int)$id . "' AND keyword='".$seo_kw."'";
			elseif($this->config->get('multilingual_seo_duplicate'))
					 $sql = "SELECT * FROM " . DB_PREFIX . "url_alias WHERE query != '".$type."_id=" . (int)$id . "' AND keyword='".$seo_kw."'";
			else $sql = "SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword='".$seo_kw."'";
			$exists = $this->db->query($sql)->row;
			if(count($exists)) $seo_kw .= '_';
		}
		
	    // config here the max chars (will cut after the current word) ; 0 = unlimited
		$this->config->set('multilingual_seo_wordlimit', 0);
	    
	    if($this->config->get('multilingual_seo_wordlimit')){
	      $pos = strpos($seo_kw, $whitespace, $this->config->get('multilingual_seo_wordlimit'));
	      if($pos > $this->config->get('multilingual_seo_wordlimit'))
	        $seo_kw = substr($seo_kw, 0, $pos);
	    }
    
		return $seo_kw;
	}
	
	public function getFullProductPaths($product_id) {
		$path = array();
		$categories = $this->db->query("SELECT c.category_id, c.parent_id FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "category c ON (p2c.category_id = c.category_id) WHERE product_id = '" . (int)$product_id . "'")->rows;
		
		foreach($categories as $key => $category)
		{
			$path[$key] = '';
			if (!$category) continue;
			$path[$key] = $category['category_id'];
			
			while ($category['parent_id']){
				$path[$key] = $category['parent_id'] . '_' . $path[$key];
				$category = $this->db->query("SELECT category_id, parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . $category['parent_id']. "'")->row;
			}
			
			$path[$key] = $path[$key];
		}
		
		if (!count($path)) return array();
		
		return $path;
	}
	
	private function mb_strtr($str, $from, $to = null)
	{
		if(is_array($from) && is_array($to))
			return str_replace($from, $to, $str);
		elseif(is_array($from))
			return str_replace(array_keys($from), array_values($from), $str);
		return str_replace(preg_split('~~u', $from, null, PREG_SPLIT_NO_EMPTY), preg_split('~~u', $to, null, PREG_SPLIT_NO_EMPTY), $str);
	}
	
}