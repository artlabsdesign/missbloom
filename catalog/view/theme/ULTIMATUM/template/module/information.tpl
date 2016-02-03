<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  <div class="box-category">
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li class="element_from_right"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <li class="element_from_right"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li class="element_from_right"><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
    </div>
  </div>
</div>
