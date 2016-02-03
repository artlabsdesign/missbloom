<?php echo $header; ?>

<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<h1 class="heading_title"><span>Оставить отзыв</span></h1>  
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
  	
  	<div class="content"><?php //echo $text_conditions ?></div>
  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="customertestimonial">
	<div class="content">

Тема<br /><br />
              <input type="text" name="title" value="<?php echo $title; ?>" />
              <?php if ($error_title) { ?>
              <span class="error"><?php echo $error_title; ?></span>
              <?php } ?>
              <br /><br />
              Отзыв<span class="required">*</span><br /><br />
              <textarea name="description" style="width: 99%;" rows="10"><?php echo $description; ?></textarea><br /><br />

              <?php if ($error_enquiry) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?>
              
              Фото<br /><br />
              <input id="testimonial_avatar" name="avatar" value="" type="file">
              <?php if ($error_avatar) { ?>
              <span class="error"><?php echo $error_avatar; ?></span>
              <?php } ?>
              <br /><br />

Имя<br /><br />
              <input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?>
              <br /><br />

		  E-mail<br /><br />
              <input type="text" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
              <br /><br />
              
<br>Рейтинг &nbsp;&nbsp;&nbsp; <span>Плохо</span>&nbsp;
        		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
        		&nbsp; <span>Хорошо</span><br /><br>



	<?php if ($need_captcha == true) { ?>

              <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
              
              <img src="index.php?route=information/contact/captcha" /> <br>
		Введите код с картинки<span class="required">*</span> <br /><br />

              <input type="text" name="captcha" value="<?php echo $captcha; ?>" /><br>

	<?php } ?>


	  </div>
      <div class="buttons">
<a  onclick="$('#customertestimonial').submit();" class="button"><span>Отправить</span></a>


      </div>
    </form>
<?php echo $content_bottom; ?>

</div>  
  <div class="clear"></div>
</div>
  <?php echo $content_bottom_fullwidth; ?>
<?php echo $footer; ?>