<?php
class ControllerModuleULTIMATUMControl extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		
		$this->load->language('module/ULTIMATUMControl');
		$language = $this->language->load('module/ULTIMATUMControl');
		$this->data = array_merge($this->data, $language);

		$this->document->setTitle($this->language->get('doc_title'));
		
		$this->load->model('setting/setting');
		
		$this->load->model('tool/image');
		
		
		$BodyBgImg = 'ULTIMATUMControl_bodyBgImg';
		if (isset($this->request->post[$BodyBgImg])) {
			$this->data[$BodyBgImg] = $this->request->post[$BodyBgImg];
			$ULTIMATUMControl_bodyBgImg = $this->request->post[$BodyBgImg];
		} else {
			$this->data[$BodyBgImg] = '';
		}
		
		$FeaturedBg1Img = 'ULTIMATUMControl_featuredBg1Img';
		if (isset($this->request->post[$FeaturedBg1Img])) {
			$this->data[$FeaturedBg1Img] = $this->request->post[$FeaturedBg1Img];
			$ULTIMATUMControl_featuredBg1Img = $this->request->post[$FeaturedBg1Img];
		} else {
			$this->data[$FeaturedBg1Img] = '';
		}	
		
		$FeaturedBg2Img = 'ULTIMATUMControl_featuredBg2Img';
		if (isset($this->request->post[$FeaturedBg2Img])) {
			$this->data[$FeaturedBg2Img] = $this->request->post[$FeaturedBg2Img];
			$ULTIMATUMControl_featuredBg2Img = $this->request->post[$FeaturedBg2Img];
		} else {
			$this->data[$FeaturedBg2Img] = '';
		}
		
		$LatestBg1Img = 'ULTIMATUMControl_latestBg1Img';
		if (isset($this->request->post[$LatestBg1Img])) {
			$this->data[$LatestBg1Img] = $this->request->post[$LatestBg1Img];
			$ULTIMATUMControl_latestBg1Img = $this->request->post[$LatestBg1Img];
		} else {
			$this->data[$LatestBg1Img] = '';
		}	
		
		$LatestBg2Img = 'ULTIMATUMControl_latestBg2Img';
		if (isset($this->request->post[$LatestBg2Img])) {
			$this->data[$LatestBg2Img] = $this->request->post[$LatestBg2Img];
			$ULTIMATUMControl_latestBg2Img = $this->request->post[$LatestBg2Img];
		} else {
			$this->data[$LatestBg2Img] = '';
		}
		
		$TabbedBg1Img = 'ULTIMATUMControl_tabbedBg1Img';
		if (isset($this->request->post[$TabbedBg1Img])) {
			$this->data[$TabbedBg1Img] = $this->request->post[$TabbedBg1Img];
			$ULTIMATUMControl_tabbedBg1Img = $this->request->post[$TabbedBg1Img];
		} else {
			$this->data[$TabbedBg1Img] = '';
		}	
		
		$TabbedBg2Img = 'ULTIMATUMControl_tabbedBg2Img';
		if (isset($this->request->post[$TabbedBg2Img])) {
			$this->data[$TabbedBg2Img] = $this->request->post[$TabbedBg2Img];
			$ULTIMATUMControl_tabbedBg2Img = $this->request->post[$TabbedBg2Img];
		} else {
			$this->data[$TabbedBg2Img] = '';
		}
		
		$DealBg1Img = 'ULTIMATUMControl_dealBg1Img';
		if (isset($this->request->post[$DealBg1Img])) {
			$this->data[$DealBg1Img] = $this->request->post[$DealBg1Img];
			$ULTIMATUMControl_dealBg1Img = $this->request->post[$DealBg1Img];
		} else {
			$this->data[$DealBg1Img] = '';
		}	
		
		$DealBg2Img = 'ULTIMATUMControl_dealBg2Img';
		if (isset($this->request->post[$DealBg2Img])) {
			$this->data[$DealBg2Img] = $this->request->post[$DealBg2Img];
			$ULTIMATUMControl_dealBg2Img = $this->request->post[$DealBg2Img];
		} else {
			$this->data[$DealBg2Img] = '';
		}
		
		$BestsellerBg1Img = 'ULTIMATUMControl_bestsellerBg1Img';
		if (isset($this->request->post[$BestsellerBg1Img])) {
			$this->data[$BestsellerBg1Img] = $this->request->post[$BestsellerBg1Img];
			$ULTIMATUMControl_bestsellerBg1Img = $this->request->post[$BestsellerBg1Img];
		} else {
			$this->data[$BestsellerBg1Img] = '';
		}	
		
		$BestsellerBg2Img = 'ULTIMATUMControl_bestsellerBg2Img';
		if (isset($this->request->post[$BestsellerBg2Img])) {
			$this->data[$BestsellerBg2Img] = $this->request->post[$BestsellerBg2Img];
			$ULTIMATUMControl_bestsellerBg2Img = $this->request->post[$BestsellerBg2Img];
		} else {
			$this->data[$BestsellerBg2Img] = '';
		}
		
		$PreloadImg = 'ULTIMATUMControl_preloadImg';
		if (isset($this->request->post[$PreloadImg])) {
			$this->data[$PreloadImg] = $this->request->post[$PreloadImg];
			$ULTIMATUMControl_preloadImg = $this->request->post[$PreloadImg];
		} else {
			$this->data[$PreloadImg] = '';
		}
		
		$WelcomeBg1Img = 'ULTIMATUMControl_welcomeBg1Img';
		if (isset($this->request->post[$WelcomeBg1Img])) {
			$this->data[$WelcomeBg1Img] = $this->request->post[$WelcomeBg1Img];
			$ULTIMATUMControl_welcomeBg1Img = $this->request->post[$WelcomeBg1Img];
		} else {
			$this->data[$WelcomeBg1Img] = '';
		}	
		
		$WelcomeBg2Img = 'ULTIMATUMControl_welcomeBg2Img';
		if (isset($this->request->post[$WelcomeBg2Img])) {
			$this->data[$WelcomeBg2Img] = $this->request->post[$WelcomeBg2Img];
			$ULTIMATUMControl_welcomeBg2Img = $this->request->post[$WelcomeBg2Img];
		} else {
			$this->data[$WelcomeBg2Img] = '';
		}
		
		$IconboxesBg1Img = 'ULTIMATUMControl_iconboxesBg1Img';
		if (isset($this->request->post[$IconboxesBg1Img])) {
			$this->data[$IconboxesBg1Img] = $this->request->post[$IconboxesBg1Img];
			$ULTIMATUMControl_iconboxesBg1Img = $this->request->post[$IconboxesBg1Img];
		} else {
			$this->data[$IconboxesBg1Img] = '';
		}	
		
		$IconboxesBg2Img = 'ULTIMATUMControl_iconboxesBg2Img';
		if (isset($this->request->post[$IconboxesBg2Img])) {
			$this->data[$IconboxesBg2Img] = $this->request->post[$IconboxesBg2Img];
			$ULTIMATUMControl_iconboxesBg2Img = $this->request->post[$IconboxesBg2Img];
		} else {
			$this->data[$IconboxesBg2Img] = '';
		}
		
		$ULTIMATUMtabsBg1Img = 'ULTIMATUMControl_ULTIMATUMtabsBg1Img';
		if (isset($this->request->post[$ULTIMATUMtabsBg1Img])) {
			$this->data[$ULTIMATUMtabsBg1Img] = $this->request->post[$ULTIMATUMtabsBg1Img];
			$ULTIMATUMControl_ULTIMATUMtabsBg1Img = $this->request->post[$ULTIMATUMtabsBg1Img];
		} else {
			$this->data[$ULTIMATUMtabsBg1Img] = '';
		}	
		
		$ULTIMATUMtabsBg2Img = 'ULTIMATUMControl_ULTIMATUMtabsBg2Img';
		if (isset($this->request->post[$ULTIMATUMtabsBg2Img])) {
			$this->data[$ULTIMATUMtabsBg2Img] = $this->request->post[$ULTIMATUMtabsBg2Img];
			$ULTIMATUMControl_ULTIMATUMtabsBg2Img = $this->request->post[$ULTIMATUMtabsBg2Img];
		} else {
			$this->data[$ULTIMATUMtabsBg2Img] = '';
		}
		
		$ULTIMATUMaccordionBg1Img = 'ULTIMATUMControl_ULTIMATUMaccordionBg1Img';
		if (isset($this->request->post[$ULTIMATUMaccordionBg1Img])) {
			$this->data[$ULTIMATUMaccordionBg1Img] = $this->request->post[$ULTIMATUMaccordionBg1Img];
			$ULTIMATUMControl_ULTIMATUMaccordionBg1Img = $this->request->post[$ULTIMATUMaccordionBg1Img];
		} else {
			$this->data[$ULTIMATUMaccordionBg1Img] = '';
		}	
		
		$ULTIMATUMaccordionBg2Img = 'ULTIMATUMControl_ULTIMATUMaccordionBg2Img';
		if (isset($this->request->post[$ULTIMATUMaccordionBg2Img])) {
			$this->data[$ULTIMATUMaccordionBg2Img] = $this->request->post[$ULTIMATUMaccordionBg2Img];
			$ULTIMATUMControl_ULTIMATUMaccordionBg2Img = $this->request->post[$ULTIMATUMaccordionBg2Img];
		} else {
			$this->data[$ULTIMATUMaccordionBg2Img] = '';
		}
		
		$ULTIMATUMtoggleBg1Img = 'ULTIMATUMControl_ULTIMATUMtoggleBg1Img';
		if (isset($this->request->post[$ULTIMATUMtoggleBg1Img])) {
			$this->data[$ULTIMATUMtoggleBg1Img] = $this->request->post[$ULTIMATUMtoggleBg1Img];
			$ULTIMATUMControl_ULTIMATUMtoggleBg1Img = $this->request->post[$ULTIMATUMtoggleBg1Img];
		} else {
			$this->data[$ULTIMATUMtoggleBg1Img] = '';
		}	
		
		$ULTIMATUMtoggleBg2Img = 'ULTIMATUMControl_ULTIMATUMtoggleBg2Img';
		if (isset($this->request->post[$ULTIMATUMtoggleBg2Img])) {
			$this->data[$ULTIMATUMtoggleBg2Img] = $this->request->post[$ULTIMATUMtoggleBg2Img];
			$ULTIMATUMControl_ULTIMATUMtoggleBg2Img = $this->request->post[$ULTIMATUMtoggleBg2Img];
		} else {
			$this->data[$ULTIMATUMtoggleBg2Img] = '';
		}
		
		$SlideshowBg1Img = 'ULTIMATUMControl_slideshowBg1Img';
		if (isset($this->request->post[$SlideshowBg1Img])) {
			$this->data[$SlideshowBg1Img] = $this->request->post[$SlideshowBg1Img];
			$ULTIMATUMControl_slideshowBg1Img = $this->request->post[$SlideshowBg1Img];
		} else {
			$this->data[$SlideshowBg1Img] = '';
		}	
		
		$SlideshowBg2Img = 'ULTIMATUMControl_slideshowBg2Img';
		if (isset($this->request->post[$SlideshowBg2Img])) {
			$this->data[$SlideshowBg2Img] = $this->request->post[$SlideshowBg2Img];
			$ULTIMATUMControl_slideshowBg2Img = $this->request->post[$SlideshowBg2Img];
		} else {
			$this->data[$SlideshowBg2Img] = '';
		}
		
		$BannersBg1Img = 'ULTIMATUMControl_bannersBg1Img';
		if (isset($this->request->post[$BannersBg1Img])) {
			$this->data[$BannersBg1Img] = $this->request->post[$BannersBg1Img];
			$ULTIMATUMControl_bannersBg1Img = $this->request->post[$BannersBg1Img];
		} else {
			$this->data[$BannersBg1Img] = '';
		}	
		
		$BannersBg2Img = 'ULTIMATUMControl_bannersBg2Img';
		if (isset($this->request->post[$BannersBg2Img])) {
			$this->data[$BannersBg2Img] = $this->request->post[$BannersBg2Img];
			$ULTIMATUMControl_bannersBg2Img = $this->request->post[$BannersBg2Img];
		} else {
			$this->data[$BannersBg2Img] = '';
		}
		
		$SpecialBg1Img = 'ULTIMATUMControl_specialBg1Img';
		if (isset($this->request->post[$SpecialBg1Img])) {
			$this->data[$SpecialBg1Img] = $this->request->post[$SpecialBg1Img];
			$ULTIMATUMControl_specialBg1Img = $this->request->post[$SpecialBg1Img];
		} else {
			$this->data[$SpecialBg1Img] = '';
		}	
		
		$SpecialBg2Img = 'ULTIMATUMControl_specialBg2Img';
		if (isset($this->request->post[$SpecialBg2Img])) {
			$this->data[$SpecialBg2Img] = $this->request->post[$SpecialBg2Img];
			$ULTIMATUMControl_specialBg2Img = $this->request->post[$SpecialBg2Img];
		} else {
			$this->data[$SpecialBg2Img] = '';
		}	
		
		$HeaderBgImg = 'ULTIMATUMControl_HeaderBgImg';
		if (isset($this->request->post[$HeaderBgImg])) {
			$this->data[$HeaderBgImg] = $this->request->post[$HeaderBgImg];
			$ULTIMATUMControl_HeaderBgImg = $this->request->post[$HeaderBgImg];
		} else {
			$this->data[$HeaderBgImg] = '';
		}
		
		$FooterBgImg = 'ULTIMATUMControl_FooterBgImg';
		if (isset($this->request->post[$FooterBgImg])) {
			$this->data[$FooterBgImg] = $this->request->post[$FooterBgImg];
			$ULTIMATUMControl_FooterBgImg = $this->request->post[$FooterBgImg];
		} else {
			$this->data[$FooterBgImg] = '';
		}
		
		$this->document->addScript('view/javascript/jquery/colorpicker.js');
		$this->document->addScript('view/javascript/jquery/jquery.ibutton.min.js');
		$this->document->addStyle('view/stylesheet/css/colorpicker.css');
		$this->document->addStyle('view/stylesheet/css/ULTIMATUMControl.css');
		
		$this->data['text_general_settings'] = $this->language->get('text_general_settings');
		$this->data['text_menu_type'] = $this->language->get('text_menu_type');
		$this->data['map_module'] = $this->language->get('map_module');
		$this->data['text_longitude'] = $this->language->get('text_longitude');
		$this->data['text_latitude'] = $this->language->get('text_latitude');
		$this->data['text_map_helper'] = $this->language->get('text_map_helper');
		$this->data['text_site_mode'] = $this->language->get('text_site_mode');
		$this->data['text_mode_store'] = $this->language->get('text_mode_store');
		$this->data['text_mode_catalog'] = $this->language->get('text_mode_catalog');
		$this->data['text_header_settings'] = $this->language->get('text_header_settings');
		$this->data['text_layout_type'] = $this->language->get('text_layout_type');
		$this->data['text_layout_full'] = $this->language->get('text_layout_full');
		$this->data['text_layout_boxed'] = $this->language->get('text_layout_boxed');
		$this->data['text_footer_settings'] = $this->language->get('text_footer_settings');
		$this->data['text_content_settings'] = $this->language->get('text_content_settings');
		$this->data['text_common_colors'] = $this->language->get('text_common_colors');
		$this->data['text_titles_teasers'] = $this->language->get('text_titles_teasers');
		$this->data['text_category_link_hover_back'] = $this->language->get('text_category_link_hover_back');
		$this->data['text_fonts'] = $this->language->get('text_fonts');
		$this->data['text_social'] = $this->language->get('text_social');
		$this->data['text_icons'] = $this->language->get('text_icons');
		$this->data['text_color_helper'] = $this->language->get('text_color_helper');
		$this->data['text_body_color'] = $this->language->get('text_body_color');
		$this->data['text_header_color'] = $this->language->get('text_header_color');
		$this->data['text_body_pattern'] = $this->language->get('text_body_pattern');
		$this->data['text_header_pattern'] = $this->language->get('text_header_pattern');
		$this->data['text_footer_pattern'] = $this->language->get('text_footer_pattern');
		$this->data['text_default_value'] = $this->language->get('text_default_value');
		$this->data['text_pattern_samples'] = $this->language->get('text_pattern_samples');
		$this->data['text_headings_color'] = $this->language->get('text_headings_color');
		$this->data['text_body_text_color'] = $this->language->get('text_body_text_color');
		$this->data['text_right_column_background'] = $this->language->get('text_right_column_background');
		$this->data['text_right_column_titles'] = $this->language->get('text_right_column_titles');
		$this->data['text_links_color'] = $this->language->get('text_links_color');
		$this->data['text_links_hover_color'] = $this->language->get('text_links_hover_color');
		$this->data['text_buttons_color'] = $this->language->get('text_buttons_color');
		$this->data['text_buttons_hover_color'] = $this->language->get('text_buttons_hover_color');
		$this->data['text_new_color'] = $this->language->get('text_new_color');
		$this->data['text_save_color'] = $this->language->get('text_save_color');
		$this->data['text_cat_back'] = $this->language->get('text_cat_back');
		$this->data['text_cat_color'] = $this->language->get('text_cat_color');
		$this->data['text_breadcrumb_color'] = $this->language->get('text_breadcrumb_color');
		$this->data['text_box_border'] = $this->language->get('text_box_border');
		$this->data['text_header_top_color'] = $this->language->get('text_header_top_color');
		$this->data['text_box_featured_border'] = $this->language->get('text_box_featured_border');
		$this->data['text_menu_link_color'] = $this->language->get('text_menu_link_color');
		$this->data['text_menu_link_hover_color'] = $this->language->get('text_menu_link_hover_color');
		$this->data['text_drop_border'] = $this->language->get('text_drop_border');
		
		$this->data['text_category_link_color'] = $this->language->get('text_category_link_color');
		$this->data['text_category_link_hover_color'] = $this->language->get('text_category_link_hover_color');
		
		$this->data['text_menu_icon_back'] = $this->language->get('text_menu_icon_back');
		$this->data['text_cart_icon_back'] = $this->language->get('text_cart_icon_back');
		
		$this->data['text_footer_back_color'] = $this->language->get('text_footer_back_color');
		$this->data['text_footer_titles_color'] = $this->language->get('text_footer_titles_color');
		$this->data['text_footer_borders_color'] = $this->language->get('text_footer_borders_color');
		$this->data['text_pre_footer_back_color'] = $this->language->get('text_pre_footer_back_color');
		$this->data['text_pre_footer_titles_color'] = $this->language->get('text_pre_footer_titles_color');
		$this->data['text_pre_footer_titles_border'] = $this->language->get('text_pre_footer_titles_border');
		$this->data['text_copyright_back_color'] = $this->language->get('text_copyright_back_color');
		$this->data['text_copyright_text_color'] = $this->language->get('text_copyright_text_color');
		$this->data['text_footer_seals'] = $this->language->get('text_footer_seals');
		$this->data['text_footer_copyright'] = $this->language->get('text_footer_copyright');
		
		$this->data['text_titles_teasers_warning'] = $this->language->get('text_titles_teasers_warning');
		$this->data['text_titles_news_warning'] = $this->language->get('text_titles_news_warning');
		$this->data['text_titles_title'] = $this->language->get('text_titles_title');
		$this->data['text_titles_teaser'] = $this->language->get('text_titles_teaser');
		$this->data['text_titles_featured'] = $this->language->get('text_titles_featured');
		$this->data['text_titles_latest'] = $this->language->get('text_titles_latest');
		$this->data['text_titles_specials'] = $this->language->get('text_titles_specials');
		$this->data['text_titles_bestseller'] = $this->language->get('text_titles_bestseller');
		$this->data['text_titles_news'] = $this->language->get('text_titles_news');
		
		$this->data['text_font_settings'] = $this->language->get('text_font_settings');
		$this->data['text_headings_font'] = $this->language->get('text_headings_font');
		$this->data['text_body_font'] = $this->language->get('text_body_font');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_responsive'] = $this->language->get('text_responsive');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_countdown'] = $this->language->get('text_countdown');
		$this->data['text_news_link'] = $this->language->get('text_news_link');
		$this->data['text_specials_link'] = $this->language->get('text_specials_link');
		$this->data['text_rss_link'] = $this->language->get('text_rss_link');
		$this->data['text_opened'] = $this->language->get('text_opened');
		$this->data['text_hidden'] = $this->language->get('text_hidden');
		$this->data['text_new_label'] = $this->language->get('text_new_label');
		$this->data['text_css'] = $this->language->get('text_css');
		$this->data['text_skype_click'] = $this->language->get('text_skype_click');
		$this->data['text_map'] = $this->language->get('text_map');
		
		$this->data['ULTIMATUMControl_custom_menu_heading'] = $this->language->get('ULTIMATUMControl_custom_menu_heading');
		$this->data['ULTIMATUMControl_custom_menu_helper'] = $this->language->get('ULTIMATUMControl_custom_menu_helper');
		$this->data['ULTIMATUMControl_custom_menu'] = $this->language->get('ULTIMATUMControl_custom_menu');
		$this->data['ULTIMATUMControl_custom_title'] = $this->language->get('ULTIMATUMControl_custom_title');
		$this->data['ULTIMATUMControl_custom_link'] = $this->language->get('ULTIMATUMControl_custom_link');
		$this->data['ULTIMATUMControl_custom_submenu'] = $this->language->get('ULTIMATUMControl_custom_submenu');
		$this->data['text_opencart_menu'] = $this->language->get('text_opencart_menu');
		$this->data['text_ULTIMATUM_menu'] = $this->language->get('text_ULTIMATUM_menu');
		$this->data['text_menu_brands'] = $this->language->get('text_menu_brands');
		$this->data['text_product_page'] = $this->language->get('text_product_page');
		$this->data['text_zoom'] = $this->language->get('text_zoom');
		$this->data['text_colorbox'] = $this->language->get('text_colorbox');
		$this->data['text_preview_type'] = $this->language->get('text_preview_type');
		$this->data['text_cart_button_color'] = $this->language->get('text_cart_button_color');
		$this->data['text_wish_button_color'] = $this->language->get('text_wish_button_color');
		$this->data['text_compare_button_color'] = $this->language->get('text_compare_button_color');
		$this->data['text_main_price'] = $this->language->get('text_main_price');
		$this->data['text_old_price'] = $this->language->get('text_old_price');
		
		$this->data['text_headings1_size'] = $this->language->get('text_headings1_size');
		$this->data['text_headings2_size'] = $this->language->get('text_headings2_size');
		$this->data['text_headings3_size'] = $this->language->get('text_headings3_size');
		$this->data['text_headings4_size'] = $this->language->get('text_headings4_size');
		
		$this->data['text_price_size'] = $this->language->get('text_price_size');
		$this->data['text_module_title_size'] = $this->language->get('text_module_title_size');
		$this->data['text_column_title_size'] = $this->language->get('text_column_title_size');
		$this->data['text_category_item_size'] = $this->language->get('text_category_item_size');
		
		$this->data['text_custom_font'] = $this->language->get('text_custom_font');
		$this->data['text_custom_font_code'] = $this->language->get('text_custom_font_code');
		$this->data['text_custom_font_family'] = $this->language->get('text_custom_font_family');
		$this->data['text_blog_link'] = $this->language->get('text_blog_link');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ULTIMATUMControl', $this->request->post);	

				
					
			$this->session->data['success'] = $this->language->get('text_success');
		
						
			if(isset( $this->request->get['exit'])){
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}else{
				$this->redirect($this->url->link('module/ULTIMATUMControl', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
		
			$this->data['text_image_manager'] = 'Image manager';
			$this->data['token'] = $this->session->data['token'];		
		
		$text_strings = array(
				'heading_title',
				'text_enabled',
				'text_disabled',
				'text_content_top',
				'text_content_bottom',
				'text_column_left',
				'text_column_right',
				'entry_layout',
				'entry_position',
				'entry_status',
				'entry_sort_order',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
				'entry_example' 
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		
		
		$config_data = array(
		'ULTIMATUMControl_status',
		'ULTIMATUMControl_menuthumb',
		'ULTIMATUMControl_preload',
		'ULTIMATUMControl_preloadImg',
		'ULTIMATUMControl_preloadImg_preview',
		'ULTIMATUMControl_featured_background_color',
		'ULTIMATUMControl_featured_title_color',
		'ULTIMATUMControl_latest_background_color',
		'ULTIMATUMControl_tabbed_background_color',
		'ULTIMATUMControl_latest_title_color',
		'ULTIMATUMControl_bestseller_background_color',
		'ULTIMATUMControl_category_menu_hover_background',
		'ULTIMATUMControl_bestseller_title_color',
		'ULTIMATUMControl_special_background_color',
		'ULTIMATUMControl_special_title_color',		
		'ULTIMATUMControl_deal_background_color',
		'ULTIMATUMControl_deal_title_color',		
		'ULTIMATUMControl_welcome_background_color',
		'ULTIMATUMControl_welcome_title_color',
		'ULTIMATUMControl_ULTIMATUMtabs_title_color',
		'ULTIMATUMControl_ULTIMATUMtabs_background_color',
		'ULTIMATUMControl_ULTIMATUMtoggle_title_color',
		'ULTIMATUMControl_ULTIMATUMtoggle_background_color',
		'ULTIMATUMControl_ULTIMATUMaccordion_title_color',
		'ULTIMATUMControl_ULTIMATUMaccordion_background_color',
		'ULTIMATUMControl_iconboxes_background_color',
		'ULTIMATUMControl_iconboxes_title_color',
		'ULTIMATUMControl_banners_background_color',
		'ULTIMATUMControl_banners_title_color',
		'ULTIMATUMControl_slideshow_background_color',
		'ULTIMATUMControl_iconboxes_icon_color',
		'ULTIMATUMControl_blog_link',
		'ULTIMATUMControl_layout',
		'ULTIMATUMControl_skin',
		'ULTIMATUMControl_site_mode',
		'ULTIMATUMControl_menu_position',
		'ULTIMATUMControl_prod_name_color',
		'ULTIMATUMControl_prod_hold_back',
		'ULTIMATUMControl_preheader',
		'ULTIMATUMControl_countdown',
		'ULTIMATUMControl_countdown_sold',
		'ULTIMATUMControl_header_back_position',
		'ULTIMATUMControl_footer_back_position',
		'ULTIMATUMControl_news_link',
		'ULTIMATUMControl_specials_link',
		'ULTIMATUMControl_information_link',
		'ULTIMATUMControl_contact_link',
		'ULTIMATUMControl_account_link',
		'ULTIMATUMControl_curlang_link',
		'ULTIMATUMControl_top_menu',
		'ULTIMATUMControl_new_label',
		'ULTIMATUMControl_custom_css',
		'ULTIMATUMControl_headings_color',
		'ULTIMATUMControl_module_headings_background',
		'ULTIMATUMControl_module_headings_color',
		'ULTIMATUMControl_top_links_hover_color',
		'ULTIMATUMControl_top_links_hover_background',
		'ULTIMATUMControl_text_color',
		'ULTIMATUMControl_links_color',
		'ULTIMATUMControl_links_color_hover',
		'ULTIMATUMControl_main_menu_color',
		'ULTIMATUMControl_cur_color',
		'ULTIMATUMControl_cur_hover_color',
		'ULTIMATUMControl_main_menu_hover_color',
		'ULTIMATUMControl_main_menu_hover_back',
		'ULTIMATUMControl_category_menu_color',
		'ULTIMATUMControl_category_menu_hover_color',
		'ULTIMATUMControl_menu_icon_back',
		'ULTIMATUMControl_cart_icon_back',
		'ULTIMATUMControl_powered_bg',
		'ULTIMATUMControl_powered_text',
		'ULTIMATUMControl_prefooter_borders',
		'ULTIMATUMControl_map_status',
		'ULTIMATUMControl_latitude',
		'ULTIMATUMControl_longitude',
		'ULTIMATUMControl_body_bg_color',
		'ULTIMATUMControl_header_bg_color',
		'ULTIMATUMControl_body_bg_pattern',
		'ULTIMATUMControl_header_bg_pattern',
		'ULTIMATUMControl_prefooter_titles',
		'ULTIMATUMControl_container_bg_color',
		'ULTIMATUMControl_footer_bg_color',
		'ULTIMATUMControl_header_top_color',
		'ULTIMATUMControl_header_top_border',
		'ULTIMATUMControl_header_top_back',
		'ULTIMATUMControl_menu_bar_background',
		'ULTIMATUMControl_menu_bar_border_top',
		'ULTIMATUMControl_menu_bar_border_bottom',
		'ULTIMATUMControl_menu_bar_border_top_thicknes',
		'ULTIMATUMControl_menu_bar_border_bottom_thicknes',
		'ULTIMATUMControl_video_mask',
		'ULTIMATUMControl_content_background_color',
		'ULTIMATUMControl_content_bg_pattern',
		'ULTIMATUMControl_category_menu_bg',
		'ULTIMATUMControl_prefooter_bg',
		'ULTIMATUMControl_column_box_color',
		'ULTIMATUMControl_column_box_title',
		'ULTIMATUMControl_footer_link_color',
		'ULTIMATUMControl_footer_link_border',
		'ULTIMATUMControl_old_price_color',
		'ULTIMATUMControl_main_price_color',
		'ULTIMATUMControl_cart_button_color',
		'ULTIMATUMControl_wish_button_color',
		'ULTIMATUMControl_compare_button_color',
		'ULTIMATUMControl_buttons_color_hover',
		'ULTIMATUMControl_new_label_color',
		'ULTIMATUMControl_cat_title_background',
		'ULTIMATUMControl_cat_title_color',
		'ULTIMATUMControl_breadcrumb_color',
		'ULTIMATUMControl_boxtop_border',
		'ULTIMATUMControl_Featuredtop_border',
		'ULTIMATUMControl_map',
		'ULTIMATUMControl_save_label_color',
		'ULTIMATUMControl_buttons_color',
		'ULTIMATUMControl_featured_custom_title',
		'ULTIMATUMControl_featured_custom_teaser',
		'ULTIMATUMControl_latest_custom_title',
		'ULTIMATUMControl_latest_custom_teaser',
		'ULTIMATUMControl_specials_custom_title',
		'ULTIMATUMControl_specials_custom_teaser',
		'ULTIMATUMControl_bestseller_custom_title',
		'ULTIMATUMControl_bestseller_custom_teaser',
		'ULTIMATUMControl_news_custom_teaser',
		'ULTIMATUMControl_rss_link',
		'ULTIMATUMControl_headings_font',
		'ULTIMATUMControl_body_font',
		'ULTIMATUMControl_twitter_id',
		'ULTIMATUMControl_facebook_id',
		'ULTIMATUMControl_pinterest_id',
		'ULTIMATUMControl_google_id',
		'ULTIMATUMControl_youtube_id',
		'ULTIMATUMControl_vimeo_id',
		'ULTIMATUMControl_linkedin_id',
		'ULTIMATUMControl_dribble_id',
		'ULTIMATUMControl_skype_id',
		'ULTIMATUMControl_picasa_id',
		'ULTIMATUMControl_flickr_id',
		'ULTIMATUMControl_instagram_id',
		'ULTIMATUMControl_western',
		'ULTIMATUMControl_switch',
		'ULTIMATUMControl_solo',
		'ULTIMATUMControl_sage',
		'ULTIMATUMControl_moneybookers',
		'ULTIMATUMControl_google',
		'ULTIMATUMControl_discover',
		'ULTIMATUMControl_delta',
		'ULTIMATUMControl_2checkout',
		'ULTIMATUMControl_cirrus',
		'ULTIMATUMControl_american',
		'ULTIMATUMControl_maestro',
		'ULTIMATUMControl_master',
		'ULTIMATUMControl_electron',
		'ULTIMATUMControl_visa',
		'ULTIMATUMControl_paypal',
		'ULTIMATUMControl_seals',
		'ULTIMATUMControl_copyright',
		'ULTIMATUMControl_custom_contact',
		'ULTIMATUMControl_custom_menu_1',
		'ULTIMATUMControl_custom_menu_1_state',
		'ULTIMATUMControl_custom_link_1',
		'ULTIMATUMControl_custom_submenu_1',
		'ULTIMATUMControl_custom_menu_2',
		'ULTIMATUMControl_custom_menu_2_state',
		'ULTIMATUMControl_custom_link_2',
		'ULTIMATUMControl_custom_submenu_2',
		'ULTIMATUMControl_custom_menu_3',
		'ULTIMATUMControl_custom_menu_3_state',
		'ULTIMATUMControl_custom_link_3',
		'ULTIMATUMControl_custom_submenu_3',
		'ULTIMATUMControl_custom_menu_4',
		'ULTIMATUMControl_custom_menu_4_state',
		'ULTIMATUMControl_custom_link_4',
		'ULTIMATUMControl_custom_submenu_4',
		'ULTIMATUMControl_custom_menu_5',
		'ULTIMATUMControl_custom_menu_5_state',
		'ULTIMATUMControl_custom_link_5',
		'ULTIMATUMControl_custom_submenu_5',
		'ULTIMATUMControl_custom_menu_6',
		'ULTIMATUMControl_custom_menu_6_state',
		'ULTIMATUMControl_custom_link_6',
		'ULTIMATUMControl_custom_submenu_6',
		'ULTIMATUMControl_preview',
		'ULTIMATUMControl_brands',
		'ULTIMATUMControl_brands',
		'ULTIMATUMControl_drop_border',
		'ULTIMATUMControl_headings1_size',
		'ULTIMATUMControl_headings2_size',
		'ULTIMATUMControl_headings3_size',
		'ULTIMATUMControl_headings4_size',
		'ULTIMATUMControl_price_size',
		'ULTIMATUMControl_module_title_size',
		'ULTIMATUMControl_column_title_size',
		'ULTIMATUMControl_category_item_size',
		'ULTIMATUMControl_custom_font',
		'ULTIMATUMControl_custom_font_family',
		'ULTIMATUMControl_cat_custom_top',
		'ULTIMATUMControl_cat_custom_bottom',
		'ULTIMATUMControl_brand_custom_top',
		'ULTIMATUMControl_brand_custom_bottom',
		'ULTIMATUMControl_countdown_color',
		'ULTIMATUMControl_play_sound',
		'ULTIMATUMControl_custom_column',
		'ULTIMATUMControl_custom_column_logo',
		'ULTIMATUMControl_sticky_menu',
		'ULTIMATUMControl_bodyBgImg',
		'ULTIMATUMControl_bodyBgImg_preview',
		'ULTIMATUMControl_featuredBg1Img',
		'ULTIMATUMControl_featuredBg1Img_preview',
		'ULTIMATUMControl_featuredBg2Img',
		'ULTIMATUMControl_featuredBg2Img_preview',		
		'ULTIMATUMControl_latestBg1Img',
		'ULTIMATUMControl_latestBg1Img_preview',
		'ULTIMATUMControl_latestBg2Img',
		'ULTIMATUMControl_latestBg2Img_preview',
		'ULTIMATUMControl_tabbedBg1Img',
		'ULTIMATUMControl_tabbedBg1Img_preview',
		'ULTIMATUMControl_tabbedBg2Img',
		'ULTIMATUMControl_tabbedBg2Img_preview',		
		'ULTIMATUMControl_specialBg1Img',
		'ULTIMATUMControl_specialBg1Img_preview',
		'ULTIMATUMControl_specialBg2Img',
		'ULTIMATUMControl_specialBg2Img_preview',		
		'ULTIMATUMControl_bestsellerBg1Img',
		'ULTIMATUMControl_bestsellerBg1Img_preview',
		'ULTIMATUMControl_bestsellerBg2Img',
		'ULTIMATUMControl_bestsellerBg2Img_preview',
		'ULTIMATUMControl_welcomeBg1Img',
		'ULTIMATUMControl_welcomeBg1Img_preview',
		'ULTIMATUMControl_welcomeBg2Img',
		'ULTIMATUMControl_welcomeBg2Img_preview',		
		'ULTIMATUMControl_dealBg1Img',
		'ULTIMATUMControl_dealBg1Img_preview',
		'ULTIMATUMControl_dealBg2Img',
		'ULTIMATUMControl_dealBg2Img_preview',		
		'ULTIMATUMControl_ULTIMATUMtabsBg1Img',
		'ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview',
		'ULTIMATUMControl_ULTIMATUMtabsBg2Img',
		'ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview',
		'ULTIMATUMControl_ULTIMATUMaccordionBg1Img',
		'ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview',
		'ULTIMATUMControl_ULTIMATUMaccordionBg2Img',
		'ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview',
		'ULTIMATUMControl_ULTIMATUMtoggleBg1Img',
		'ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview',
		'ULTIMATUMControl_ULTIMATUMtoggleBg2Img',
		'ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview',
		'ULTIMATUMControl_iconboxesBg1Img',
		'ULTIMATUMControl_iconboxesBg1Img_preview',
		'ULTIMATUMControl_iconboxesBg2Img',
		'ULTIMATUMControl_iconboxesBg2Img_preview',		
		'ULTIMATUMControl_slideshowBg1Img',
		'ULTIMATUMControl_slideshowBg1Img_preview',
		'ULTIMATUMControl_slideshowBg2Img',
		'ULTIMATUMControl_slideshowBg2Img_preview',
		'ULTIMATUMControl_bannersBg1Img',
		'ULTIMATUMControl_bannersBg1Img_preview',
		'ULTIMATUMControl_bannersBg2Img',
		'ULTIMATUMControl_bannersBg2Img_preview',								
		'ULTIMATUMControl_HeaderBgImg',
		'ULTIMATUMControl_HeaderBgImg_preview',
		'ULTIMATUMControl_FooterBgImg',
		'ULTIMATUMControl_footer_bg_pattern',
		'ULTIMATUMControl_FooterBgImg_preview',
		'ULTIMATUMControl_featured_mode',
		'ULTIMATUMControl_featured_hover_mode',
		'ULTIMATUMControl_featured_name_display',
		'ULTIMATUMControl_featured_price_display',
		'ULTIMATUMControl_featured_rating_display',
		'ULTIMATUMControl_featured_cart_display',
		'ULTIMATUMControl_latest_hover_mode',
		'ULTIMATUMControl_sort_hover_mode',
		'ULTIMATUMControl_sort_flydesc_mode',
		'ULTIMATUMControl_featured_flydesc_mode',
		'ULTIMATUMControl_latest_flydesc_mode',
		'ULTIMATUMControl_deal_flydesc_mode',
		'ULTIMATUMControl_bestseller_flydesc_mode',
		'ULTIMATUMControl_special_flydesc_mode',
		'ULTIMATUMControl_listing_flydesc_mode',
		'ULTIMATUMControl_latest_name_display',
		'ULTIMATUMControl_latest_price_display',
		'ULTIMATUMControl_latest_rating_display',
		'ULTIMATUMControl_latest_cart_display',
		'ULTIMATUMControl_special_hover_mode',
		'ULTIMATUMControl_special_name_display',
		'ULTIMATUMControl_special_price_display',
		'ULTIMATUMControl_special_rating_display',
		'ULTIMATUMControl_special_cart_display',
		'ULTIMATUMControl_bestseller_hover_mode',
		'ULTIMATUMControl_bestseller_name_display',
		'ULTIMATUMControl_bestseller_price_display',
		'ULTIMATUMControl_bestseller_rating_display',
		'ULTIMATUMControl_bestseller_cart_display',
		'ULTIMATUMControl_listing_hover_mode',
		'ULTIMATUMControl_listing_name_display',
		'ULTIMATUMControl_listing_price_display',
		'ULTIMATUMControl_listing_rating_display',
		'ULTIMATUMControl_listing_cart_display',
		'ULTIMATUMControl_additional_image_mode',
		'ULTIMATUMControl_latest_mode',
		'ULTIMATUMControl_header_support_mode',
		'ULTIMATUMControl_header_support_mail',
		'ULTIMATUMControl_header_support_phone',
		'ULTIMATUMControl_special_mode',
		'ULTIMATUMControl_bestseller_mode',
		'ULTIMATUMControl_banner_title_mode',
		'ULTIMATUMControl_banner_name_mode',
		'ULTIMATUMControl_iconboxes_video',
		'ULTIMATUMControl_iconboxes_video_start',
		'ULTIMATUMControl_deal_video',
		'ULTIMATUMControl_deal_video_start',
		'ULTIMATUMControl_tabbed_video',
		'ULTIMATUMControl_tabbed_video_start',
		'ULTIMATUMControl_featured_video',
		'ULTIMATUMControl_featured_video_start',
		'ULTIMATUMControl_latest_video',
		'ULTIMATUMControl_latest_video_start',
		'ULTIMATUMControl_special_video',
		'ULTIMATUMControl_special_video_start',
		'ULTIMATUMControl_bestseller_video',
		'ULTIMATUMControl_bestseller_video_start',
		'ULTIMATUMControl_welcome_video',
		'ULTIMATUMControl_welcome_video_start',
		'ULTIMATUMControl_slideshow_video',
		'ULTIMATUMControl_slideshow_video_start',
		'ULTIMATUMControl_banners_video',
		'ULTIMATUMControl_banners_video_start',
		'ULTIMATUMControl_ULTIMATUMtabs_video',
		'ULTIMATUMControl_ULTIMATUMtabs_video_start',
		'ULTIMATUMControl_ULTIMATUMaccordion_video',
		'ULTIMATUMControl_ULTIMATUMaccordion_video_start',
		'ULTIMATUMControl_ULTIMATUMtoggle_video',
		'ULTIMATUMControl_ULTIMATUMtoggle_video_start',
		'ULTIMATUMControl_cat1_label',
		'ULTIMATUMControl_cat2_label',
		'ULTIMATUMControl_cat3_label',
		'ULTIMATUMControl_cat4_label',
		'ULTIMATUMControl_cat5_label',
		'ULTIMATUMControl_cat6_label',
		'ULTIMATUMControl_cat7_label',
		'ULTIMATUMControl_cat8_label',
		'ULTIMATUMControl_cat9_label',
		'ULTIMATUMControl_cat10_label',
		'ULTIMATUMControl_cat11_label',
		'ULTIMATUMControl_cat12_label',
		'ULTIMATUMControl_cat13_label',
		'ULTIMATUMControl_cat14_label',
		'ULTIMATUMControl_cat15_label',
		'ULTIMATUMControl_cat1_color',
		'ULTIMATUMControl_cat2_color',
		'ULTIMATUMControl_cat3_color',
		'ULTIMATUMControl_cat4_color',
		'ULTIMATUMControl_cat5_color',
		'ULTIMATUMControl_cat6_color',
		'ULTIMATUMControl_cat7_color',
		'ULTIMATUMControl_cat8_color',
		'ULTIMATUMControl_cat9_color',
		'ULTIMATUMControl_cat10_color',
		'ULTIMATUMControl_cat11_color',
		'ULTIMATUMControl_cat12_color',
		'ULTIMATUMControl_cat13_color',
		'ULTIMATUMControl_cat14_color',
		'ULTIMATUMControl_cat15_color',
		'ULTIMATUMControl_submenu_columns',
		'ULTIMATUMControl_brandmenu_columns',
		'ULTIMATUMControl_shop_cats_background',
		'ULTIMATUMControl_shop_cats_color',
		'ULTIMATUMControl_logo_position',
		'ULTIMATUMControl_pagetitle_title_color',
		'ULTIMATUMControl_wish_status',
		'ULTIMATUMControl_compare_status',
		'ULTIMATUMControl_account_status',
		'ULTIMATUMControl_affiliate_status',
		'ULTIMATUMControl_newsletter_status',
		'ULTIMATUMControl_default_cat_color',
		'ULTIMATUMControl_default_cat_hover_color',
		'ULTIMATUMControl_header_cms_block',
		'ULTIMATUMControl_header_cms_block_state',
		'ULTIMATUMControl_header_cms_block_background',
		'ULTIMATUMControl_header_cms_block_color',
		'ULTIMATUMControl_header_cms_button_color',
		'ULTIMATUMControl_product1_cms_block',
		'ULTIMATUMControl_product1_cms_block_state',
		'ULTIMATUMControl_product1_cms_block_background',
		'ULTIMATUMControl_product1_cms_block_color',
		'ULTIMATUMControl_product1_cms_button_color',
		'ULTIMATUMControl_product2_cms_block',
		'ULTIMATUMControl_product2_cms_block_state',
		'ULTIMATUMControl_product2_cms_block_background',
		'ULTIMATUMControl_product2_cms_block_color',
		'ULTIMATUMControl_product2_cms_button_color',
		'ULTIMATUMControl_cat_desc_status',
		'ULTIMATUMControl_cat_refine_status',
		'ULTIMATUMControl_cat_refine_images',
		'ULTIMATUMControl_cat_refine_image_size_w',
		'ULTIMATUMControl_cat_refine_image_size_h',
		'ULTIMATUMControl_cat_sort_color',
		'ULTIMATUMControl_cat_sort_back',
		'ULTIMATUMControl_custom_top_link_1',
		'ULTIMATUMControl_custom_top_link_2',
		'ULTIMATUMControl_custom_top_link_3',
		'ULTIMATUMControl_product_share_mode',
		'ULTIMATUMControl_pop_log_status',
		'ULTIMATUMControl_responsive'			
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
			}
		}
		
		
		
	

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/ULTIMATUMControl', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/ULTIMATUMControl', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

	

		if (isset($this->request->post['ULTIMATUMControl_module'])) {
			$modules = explode(',', $this->request->post['ULTIMATUMControl_module']);
		} elseif ($this->config->get('ULTIMATUMControl_module') != '') {
			$modules = explode(',', $this->config->get('ULTIMATUMControl_module'));
		} else {
			$modules = array();
		}			
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['ULTIMATUMControl_' . $module . '_layout_id'])) {
				$this->data['ULTIMATUMControl_' . $module . '_layout_id'] = $this->request->post['ULTIMATUMControl_' . $module . '_layout_id'];
			} else {
				$this->data['ULTIMATUMControl_' . $module . '_layout_id'] = $this->config->get('ULTIMATUMControl_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['ULTIMATUMControl_' . $module . '_position'])) {
				$this->data['ULTIMATUMControl_' . $module . '_position'] = $this->request->post['ULTIMATUMControl_' . $module . '_position'];
			} else {
				$this->data['ULTIMATUMControl_' . $module . '_position'] = $this->config->get('ULTIMATUMControl_' . $module . '_position');
			}	
			
			if (isset($this->request->post['ULTIMATUMControl_' . $module . '_status'])) {
				$this->data['ULTIMATUMControl_' . $module . '_status'] = $this->request->post['ULTIMATUMControl_' . $module . '_status'];
			} else {
				$this->data['ULTIMATUMControl_' . $module . '_status'] = $this->config->get('ULTIMATUMControl_' . $module . '_status');
			}	
						
			if (isset($this->request->post['ULTIMATUMControl_' . $module . '_sort_order'])) {
				$this->data['ULTIMATUMControl_' . $module . '_sort_order'] = $this->request->post['ULTIMATUMControl_' . $module . '_sort_order'];
			} else {
				$this->data['ULTIMATUMControl_' . $module . '_sort_order'] = $this->config->get('ULTIMATUMControl_' . $module . '_sort_order');
			}				
		}
		

		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['ULTIMATUMControl_module'])) {
			$this->data['ULTIMATUMControl_module'] = $this->request->post['ULTIMATUMControl_module'];
		} else {
			$this->data['ULTIMATUMControl_module'] = $this->config->get('ULTIMATUMControl_module');
		}

		$this->template = 'module/ULTIMATUMControl.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_1' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_2' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_2' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_2' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_2' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_2' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_3' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_3' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_3' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_3' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_3' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_4' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_4' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_4' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_4' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_4' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_5' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_5' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_5' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_5' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_5' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_6' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_6' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_6' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_6' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_6' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_1' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_2' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_2' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_2' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_2' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_2' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_3' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_3' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_3' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_3' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_3' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_4' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_4' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_4' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_4' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_4' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_5' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_5' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_5' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_5' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_5' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_submenu_6' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_submenu_6' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_submenu_6' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_submenu_6' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_submenu_6' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_custom_contact' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_contact' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_contact' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_contact' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_contact' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_seals' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_seals' . $language['language_id']] = $this->request->post['ULTIMATUMControl_seals' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_seals' . $language['language_id']] = $this->config->get('ULTIMATUMControl_seals' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_header_cms_block_content_1' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_product1_cms_block_content_1' . $language['language_id']);
			}
			
			if (isset($this->request->post['ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_product2_cms_block_content_1' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_top_1' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_top_1' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_top_1' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_top_1' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_top_1' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_top_2' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_top_2' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_top_2' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_top_2' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_top_2' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_custom_menu_top_3' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_custom_menu_top_3' . $language['language_id']] = $this->request->post['ULTIMATUMControl_custom_menu_top_3' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_custom_menu_top_3' . $language['language_id']] = $this->config->get('ULTIMATUMControl_custom_menu_top_3' . $language['language_id']);
			}
			if (isset($this->request->post['ULTIMATUMControl_menu_label' . $language['language_id']])) {
				$this->data['ULTIMATUMControl_menu_label' . $language['language_id']] = $this->request->post['ULTIMATUMControl_menu_label' . $language['language_id']];
			} else {
				$this->data['ULTIMATUMControl_menu_label' . $language['language_id']] = $this->config->get('ULTIMATUMControl_menu_label' . $language['language_id']);
			}
			
		}
		
		// BODY BG IMAGE PREVIEW
		$BodyBgImg_Preview = 'ULTIMATUMControl_bodyBgImg_preview';
		if (isset($this->data[$BodyBgImg]) && $this->data[$BodyBgImg] != "" && file_exists(DIR_IMAGE . $this->data[$BodyBgImg])) {
			$this->data[$BodyBgImg_Preview] = $this->model_tool_image->resize($this->data[$BodyBgImg], 100, 100);
		} else {
			$this->data[$BodyBgImg_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// HEADER BG IMAGE PREVIEW
		$HeaderBgImg_Preview = 'ULTIMATUMControl_HeaderBgImg_preview';
		if (isset($this->data[$HeaderBgImg]) && $this->data[$HeaderBgImg] != "" && file_exists(DIR_IMAGE . $this->data[$HeaderBgImg])) {
			$this->data[$HeaderBgImg_Preview] = $this->model_tool_image->resize($this->data[$HeaderBgImg], 100, 100);
		} else {
			$this->data[$HeaderBgImg_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// FOOTER BG IMAGE PREVIEW
		$FooterBgImg_Preview = 'ULTIMATUMControl_FooterBgImg_preview';
		if (isset($this->data[$FooterBgImg]) && $this->data[$FooterBgImg] != "" && file_exists(DIR_IMAGE . $this->data[$FooterBgImg])) {
			$this->data[$FooterBgImg_Preview] = $this->model_tool_image->resize($this->data[$FooterBgImg], 100, 100);
		} else {
			$this->data[$FooterBgImg_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// FEATURED PARALAX 1
		$FeaturedBg1Img_Preview = 'ULTIMATUMControl_featuredBg1Img_preview';
		if (isset($this->data[$FeaturedBg1Img]) && $this->data[$FeaturedBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$FeaturedBg1Img])) {
			$this->data[$FeaturedBg1Img_Preview] = $this->model_tool_image->resize($this->data[$FeaturedBg1Img], 100, 100);
		} else {
			$this->data[$FeaturedBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// FEATURED PARALAX 2
		$FeaturedBg2Img_Preview = 'ULTIMATUMControl_featuredBg2Img_preview';
		if (isset($this->data[$FeaturedBg2Img]) && $this->data[$FeaturedBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$FeaturedBg2Img])) {
			$this->data[$FeaturedBg2Img_Preview] = $this->model_tool_image->resize($this->data[$FeaturedBg2Img], 100, 100);
		} else {
			$this->data[$FeaturedBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Latest PARALAX 1
		$LatestBg1Img_Preview = 'ULTIMATUMControl_latestBg1Img_preview';
		if (isset($this->data[$LatestBg1Img]) && $this->data[$LatestBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$LatestBg1Img])) {
			$this->data[$LatestBg1Img_Preview] = $this->model_tool_image->resize($this->data[$LatestBg1Img], 100, 100);
		} else {
			$this->data[$LatestBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Latest PARALAX 2
		$LatestBg2Img_Preview = 'ULTIMATUMControl_latestBg2Img_preview';
		if (isset($this->data[$LatestBg2Img]) && $this->data[$LatestBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$LatestBg2Img])) {
			$this->data[$LatestBg2Img_Preview] = $this->model_tool_image->resize($this->data[$LatestBg2Img], 100, 100);
		} else {
			$this->data[$LatestBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Tabbed PARALAX 1
		$TabbedBg1Img_Preview = 'ULTIMATUMControl_tabbedBg1Img_preview';
		if (isset($this->data[$TabbedBg1Img]) && $this->data[$TabbedBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$TabbedBg1Img])) {
			$this->data[$TabbedBg1Img_Preview] = $this->model_tool_image->resize($this->data[$TabbedBg1Img], 100, 100);
		} else {
			$this->data[$TabbedBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Tabbed PARALAX 2
		$TabbedBg2Img_Preview = 'ULTIMATUMControl_tabbedBg2Img_preview';
		if (isset($this->data[$TabbedBg2Img]) && $this->data[$TabbedBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$TabbedBg2Img])) {
			$this->data[$TabbedBg2Img_Preview] = $this->model_tool_image->resize($this->data[$TabbedBg2Img], 100, 100);
		} else {
			$this->data[$TabbedBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Deal PARALAX 1
		$DealBg1Img_Preview = 'ULTIMATUMControl_dealBg1Img_preview';
		if (isset($this->data[$DealBg1Img]) && $this->data[$DealBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$DealBg1Img])) {
			$this->data[$DealBg1Img_Preview] = $this->model_tool_image->resize($this->data[$DealBg1Img], 100, 100);
		} else {
			$this->data[$DealBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Deal PARALAX 2
		$DealBg2Img_Preview = 'ULTIMATUMControl_dealBg2Img_preview';
		if (isset($this->data[$DealBg2Img]) && $this->data[$DealBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$DealBg2Img])) {
			$this->data[$DealBg2Img_Preview] = $this->model_tool_image->resize($this->data[$DealBg2Img], 100, 100);
		} else {
			$this->data[$DealBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Special PARALAX 1
		$SpecialBg1Img_Preview = 'ULTIMATUMControl_specialBg1Img_preview';
		if (isset($this->data[$SpecialBg1Img]) && $this->data[$SpecialBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$SpecialBg1Img])) {
			$this->data[$SpecialBg1Img_Preview] = $this->model_tool_image->resize($this->data[$SpecialBg1Img], 100, 100);
		} else {
			$this->data[$SpecialBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Special PARALAX 2
		$SpecialBg2Img_Preview = 'ULTIMATUMControl_specialBg2Img_preview';
		if (isset($this->data[$SpecialBg2Img]) && $this->data[$SpecialBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$SpecialBg2Img])) {
			$this->data[$SpecialBg2Img_Preview] = $this->model_tool_image->resize($this->data[$SpecialBg2Img], 100, 100);
		} else {
			$this->data[$SpecialBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Bestseller PARALAX 1
		$BestsellerBg1Img_Preview = 'ULTIMATUMControl_bestsellerBg1Img_preview';
		if (isset($this->data[$BestsellerBg1Img]) && $this->data[$BestsellerBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$BestsellerBg1Img])) {
			$this->data[$BestsellerBg1Img_Preview] = $this->model_tool_image->resize($this->data[$BestsellerBg1Img], 100, 100);
		} else {
			$this->data[$BestsellerBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Bestseller PARALAX 2
		$BestsellerBg2Img_Preview = 'ULTIMATUMControl_bestsellerBg2Img_preview';
		if (isset($this->data[$BestsellerBg2Img]) && $this->data[$BestsellerBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$BestsellerBg2Img])) {
			$this->data[$BestsellerBg2Img_Preview] = $this->model_tool_image->resize($this->data[$BestsellerBg2Img], 100, 100);
		} else {
			$this->data[$BestsellerBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Preload image
		$PreloadImg_Preview = 'ULTIMATUMControl_preloadImg_preview';
		if (isset($this->data[$PreloadImg]) && $this->data[$PreloadImg] != "" && file_exists(DIR_IMAGE . $this->data[$PreloadImg])) {
			$this->data[$PreloadImg_Preview] = $this->model_tool_image->resize($this->data[$PreloadImg], 100, 100);
		} else {
			$this->data[$PreloadImg_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Welcome PARALAX 1
		$WelcomeBg1Img_Preview = 'ULTIMATUMControl_welcomeBg1Img_preview';
		if (isset($this->data[$WelcomeBg1Img]) && $this->data[$WelcomeBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$WelcomeBg1Img])) {
			$this->data[$WelcomeBg1Img_Preview] = $this->model_tool_image->resize($this->data[$WelcomeBg1Img], 100, 100);
		} else {
			$this->data[$WelcomeBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Welcome PARALAX 2
		$WelcomeBg2Img_Preview = 'ULTIMATUMControl_welcomeBg2Img_preview';
		if (isset($this->data[$WelcomeBg2Img]) && $this->data[$WelcomeBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$WelcomeBg2Img])) {
			$this->data[$WelcomeBg2Img_Preview] = $this->model_tool_image->resize($this->data[$WelcomeBg2Img], 100, 100);
		} else {
			$this->data[$WelcomeBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMtabs PARALAX 1
		$ULTIMATUMtabsBg1Img_Preview = 'ULTIMATUMControl_ULTIMATUMtabsBg1Img_preview';
		if (isset($this->data[$ULTIMATUMtabsBg1Img]) && $this->data[$ULTIMATUMtabsBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMtabsBg1Img])) {
			$this->data[$ULTIMATUMtabsBg1Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMtabsBg1Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMtabsBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMtabs PARALAX 2
		$ULTIMATUMtabsBg2Img_Preview = 'ULTIMATUMControl_ULTIMATUMtabsBg2Img_preview';
		if (isset($this->data[$ULTIMATUMtabsBg2Img]) && $this->data[$ULTIMATUMtabsBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMtabsBg2Img])) {
			$this->data[$ULTIMATUMtabsBg2Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMtabsBg2Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMtabsBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMaccordion PARALAX 1
		$ULTIMATUMaccordionBg1Img_Preview = 'ULTIMATUMControl_ULTIMATUMaccordionBg1Img_preview';
		if (isset($this->data[$ULTIMATUMaccordionBg1Img]) && $this->data[$ULTIMATUMaccordionBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMaccordionBg1Img])) {
			$this->data[$ULTIMATUMaccordionBg1Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMaccordionBg1Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMaccordionBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMaccordion PARALAX 2
		$ULTIMATUMaccordionBg2Img_Preview = 'ULTIMATUMControl_ULTIMATUMaccordionBg2Img_preview';
		if (isset($this->data[$ULTIMATUMaccordionBg2Img]) && $this->data[$ULTIMATUMaccordionBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMaccordionBg2Img])) {
			$this->data[$ULTIMATUMaccordionBg2Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMaccordionBg2Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMaccordionBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMtoggle PARALAX 1
		$ULTIMATUMtoggleBg1Img_Preview = 'ULTIMATUMControl_ULTIMATUMtoggleBg1Img_preview';
		if (isset($this->data[$ULTIMATUMtoggleBg1Img]) && $this->data[$ULTIMATUMtoggleBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMtoggleBg1Img])) {
			$this->data[$ULTIMATUMtoggleBg1Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMtoggleBg1Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMtoggleBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// ULTIMATUMtoggle PARALAX 2
		$ULTIMATUMtoggleBg2Img_Preview = 'ULTIMATUMControl_ULTIMATUMtoggleBg2Img_preview';
		if (isset($this->data[$ULTIMATUMtoggleBg2Img]) && $this->data[$ULTIMATUMtoggleBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$ULTIMATUMtoggleBg2Img])) {
			$this->data[$ULTIMATUMtoggleBg2Img_Preview] = $this->model_tool_image->resize($this->data[$ULTIMATUMtoggleBg2Img], 100, 100);
		} else {
			$this->data[$ULTIMATUMtoggleBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		
		
		// Iconboxes PARALAX 1
		$IconboxesBg1Img_Preview = 'ULTIMATUMControl_iconboxesBg1Img_preview';
		if (isset($this->data[$IconboxesBg1Img]) && $this->data[$IconboxesBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$IconboxesBg1Img])) {
			$this->data[$IconboxesBg1Img_Preview] = $this->model_tool_image->resize($this->data[$IconboxesBg1Img], 100, 100);
		} else {
			$this->data[$IconboxesBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Iconboxes PARALAX 2
		$IconboxesBg2Img_Preview = 'ULTIMATUMControl_iconboxesBg2Img_preview';
		if (isset($this->data[$IconboxesBg2Img]) && $this->data[$IconboxesBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$IconboxesBg2Img])) {
			$this->data[$IconboxesBg2Img_Preview] = $this->model_tool_image->resize($this->data[$IconboxesBg2Img], 100, 100);
		} else {
			$this->data[$IconboxesBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Slideshow PARALAX 1
		$SlideshowBg1Img_Preview = 'ULTIMATUMControl_slideshowBg1Img_preview';
		if (isset($this->data[$SlideshowBg1Img]) && $this->data[$SlideshowBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$SlideshowBg1Img])) {
			$this->data[$SlideshowBg1Img_Preview] = $this->model_tool_image->resize($this->data[$SlideshowBg1Img], 100, 100);
		} else {
			$this->data[$SlideshowBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Slideshow PARALAX 2
		$SlideshowBg2Img_Preview = 'ULTIMATUMControl_slideshowBg2Img_preview';
		if (isset($this->data[$SlideshowBg2Img]) && $this->data[$SlideshowBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$SlideshowBg2Img])) {
			$this->data[$SlideshowBg2Img_Preview] = $this->model_tool_image->resize($this->data[$SlideshowBg2Img], 100, 100);
		} else {
			$this->data[$SlideshowBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Banners PARALAX 1
		$BannersBg1Img_Preview = 'ULTIMATUMControl_bannersBg1Img_preview';
		if (isset($this->data[$BannersBg1Img]) && $this->data[$BannersBg1Img] != "" && file_exists(DIR_IMAGE . $this->data[$BannersBg1Img])) {
			$this->data[$BannersBg1Img_Preview] = $this->model_tool_image->resize($this->data[$BannersBg1Img], 100, 100);
		} else {
			$this->data[$BannersBg1Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// Banners PARALAX 2
		$BannersBg2Img_Preview = 'ULTIMATUMControl_bannersBg2Img_preview';
		if (isset($this->data[$BannersBg2Img]) && $this->data[$BannersBg2Img] != "" && file_exists(DIR_IMAGE . $this->data[$BannersBg2Img])) {
			$this->data[$BannersBg2Img_Preview] = $this->model_tool_image->resize($this->data[$BannersBg2Img], 100, 100);
		} else {
			$this->data[$BannersBg2Img_Preview] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		// NO IMAGE
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->response->setOutput($this->render());
	}
	
	

	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/ULTIMATUMControl')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}


}
?>