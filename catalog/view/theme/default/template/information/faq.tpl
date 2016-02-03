<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="title-holder">
<div class="inner">
	<div class="breadcrumb">
		<a href="/">Главная</a> » <a>FAQ</a>
	</div>
<h1 class="heading_title"><span>FAQ</span></h1>
</div>
</div>

<div id="content_wrap" class="inner main_inner"><?php echo $content_top; ?>

  <div class="content">
    <?php if (isset($topics)) { ?>
      <div class="content">
      <?php foreach ($topics as $topic) { ?>
      <div style="margin-bottom: 10px;">
		Вопрос: <?php echo $topic['title']; ?><br>
		Ответ: <?php echo $topic['description'];?>
	  </div>
      <?php } ?>
      </div>
    <?php } ?>
  </div>

  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
