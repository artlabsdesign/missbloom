<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <a href="#ajaxcart-settingmain"><?php echo $text_main_tab_setting; ?></a>
        </div>
        <div id="ajaxcart-settingmain" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_heading_forproducts; ?></td>
              <td><input type="text" name="config_textforproducts" value="<?php echo $config_textforproducts; ?>" size="100" /></td>
            </tr>
            <tr>
              <td><?php echo $text_ajaxcart_countname; ?></td>
              <td><input type="text" name="config_ajaxcart_countname" value="<?php echo $config_ajaxcart_countname; ?>" size="50" /></td>
            </tr>
            <tr>
              <td><?php echo $text_ajaxcart_countdesc; ?></td>
              <td><input type="text" name="config_ajaxcart_countdesc" value="<?php echo $config_ajaxcart_countdesc; ?>" size="50" /></td>
            </tr>
            <tr>
              <td><?php echo $text_ajaxcart_showsku; ?></td>
              <td>
                  <select name="config_ajaxcart_showsku">
                      <?php if ($config_ajaxcart_showsku == "1") { ?>
                      <option value="1" selected="selected"><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } elseif ($config_ajaxcart_showsku == "2") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" selected="selected"><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } else { ?>
                      <option value="1" ><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  selected="selected"><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } ?>
                  </select>
              </td>
            </tr>
            <tr>
              <td><?php echo $text_ajaxcart_showmodel; ?></td>
              <td>
                  <select name="config_ajaxcart_showmodel">
                      <?php if ($config_ajaxcart_showmodel == "1") { ?>
                      <option value="1" selected="selected"><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } elseif ($config_ajaxcart_showmodel == "2") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" selected="selected"><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } else { ?>
                      <option value="1" ><?php echo $text_ajaxcart_yes; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_no; ?></option>
                      <option value=""  selected="selected"><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } ?>
                  </select>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_type_productsincart; ?></td>
              <td>
                  <select name="config_type_ap" id="type_ap_change">
                      <?php if ($config_type_ap == "1") { ?>
                      <option value="1" selected="selected"><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" ><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" ><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" ><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } elseif ($config_type_ap == "2") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" selected="selected"><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" ><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" ><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" ><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                       <?php } elseif ($config_type_ap == "3") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" selected="selected"><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" ><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" ><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                       <?php } elseif ($config_type_ap == "4") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" ><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" selected="selected"><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" ><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                       <?php } elseif ($config_type_ap == "5") { ?>
                      <option value="1" ><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" ><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" ><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" selected="selected"><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  ><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } else { ?>
                      <option value="1" ><?php echo $text_ajaxcart_bycategory; ?></option>
                      <option value="2" ><?php echo $text_ajaxcart_viewed; ?></option>
                      <option value="3" ><?php echo $text_ajaxcart_special; ?></option>
                      <option value="4" ><?php echo $text_ajaxcart_bestsellers; ?></option>
                      <option value="5" ><?php echo $text_ajaxcart_latest; ?></option>
                      <option value=""  selected="selected"><?php echo $text_ajaxcart_makeachoice; ?></option>
                      <?php } ?>
                  </select>
              </td>
            </tr>
            
          <tr id="type_ap_categories" style="display:none;">
              <td><?php echo $entry_select_categories; ?></td>
              <td><select name="config_parent_id">
                  <option value="0"><?php echo $text_ajaxcart_makeachoice; ?></option>
                  <?php foreach ($categories as $category) { ?>
                  <?php if ($category['category_id'] == $config_parent_id) { ?>
                  <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
            </td>
            </tr>

            <script type="text/javascript">
              $(document).ready(function() {
                if ($('#type_ap_change').val() == '1') {
                  $('#type_ap_categories').show();
                };
                $('#type_ap_change').change(function(){
                  if($('#type_ap_change').val() == '1'){
                    $('#type_ap_categories').show();
                  } else {
                    $('#type_ap_categories').hide();
                  }
                });
              });
            </script>
          </table>
      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<?php echo $footer; ?>