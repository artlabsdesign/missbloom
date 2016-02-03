<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div id="blog_search_form">
<?php
$this->language->load('blog/search');
$search_form_title = $this->language->get('search_form_title');
$search_form_placeholder = $this->language->get('search_form_placeholder');
?>
  <div id="blog-searchform">
    <input type="text" name="filter_name" placeholder="<?php echo $search_form_placeholder; ?>" value="<?php echo $filter_name; ?>"  class="searchfield" />
  </div>
</div>
  </div>
</div>
