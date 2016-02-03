<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name='yandex-verification' content='7ec0c8cb895c5e49' />
<meta name="robots" content="index,follow">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="w1-verification" content="144401618993" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/load.css"  id="load" />
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_skin') != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/<?php echo $this->config->get('ULTIMATUMControl_skin'); ?>.css" id="colors" />
<?php } else { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/stylesheet.css"  id="colors" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_status') == '1'){	?>
<?php if($this->config->get('ULTIMATUMControl_custom_font') != null){	?>
<?php echo html_entity_decode($this->config->get('ULTIMATUMControl_custom_font')); ?>
<?php } else if ($this->config->get('ULTIMATUMControl_headings_font') != 'Open+Sans'){ ?>
<link href='https://fonts.googleapis.com/css?family=<?php echo $this->config->get('ULTIMATUMControl_headings_font') ?>' rel='stylesheet' type='text/css' />
<?php } else { ?>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&subset=latin,cyrillic,latin-ext,greek' rel='stylesheet' type='text/css' />
<?php } ?>
<?php } else { ?>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&subset=latin,cyrillic,latin-ext,greek' rel='stylesheet' type='text/css' />
<?php } ?>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/modernizr.custom.js"></script>
<?php if($this->config->get('ULTIMATUMControl_responsive') == '1'){	?>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/responsive.css" />
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/selectnav.min.js"></script>
<?php } else { ?>
<meta name="viewport" content="width=1190">
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/custom_scripts.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/selectnav.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/count/jquery.plugin.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/count/jquery.countdown.js"></script>
<?php if ($lang != 'en'){	?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/count/jquery.countdown-<?php echo $lang; ?>.js"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.cycle.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/flex/jquery.flexslider-min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/flex/flexslider.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/tipsy/css.tipsy.css" />
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/tipsy/jquery.tipsy.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/owl-carousel/owl.carousel.min.js"></script>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/owl-carousel/owl.theme.css" rel="stylesheet">
<!-- PARALAX -->
<script src="catalog/view/theme/ULTIMATUM/js/paralax/jquery.parallax-1.1.3.js"></script>
<script src="catalog/view/theme/ULTIMATUM/js/jquery.mb.YTPlayer.js"></script>
<script src="catalog/view/theme/ULTIMATUM/js/jquery.scrollTo-min.js"></script>
<!-- END PARALAX -->
<!-- APPEAR -->
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/appear.js"></script>
<!-- END APPEAR -->
<!-- AJAX SEARCH -->
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.ajax_search.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.typewatch.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.highlight.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ajax_search.css" />
<!-- END AJAX SEARCH -->
<!-- iLightbox -->
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.requestAnimationFrame.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/ilightbox.packed.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ilightbox.css" />
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/scrolltopcontrol.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<?php if($this->config->get('ULTIMATUMControl_status') == '1'){ ?>
<?php include(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/customized.css.php'); ?>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
</head>

<body class="<?php echo $lang; ?>">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&appId=823981217612462&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!--LiveInternet counter--><script type="text/javascript"><!--
new Image().src = "//counter.yadro.ru/hit?r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";"+Math.random();//--></script><!--/LiveInternet-->
<?php if($this->config->get('ULTIMATUMControl_preload') == '1') { ?>
<div class="mask">
  <div id="loader"></div>
</div>
<?php } ?>
<audio id="cart_add_sound" controls preload="auto" hidden="hidden">
  <?php if($this->config->get('ULTIMATUMControl_play_sound') == '1') { ?>
  <source src="<?php echo $base; ?>catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/cart_add.wav" controls></source>
  <?php } else { ?>
  <?php } ?>
</audio>
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
if ($this->config->get('ULTIMATUMControl_site_mode') == '1') {
$text_store_mode = $this->language->get('text_shop');
} else {
$text_store_mode = $this->language->get('text_catalog');
    }
$text_blog = $this->language->get('text_blog');
$text_special_custom = $this->language->get('text_special_custom');
?>
<?php 
$ULTIMATUMControl_custom_menu_1 = $this->config->get('ULTIMATUMControl_custom_menu_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_top_1 = $this->config->get('ULTIMATUMControl_custom_menu_top_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_top_2 = $this->config->get('ULTIMATUMControl_custom_menu_top_2' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_top_3 = $this->config->get('ULTIMATUMControl_custom_menu_top_3' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_1 = $this->config->get('ULTIMATUMControl_custom_submenu_1' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_2 = $this->config->get('ULTIMATUMControl_custom_menu_2' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_2 = $this->config->get('ULTIMATUMControl_custom_submenu_2' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_3 = $this->config->get('ULTIMATUMControl_custom_menu_3' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_3 = $this->config->get('ULTIMATUMControl_custom_submenu_3' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_4 = $this->config->get('ULTIMATUMControl_custom_menu_4' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_4 = $this->config->get('ULTIMATUMControl_custom_submenu_4' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_5 = $this->config->get('ULTIMATUMControl_custom_menu_5' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_5 = $this->config->get('ULTIMATUMControl_custom_submenu_5' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_menu_6 = $this->config->get('ULTIMATUMControl_custom_menu_6' . $this->config->get('config_language_id'));
$ULTIMATUMControl_custom_submenu_6 = $this->config->get('ULTIMATUMControl_custom_submenu_6' . $this->config->get('config_language_id'));
$ULTIMATUMControl_header_cms_block_content_1 = $this->config->get('ULTIMATUMControl_header_cms_block_content_1' . $this->config->get('config_language_id'));
?>
<?php echo $content_top_fullscreen; ?>
<div id="headerSlideContainer">
  <div id="headerSlideContent"> </div>
</div>
<div id="container" class="<?php if($this->config->get('ULTIMATUMControl_layout') != null) { ?>
<?php echo $this->config->get('ULTIMATUMControl_layout') ?>
<?php } else { ?>
<?php echo "full_width_container"; ?>
<?php } ?>">
<?php if(($ULTIMATUMControl_header_cms_block_content_1 != null) && ($this->config->get('ULTIMATUMControl_header_cms_block') == '1')) { ?>
<div id="header_cms_block">
<div id="header_cms_block_togglerone" class="inner">

        <?php echo html_entity_decode($ULTIMATUMControl_header_cms_block_content_1); ?>
        
        </div>
      <a id="toggle_switch" class="toggler" href="#" title="Slide toggle"><span>Slide toggle</span></a>  
</div>
<script type="text/javascript">
$("#toggle_switch").toggle(function(){
        $(this).addClass("swap");
        $('#header_cms_block_togglerone').slideToggle("slow");
		return false;
    	}, function () {
        
        $('#header_cms_block_togglerone').slideToggle("slow");
		$(this).removeClass("swap");
		return false;
		});
</script>
<?php } ?>
<div id="header_wrapper">
  <div id="header_all">
    <div id="header_top">
      <div class="inner">
	    
        <?php if($this->config->get('ULTIMATUMControl_header_support_mode') == '1') { ?>
        <div class="header_support">
		<a href="#" id="callbackLink">Обратный звонок</a>  
		<?php echo $text_header_support; ?>
          <?php if($this->config->get('ULTIMATUMControl_header_support_mail') != null) { ?>
          <span class="hmail"><i class="icon-envelope-alt"></i> <a href="mailto:<?php echo $this->config->get('ULTIMATUMControl_header_support_mail'); ?>"><?php echo $this->config->get('ULTIMATUMControl_header_support_mail'); ?></a></span>
          <?php } ?>

         
		  <span class="workTime"><a class="skype_link" href="skype:missbloom.shop?call">Skype: missbloom.shop</a></span>
          <?php if($this->config->get('ULTIMATUMControl_header_support_phone') != null) { ?>
          <span class="hphone"><i class="icon-phone"></i> <?php echo $this->config->get('ULTIMATUMControl_header_support_phone'); ?></span>
          <?php } ?>
		 <span class="workTime2">Без выходных: с 10 до 20 00</span>  
	    </div>
        <?php } ?>
        <div id="tabs-header"> <?php echo $language; ?> <?php echo $currency; ?> </div>
      </div>
    </div>
    <div id="header_colapse">
      <div id="togglerone" class="inner">
	 <div id="my_slidemenu1_button">
			<div class="my_button-search"></div>
			</div>
        <div id="search">
          <div class="button-search"></div>
          <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
          <div id="AjaxAutoSuggest">
            <div id="AjaxAutoSuggestContent"></div>
          </div>
		  
        </div>
        <?php echo $cart; ?>
		
        <div id="cur_lang">
          <div class="links">
            <ul id="main_nav">
              <?php  if($this->config->get('ULTIMATUMControl_blog_link') == '1'){ ?>
              <li><a href="<?php echo $blog_link_header; ?>" class="blog_link"><i class="icon-book"></i> <?php echo $text_blog; ?></a></li>
              <?php } ?>
              <?php if(($this->config->get('ULTIMATUMControl_information_link') == '1') && ($informations)) { ?>
              <li class="subico"><a href="#" class="information_link"><i class="icon-question-sign"></i> <?php echo $text_information; ?></a>
                <ul class="secondary">
                  <?php foreach ($informations as $information) { ?>
                  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                  <?php } ?>
				  <li><a href="/news">Новости</a></li>
				  <li><a href="/faq">FAQ</a></li>
				  <li><a href="/otzivi">Отзывы</a></li>
                </ul>
              </li>
              <?php } ?>
              <?php if(($this->config->get('ULTIMATUMControl_account_link') != '0')) { ?>
              <?php if (!$logged) { ?>
              <li id="subico_account" class="subico subico_account"><a href="<?php echo $account; ?>"  class="account_link" id="loginLink"><i class="icon-lock"></i> <?php echo $text_account; ?></a>
              <?php if(($this->config->get('ULTIMATUMControl_pop_log_status') != '0')) { ?>
              <div id="loginBox">                
        <div id="login-form">
        
          <fieldset id="body">
          <span class="h6"><?php echo $text_existing_account; ?></span>
            <fieldset>
            <label for="email"><i class="icon-user"></i><?php echo $text_email_address; ?></label>
            <input type="text" name="email" id="email" />
            </fieldset>
            <fieldset>
            <label for="password"><i class="icon-lock"></i><?php echo $text_password; ?></label>
            <input type="password" name="password" id="password" />
            </fieldset>
          <input class="button" type="submit" id="log-in" value="<?php echo $text_login; ?>" />
        </fieldset>
      <a class="forg" href="./index.php?route=account/forgotten"><span><?php echo $text_forgot; ?></span></a>
      <div class="reg">
      <span class="h6"><?php echo $text_new_account; ?></span>
      <a class="button" href="<?php echo $account; ?>"><?php echo $text_register_account; ?></a>
      <br /><br />
      <span class="h6">Войти с помощью</span>
      <div id="uLogin" data-ulogin="display=panel;fields=first_name,last_name;providers=vkontakte,facebook,twitter,instagram,odnoklassniki;hidden=livejournal,openid,lastfm,linkedin,liveid,soundcloud,steam,flickr,uid,youtube,webmoney,foursquare,tumblr,googleplus,dudu,vimeo,wargaming,google;redirect_uri=http%3A%2F%2Fmissbloom.ru%2Findex.php%3Froute%3Daccount%2Fulogin"><img src="/image/loading.gif" alt="Загрузка..." /></div>
      </div>
    </div>
  </div>
  <?php } ?>
  <div id="callbackBox"> 
		<a class="closecallbackBox" style="position: absolute; top: 5px; right: 10px;">X</a>
        <div id="login-form">
		  <form id="callbackForm">
          <fieldset id="body">
			  <span class="h6">Обратный звонок</span>
				<fieldset>
				<label for="phone"><i class="icon-phone"></i>Телефон</label>
				<input type="text" name="phone" id="phone" />
				</fieldset>
				<fieldset>
				<label for="time"><i class="icon-time"></i>Удобное время для звонка</label>
				<input type="text" name="time" id="time" />
				</fieldset>
			  <input class="button" type="submit" value="Отправить" />
			</fieldset>
			</form>
    </div>
  </div>
  
  
  
                <?php if(($this->config->get('ULTIMATUMControl_wish_status') == '1') || ($this->config->get('ULTIMATUMControl_compare_status') == '1')) { ?>
                <ul class="secondary">
                  <li class="wishlist_header"><a href="<?php echo $wishlist; ?>" id="wishlist_total"><i class="icon-heart"></i> <?php echo $text_wishlist; ?></a></li>
                  <li class="compare_header"><a href="<?php echo $compare; ?>" class="compare_link"><i class="icon-bar-chart"></i> <?php echo $text_compare; ?></a></li>
                </ul>
                <?php } ?>
              </li>
              <?php } else { ?>
              <li class="subico subico_account"><a href="<?php echo $account; ?>"  class="account_link"><i class="icon-unlock"></i> <?php echo $user_welc; ?></a>
                <ul class="secondary">
                  <li class="wishlist_header"><a href="<?php echo $wishlist; ?>" id="wishlist_total"><i class="icon-heart"></i> <?php echo $text_wishlist; ?></a></li>
                  <li class="compare_header"><a href="<?php echo $compare; ?>" class="compare_link"><i class="icon-bar-chart"></i> <?php echo $text_compare; ?></a></li>
                  <li><a href="<?php echo $logout; ?>"><i class="icon-signout"></i> <?php echo $text_logout; ?></a></li>
                </ul>
              </li>
              <?php } ?>
              <?php } ?>
              <li class="contact_header"><a href="<?php echo $contact; ?>"><i class="icon-envelope"></i> <?php echo $text_contact; ?></a></li>
              <?php  if($ULTIMATUMControl_custom_menu_top_1 != null){ ?>
              <li><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_top_link_1'); ?>"><i class="icon-link"></i> <?php echo $ULTIMATUMControl_custom_menu_top_1; ?></a></li>
              <?php } ?>
              <?php  if($ULTIMATUMControl_custom_menu_top_2 != null){ ?>
              <li><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_top_link_2'); ?>"><i class="icon-link"></i> <?php echo $ULTIMATUMControl_custom_menu_top_2; ?></a></li>
              <?php } ?>
              <?php  if($ULTIMATUMControl_custom_menu_top_3 != null){ ?>
              <li><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_top_link_3'); ?>"><i class="icon-link"></i> <?php echo $ULTIMATUMControl_custom_menu_top_3; ?></a></li>
              <?php } ?>
            </ul>
		
          </div>
        </div>
			
        <div class="clear"></div>
		
        <div id="notification"></div>
	
      </div>
      <div class="inner inner2"></div>
    </div>
    <div id="header">
      <div class="inner main_head_inner">
        <?php if ($logo) { ?>
        <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
        <?php } ?>
        <?php echo $header_icon_teaser; ?>
        <div class="clear"></div>
        <?php  if($this->config->get('ULTIMATUMControl_top_menu') == '1'){ ?>
        <div id="menu">
        <ul id="topnav"><li class="top_cat home_link"><a href="<?php echo $base; ?>"><i class="icon-home"></i></a></li>
          <?php include(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/ULTIMATUM_menu.php'); ?>
          </ul>
          <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <?php } ?>
        <a class="mob-menu-toggle" href="#"><i class="icon-reorder"></i></a>
        <div id="menu_mobile">
          <?php foreach ($categories as $category) { ?>
          <div class="accord-header<?php if ($category['children']) { ?> has_sub<?php } ?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
          <?php if ($category['children']) { ?>
          <div class="accord-content">
            <?php foreach ($category['children'] as $child) { ?>
            <a href="<?php echo $child['href']; ?>" class="mobile_sub"><?php echo $child['name']; ?></a>
            <?php } ?>
          </div>
          <?php } ?>
          <?php } ?>
          <?php if($this->config->get('ULTIMATUMControl_brands') == '1'){ ?>
          <div class="accord-header"><a href="<?php echo $brand; ?>"><?php echo $text_brands; ?></a></div>
          <?php } ?>
          <?php if($this->config->get('ULTIMATUMControl_specials_link') == '1'){ ?>
          <div class="accord-header"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></div>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_1 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_1 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_1'); ?>"><?php echo $ULTIMATUMControl_custom_menu_1; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_1 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_1); ?> </div>
          <?php } ?>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_2 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_2 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_2'); ?>"><?php echo $ULTIMATUMControl_custom_menu_2; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_2 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_2); ?> </div>
          <?php } ?>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_3 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_3 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_3'); ?>"><?php echo $ULTIMATUMControl_custom_menu_3; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_3 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_3); ?> </div>
          <?php } ?>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_4 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_4 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_4'); ?>"><?php echo $ULTIMATUMControl_custom_menu_4; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_4 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_4); ?> </div>
          <?php } ?>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_5 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_5 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_5'); ?>"><?php echo $ULTIMATUMControl_custom_menu_5; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_5 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_5); ?> </div>
          <?php } ?>
          <?php } ?>
          <?php if($ULTIMATUMControl_custom_menu_6 != null){ ?>
          <div class="accord-header<?php if($ULTIMATUMControl_custom_submenu_6 != null){ ?> has_sub<?php } ?>"><a href="<?php echo $this->config->get('ULTIMATUMControl_custom_link_6'); ?>"><?php echo $ULTIMATUMControl_custom_menu_6; ?></a></div>
          <?php if($ULTIMATUMControl_custom_submenu_6 != null){ ?>
          <div class="accord-content"> <?php echo html_entity_decode($ULTIMATUMControl_custom_submenu_6); ?> </div>
          <?php } ?>
          <?php } ?>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
   $("#menu_mobile .accord-header").click(function() {
     // For active header definition
     $('.accord-header').removeClass('on');
     $(this).addClass('on');
     
     // Accordion actions
     if($(this).next("div.accord-content").is(":visible")){
       $(this).next("div.accord-content").slideUp("slow");
     } else {
       $("#menu_mobile .accord-content").slideUp("slow");
       $(this).next("div.accord-content").slideToggle("slow");
     }
  });
});
</script> 
<script type="text/javascript">
function DoAjaxSearch(){
	var current_obj = $('#search input[name=\'search\']');
	
	$.ajax({
		url: 'index.php?route=common/header/search',
		data: 'filter_name=' + encodeURIComponent($(current_obj).val()),
		success: function(data){
			$('#AjaxAutoSuggestContent').html(data);
			
			customSetLocationAjaxSearchContainer(current_obj);
			
			if (AjaxSearchContainerStatus == 0  ){  
				loadAjaxSearchContainer();
			}	
		}
	});
}

$(document).ready(function(){
	$('#search input[name=\'search\']').typeWatch({
		callback: DoAjaxSearch,
		wait: 400,
		highlight: false,
		captureLength: 3
	})

	$('#search input[name=\'search\']').bind('keyup', function(){
		if ( ($(this).val().length < 3) && AjaxSearchContainerStatus ){
			disableAjaxSearchContainer();
		}
	});
	
	$("#search").mouseleave(function(){
		disableAjaxSearchContainer();
	});

	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && AjaxSearchContainerStatus==1){
			disableAjaxSearchContainer();
		}
	});

});
</script>
<?php if($this->config->get('ULTIMATUMControl_cat1_label') != null) { ?>
<span id="cat_tag1" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat1_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat1_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat1_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag1').prependTo("ul#topnav li:nth-child(1) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat2_label') != null) { ?>
<span id="cat_tag2" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat2_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat2_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat2_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag2').prependTo("ul#topnav li.top_cat:nth-child(2) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat3_label') != null) { ?>
<span id="cat_tag3" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat3_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat3_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat3_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag3').prependTo("ul#topnav li.top_cat:nth-child(3) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat4_label') != null) { ?>
<span id="cat_tag4" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat4_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat4_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat4_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag4').prependTo("ul#topnav li.top_cat:nth-child(4) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat5_label') != null) { ?>
<span id="cat_tag5" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat5_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat5_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat5_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag5').prependTo("ul#topnav li.top_cat:nth-child(5) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat6_label') != null) { ?>
<span id="cat_tag6" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat6_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat6_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat6_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag6').prependTo("ul#topnav li.top_cat:nth-child(6) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat7_label') != null) { ?>
<span id="cat_tag7" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat7_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat7_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat7_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag7').prependTo("ul#topnav li.top_cat:nth-child(7) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat8_label') != null) { ?>
<span id="cat_tag8" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat8_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat8_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat8_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag8').prependTo("ul#topnav li.top_cat:nth-child(8) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat9_label') != null) { ?>
<span id="cat_tag9" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat9_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat9_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat9_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag9').prependTo("ul#topnav li.top_cat:nth-child(9) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat10_label') != null) { ?>
<span id="cat_tag10" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat10_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat10_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat10_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag10').prependTo("ul#topnav li.top_cat:nth-child(10) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat11_label') != null) { ?>
<span id="cat_tag11" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat11_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat11_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat11_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag11').prependTo("ul#topnav li.top_cat:nth-child(11) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat12_label') != null) { ?>
<span id="cat_tag12" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat12_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat12_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat12_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag12').prependTo("ul#topnav li.top_cat:nth-child(12) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat13_label') != null) { ?>
<span id="cat_tag13" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat13_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat13_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat13_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag13').prependTo("ul#topnav li.top_cat:nth-child(13) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat14_label') != null) { ?>
<span id="cat_tag14" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat14_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat14_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat14_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag14').prependTo("ul#topnav li.top_cat:nth-child(14) > a");
});	
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat15_label') != null) { ?>
<span id="cat_tag15" class="cat_tag" <?php if($this->config->get('ULTIMATUMControl_cat15_color') != null) { ?>style="background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat15_color'); ?>;"<?php } ?>><?php echo $this->config->get('ULTIMATUMControl_cat15_label'); ?></span> 
<script type="text/javascript">
$(document).ready(function(){
	$('#cat_tag15').prependTo("ul#topnav li.top_cat:nth-child(15) > a");
});	
</script>
<?php } ?>
