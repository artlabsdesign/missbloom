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
    <?php if ($success) { ?>
        <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                            <td class="left"><?php echo $column_url; ?></td>
                            <td class="right"><?php if ($sort == 's.h1') { ?>
                                    <a href="<?php echo $sort_h1; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_h1; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_h1; ?>"><?php echo $column_h1; ?></a>
                                <?php } ?></td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($seo_datas) { ?>
                            <?php foreach ($seo_datas as $seo_data) { ?>
                                <tr>
                                    <td style="text-align: center;"><?php if ($seo_data['selected']) { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $seo_data['seo_data_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $seo_data['seo_data_id']; ?>" />
                                        <?php } ?></td>
                                    <td class="left"><?php echo $seo_data['url']; ?></td>
                                    <td class="right"><?php echo $seo_data['h1']; ?></td>
                                    <td class="right"><?php foreach ($seo_data['action'] as $action) { ?>
                                            [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                                        <?php } ?></td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>
<?php echo $footer; ?>