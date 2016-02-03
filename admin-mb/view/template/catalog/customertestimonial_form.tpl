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
      <h1><?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">

            <table class="form">

	          <tr>
	            <td><?php echo $entry_title; ?></td>

	            <td><input type="text" name="customertestimonial_description[<?php echo $language['language_id']; ?>][title]" size="100" value="<?php echo isset($customertestimonial_description[$language['language_id']]) ? $customertestimonial_description[$language['language_id']]['title'] : ''; ?>" />


	          </tr>
	
	          <tr>
	            <td> <?php echo $entry_description; ?><span class="required">*</span></td>
	            <td>

			  <textarea rows="10" cols="95" name="customertestimonial_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($customertestimonial_description[$language['language_id']]) ? $customertestimonial_description[$language['language_id']]['description'] : ''; ?></textarea>
	              
				<?php if (isset($error_description[$language['language_id']])) { ?>
	              <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
	              <?php } ?>
			</td>
	          </tr>
      

            </table>


          </div>
          <?php } ?>
        </div>



      <table class="form">

			  <tr>
		          <td><?php echo $entry_avatar; ?></td>
			    <td>


<a onclick="image_upload('image0', 'thumb0');"><img id="thumb0" src="<?php echo $avatar2; ?>"><br>Browse</a> | <a onclick="$('#thumb0').attr('src', '<?php echo $no_image; ?>'); $('#image0').attr('value', '');" class="bt btn btn-mini">Delete</a>
				<input id="image0" type="hidden" value="<?php echo $avatar; ?>" name="avatar">

				<?php if (isset($error_avatar)) { ?>
	              <span class="error"><?php echo $error_avatar; ?></span>
	              <?php } ?>

				</td>
		        </tr> 

		        <tr>
		          <td> <?php echo $entry_name; ?></td>
				 <td><input type="text" name="name" value="<?php echo $name; ?>">
		
			              <?php if (isset($error_name)) { ?>
			              <span class="error"><?php echo $error_name; ?></span>
			              <?php } ?>

				</td>
		        </tr>   

			  <tr>
		          <td><?php echo $entry_email; ?></td>
			    <td><input type="text" name="email" value="<?php echo $email; ?>"></td>
		        </tr>
     

        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="status">
              <?php if ($status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_date_added; ?></td>
     	    <td><input type="text" name="date_added" value="<?php echo $date_added; ?>"></td> 	
        </tr>
          <tr>
            <td><?php echo $entry_rating; ?></td> 
		<td><span><?php echo $entry_bad; ?></span>&nbsp;
        		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
        		&nbsp; <span><?php echo $entry_good; ?></span>

          	</td>
          </tr>


      </table>


      </form>
    </div>
  </div>
</div>



<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $entry_avatar; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 


<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--></script> 
<?php echo $footer; ?>