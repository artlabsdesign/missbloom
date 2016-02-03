<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_toggle = $this->language->get('text_toggle');
$text_question = $this->language->get('text_question');
$text_facebook = $this->language->get('text_facebook');
$text_twitter = $this->language->get('text_twitter');
$text_twitter_follow = $this->language->get('text_twitter_follow');
$text_payment = $this->language->get('text_payment');
$text_skype_click = $this->language->get('text_skype_click');
?>

<div id="footer">
  <div class="inner inner_lifted">
  <?php echo $footer_icon_teaser; ?>
    <div class="clear"></div>
  </div>
  
<?php if ($modules) { ?>  
  <div class="inner inner_mods">
  
  <?php if (count($modules) == 1) { ?>
  <?php $modNum = "full_width"; ?>
<?php } ?>
<?php if (count($modules) == 2) { ?>
  <?php $modNum = "one_half"; ?>
<?php } ?>
<?php if (count($modules) == 3) { ?>
  <?php $modNum = "one_third"; ?>
<?php } ?>
<?php if (count($modules) == 4) { ?>
  <?php $modNum = "one_fourth"; ?>
<?php } ?>
<?php if (count($modules) > 4) { ?>
  <?php $modNum = "full_width"; ?>
<?php } ?>
<?php
  $modNumber = count($modules);
  $startmodNumber = 0;
  ?>  
  
  	<?php foreach ($modules as $module) { ?>
    <div class="<?php echo $modNum; ?> <?php if ($startmodNumber < $modNumber - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>">
      <?php echo $module; ?>
    </div>
    <?php $startmodNumber = $startmodNumber + 1; ?>
      <?php } ?>
    <div class="clear"></div>
  </div>
 <?php } ?> 
  
  <div class="inner">
    <div class="one_fourth column element_from_left">
      <span class="h4"><?php echo $text_information; ?></span>
      <ul class="footer_links">
        <?php foreach ($informations as $information) { ?>
        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
    <div class="one_fourth column element_from_left">
      <span class="h4"><?php echo $text_service; ?></span>
      <ul class="footer_links">
        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
      </ul>
    </div>
	<?/*
    <div class="one_fourth column element_from_right">
      <span class="h4"><?php echo $text_extra; ?></span>
      <ul class="footer_links">
        <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
        <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
        <li class="affiliate_footer"><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
      </ul>
    </div>
	*/?>
	<div class="one_fourth column element_from_left">
	  <span class="h4">Категории</span>
	  <ul class="footer_links">
		<li><a href="/buketi">Букеты</a></li>
		<li><a href="/design-collection">Дизайнерские букеты</a></li>
		<li><a href="/cveti">Цветы</a></li>
		<li><a href="/compositions">Композиции</a></li>
		<li><a href="/wedding">Свадебная флористика</a></li>
		<li><a href="/podarki">Подарки</a></li>
	  </ul>
	</div>
	
    <div class="one_fourth last column element_from_right">
      <span class="h4"><?php echo $text_account; ?></span>
      <ul class="footer_links">
        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li class="wishlist_header"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
    </div>
    <div class="clear"></div>
	

	

	
	<div class="clear"></div>
	
    <div class="footer_bottom">
      <div class="one_half">
        <?php if($this->config->get('ULTIMATUMControl_paypal') == '1') { ?>
        <div class="paypal_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_visa') == '1') { ?>
        <div class="visa_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_electron') == '1') { ?>
        <div class="electron_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_master') == '1') { ?>
        <div class="master_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_maestro') == '1') { ?>
        <div class="maestro_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_cirrus') == '1') { ?>
        <div class="cirrus_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_american') == '1') { ?>
        <div class="american_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_2checkout') == '1') { ?>
        <div class="two_checkout_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_delta') == '1') { ?>
        <div class="delta_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_discover') == '1') { ?>
        <div class="discover_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_google') == '1') { ?>
        <div class="google_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_moneybookers') == '1') { ?>
        <div class="moneybookers_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_sage') == '1') { ?>
        <div class="sage_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_solo') == '1') { ?>
        <div class="solo_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_switch') == '1') { ?>
        <div class="switch_icon cards_icon"></div>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_western') == '1') { ?>
        <div class="western_icon cards_icon"></div>
        <?php } ?>
      </div>
      <div class="one_half last">
      <div class="socials">
    <?php if($this->config->get('ULTIMATUMControl_facebook_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_facebook_id') ?>" title="facebook" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_facebook.png" alt="Facebook" /></a>
        <?php } ?>
    <?php if($this->config->get('ULTIMATUMControl_twitter_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_twitter_id') ?>" title="Twitter" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_twitter.png" alt="Twitter" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_pinterest_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_pinterest_id') ?>" title="Pinterest" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_pinterest.png" alt="Pinterest" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_google_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_google_id') ?>" title="Google+" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_google.png" alt="Google+" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_youtube_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_youtube_id') ?>" title="YouTube" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_youtube.png" alt="YouTube" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_vimeo_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_vimeo_id') ?>" title="Vimeo" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_vimeo.png" alt="Vimeo" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_linkedin_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_linkedin_id') ?>" title="LinkedIn" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_linkedin.png" alt="LinkedIn" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_dribble_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_dribble_id') ?>" title="Dribbble" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_dribbble.png" alt="Dribbble" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_skype_id') != null) { ?>
        <script type="text/javascript" src="https://download.skype.com/share/skypebuttons/js/skypeCheck.js"></script>
        <a href="skype:<?php echo $this->config->get('ULTIMATUMControl_skype_id') ?>?chat" title="Skype"><img src="catalog/view/theme/ULTIMATUM/image/icon_skype.png" alt="Skype" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_picasa_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_picasa_id') ?>" title="Picasa" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_picasa.png" alt="Picasa" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_flickr_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_flickr_id') ?>" title="Flickr" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_flickr.png" alt="Flickr" /></a>
        <?php } ?>
        <?php if($this->config->get('ULTIMATUMControl_instagram_id') != null) { ?>
        <a href="<?php echo $this->config->get('ULTIMATUMControl_instagram_id') ?>" title="Instagram" target="_blank"><img src="catalog/view/theme/ULTIMATUM/image/icon_instagram.png" alt="Instagram" /></a>
        <?php } ?>
    </div>
        
      </div>
      <div class="clear"></div>
      <div class="fuillwidth">
      <?php
      $ULTIMATUMControl_seals = $this->config->get('ULTIMATUMControl_seals' . $this->config->get('config_language_id'));
      ?>
      <?php if($ULTIMATUMControl_seals != null) { ?>
        <?php echo html_entity_decode($ULTIMATUMControl_seals); ?>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered">
  <div class="inner" style="color: white;">
	
    <?php if($this->config->get('ULTIMATUMControl_copyright') != null) { ?>
    <?php echo html_entity_decode($this->config->get('ULTIMATUMControl_copyright')); ?>
    <?php } else { ?>
    Design and Development by <a href="http://themeforest.net/user/theAlThemist/portfolio?ref=theAlThemist">theAlThemist</a><br> © 2014 | All rights reserved!    
    <?php } ?>
	
	<span>Без выходных: с 10 до 20 00</span>
  </div>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
<?php if($this->config->get('ULTIMATUMControl_responsive') == '1'){	?>
<?php 
$ULTIMATUMControl_menu_label = $this->config->get('ULTIMATUMControl_menu_label' . $this->config->get('config_language_id'));
?>
<script>
    selectnav('main_nav', {
  	label: ' <?php echo $ULTIMATUMControl_menu_label; ?> ',
  	nested: true,
	activeclass: 'selected',
  	indent: '-'
	});
</script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#menu_mobile").mmenu();
   });
   
