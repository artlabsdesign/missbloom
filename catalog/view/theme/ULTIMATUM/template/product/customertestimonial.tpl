<?php echo $header; ?>

<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
        <a href="http://missbloom.ru/">Главная</a>
         » <a href="http://missbloom.ru/otzivi.html">Отзывы</a>
      </div>
<h1 class="heading_title"><span>Отзывы</span></h1>  
</div>
</div>


<?php echo $content_top_fullwidth; ?>

<div id="content_wrap" class="inner main_inner"> <?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content">
  <div id="content_sections">
  <?php echo $content_top_two_third; ?>
<?php echo $content_top_one_third_last; ?>
<div class="clear"></div>
</div>
<?php echo $content_top; ?>

    <?php if ($customertestimonials) { ?>
    
      <?php foreach ($customertestimonials as $customertestimonial) { ?>

        <div class="testimoial_unit">
		
		<div class="testimonial-left-block">
			<div class="testimoial_author_img">
			<?php if ($customertestimonial['avatar']!="") { ?>
			<img src="<?php echo $customertestimonial['avatar']; ?>">
			<?php } else { ?>
			<img src="catalog/view/theme/ULTIMATUM/image/no_avatar.jpg" />
			<?php } ?>
			</div>
			
			<div class="testimoial_author">
			<?php if ($customertestimonial['name']!="") echo $customertestimonial['name']; ?>
			</div>
		</div>
		
		<div class="testimonial-right-block">
			
			<div class="testimonial_title"><h4><?php echo $customertestimonial['title']; ?></h4></div>

			<div class="testimonial_description"><?php echo $customertestimonial['description'] ; ?></div>
			
			<?php if ($customertestimonial['rating']) { ?>
			<div class="testimoial_rating"> <img src="catalog/view/theme/ULTIMATUM/image/testimonials/stars-<?php echo $customertestimonial['rating'] . '.png'; ?>" /> </div>
			<?php } ?>
		</div>

        </div>


      <?php } ?>

    	<?php if ( isset($pagination)) { ?>
    		<div class="pagination"><?php // echo $pagination;?></div>
    		<? /*<div class="buttons" align="right"><a class="button" href="<?php echo $write_url;?>" title="Написать отзыв"><span>Написать отзыв</span></a></div> */?>
    	<?php }?>

    	<?php if (isset($showall_url)) { ?>
    		<? /* <div class="buttons" align="right"><a class="button" href="<?php echo $write_url;?>" title="Написать отзыв"><span>Написать отзыв</span></a> &nbsp;<a class="button" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><span><?php echo $showall;?></span></a></div> */?>
    	<?php }?>
		
		
		<form action="" method="post" enctype="multipart/form-data" id="customertestimonial">
		<div class="content">
			<div class="testimonial-form-left">
				<div class="testimonial-form-block">
					<label class="simple">Фото</label>
					
					<input id="testimonial_avatar" name="avatar" value="" type="file">
					<?php if ($error_avatar) { ?>
					<span class="error"><?php echo $error_avatar; ?></span>
					<?php } ?>
				</div>
			</div>
			
			<div class="testimonial-form-right">
			<span class="h3"><i class="icon-comment"></i> Оставьте свой отзыв</span>
			
				<div class="new-form-block">
					<label><span>Ваше имя:</span> <input type="text" name="name" value="<?php echo $name; ?>" /></label>
				
					<?php if ($error_name) { ?>
					<span class="error"><?php echo $error_name; ?></span>
					<?php } ?>
				</div>
				
				<div class="new-form-block">
					<label><span>Ваш e-mail:</span> <input type="text" name="email" value="<?php echo $email; ?>" /></label>
				
					<?php if ($error_email) { ?>
					<span class="error"><?php echo $error_email; ?></span>
					<?php } ?>
				</div>

				<div class="new-form-block">
					<label class="simple">Ваш текст:<i class="required">*</i></label>
					
					<textarea name="description" style="width: 99%;" rows="10"><?php echo $description; ?></textarea>
					
					<?php if ($error_enquiry) { ?>
					<span class="error"><?php echo $error_enquiry; ?></span>
					<?php } ?>
				</div>
				
				<div class="new-form-block">
					<?php if ($need_captcha == true) { ?>

					<label class="simple">Введите код указанный картинки <i class="required">*</i></label>
			
					<input type="text" name="captcha" value="<?php echo $captcha; ?>" /><br><br>
					
					<img src="index.php?route=information/contact/captcha" /><br><br>
					
					<?php if ($error_captcha) { ?>
					<span class="error"><?php echo $error_captcha; ?></span>
					<?php } ?>
					
					<?php } ?>
				</div>
				
				<div class="buttons">
					<a  onclick="$('#customertestimonial').submit();" class="button"><span>Отправить</span></a>
				</div>
			</div>

		</div>
		
		
		</form>
	
    <?php } ?>
  <?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?>