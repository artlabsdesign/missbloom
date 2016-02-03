<?php
$this->language->load('ULTIMATUM_custom/ULTIMATUM');
$text_wish = $this->language->get('text_wish');
$text_compare = $this->language->get('text_compare');
$text_sale = $this->language->get('text_sale');
$text_save = $this->language->get('text_save');
$text_new_prod = $this->language->get('text_new_prod');
$text_left = $this->language->get('text_left');
$text_purchased = $this->language->get('text_purchased');
$text_limited = $this->language->get('text_limited');
?>
<div class="box">

<div class="box-heading"><?php if ($customertestimonial_title=="") echo "<br>"; else echo $customertestimonial_title; ?></div>


    <div class="box-content">
    
        <?php foreach ($customertestimonials as $customertestimonial) { ?>
        <div class="testimonial_unit_column">

        <b><?php echo $customertestimonial['title']; ?></b>
        
        <div class="testimonial_description"><?php echo $customertestimonial['description'] ; ?></div>
          
          
          
          <div class="testimoial_author">
          
          <?php if ($customertestimonial['name']!="") echo '<i class="icon-user"></i>' .$customertestimonial['name']; ?>
          </div>


        </div>
        <?php }  ?>
        
        
        

      
      <div class="testimonial_buttons">
        <a href="<?php echo $showall_url;?>"><?php echo $show_all; ?> (<?php echo $total ?>)</a> | <a href="<?php echo $sendtests; ?>"><?php echo $send_customertestimonial_lr; ?></a>
       </div>
      
</div>


</div>
