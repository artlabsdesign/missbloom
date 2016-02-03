<?php if (count($sections) == 1) { ?>
  <?php $boxNum = "full_width"; ?>
<?php } ?>
<?php if (count($sections) == 2) { ?>
  <?php $boxNum = "one_half"; ?>
<?php } ?>
<?php if (count($sections) == 3) { ?>
  <?php $boxNum = "one_third"; ?>
<?php } ?>
<?php if (count($sections) == 4) { ?>
  <?php $boxNum = "one_fourth"; ?>
<?php } ?>
<?php if (count($sections) == 5) { ?>
  <?php $boxNum = "one_fifth"; ?>
<?php } ?>


<?php if ($setting['position'] == 'footer_icon_teaser'){ ?>

<?php
  $number = count($sections);
  $start = 0;
  ?>

<div class="icon_links">

<?php foreach($sections as $section){ ?>

<div class="icon_link_item <?php echo $boxNum; ?> <?php if ($start < $number - 1) { ?><?php echo ""; ?><?php } else { ?><?php echo "last"; ?><?php } ?>">

<div class="icon_holder" <?php if ($section['icon_color']){ ?>style="background-color:#<?php echo $section['icon_color']; ?>"<?php } ?>><i class="<?php echo $section['icon']; ?>"></i></div>

<?php if ($section['title'] != "..."){ ?>
<a href="<?php if ($section['icon_link']){ ?><?php echo $section['icon_link']; ?><?php } else { ?>#teaser-<?php echo $section['id']; ?><?php } ?>" <?php if (!$section['icon_link']){ ?>id="<?php echo $section['id']; ?>" data-type="inline" class="ilightbox" data-options="width: 550, maxScale: 1"<?php } ?>><span class="h5"><?php echo $section['title']; ?></span></a>
<?php } ?>

<?php if ($section['sub_title'] != "..."){ ?>
<small><?php echo $section['sub_title']; ?></small>
<?php } ?>


<?php if ($section['description'] != "..."){ ?>
<div id="teaser-<?php echo $section['id']; ?>" style="display:none" class="icon_teaser">
<?php if ($section['title'] != "..."){ ?>
<span class="h3"><?php echo $section['title']; ?></span>
<?php } ?>
<?php if ($section['sub_title'] != "..."){ ?>
<span class="h6"><?php echo $section['sub_title']; ?></span>
<?php } ?>
<?php echo $section['description']; ?>      
</div>
<?php } ?>
</div>
<?php $start = $start + 1; ?>
<?php } ?>

<div class="clear"></div>
 
</div>

<?php } else { ?>

<div class="icon_links">
<?php foreach($sections as $section){ ?>
<div class="icon_link_item">
<div class="icon_holder" <?php if ($section['icon_color']){ ?>style="background-color:#<?php echo $section['icon_color']; ?>"<?php } ?>><i class="<?php echo $section['icon']; ?>"></i></div>

<?php if ($section['title'] != "..."){ ?>
<a href="<?php if ($section['icon_link']){ ?><?php echo $section['icon_link']; ?><?php } else { ?>#teaser-<?php echo $section['id']; ?><?php } ?>" <?php if (!$section['icon_link']){ ?>id="<?php echo $section['id']; ?>" data-type="inline" class="ilightbox" data-options="width: 550, maxScale: 1"<?php } ?>><span class="h5"><?php echo $section['title']; ?></span></a>
<?php } ?>

<?php if ($section['sub_title'] != "..."){ ?>
<small><?php echo $section['sub_title']; ?></small>
<?php } ?>


<?php if ($section['description'] != "..."){ ?>
<div id="teaser-<?php echo $section['id']; ?>" style="display:none" class="icon_teaser">
<?php if ($section['title'] != "..."){ ?>
<span class="h3"><?php echo $section['title']; ?></span>
<?php } ?>
<?php if ($section['sub_title'] != "..."){ ?>
<span class="h6"><?php echo $section['sub_title']; ?></span>
<?php } ?>
<?php echo $section['description']; ?>
<img src="catalog/view/theme/ULTIMATUM/image/spacer_trans.png" alt="trans"/>      
</div>
<?php } ?>

</div>
<?php } ?>



</div>
<?php } ?>

<script>
jQuery(document).ready(function($) {
<?php foreach($sections as $section){ ?>
$('#<?php echo $section['id']; ?>').iLightBox({
skin: 'metro-black'
});
<?php } ?>
return false;
});
</script>