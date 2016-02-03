<style type="text/css">
body {
<?php if($this->config->get('ULTIMATUMControl_bodyBgImg') != '') { ?> 
background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_bodyBgImg');?>") top center repeat;
<?php } ?>	
<?php if(( $this->config->get('ULTIMATUMControl_body_bg_pattern') != null) && ($this->config->get('ULTIMATUMControl_body_bg_pattern') != 'pattern0.png') && ($this->config->get('ULTIMATUMControl_bodyBgImg') == '')) { ?> 
background:url("catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/backgrounds/<?php echo  $this->config->get('ULTIMATUMControl_body_bg_pattern');?>") top center repeat;
<?php } ?> 
background-color:#<?php echo $this->config->get('ULTIMATUMControl_body_bg_color') ?>;
font-family:<?php echo $this->config->get('ULTIMATUMControl_body_font') ?>;
color:#<?php echo $this->config->get('ULTIMATUMControl_text_color') ?>;
}
h1, h2, h3, h4, h5, h6, #column-left .box .box-heading, #column-right .box .box-heading, .htabs a, .product-info .price-old, .product-info .price-new, .button, #content .boxPlain .box-heading, .related-post-item .name, ul.pricetable li.title-icon-holder, ul.pricetable li.table-price, .countdown_amount, .ls-layer, .ptabs a {
<?php if( $this->config->get('ULTIMATUMControl_custom_font') != null) { ?> 
font-family: '<?php echo  $this->config->get('ULTIMATUMControl_custom_font_family'); ?>' !Important;
<?php } elseif (( $this->config->get('ULTIMATUMControl_custom_font') == null) && ( $this->config->get('ULTIMATUMControl_header_font') != 'Open+Sans')) { ?> 
<?php 
$headerFont = $this->config->get('ULTIMATUMControl_headings_font');
$font = str_replace("+", " ", $headerFont);
?> 
font-family: '<?php echo $font; ?>';
<?php } else { ?> font-family: 'Comic Sans';
<?php } ?>
}
 <?php if( $this->config->get('ULTIMATUMControl_headings_color') != null) {
?> h1, h2, h3, h4, h5, h6, #column-left .box .box-heading, #column-right .box .box-heading {
color:#<?php echo $this->config->get('ULTIMATUMControl_headings_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_headings1_size') != null) {
?> h1 {
font-size:<?php echo $this->config->get('ULTIMATUMControl_headings1_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_headings2_size') != null) {
?> h2, #content .boxPlain .box-heading {
font-size:<?php echo $this->config->get('ULTIMATUMControl_headings2_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_headings3_size') != null) {
?> h3 {
font-size:<?php echo $this->config->get('ULTIMATUMControl_headings3_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_headings4_size') != null) {
?> h4 {
font-size:<?php echo $this->config->get('ULTIMATUMControl_headings4_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_price_size') != null) {
?> .product-info .price {
font-size:<?php echo $this->config->get('ULTIMATUMControl_price_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_module_title_size') != null) {
?> h2.heading_title span {
font-size:<?php echo $this->config->get('ULTIMATUMControl_module_title_size') ?>px;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_module_headings_color') != null) {
?> h2.heading_title span {
color:#<?php echo $this->config->get('ULTIMATUMControl_module_headings_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_module_headings_background') != null) {
?> h2.heading_title span, h2.heading_title span:after {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_module_headings_background') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_column_title_size') != null) {
?> #column-left .box .box-heading, #column-right .box .box-heading {
font-size:<?php echo $this->config->get('ULTIMATUMControl_column_title_size') ?>px;
}
<?php
}
?>  

#menu {
	<?php if($this->config->get('ULTIMATUMControl_menu_bar_background') != null) { ?>
	background:#<?php echo $this->config->get('ULTIMATUMControl_menu_bar_background'); ?>;
	<?php } ?>
	<?php if(($this->config->get('ULTIMATUMControl_menu_bar_border_top') != null) && ($this->config->get('ULTIMATUMControl_menu_bar_border_top_thicknes') != null)) { ?>
	border-top:<?php echo $this->config->get('ULTIMATUMControl_menu_bar_border_top_thicknes'); ?>px solid #<?php echo $this->config->get('ULTIMATUMControl_menu_bar_border_top'); ?>;
	<?php } ?>
	<?php if(($this->config->get('ULTIMATUMControl_menu_bar_border_bottom') != null) && ($this->config->get('ULTIMATUMControl_menu_bar_border_bottom_thicknes') != null)) { ?>
	border-bottom:<?php echo $this->config->get('ULTIMATUMControl_menu_bar_border_bottom_thicknes'); ?>px solid #<?php echo $this->config->get('ULTIMATUMControl_menu_bar_border_bottom'); ?>;
	<?php } ?>
}
.column-category ul#topnav_column {
	<?php if($this->config->get('ULTIMATUMControl_menu_bar_background') != null) { ?>
	background:#<?php echo $this->config->get('ULTIMATUMControl_menu_bar_background'); ?>;
	<?php } ?>
}


<?php if($this->config->get('ULTIMATUMControl_category_item_size') != null) {
?> #menu ul#topnav > li > a, #menu > ul.topnav2 > li > a {
font-size:<?php echo $this->config->get('ULTIMATUMControl_category_item_size') ?>px;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_headings_accent') != null) {
?> #content .heading_title span {
border-color:#<?php echo $this->config->get('ULTIMATUMControl_headings_accent') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_links_color') != null) {
?> a, a:visited {
color:#<?php echo $this->config->get('ULTIMATUMControl_links_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_links_color_hover') != null) {
?> a:hover {
color:#<?php echo $this->config->get('ULTIMATUMControl_links_color_hover') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_buttons_color') != null) {
?> a.button, input.button, .cart .qty-minus, .quantity .qty-minus, .cart .qty-plus, .quantity .qty-plus, .box-subscribero a#button-subscribero.button, #footer #ULTIMATUMcontactform-content input.button {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_buttons_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_buttons_color_hover') != null) {
?> a.button:hover, input.button:hover, .cart .qty-minus:hover, .quantity .qty-minus:hover, .cart .qty-plus:hover, .quantity .qty-plus:hover, .box-subscribero a#button-subscribero.button:hover, #footer #ULTIMATUMcontactform-content input.button:hover, a.add_to_cart_small:hover {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_buttons_color_hover') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_new_label_color') != null) {
?> .sale_save_holder span.new_prod {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_new_label_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_save_label_color') != null) {
?> .sale_save_holder span.save {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_save_label_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_breadcrumb_color') != null) {
?> .breadcrumb, .breadcrumb a {
color:#<?php echo $this->config->get('ULTIMATUMControl_breadcrumb_color') ?>;
}
<?php
}
?>  
#header_wrapper {
<?php if($this->config->get('ULTIMATUMControl_HeaderBgImg') != '') { ?> 
background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_HeaderBgImg');?>") <?php echo  $this->config->get('ULTIMATUMControl_header_back_position');?>;
<?php } ?>	
<?php if(( $this->config->get('ULTIMATUMControl_header_bg_pattern') != null) && ($this->config->get('ULTIMATUMControl_header_bg_pattern') != 'pattern0.png') && ($this->config->get('ULTIMATUMControl_HeaderBgImg') == '')) { ?> 
background:url("catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/backgrounds/<?php echo  $this->config->get('ULTIMATUMControl_header_bg_pattern');?>") top center repeat;
 <?php } ?> 
<?php if($this->config->get('ULTIMATUMControl_header_bg_color') != null) { ?> 
background-color:#<?php echo $this->config->get('ULTIMATUMControl_header_bg_color') ?>;
 <?php } ?> 
<?php if($this->config->get('ULTIMATUMControl_header_top_color') != null) { ?> 
border-top-color:#<?php echo $this->config->get('ULTIMATUMControl_header_top_color') ?>;
 <?php } ?>
}
 <?php if($this->config->get('ULTIMATUMControl_header_top_back') != null) { ?> 
#header_top {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_header_top_back') ?>;
}
<?php } ?>
 <?php if($this->config->get('ULTIMATUMControl_header_top_color') != null) { ?> 
#header_colapse, #header_colapse .inner2 {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_header_top_color') ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_header_top_border') != null) { ?> 
#header_colapse, #togglerone, #header_colapse .inner2 {
border-bottom-color:#<?php echo $this->config->get('ULTIMATUMControl_header_top_border') ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_main_menu_color') != null) { ?> 
#header_colapse .links > ul > li > a, #header_colapse #cart .heading h4, #header_colapse #cart .heading a {
color:#<?php echo $this->config->get('ULTIMATUMControl_main_menu_color') ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_main_menu_hover_back') != null) { ?> 
#header_colapse .links  #main_nav > li > a:hover, #header_colapse .links  #main_nav > li > a.selected, #header_colapse .links  #main_nav > li > a.blog_link:hover {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_main_menu_hover_back') ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cur_color') != null) { ?> 
#currency a, .header_support {
color:#<?php echo $this->config->get('ULTIMATUMControl_cur_color') ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cur_hover_color') != null) { ?> 
#currency a b, #currency a:hover {
color:#<?php echo $this->config->get('ULTIMATUMControl_cur_hover_color') ?>;
}
<?php } ?>  
#header_colapse .links a:hover {
<?php if($this->config->get('ULTIMATUMControl_main_menu_hover_color') != null) { ?> 
color:#<?php echo $this->config->get('ULTIMATUMControl_main_menu_hover_color') ?>;
<?php } ?> 
}
#header_colapse .links ul.secondary li a:hover {
<?php if($this->config->get('ULTIMATUMControl_top_links_hover_color') != null) { ?> 
color:#<?php echo $this->config->get('ULTIMATUMControl_top_links_hover_color') ?>;
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_top_links_hover_background') != null) { ?> 
background-color:#<?php echo $this->config->get('ULTIMATUMControl_top_links_hover_background') ?>;
<?php } ?> 
}
<?php if($this->config->get('ULTIMATUMControl_shop_cats_background') != null) { ?>
#menu ul#topnav li.top_cat.cat_item, .column-category ul#topnav_column li.top_cat.cat_item  {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_shop_cats_background'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_shop_cats_color') != null) { ?>
#menu ul#topnav li.top_cat.cat_item > a, .column-category ul#topnav_column li.top_cat.cat_item > a {
	color:#<?php echo $this->config->get('ULTIMATUMControl_shop_cats_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_category_menu_color') != null) { ?> 
#menu ul#topnav > li > a, #menu > ul.topnav2 > li > a, #menu ul#topnav ul.children li.pic_name h3 a span, #menu ul#topnav ul.children a, #menu ul#topnav li:hover ul.children a, #menu > ul.topnav2 >li ul > li > a, #menu > ul#topnav > li > div ul > li > a {
color:#<?php echo $this->config->get('ULTIMATUMControl_category_menu_color') ?>;
}
<?php } ?>  
#menu > ul.topnav2 > li:hover > a, #menu > ul#topnav > li:hover > a, #menu ul#topnav ul.children li a:hover, #menu > ul.topnav2 > li ul > li > a:hover, #menu > ul#topnav > li div ul > li > a:hover, #menu ul#topnav li.top_cat.cat_item > a:hover, #menu ul#topnav li ul.children ul.children2 a:hover, #menu ul#topnav li.top_cat.cat_item:hover > a, .column-category ul#topnav_column li.top_cat:hover > a, .column-category ul#topnav_column > li .children li a:hover {
<?php if($this->config->get('ULTIMATUMControl_category_menu_hover_color') != null) { ?> 
color:#<?php echo $this->config->get('ULTIMATUMControl_category_menu_hover_color') ?> !Important;
<?php } ?> 
<?php if($this->config->get('ULTIMATUMControl_category_menu_hover_background') != null) { ?> 
background-color:#<?php echo $this->config->get('ULTIMATUMControl_category_menu_hover_background') ?>;
<?php } ?>
}
#menu ul#topnav li a.selected {
<?php if($this->config->get('ULTIMATUMControl_category_menu_hover_background') != null) { ?> 
background-color:#<?php echo $this->config->get('ULTIMATUMControl_category_menu_hover_background') ?>;
<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_menu_icon_back') != null) { ?> 
#header_colapse .button-search {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_menu_icon_back') ?>;
}
<?php } ?>  
<?php if($this->config->get('ULTIMATUMControl_cart_icon_back') != null) { ?> 
#header_colapse #cart .cart_circle {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_cart_icon_back') ?>;
}
<?php } ?>  
<?php if($this->config->get('ULTIMATUMControl_drop_border') != null) { ?> 
#header .links ul.secondary, #header #cart .content, #menu > ul.topnav2 > li > div, #menu > ul#topnav > li > div, #menu ul#topnav ul.children, #menu ul#topnav ul.children2 {
border-bottom-color:#<?php echo $this->config->get('ULTIMATUMControl_drop_border') ?>;
}
<?php } ?>  
#footer {
<?php if($this->config->get('ULTIMATUMControl_FooterBgImg') != '') { ?> 
background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_FooterBgImg');?>") <?php echo  $this->config->get('ULTIMATUMControl_footer_back_position');?>;
<?php } ?>
<?php if(( $this->config->get('ULTIMATUMControl_header_bg_pattern') != null) && ($this->config->get('ULTIMATUMControl_footer_bg_pattern') != 'pattern0.png') && ($this->config->get('ULTIMATUMControl_FooterBgImg') == '')) {
?> background:url("catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/backgrounds/<?php echo  $this->config->get('ULTIMATUMControl_footer_bg_pattern');?>") top center repeat;
 <?php
}
?> <?php if($this->config->get('ULTIMATUMControl_footer_bg_color') != null) {
?> background-color:#<?php echo $this->config->get('ULTIMATUMControl_footer_bg_color') ?>;
 <?php
}
?> <?php if($this->config->get('ULTIMATUMControl_prefooter_border_top') != null) {
?> border-top-color:#<?php echo $this->config->get('ULTIMATUMControl_prefooter_border_top') ?>;
 <?php
}
?>
}
 <?php if($this->config->get('ULTIMATUMControl_footer_link_color') != null) {
?> #footer h4 {
color:#<?php echo $this->config->get('ULTIMATUMControl_footer_link_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_footer_link_border') != null) {
?> #footer h4, .tweet_list li, .footer_time, .footer_address, .footer_phone, .footer_fax, .footer_mail, .footer_skype, #footer .column ul.footer_links li, #footer .column:first-child, .subscribe_module, #footer .socials {
border-color:#<?php echo $this->config->get('ULTIMATUMControl_footer_link_border') ?>;
}
<?php
}
?>  #powered {
 <?php if($this->config->get('ULTIMATUMControl_powered_bg') != null) {
?> background-color:#<?php echo $this->config->get('ULTIMATUMControl_powered_bg') ?>;
<?php
}
?> <?php if($this->config->get('ULTIMATUMControl_powered_text') != null) {
?> color:#<?php echo $this->config->get('ULTIMATUMControl_powered_text') ?>;
 <?php
}
?>
}
 <?php if($this->config->get('ULTIMATUMControl_cart_button_color') != null) {
?> input.button_cart_product, a.add_to_cart_small {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_cart_button_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_wish_button_color') != null) {
?> a.add_to_wishlist_small, .add_to_wishlist.button {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_wish_button_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_compare_button_color') != null) {
?> a.add_to_compare_small, a.add_to_compare.button {
background-color:#<?php echo $this->config->get('ULTIMATUMControl_compare_button_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_prod_hold_back') != null) { ?>
html.no-touch div.prod_hold {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_prod_hold_back') ?>;;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_prod_name_color') != null) {
?> .prod_hold .name a {
color:#<?php echo $this->config->get('ULTIMATUMControl_prod_name_color') ?>;
}
<?php
}
?>
  <?php if($this->config->get('ULTIMATUMControl_main_price_color') != null) {
?> div.prod_hold .price-new, .accordeonHolder .price-new, div.prod_hold .prod-info-fly .price, .accordeonHolder .price, .product-info .price {
color:#<?php echo $this->config->get('ULTIMATUMControl_main_price_color') ?>;
}
<?php
}
?>  <?php if($this->config->get('ULTIMATUMControl_old_price_color') != null) {
?> .product-info .price-old, div.prod_hold .price-old, .accordeonHolder .price-old {
color:#<?php echo $this->config->get('ULTIMATUMControl_old_price_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_site_mode') == '0') {
?> #header_colapse #cart, #header .links a.cart_link, a.add_to_cart_small, input#button-cart, input.compare_cart, img.wish-cart, .plus_minus_quantity, #AjaxAutoSuggestContent .autosuggest-list .cart {
display:none;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_menu_position') == 'left') {
?> #menu {
    float: left !important;
    margin: 0 0 0 40px !important;
}
<?php
}
?>  
<?php if($this->config->get('ULTIMATUMControl_countdown_color') != null) {
?> .countdown_time_prodpage {
	color:#<?php echo $this->config->get('ULTIMATUMControl_countdown_color') ?>;
}
<?php
}
?>
<?php if($this->config->get('ULTIMATUMControl_custom_css') != null) {
?> <?php echo $this->config->get('ULTIMATUMControl_custom_css') ?> <?php
}
?>
html.no-touch #content_top_fullwidth .box-latest, html.no-touch #content_bottom_fullwidth .box-latest {
	<?php if($this->config->get('ULTIMATUMControl_latestBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_latestBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}
.box-latest {
	<?php if($this->config->get('ULTIMATUMControl_latest_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_latest_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_latestBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-latest .bg, html.no-touch #content_bottom_fullwidth .box-latest .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_latestBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-tabbed.box-paralax, html.no-touch #content_top_fullwidth .box-tabbed-sortable.box-paralax, html.no-touch #content_bottom_fullwidth .box-tabbed.box-paralax, html.no-touch #content_bottom_fullwidth .box-tabbed-sortable.box-paralax {
	<?php if($this->config->get('ULTIMATUMControl_tabbedBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_tabbedBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}
.box-tabbed, .box-tabbed-sortable {
	<?php if($this->config->get('ULTIMATUMControl_tabbed_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_tabbed_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_tabbedBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-tabbed.box-paralax .bg, html.no-touch #content_top_fullwidth .box-tabbed-sortable.box-paralax .bg, html.no-touch #content_bottom_fullwidth .box-tabbed.box-paralax .bg, html.no-touch #content_bottom_fullwidth .box-tabbed-sortable.box-paralax .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_tabbedBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>	
html.no-touch #content_top_fullwidth .box-deal, html.no-touch #content_bottom_fullwidth .box-deal {
	<?php if($this->config->get('ULTIMATUMControl_dealBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_dealBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-deal {
	<?php if($this->config->get('ULTIMATUMControl_deal_background_color') != null){ ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_deal_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_dealBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-deal .bg, html.no-touch #content_bottom_fullwidth .box-deal .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_dealBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-special, html.no-touch #content_bottom_fullwidth .box-special {
	<?php if($this->config->get('ULTIMATUMControl_specialBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_specialBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-special {
	<?php if($this->config->get('ULTIMATUMControl_special_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_special_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_specialBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-special .bg, html.no-touch #content_bottom_fullwidth .box-special .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_specialBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-bestsellers, html.no-touch #content_bottom_fullwidth .box-bestsellers {
	<?php if($this->config->get('ULTIMATUMControl_bestsellerBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_bestsellerBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-bestsellers {
	<?php if($this->config->get('ULTIMATUMControl_bestseller_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_bestseller_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_bestsellerBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-bestsellers .bg, html.no-touch #content_bottom_fullwidth .box-bestsellers .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_bestsellerBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-welcome, html.no-touch #content_bottom_fullwidth .box-welcome {
	<?php if($this->config->get('ULTIMATUMControl_welcomeBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_welcomeBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-welcome {
	<?php if($this->config->get('ULTIMATUMControl_welcome_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_welcome_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_welcomeBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-welcome .bg, html.no-touch #content_bottom_fullwidth .box-welcome .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_welcomeBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMtabs, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMtabs {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-ULTIMATUMtabs {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtabs_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMtabs .bg, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMtabs .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMtabsBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMaccordion, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMaccordion {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-ULTIMATUMaccordion {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMaccordion .bg, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMaccordion .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMaccordionBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMtoggle, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMtoggle {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-ULTIMATUMtoggle {
	<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-ULTIMATUMtoggle .bg, html.no-touch #content_bottom_fullwidth .box-ULTIMATUMtoggle .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_ULTIMATUMtoggleBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
	
	html.no-touch #content_top_fullwidth .box-iconboxes, html.no-touch #content_bottom_fullwidth .box-iconboxes {
	<?php if($this->config->get('ULTIMATUMControl_iconboxesBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_iconboxesBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}
.box-iconboxes {
	<?php if($this->config->get('ULTIMATUMControl_iconboxes_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_iconboxes_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_iconboxesBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-iconboxes .bg, html.no-touch #content_bottom_fullwidth .box-iconboxes .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_iconboxesBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
	<?php if($this->config->get('ULTIMATUMControl_iconboxes_icon_color') != null) { ?>
	.icon_wrapper, .icon_wrapper:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_iconboxes_icon_color') ?>;
	}
	<?php } ?>
html.no-touch #content_top_fullwidth .box-slideshow, html.no-touch #content_bottom_fullwidth .box-slideshow {
	<?php if($this->config->get('ULTIMATUMControl_slideshowBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_slideshowBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}	
	.box-slideshow {
	<?php if($this->config->get('ULTIMATUMControl_slideshow_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_slideshow_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_slideshowBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-slideshow .bg, html.no-touch #content_bottom_fullwidth .box-slideshow .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_slideshowBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
	
	html.no-touch #content_top_fullwidth .box-banners, html.no-touch #content_bottom_fullwidth .box-banners {
	<?php if($this->config->get('ULTIMATUMControl_bannersBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_bannersBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}
.box-banners {
	<?php if($this->config->get('ULTIMATUMControl_banners_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_banners_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_bannersBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-banners .bg, html.no-touch #content_bottom_fullwidth .box-banners .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_bannersBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
	
	html.no-touch #content_top_fullwidth .box-featured, html.no-touch #content_bottom_fullwidth .box-featured {
	<?php if($this->config->get('ULTIMATUMControl_featuredBg1Img') != null) { ?>
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_featuredBg1Img');?>") 50% 0 no-repeat fixed;
	<?php } ?>
}
.box-featured {
	<?php if($this->config->get('ULTIMATUMControl_featured_background_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_featured_background_color') ?>;
	<?php } ?>
}
<?php if($this->config->get('ULTIMATUMControl_featuredBg2Img') != null) { ?>
html.no-touch #content_top_fullwidth .box-featured .bg, html.no-touch #content_bottom_fullwidth .box-featured .bg {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_featuredBg2Img');?>") 50% 0 no-repeat fixed;
}
	<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_pagetitle_title_color') != null) { ?>
.title-holder .heading_title {
	color:#<?php echo $this->config->get('ULTIMATUMControl_pagetitle_title_color') ?>;
}
.title-holder .heading_title span {
	color:#<?php echo $this->config->get('ULTIMATUMControl_pagetitle_title_color') ?>;
}
<?php } ?>

<?php if($this->config->get('ULTIMATUMControl_latest_title_color') != null) { ?>
.box-latest .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_latest_title_color') ?>;
}
.box-latest .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_latest_title_color') ?> !Important;	
}
<?php } ?>

<?php if($this->config->get('ULTIMATUMControl_deal_title_color') != null) { ?>
.box-deal .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_deal_title_color') ?>;
}
.box-deal .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_deal_title_color') ?> !Important;	
}
<?php } ?>

<?php if($this->config->get('ULTIMATUMControl_featured_title_color') != null) { ?>
.box-featured .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_featured_title_color') ?>;
}
.box-featured .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_featured_title_color') ?> !Important;	
}
<?php } ?>

<?php if($this->config->get('ULTIMATUMControl_special_title_color') != null) { ?>
.box-special .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_special_title_color') ?>;
}
.box-special .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_special_title_color') ?> !Important;	
}
<?php } ?>

<?php if($this->config->get('ULTIMATUMControl_bestseller_title_color') != null) { ?>
.box-bestsellers .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_bestseller_title_color') ?>;
}
.box-bestsellers .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_bestseller_title_color') ?> !Important;	
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_welcome_title_color') != null) { ?>
.box-welcome .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_welcome_title_color') ?>;
}
.box-welcome .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_welcome_title_color') ?> !Important;	
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtabs_title_color') != null) { ?>
.box-ULTIMATUMtabs .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_title_color') ?>;
}
.box-ULTIMATUMtabs .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtabs_title_color') ?> !Important;	
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_title_color') != null) { ?>
.box-ULTIMATUMaccordion .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_title_color') ?>;
}
.box-ULTIMATUMaccordion .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMaccordion_title_color') ?> !Important;	
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_title_color') != null) { ?>
.box-ULTIMATUMtoggle .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_title_color') ?>;
}
.box-ULTIMATUMtoggle .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_ULTIMATUMtoggle_title_color') ?> !Important;	
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_iconboxes_title_color') != null) { ?>

.box-iconboxes .heading_title span {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_iconboxes_title_color') ?>;
}
.box-iconboxes .heading_title span:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_iconboxes_title_color') ?> !Important;	
}
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_preloadImg') != null) && ($this->config->get('ULTIMATUMControl_preload') == '1')) { ?>
#loader  {
	background:url("<?php echo $base; ?>image/<?php echo  $this->config->get('ULTIMATUMControl_preloadImg');?>")  center center no-repeat no-repeat !Important;
}
	<?php } ?>
	<?php if($this->config->get('ULTIMATUMControl_featured_name_display') == '1') { ?>
.box-featured .prod_hold .name {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_featured_price_display') == '1') { ?>
.box-featured .prod_hold .price {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_featured_rating_display') == '1') { ?>
.box-featured .prod_hold .rating {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_featured_cart_display') == '1') { ?>
.box-featured .prod_hold .cart {
	display:none;
}
<?php } ?>
	<?php if($this->config->get('ULTIMATUMControl_latest_name_display') == '1') { ?>
.box-latest .prod_hold .name {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_latest_price_display') == '1') { ?>
.box-latest .prod_hold .price {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_latest_rating_display') == '1') { ?>
.box-latest .prod_hold .rating {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_latest_cart_display') == '1') { ?>
.box-latest .prod_hold .cart {
	display:none;
}
<?php } ?>
	<?php if($this->config->get('ULTIMATUMControl_bestseller_name_display') == '1') { ?>
.box-bestsellers .prod_hold .name {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_bestseller_price_display') == '1') { ?>
.box-bestsellers .prod_hold .price {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_bestseller_rating_display') == '1') { ?>
.box-bestsellers .prod_hold .rating {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_bestseller_cart_display') == '1') { ?>
.box-bestsellers .prod_hold .cart {
	display:none;
}
<?php } ?>
	<?php if($this->config->get('ULTIMATUMControl_special_name_display') == '1') { ?>
.box-special .prod_hold .name {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_special_price_display') == '1') { ?>
.box-special .prod_hold .price {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_special_rating_display') == '1') { ?>
.box-special .prod_hold .rating {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_special_cart_display') == '1') { ?>
.box-special .prod_hold .cart {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat15_color') != null) { ?>
#cat_tag15:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat15_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat14_color') != null) { ?>
#cat_tag14:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat14_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat13_color') != null) { ?>
#cat_tag13:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat13_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat12_color') != null) { ?>
#cat_tag12:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat12_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat11_color') != null) { ?>
#cat_tag11:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat11_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat10_color') != null) { ?>
#cat_tag10:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat10_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat9_color') != null) { ?>
#cat_tag9:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat9_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat8_color') != null) { ?>
#cat_tag8:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat8_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat7_color') != null) { ?>
#cat_tag7:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat7_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat6_color') != null) { ?>
#cat_tag6:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat6_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat5_color') != null) { ?>
#cat_tag5:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat5_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat4_color') != null) { ?>
#cat_tag4:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat4_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat3_color') != null) { ?>
#cat_tag3:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat3_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat2_color') != null) { ?>
#cat_tag2:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat2_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat1_color') != null) { ?>
#cat_tag1:after {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat1_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_submenu_columns') != null) { ?>
#menu ul#topnav ul.children {
	width:<?php echo $this->config->get('ULTIMATUMControl_submenu_columns'); ?>px;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_brandmenu_columns') != null) { ?>
#menu ul#topnav ul.children.children_brands {
	width:<?php echo $this->config->get('ULTIMATUMControl_brandmenu_columns'); ?>px;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_logo_position') != '1') { ?>
#header #logo {
	float:none !important;
}
#header .icon_links {
	float:none !important;
	margin:0 auto 20px auto !important;
}
<?php } ?>


<?php if($this->config->get('ULTIMATUMControl_listing_name_display') == '1') { ?>
.product-list .prod_hold .name {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_listing_price_display') == '1') { ?>
.product-list .prod_hold .price {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_listing_rating_display') == '1') { ?>
.product-list .prod_hold .rating {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_listing_cart_display') == '1') { ?>
.product-list .prod_hold .cart {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_sort_hover_mode') != '1') { ?>
html.no-touch .box-tabbed .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .box-tabbed .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_featured_hover_mode') != '1') { ?>
html.no-touch .box-featured .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .box-featured .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_latest_hover_mode') != '1') { ?>
html.no-touch .box-latest .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .box-latest .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_bestseller_hover_mode') != '1') { ?>
html.no-touch .box-bestsellers .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .box-bestsellers .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_special_hover_mode') != '1') { ?>
html.no-touch .box-special .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .box-special .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_listing_hover_mode') != '1') { ?>
html.no-touch .product-list .prod_hold:hover img {
	opacity:.6;
}
html.no-touch .product-list .prod_hold:hover {
	background-color:#f8f8f8;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_video_mask') != '0') { ?>
#fullscreen_slider .pattern, .bg .pattern {
	background:<?php echo $this->config->get('ULTIMATUMControl_video_mask'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_wish_status') == '0') { ?>
a.add_to_wishlist_small, li.wishlist_header, a.add_to_wishlist, li.edit_wishlist {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_compare_status') == '0') { ?>
a.add_to_compare_small, li.compare_header, a.add_to_compare, a#compare-total {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_affiliate_status') == '0') { ?>
li.affiliate_footer {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_default_cat_color') != null){ ?>
.box-category > ul > li > a {
	color:#<?php echo $this->config->get('ULTIMATUMControl_default_cat_color'); ?>;;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_default_cat_hover_color') != null) { ?>
.box-category > ul > li > a:hover, .box-category > ul > li a.active, .box-category > ul > li ul > li > a:hover {
	color:#<?php echo $this->config->get('ULTIMATUMControl_default_cat_hover_color'); ?>;;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_curlang_link') == '0') { ?>
#tabs-header {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_contact_link') == '0') { ?>
li.contact_header {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_wish_status') == '0') { ?>
a.add_to_wishlist_small, li.wishlist_header, a.add_to_wishlist, li.edit_wishlist {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_compare_status') == '0') { ?>
a.add_to_compare_small, li.compare_header, a.add_to_compare, a#compare-total {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_affiliate_status') == '0') { ?>
li.affiliate_footer {
	display:none !important;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_header_cms_block_state') == '0') { ?>
#header_cms_block_togglerone {
	display:none;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_header_cms_block_background') != null) { ?>
#header_cms_block {
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_header_cms_block_background'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_header_cms_block_color') != null) { ?>
#header_cms_block #header_cms_block_togglerone, #header_cms_block h1, #header_cms_block h2, #header_cms_block h3, #header_cms_block h4, #header_cms_block h5, #header_cms_block h6 {
	color:#<?php echo $this->config->get('ULTIMATUMControl_header_cms_block_color'); ?>;
}
<?php } ?>
html.touch .bg .pattern {
	display:none !important;
}
html.no-touch .element_from_bottom {
	bottom: -80px;
	opacity: 0;
	position: relative;
}
html.no-touch .element_from_left {
	left: -80px;
	opacity: 0;
	position: relative;
}
html.no-touch .element_from_right {
	right: -80px;
	opacity: 0;
	position: relative;
}
html.no-touch .element_fade_in {
	opacity: 0;
}
.product-filter {
	overflow:hidden;
}
#header .banner {
	float:right;
	margin-top:40px;
	margin-bottom:30px;
	width:auto;
}
.product-info .tags {
    max-width: 300px;
}
.latest-post-big {
	clear:left;
}
.latest-post-big.post_right {
	clear:none;
}
.related-posts, .box-related-posts {
	text-align:left;
}
body.bg .deal-item .post-date {
	width:70px;
	margin-left:-35px;
}
#header .icon_link_item, #footer .icon_link_item {
	vertical-align:top;
}
#header_cms_block {
	position:relative;
	z-index:200;
	<?php if($this->config->get('ULTIMATUMControl_header_cms_button_color') != null) { ?>
	border-bottom:3px solid #<?php echo $this->config->get('ULTIMATUMControl_header_cms_button_color'); ?>;
<?php } else { ?>
border-bottom:3px solid #444444;
<?php } ?>
}
#header_cms_block img {
	max-width:100%;
}
.toggler {
	position: absolute;
	display: block;
	width: 28px;
	height: 28px;
	<?php if($this->config->get('ULTIMATUMControl_header_cms_button_color') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_header_cms_button_color'); ?>;
<?php } else { ?>
background-color: #444444;
<?php } ?>	
	left: 50%;
	margin-left:-14px;
	text-indent: -9999px;
}
#header_cms_block_togglerone {
	position:relative;
	padding-top:30px;
	padding-bottom:30px;
}
.toggler span {
	display: block;
	width: 25px;
	height: 22px;
	background: url(catalog/view/theme/ULTIMATUM/image/back_toggle.png) 2px 0px no-repeat;
}
.swap span {
	background: url(catalog/view/theme/ULTIMATUM/image/back_toggle.png) 1px -30px no-repeat;
}
#product1_cms_block, #product2_cms_block {
	width:100%;
	margin-bottom:10px;	
}
#product2_cms_block {
	margin-bottom:30px;
	<?php if($this->config->get('ULTIMATUMControl_product2_cms_block_background') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_product2_cms_block_background'); ?>;
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_product2_cms_block_color') != null) { ?>
	color:#<?php echo $this->config->get('ULTIMATUMControl_product2_cms_block_color'); ?> !Important;
<?php } ?>	
}
#product1_cms_block {
	<?php if($this->config->get('ULTIMATUMControl_product1_cms_block_background') != null) { ?>
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_product1_cms_block_background'); ?>;
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_product1_cms_block_color') != null) { ?>
	color:#<?php echo $this->config->get('ULTIMATUMControl_product1_cms_block_color'); ?> !Important;
<?php } ?>	
}
#product1_cms_block > div, #product2_cms_block > div{
	padding:20px;	
}
<?php if($this->config->get('ULTIMATUMControl_cat_sort_back') != null) { ?>
.product-filter {	
	background-color:#<?php echo $this->config->get('ULTIMATUMControl_cat_sort_back'); ?>;
}
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_cat_sort_color') != null) { ?>
.product-filter .sort b, .product-filter .limit b, .product-filter a#compare-total{	
	color:#<?php echo $this->config->get('ULTIMATUMControl_cat_sort_color'); ?>;
}
<?php } ?>
.category-list {
	overflow:hidden;
}
#container.sticksy {
	padding-top:150px;
}
#header_all.sticksy {
	z-index: 20000;
	width:100%;
	opacity:0.95;
}
#header_all.sticksy #header {
	background-color:#333333;	
}
#header_all.sticksy .cat_tag, #header_all.sticksy #header #logo, #container.sticksy #header_cms_block, #header_all.sticksy .banner {
	display:none !important;
}
#header_all.sticksy #header_top {
	display:none !important;
}
.sticksy #menu {
	padding-top: 5px;
}
#header_all.sticksy #header .icon_links {
	display:none;
}
#loginContainer {
  position:relative;
  float:right;
  font-size:12px;
}
#loginBox {  
  position:absolute;
  top:34px;
  left:0px;
  display:none;
  z-index:19999;
  background: #ffffff; 
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
  -webkit-box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
} 
#login-form {
  width:236px; 
  padding:6px;
}
#login-form fieldset { 
  text-align:left;
  margin:0 0 12px 0;
  display:block;
  border:0;
  padding:0;
}
fieldset#body, #login-form .reg {  
  padding:10px 13px;
  margin:0;
}
#body label {
  margin:5px 0 0 0;
  display:block;
  float:left;
}
#login-form #body fieldset label {  
  display:block;
  float:none;
  text-transform:uppercase;
  font-size:11px;
}
#login-form input {  
  width:95%;   
}
#login-form a.forg {
  text-decoration:none;
  color:#333333;
}
#login-form a.forg:hover {
  color:#333333;
}
#login-form span {
  text-align:center; 
  display:block;
  padding-bottom: 7px;
}
#login-form #log-in {
  text-align:center; 
  width:211px;
  text-transform:uppercase;
  cursor: pointer; 
}
#login-form .button {
  text-align:center; 
  width:192px;
  text-transform:uppercase;
  cursor: pointer; 
}
.flydesc {
	width:260px;
	background-color:#333333;
	border:5px solid #444444;
	position:absolute;
	padding:10px;
	z-index:10000;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
	opacity:0.9;
	color:#f8f8f8;
}
.prod_hold .flydesc, .deal-item .flydesc {
	display:none;
}
</style>