</script>
<?php } ?>
<?php if($this->config->get('ULTIMATUMControl_sticky_menu') == '1') { ?>
<script>

$(function() {

		// grab the initial top offset of the navigation 
		var sticky_navigation_offset_top = $('#header_colapse').offset().top;
	
		// our function that decides weather the navigation bar should have "fixed" css position or not.
		var sticky_navigation = function(){
		var scroll_top = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll_top > sticky_navigation_offset_top) { 
			$('html.no-touch #header_all').css({ 'position': 'fixed', 'top':0, 'left':0 });
			$('html.no-touch #header_all, html.no-touch #container').addClass("sticksy");
		} else {
			$('html.no-touch #header_all').css({ 'position': 'relative' });
			$('html.no-touch #header_all, html.no-touch #container').removeClass("sticksy"); 
		}   
		};

		// Sticky menu
		sticky_navigation();
	
		// and run it again every time you scroll
		$(window).scroll(function() {
		 sticky_navigation();
		});

		});
</script>
<?php } ?>
<?php if(($this->config->get('ULTIMATUMControl_pop_log_status') != '0')) { ?>
<script type="text/javascript">
$(document).ready(function(){
    var link = $('#loginLink');
    var box = $('#loginBox');
    var form = $('#login-form');
    link.removeAttr('href');
    link.mouseup(function(login) {
        box.toggle();
        link.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    $(this).mouseup(function(login) {
        if(!($(login.target).parent('#subico_account').length > 0)) {
            link.removeClass('active');
            box.hide();
        }
    });
});
</script>
<script type="text/javascript">
$(document).ready(function() {
$('#log-in').on('click', function() {
 $('.warning').hide();
 $('.warning').html('');
	$.ajax({
		url: 'index.php?route=account/login/send_login',
		type: 'post',		
		data: $('#login-form :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#log-in').attr('disabled', true);
			$('#log-in').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#log-in').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			if (json['error']) {
				$('#login-form').after('<div class="warning" style="width:160px; margin-left:8px;">' + json['error'] + '</div>');
				setTimeout(function(){$('.warning').fadeOut();}, 5000);
			} 
			if (json['success']) {
				$('#login-form input[name=\'email\']').val("");
				$('#login-form input[name=\'password\']').val("");	

        window.location.reload();

			}
		  }
	  });	
  });
});
</script> 
<?php } ?>
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<a href="https://plus.google.com/105762685302669444027" rel="publisher"></a>
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'sjZ4KGyJsX';
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();</script>
<!-- {/literal} END JIVOSITE CODE -->

