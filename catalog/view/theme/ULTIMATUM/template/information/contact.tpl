<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_toggle = $this->language->get('text_toggle');
$text_question = $this->language->get('text_question');
$text_facebook = $this->language->get('text_facebook');
$text_twitter = $this->language->get('text_twitter');
$text_payment = $this->language->get('text_payment');
$text_skype_click = $this->language->get('text_skype_click');
$text_hours = $this->language->get('text_hours');
$text_map_get_directions = $this->language->get('text_map_get_directions');
$text_map_route = $this->language->get('text_map_route');
$text_map_address = $this->language->get('text_map_address');
$text_calculate = $this->language->get('text_calculate');
?>
<?php echo $header; ?>


<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>  
</div>
</div>
<?php echo $content_top_fullwidth; ?>



<div itemscope itemtype="http://schema.org/Organization" id="content_wrap" class="inner main_inner"> <?php echo $column_left; ?><?php echo $column_right; ?>
<span style="display:none;" itemprop="name">Miss Bloom</span>
  <div id="content">
  <div id="content_sections">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>
  <?php if(($this->config->get('ULTIMATUMControl_map_status') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
  <div class="google-maps">
    <div id="map_canvas" style="width:100%; height:440px"></div>
    <div class="directions_holder">
    <h4><i class="icon-map-marker"></i><?php echo $text_map_get_directions; ?></h4>
      <p><?php echo $text_map_route; ?></p>
      <form id="gmap" action="" onSubmit="calcRoute();return false;" id="routeForm" align="right">
      <input type="text" id="routeStart" value="" placeholder="<?php echo $text_map_address; ?>" style="margin-top:3px"><br /><br />
      <input type="submit" value="<?php echo $text_calculate; ?>" class="button" onclick="calcRoute();return false;"  />
      </form>
    </div>
  </div>
  <?php } ?>
  
  
  
  
  
  <?php
      $ULTIMATUMControl_custom_contact = $this->config->get('ULTIMATUMControl_custom_contact' . $this->config->get('config_language_id'));
      ?>
  <?php if(($ULTIMATUMControl_custom_contact != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
  
  <div class="content">
  
  <?php //echo html_entity_decode($ULTIMATUMControl_custom_contact); ?>
  
  </div>
  <?php } ?> 
  
   
   
    
      <div class="two_third" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
        <span class="h3"><i class="icon-map-marker"></i><?php echo $text_address; ?></span></span>

		<span class="contact-info-text" itemprop="streetAddress">
			<?php echo $address; ?>
		</span>
		
		<div class="how_find_us">
			<span class="how_find_us_title">Как к нам добраться</span> <a onclick="changeFindTextarea('how_find_us_car_textarea');" class="how_find_us_car_textarea_button button active">На машине</a><a onclick="changeFindTextarea('how_find_us_walk_textarea');" class="how_find_us_walk_textarea_button button">Пешком</a>
			<div>
				<textarea rows="10" cols="55" class="how_find_us_car_textarea">При движении в центр по Комсомольской площади(от 3-го транспортного кольца) Вам нужно проехать Ярославский и Ленинградский вокзал и на последнем повороте перед железнодорожным мостом повернуть направо. Далее прямо до шлагбаума. Вьехав на территорию, нужно проехать прямо два длинных здания, повернуть направо и заехать в ворота(тоже справа). Наша дверь последняя в длинном здании слева.    </textarea>
				<textarea rows="10" cols="55" class="how_find_us_walk_textarea" style="display:none;"> </textarea>
			</div>
		</div>
		
		<script>
			function changeFindTextarea($element){
				$('.how_find_us .button').removeClass('active');
				$('.'+$element+'_button').addClass('active');
				$('.how_find_us textarea').hide();
				$('.'+$element).show();
			}
		</script>
		
		
		<?php if ($telephone) { ?>
		<span class="h3"><i class="icon-phone"></i><?php echo $text_telephone; ?></span></span>
		
		<span class="contact-info-text" itemprop="telephone">
			<?php echo $telephone; ?>
		</span>
		<?php } ?>
		
		<?php if ($fax) { ?>
		<span class="h3"><i class="icon-fax"></i><?php echo $text_fax; ?></span></span>
		
		<span class="contact-info-text">
			<?php echo $fax; ?>
		</span>
		<?php } ?>
		

		<span class="h3"><i class="icon-list"></i>Наши реквизиты:</span>
		<span class="contact-info-text">
			<p>ИП Костюкович Екатерина Александровна</p>
			<p>ИНН &nbsp;310303200620</p>
			<p>ОГРНИП &nbsp;314500112000025</p>
			<p>Юр. адрес : Московская область, г. Балашиха, д. Черное, ул. Рассветная д.6а</p>
			<p>ОКАТО: 46204000000</p>
			<p>ОКВЭД: &nbsp;52.61.2</p>
			<p>Р.сч.:&nbsp;40802810502620000304</p>
			<p>Банк: ОАО "АЛЬФА-БАНК"</p>
			<p>БИК: 044525593</p>
			<p>Кор.сч.: &nbsp;30101810200000000593</p>
		</span>


      </div>
      <div class="last one_third">
		<form action="<?php echo $action; ?>" method="post" id="contact_send_form" enctype="multipart/form-data">
			<span class="h3"><i class="icon-comment"></i> <span>Напишите нам</span></span>
			
			<div class="new-form-block">
				<label><span><?php echo $entry_name; ?></span> <input type="text" name="name" value="<?php echo $name; ?>" /></label>
			
				<?php if ($error_name) { ?>
				<span class="error"><?php echo $error_name; ?></span>
				<?php } ?>
			</div>
			
			<div class="new-form-block">
				<label><span><?php echo $entry_email; ?></span> <input type="text" name="email" value="<?php echo $email; ?>" /></label>
			
				<?php if ($error_email) { ?>
				<span class="error"><?php echo $error_email; ?></span>
				<?php } ?>
			</div>

			<div class="new-form-block">
				<label class="simple"><?php echo $entry_enquiry; ?><i class="required">*</i></label>
				
				<textarea name="enquiry" style="width: 100%;" rows="10"><?php echo $enquiry; ?></textarea>
				
				<?php if ($error_enquiry) { ?>
				<span class="error"><?php echo $error_enquiry; ?></span>
				<?php } ?>
			</div>
			
			<div class="new-form-block">
				<label class="simple"><?php echo $entry_captcha; ?> <i class="required">*</i></label>
		
				<input type="text" name="captcha" value="<?php echo $captcha; ?>" /><br><br>
				
				<img src="index.php?route=information/contact/captcha" alt="" /><br><br>
				
				<?php if ($error_enquiry) { ?>
				<span class="error"><?php echo $error_enquiry; ?></span>
				<?php } ?>
			</div>
			
			<div class="buttons text-right">
				<a onclick="$('#contact_send_form').submit();" class="button"><span>Отправить</span></a>
			</div>
		</form>
    <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <?php echo $content_bottom; ?>
    </div>
    <div class="clear"></div>
</div>
<?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?> 
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<?php if(($this->config->get('ULTIMATUMControl_map_status') == '1') && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php include(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/map.php'); ?> 
<?php } ?>