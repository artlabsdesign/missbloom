<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($blog_categories as $blog_category) { ?>
        <li class="element_from_right">
          <?php if ($blog_category['blog_category_id'] == $blog_category_id) { ?>
          <a href="<?php echo $blog_category['href']; ?>" class="active"><?php echo $blog_category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $blog_category['href']; ?>"><?php echo $blog_category['name']; ?></a>
          <?php } ?>
          <?php if ($blog_category['children']) { ?>
          <ul>
            <?php foreach ($blog_category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
