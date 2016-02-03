<?php if(($this->config->get('ULTIMATUMControl_pricetablesBg1Img') || $this->config->get('ULTIMATUMControl_pricetablesBg2Img') != null) && ($this->config->get('ULTIMATUMControl_status') == '1')) { ?>
<?php $parClass = "box-paralax"; ?>
<script type="text/javascript">
$(document).ready(function(){
	$('html.no-touch .box-pricetables').parallax("50%", 0.1, true);
})
</script>
<?php } else { ?>
<?php $parClass = "no-paralax"; ?>
<?php } ?>
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
<?php if (count($sections) > 5) { ?>
  <?php $boxNum = "full_width"; ?>
<?php } ?>
<div class="box box-pricetables <?php echo $parClass; ?>" id="pricetables<?php echo $module; ?>">
<div class="bg"></div>
<div class="inner">
<?php if ($module_title){ ?>
  <h2 class="heading_title"><span><?php echo $module_title; ?></span></h2>
<?php } ?>


<div class="all_tables">
<?php foreach($sections as $section){ ?>
<?php if ($section['state'] == "yes"){ ?>
<?php $tableClass = "active"; ?>
<?php } else { ?>
<?php $tableClass = "non-active"; ?>
<?php } ?>
<ul class="pricetable <?php echo $boxNum; ?> <?php echo $tableClass; ?> element_from_bottom <?php echo $section['id']; ?>">

  
	  <?php if ($section['title'] != ""){ ?>
      <li class="title-icon-holder"><?php echo $section['title']; ?><span class="pricetable_icon"><i class="<?php echo $section['icon']; ?>"></i></span></li>
      <?php } ?>
      <?php if ($section['line_price'] != ""){ ?>
      <li class="table-price"><?php echo $section['line_price']; ?>
      <?php if ($section['line_period'] != ""){ ?>
      <span class="pricetable_period"><?php echo $section['line_period']; ?></span>
      <?php } ?>
      </li>
      <?php } ?>
      <?php if ($section['line_option1'] != ""){ ?>
      <li class="odd"><?php echo $section['line_option1']; ?></li>
      <?php } ?>
      <?php if ($section['line_option2'] != ""){ ?>
      <li class="even"><?php echo $section['line_option2']; ?></li>
      <?php } ?>
      <?php if ($section['line_option3'] != ""){ ?>
      <li class="odd"><?php echo $section['line_option3']; ?></li>
      <?php } ?>
      <?php if ($section['line_option4'] != ""){ ?>
      <li class="even"><?php echo $section['line_option4']; ?></li>
      <?php } ?>
      <?php if ($section['line_option5'] != ""){ ?>
      <li class="odd"><?php echo $section['line_option5']; ?></li>
      <?php } ?>
      <?php if ($section['line_option6'] != ""){ ?>
      <li class="even"><?php echo $section['line_option6']; ?></li>
      <?php } ?>
      <?php if ($section['line_option7'] != ""){ ?>
      <li class="odd"><?php echo $section['line_option7']; ?></li>
      <?php } ?>
      <?php if ($section['line_option8'] != ""){ ?>
      <li class="even"><?php echo $section['line_option8']; ?></li>
      <?php } ?>
      <?php if ($section['line_button'] != ""){ ?>
      <li class="pricetable_button"><a class="button" href="<?php echo $section['line_button']; ?>"><?php echo $text_more; ?></a></li>
      <?php } ?>
 
</ul>
<?php if ($section['icon_color']){ ?>
      <style type="text/css">
      ul.pricetable.active.<?php echo $section['id']; ?> li.title-icon-holder, ul.pricetable.<?php echo $section['id']; ?>:hover li.title-icon-holder {
	background-color:#<?php echo $section['icon_color']; ?> !Important;	
}
      </style>
      <?php } ?>
<?php } ?>
</div>
</div>
</div>
