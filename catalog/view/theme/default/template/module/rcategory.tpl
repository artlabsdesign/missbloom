<?php if(!empty($rcatproducts)){ ?>
	<?php if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom')){ ?>
		<?php if($setting['tab_color']){ ?>
			<style>.rhtabs a.selected {background-color:<?php echo $setting['tab_color']; ?>}</style>
		<?php } ?>
		<div class="box box-related">
			<div class="heading_title"><span><?php echo $heading_title; ?></span></div>
			<div class="box-content">
			
				<p id="rhtabs-<?php echo $module ?>" class="rhtabs">
					<?php foreach ($rcatproducts as $rcatproduct) { ?>
						<?php if(!empty($rcatproduct['rproducts'])) { ?>
							<a href="#rcategory-<?php echo $rcatproduct['rcategory_id'] ?>-<?php echo $module ?>" ><?php echo $rcatproduct['rcategory_name'] ?></a>
						<?php } ?>
					<?php } ?>
				</p>
				<?php foreach ($rcatproducts as $rcatproduct) { ?>
					<?php if(!empty($rcatproduct['rproducts'])) { ?>
						<div id="rcategory-<?php echo $rcatproduct['rcategory_id'] ?>-<?php echo $module ?>" class="box-product<?php echo $setting['use_carousel'] ? ' owl-carousel' : '' ?>">
							<?php foreach ($rcatproduct['rproducts'] as $product) { ?>
								<div class="prod_hold element_from_bottom">
									<?php if ($product['thumb']) { ?>
										<div class="image"><a href="<?php echo $product['href']; ?>"><img class="anotherimg" <?php if($setting['use_carousel']) { ?>data-<?php } ?>src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="lazyOwl" /></a></div>
									<?php } ?>
									<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									<?php if ($product['price']) { ?>
										<div class="price">
											<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
											<?php } ?>
										</div>
									<?php } ?>
									<?php if ($product['rating']) { ?>
										<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
									<?php } ?>
									<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
								</div>
							<?php } ?>

							<?php if($setting['show_link']['status']) { ?>
								<?php if($setting['use_carousel']) { ?>
									<span class="rcategory_path" style="position:relative;"><?php echo $rcatproduct['goto_rcategory'] ?>
									<style>#rcategory-<?php echo $rcatproduct['rcategory_id'] ?>-<?php echo $module ?> .owl-item:last-child{width:100% !important;margin-top:25px;}</style>
									</span>
								<?php } else { ?>
									<span class="rcategory_path"><?php echo $rcatproduct['goto_rcategory'] ?>
								<?php } ?>
							<?php } ?>
						</div>							
					<?php } ?>
				<?php } ?>
			</div>
		</div>

		<script type="text/javascript"><!--
			$('#rhtabs-<?php echo $module ?> a').tabs();
			<?php if($setting['use_carousel']) { ?>
				$(document).ready(function() { 
					<?php foreach ($rcatproducts as $rcatproduct) { ?>
						$("#rcategory-<?php echo $rcatproduct['rcategory_id'] ?>-<?php echo $module ?>").owlCarousel({
							lazyLoad : true
						});	
					<?php } ?> 
				});
			<?php } ?>
		//--></script>

	<?php } else { ?>
	
		<div class="box">
			<div class="heading_title"><?php echo $heading_title; ?></div>
			<div class="box-content <?php echo $setting['use_carousel'] ? 'jcarousel' : '' ?>">
				<<?php echo $setting['use_carousel'] ? 'ul' : 'div' ?> class="box-product">
					<?php foreach ($rcatproducts as $rcatproduct) { ?>
						<?php foreach ($rcatproduct['rproducts'] as $product) { ?>
							<<?php echo $setting['use_carousel'] ? 'li' : 'div' ?>>
								<?php if ($product['thumb']) { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
								<?php } ?>
								<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
								<?php if ($product['price']) { ?>
									<div class="price">
										<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
										<?php } else { ?>
											<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
										<?php } ?>
									</div>
								<?php } ?>
								<?php if ($product['rating']) { ?>
									<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
								<?php } ?>
								<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
							</<?php echo $setting['use_carousel'] ? 'li' : 'div' ?>>
						<?php } ?>
					<?php } ?>
				</<?php echo $setting['use_carousel'] ? 'ul' : 'div' ?>>
			</div>
		</div>
		<?php if($setting['use_carousel']) { ?>
			<script type="text/javascript"><!--
				<?php if($setting['use_carousel']) { ?>
				$('.jcarousel ul').jcarousel({
					wrap: 'both',
					animation: 1500,
					vertical: true,
					easing: 'easeInOutBack',
					scroll: 1,
					//auto: true,
				});
				<?php } ?>
			//--></script>		
		<?php } ?>
	<?php } ?>
<?php } ?>