<div style="display:none;">
<!-- begin of Top100 code -->
<script id="top100Counter" type="text/javascript" src="http://counter.rambler.ru/top100.jcn?3106876"></script>
<noscript>
<a style="display:none;" href="http://top100.rambler.ru/navi/3106876/">
<img style="display:none;" src="http://counter.rambler.ru/top100.cnt?3106876" alt="Rambler's Top100" border="0" />
</a>

</noscript>
<!-- end of Top100 code -->
</div>
 
<!-- Rating@Mail.ru counter -->
<script type="text/javascript">
var _tmr = _tmr || [];
_tmr.push({id: "2652046", type: "pageView", start: (new Date()).getTime()});
(function (d, w) {
   var ts = d.createElement("script"); ts.type = "text/javascript"; ts.async = true;
   ts.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//top-fwz1.mail.ru/js/code.js";
   var f = function () {var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ts, s);};
   if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); }
})(document, window);
</script><noscript><div style="position:absolute;left:-10000px;">
<img style="display:none;"  src="//top-fwz1.mail.ru/counter?id=2652046;js=na" style="border:0;" height="1" width="1" alt="Рейтинг@Mail.ru" />
</div></noscript>
<!-- //Rating@Mail.ru counter -->

<!--LiveInternet counter--><script type="text/javascript"><!--
document.write("<a style='display:none;'  href='//www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t52.6;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";"+Math.random()+
"' alt='' title='LiveInternet: показано число просмотров и"+
" посетителей за 24 часа' "+
"border='0' width='88' height='31'><\/a>")
//--></script><!--/LiveInternet-->

</body></html>