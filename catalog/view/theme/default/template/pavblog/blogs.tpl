<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="title-holder">
<div class="inner">
	<div class="breadcrumb">
		<a href="/">Главная</a> » <a>Новости</a>
	</div>
<h1 class="heading_title"><span>Новости</span></h1>
</div>
</div>

<div id="content_wrap" class="inner main_inner"><?php echo $content_top; ?>
    
  <div class="pav-filter-blogs">

		<div class="pav-blogs">
		
			<div class="box-content box-posts-holder mod_2">
				<?php
				$cols = $config->get('cat_columns_leading_blogs');
				if( count($leading_blogs) ) { ?>
						<?php foreach( $leading_blogs as $key => $blog ) {?>
						<?php require( '_item.tpl' ); ?>
						<?php } ?>
				<?php } ?>

				<?php
					$cols = $config->get('cat_columns_secondary_blogs');
					if ( count($secondary_blogs) ) { ?>
						<?php foreach( $secondary_blogs as $key => $blog ) {; ?>
						<?php require( '_item.tpl' ); ?>
						<?php } ?>
				<?php } ?>
			</div>
			
			<div class="pav-pagination pagination"><?php echo $pagination;?></div>
		</div>
  </div>
 

  <?php echo $content_bottom; ?></div>
  
<?php echo $footer; ?>