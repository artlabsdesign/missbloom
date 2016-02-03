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
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab-data">
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_url; ?></td>
                            <td><input type="text" name="url" value="<?php echo $url; ?>" size="98" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_h1; ?></td>
                            <td><input type="text" name="h1" value="<?php echo $h1; ?>" size="98" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_title; ?></td>
                            <td><input type="text" name="title" value="<?php echo $title; ?>" size="98" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_description; ?></td>
                            <td><textarea name="description" cols="100" rows="4" id="description"><?php echo $description; ?></textarea></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_seo_text; ?></td>
                            <td><textarea name="seo_text" cols="40" rows="10" id="seo_text"><?php echo $seo_text; ?></textarea></td>
                        </tr>
                        
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
CKEDITOR.replace('seo_text', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script> 
<?php echo $footer; ?>