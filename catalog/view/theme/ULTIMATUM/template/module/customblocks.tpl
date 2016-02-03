<?php foreach($sections as $section){ ?>

<div id="my-menu<?php echo $module; ?>" class="pull-item <?php echo $section['left_right']; ?>" style="<?php echo $section['left_right']; ?>:-<?php echo $section['item_width'] + 24; ?>px; top:<?php echo $section['top']; ?>px; width:<?php echo $section['item_width'] + 24; ?>px;">
  <div class="top-level-pull-out" style="width:<?php echo $section['item_width']; ?>px; height:<?php echo $section['item_height']; ?>px; background-color:#<?php echo $section['color']; ?>;">
    <div class="pull-inner" style="width:<?php echo $section['item_width']; ?>px; height:<?php echo $section['item_height']; ?>px;">
    <div style="padding:20px;">
    <?php if ($section['title'] != "..."){ ?>
      <span class="h4"><?php echo $section['title']; ?></span>
      <?php } ?>
      <?php if ($section['description'] != "..."){ ?>
      <?php echo $section['description']; ?>
      <?php } ?>
      </div>
    </div>
  </div>
  <div class="pull_butoon" style="width:<?php echo $image_width; ?>px; height:<?php echo $image_height; ?>px; background-color:#<?php echo $section['color']; ?>;"><img alt="sideblock" src="<?php echo $section['image']; ?>" /></div>
</div>
<script>
$('#my-menu<?php echo $module; ?>').appendTo('body');
</script>
<?php } ?>
