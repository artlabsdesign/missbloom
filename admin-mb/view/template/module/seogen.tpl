<?php echo $header; ?>
<style type="text/css">
	#form {
		border-collapse: collapse;
	}

	#form tbody td {
		padding: 5px;
		vertical-align: top;
	}
	#form input[type="text"] {
		width: 430px;
	}
	#form a.button {
		float: right;
		margin-top: 5px;
		margin-right: 10px
	}
	#form td {
		border-bottom: inherit;
		border-right: inherit;
	}
	#form span.bold {
		font-weight: bold;
	}
	#form input[type="text"] {
		width: 669px;
	}
</style>

<div id="content">
	<div class="breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt=""/> <?php echo $heading_title; ?></h1>

			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';"
																													class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<input type="hidden" name="seogen[main_category_exists]" value="<?php echo (isset($seogen['main_category_exists']) && $seogen['main_category_exists']) ? 1 : 0?>">
			<input type="hidden" id="seogen_tab" name="seogen[seogen_tab]" value="<?php echo $seogen['seogen_tab']; ?>">
				<table class="seogen-list" style="width: 850px;">
					<tbody style="border: 1px solid #003A88;">
					<tr>
						<td><label for="seogen_status"><?php echo $entry_status; ?></label></td>
						<td><input id="seogen_status" type="checkbox" name="seogen_status" <?php if($seogen_status){echo 'checked="checked"';}?>></td>
					</tr>
					<tr>
						<td><label for="seogen_language_id"><?php echo $entry_language?></label></td>
						<td><select id="seogen_language_id" name="seogen[language_id]">
							<?php foreach($languages as $lang) {?>
									<option value="<?php echo $lang['language_id']?>"><?php echo $lang['name']?></option>
							<?php }?>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr>
						<td>Профили</td>
						<td><div style="display: flex;">
							<select id="seogen_profile" onchange="changeProfile(this)" style="width: 150px">
								<option data-id="0" id="profile-0">--</option>
								<?php foreach($profiles as $profile) { ?>
										<option data-id="<?php echo $profile['profile_id']?>" id="profile-<?php echo $profile['profile_id']?>"><?php echo $profile['name']?></option>
								<?php } ?>
							</select><input name="seogen_profile_name" style="width: 150px">
							</div>
							<div style="text-align: right;">
								<a onclick="addProfile()">Добавить</a>&nbsp;<a onclick="delProfile()">Удалить</a>
							</div>
						</td>

					</tr>
					</tbody>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
            </table>
            <div id="tabs" class="htabs">
                <a href="#tab-categories"><?php echo $tab_categories; ?></a>
                <a href="#tab-products"><?php echo $tab_products; ?></a>
                <a href="#tab-manufacturers"><?php echo $tab_manufacturers; ?></a>
                <a href="#tab-news"><?php echo $tab_news; ?></a>
            </div>
            <div id="tab-categories">
            <table>
					<thead>
						<tr>
							<td>&nbsp;</td>
							<td style="text-align: right;"><label for="seogen_overwrite_categories"><?php echo $entry_overwrite; ?></label></td>
							<td><input id="seogen_overwrite_categories" class="seogen_overwrite" type="checkbox"></td>
						</tr>
					</thead>
					<tbody id="categories" style="border: 1px solid #003A88;">
					<tr>
						<td style="width: 120px;"><?php echo $text_categories; ?></td>
						<td>
							<input type="text" name="seogen[categories_template]" value="<?php echo $seogen['categories_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_overwrite]" <?php if (isset($seogen['categories_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['categories_h1_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_h1; ?></td>
						<td>
							<input type="text" name="seogen[categories_h1_template]"
																	  value="<?php echo $seogen['categories_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_h1_overwrite]" <?php if (isset($seogen['categories_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_title_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_title; ?></td>
						<td>
							<input type="text" name="seogen[categories_title_template]"
																	  value="<?php echo $seogen['categories_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_title_overwrite]" <?php if (isset($seogen['categories_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_meta_keyword_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_meta_keyword; ?></td>
						<td>
							<input type="text" name="seogen[categories_meta_keyword_template]"
																	  value="<?php echo $seogen['categories_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_meta_keyword_overwrite]" <?php if (isset($seogen['categories_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_meta_description_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_meta_description; ?></td>
						<td>
							<textarea cols="125" rows="2" name="seogen[categories_meta_description_template]"><?php echo $seogen['categories_meta_description_template']; ?></textarea><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_meta_description_overwrite]" <?php if (isset($seogen['categories_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<tr>
						<td><?php echo $text_meta_description_limit?></td>
						<td><input type="text" name="seogen[categories_meta_description_limit]" style="width: 40px" value="<?php echo $seogen['categories_meta_description_limit']?>" size="3"></td>
					</tr>
					<tr>
						<td><?php echo $text_use_expressions?></td>
						<td><input type="checkbox" name="seogen[categories_use_expressions]" <?php if (isset($seogen['categories_use_expressions'])) echo "checked='checked'"; ?>></td>
					</tr>
					<?php } ?>
					<tr>
						<td><?php echo $text_categories_description ?></td>
						<td>
							<textarea id="categories_description_template" cols="125" rows="2" name="seogen[categories_description_template]"><?php echo $seogen['categories_description_template']; ?></textarea><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_description_overwrite]" <?php if (isset($seogen['categories_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>

					<tr>
						<td colspan="3"><a onclick="generate('categories');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					</tbody>
            </table>
            </div>
            <div id ="tab-products">
            <table>
				<thead>
					<tr>
						<td style="text-align: right">
							<label for="seogen_overwrite_products"><?php echo $entry_overwrite; ?></label>
							<input style="margin-right: 14px;" id="seogen_overwrite_products" class="seogen_overwrite" type="checkbox">
						</td>
						<td></td>
					</tr>
				</thead>

					<tbody id="products" style="border: 1px solid #003A88;">
					<tr>
						<td>
							<table>
								<tr>
									<td><?php echo $text_products ?></td>
									<td>
										<input type="hidden" name="seogen[product_tag_table]" value="<?php echo (isset($seogen['product_tag_table']) && $seogen['product_tag_table']) ? 1 : 0?>">
										<input type="text" name="seogen[products_template]" value="<?php echo $seogen['products_template']; ?>"><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_overwrite]" <?php if (isset($seogen['products_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
								<?php if(isset($seogen['products_h1_template'])) { ?>

								<tr>
									<td><?php echo $text_products_h1 ?></td>
									<td>
										<input type="text" name="seogen[products_h1_template]" value="<?php echo $seogen['products_h1_template']; ?>"><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_h1_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_h1_overwrite]" <?php if (isset($seogen['products_h1_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
									<?php } ?>
								<?php if(isset($seogen['products_title_template'])) { ?>
								<tr>
									<td><?php echo $text_products_title ?></td>
									<td>
										<input type="text" name="seogen[products_title_template]"
																				  value="<?php echo $seogen['products_title_template']; ?>"><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_title_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_title_overwrite]" <?php if (isset($seogen['products_title_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
									<?php } ?>
								<?php if(isset($seogen['products_meta_keyword_template'])) { ?>
								<tr>
									<td><?php echo $text_products_meta_keyword ?></td>
									<td>
										<input type="text" name="seogen[products_meta_keyword_template]"
																				  value="<?php echo $seogen['products_meta_keyword_template']; ?>"><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_meta_keyword_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_meta_keyword_overwrite]" <?php if (isset($seogen['products_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
									<?php } ?>
								<?php if(isset($seogen['products_meta_description_template'])) { ?>
								<tr>
									<td><?php echo $text_products_meta_description ?></td>
									<td>
										<textarea cols="125" rows="2" name="seogen[products_meta_description_template]"><?php echo $seogen['products_meta_description_template']; ?></textarea><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_meta_description_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_meta_description_overwrite]" <?php if (isset($seogen['products_meta_description_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
								<tr>
									<td><?php echo $text_meta_description_limit ?></td>
									<td><input type="text" name="seogen[products_meta_description_limit]" style="width: 40px" value="<?php echo $seogen['products_meta_description_limit'] ?>" size="3"></td>
								</tr>
									<?php } ?>
								<tr>
									<td><?php echo $text_img_alt?></td>
									<td><input type="text" name="seogen[products_img_alt_template]" value="<?php echo isset($seogen['products_img_alt_template'])? $seogen['products_img_alt_template'] : ""?>"></td>
								</tr>
								<tr>
									<td><?php echo $text_img_title?></td>
									<td><input type="text" name="seogen[products_img_title_template]" value="<?php echo isset($seogen['products_img_title_template'])? $seogen['products_img_title_template'] : ""?>"></td>
								</tr>
								<tr>
									<td><?php echo $text_products_description ?></td>
									<td>
										<textarea id="products_description_template" cols="125" rows="2" name="seogen[products_description_template]"><?php echo $seogen['products_description_template']; ?></textarea><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_description_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_description_overwrite]" <?php if (isset($seogen['products_description_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
								<tr>
									<td><?php echo $text_products_tag ?></td>
									<td>
										<textarea id="text_products_tag_template" cols="125" rows="2" name="seogen[products_tag_template]"><?php echo $seogen['products_tag_template']; ?></textarea><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_tag_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_tag_overwrite]" <?php if (isset($seogen['products_tag_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
								<tr>
									<td><?php echo $text_products_model ?></td>
									<td>
										<input type="text" name="seogen[products_model_template]" value="<?php echo $seogen['products_model_template']; ?>"><br/>
										<?php echo $text_available_tags . ' <span class="bold">' . $text_products_model_tags . '</span>'; ?>
									</td>
									<td>
										<input class="overwrite" type="checkbox" name="seogen[products_model_overwrite]" <?php if (isset($seogen['products_model_overwrite'])) echo "checked='checked'"; ?>>
									</td>
								</tr>
								<tr>
									<td><?php echo $text_use_expressions?></td>
									<td><input type="checkbox" name="seogen[products_use_expressions]" <?php if (isset($seogen['products_use_expressions'])) echo "checked='checked'"; ?>></td>
								</tr>
								<tr>
									<td colspan="3"><a onclick="generate('products');" class="button"><?php echo $text_generate; ?></a></td>
								</tr>							</table>
						</td>
						<td>
							<table>
								<tr>
									<td><?php echo $entry_category; ?></td>
									<td>
										<div class="scrollbox" style="height: 330px;">
											<?php $class = 'odd'; ?>
											<?php $selected_categories = array(); ?>
											<?php foreach($categories as $category) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if(in_array($category['category_id'], $seogen['only_categories'])) { ?>
														<input type="checkbox" name="seogen[only_categories][]" value="<?php echo $category['category_id']; ?>" checked="checked"/>
														<?php echo $category['name']; ?>
														<?php if(count($selected_categories) < 5) {
															$selected_categories[] = $category['name'];
														} ?>
													<?php } else { ?>
														<input type="checkbox" name="seogen[only_categories][]" value="<?php echo $category['category_id']; ?>"/>
														<?php echo $category['name']; ?>
													<?php } ?>
												</div>
											<?php } ?>
										</div>
										<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a
												onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
										<?php if($selected_categories) { ?>
											<br/><span class="error"><?php echo $text_limited_by . implode(", ", $selected_categories); ?></span>
										<?php } ?>
									</td>
								</tr>
								<tr>
									<td><?php echo $entry_manufacturer; ?></td>
									<td>
										<div class="scrollbox" style="height: 330px;">
											<?php $class = 'odd'; ?>
											<?php $selected_manufacturers = array(); ?>
											<?php foreach($manufacturers as $manufacturer) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if(in_array($manufacturer['manufacturer_id'], $seogen['only_manufacturers'])) { ?>
														<input type="checkbox" name="seogen[only_manufacturers][]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked"/>
														<?php echo $manufacturer['name']; ?>
														<?php if(count($selected_manufacturers) < 5) {
															$selected_manufacturers[] = $manufacturer['name'];
														} ?>
													<?php } else { ?>
														<input type="checkbox" name="seogen[only_manufacturers][]" value="<?php echo $manufacturer['manufacturer_id']; ?>"/>
														<?php echo $manufacturer['name']; ?>
													<?php } ?>
												</div>
											<?php } ?>
										</div>
										<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a
												onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
										<?php if($selected_manufacturers) { ?>
											<br/><span class="error"><?php echo $text_limited_by . implode(", ", $selected_manufacturers); ?></span>
										<?php } ?>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					</tbody>
            </table>
            </div>
            <div id ="tab-manufacturers">
            <table>
				<thead>
					<tr>
						<td>&nbsp;</td>
						<td style="text-align: right;"><label for="seogen_overwrite_manufacturers"><?php echo $entry_overwrite; ?></label></td>
						<td><input id="seogen_overwrite_manufacturers" class="seogen_overwrite" type="checkbox"></td>
					</tr>
				</thead>
					<tbody id="manufacturers" style="border: 1px solid #003A88;">
					<tr>
						<td><?php echo $text_manufacturers ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_template]"
																	  value="<?php echo $seogen['manufacturers_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_overwrite]" <?php if (isset($seogen['manufacturers_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['manufacturers_h1_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_h1 ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_h1_template]"
																	  value="<?php echo $seogen['manufacturers_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_h1_overwrite]" <?php if (isset($seogen['manufacturers_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_title_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_title ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_title_template]"
																	  value="<?php echo $seogen['manufacturers_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_title_overwrite]" <?php if (isset($seogen['manufacturers_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_meta_keyword_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_meta_keyword ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_meta_keyword_template]"
																	  value="<?php echo $seogen['manufacturers_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_meta_keyword_overwrite]" <?php if (isset($seogen['manufacturers_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_meta_description_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_meta_description ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_meta_description_template]"
																	  value="<?php echo $seogen['manufacturers_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_meta_description_overwrite]" <?php if (isset($seogen['manufacturers_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td><?php echo $text_manufacturers_description ?></td>
						<td>
							<textarea id="manufacturers_description_template" cols="125" rows="2" name="seogen[manufacturers_description_template]"><?php echo $seogen['manufacturers_description_template']; ?></textarea><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_description_overwrite]" <?php if (isset($seogen['manufacturers_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<tr>
						<td><?php echo $text_use_expressions?></td>
						<td><input type="checkbox" name="seogen[manufacturers_use_expressions]" <?php if (isset($seogen['manufacturers_use_expressions'])) echo "checked='checked'"; ?>></td>
					</tr>

					<tr>
						<td colspan="3"><a onclick="generate('manufacturers');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
            </table>
            </div>
            <div id ="tab-news">
                <table>
					<thead>
						<tr>
							<td>&nbsp;</td>
							<td style="text-align: right;"><label for="seogen_overwrite_informations"><?php echo $entry_overwrite; ?></label></td>
							<td><input id="seogen_overwrite_informations" class="seogen_overwrite" type="checkbox"></td>
						</tr>
					</thead>
					<tbody id="informations" style="border: 1px solid #003A88;">
					<tr>
						<td><?php echo $text_informations ?></td>
						<td>
							<input type="text" name="seogen[informations_template]" value="<?php echo $seogen['informations_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_overwrite]" <?php if (isset($seogen['informations_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['informations_h1_template'])) { ?>

					<tr>
						<td><?php echo $text_informations_h1 ?></td>
						<td>
							<input type="text" name="seogen[informations_h1_template]" value="<?php echo $seogen['informations_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_h1_overwrite]" <?php if (isset($seogen['informations_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_title_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_title ?></td>
						<td>
							<input type="text" name="seogen[informations_title_template]"
																	  value="<?php echo $seogen['informations_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_title_overwrite]" <?php if (isset($seogen['informations_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_meta_keyword_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_meta_keyword ?></td>
						<td>
							<input type="text" name="seogen[informations_meta_keyword_template]"
																	  value="<?php echo $seogen['informations_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_meta_keyword_overwrite]" <?php if (isset($seogen['informations_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_meta_description_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_meta_description ?></td>
						<td>
							<input type="text" name="seogen[informations_meta_description_template]"
																	  value="<?php echo $seogen['informations_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_meta_description_overwrite]" <?php if (isset($seogen['informations_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td colspan="3"><a onclick="generate('informations');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					</tbody>
				</table>
            </div>
			</form>
			<a id="generate_url" style="display: none" href="<?php echo $generate?>"></a>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php foreach (array('products_description_template', 'categories_description_template', 'manufacturers_description_template') as $item) { ?>
CKEDITOR.replace('<?php echo $item ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script>
<script type="text/javascript">
function generate(selector) {
	$(".success").remove();
	//update CKEDITOR
	for(var instanceName in CKEDITOR.instances)
	    CKEDITOR.instances[instanceName].updateElement();

	var data = $('#' + selector + ' :input, #seogen_language_id').serialize()
			+ '&name=' + selector;
	$.post($('#generate_url').attr('href'), data, function(html) {
		$(".breadcrumb").after('<div class="success">' + html + '</div>');
	});
}

$('.seogen_overwrite').change(function(){
	$('.overwrite:visible').prop('checked', $(this).prop('checked'))
});

$(document).ready(function() {
	$("#form tr:even").css("background-color", "#F4F4F8");
	$('a[href="'+$('#seogen_tab').val()+'"]').click();
});

$('#tabs a').tabs();

$('#tabs a').click(function() {
	$('#seogen_tab').val($(this).attr('href'));
});

function addProfile(){
	$(".success").remove();
	var spn = $('input[name="seogen_profile_name"]').val();
	if(!spn){
		return;
	}
	for(var instanceName in CKEDITOR.instances)
	    CKEDITOR.instances[instanceName].updateElement();

	$.post('<?php echo $action_profile_add; ?>', 'data=' + window.btoa($("#form").serialize()), function (json) {
		if (json.result == "success" && json.profile_id > 0) {
			$('#seogen_profile').append('<option data-id="' + json.profile_id + '" id="profile-' + json.profile_id + '">' + htmlEscape(spn) + '</option>');
		}
	}, 'json');

}
function delProfile() {
	var $seogenprofile = $('#seogen_profile option:selected');
	var profile_id = $seogenprofile.attr('id');
	var data_id = $seogenprofile.attr('data-id');
	if(data_id == "0"){
		return;
	}
	$.post('<?php echo $action_profile_del; ?>', 'profile_id='+data_id , function (json) {
		$('#profile-'+data_id).remove();
   }, 'json');

}
function changeProfile(e){
	var $seogenprofile = $('#seogen_profile option:selected');
	var data_id = $seogenprofile.attr('data-id');
	if(data_id == "0"){
		return;
	}
	$.post('<?php echo $action_profile_get; ?>', 'profile_id='+data_id, function (json) {
		$('input[name="seogen_profile_name"]').val($(e).val());
		if(json.result == "success") {
			$('input[type="checkbox"][name]').each(function(i, e){
				$e = $(e);
				var matches = $(e).attr('name').match(/seogen\[(.*)\]/);
				if(matches) {
					$(e).prop('checked', json.profile[matches[1]] != undefined);
				}
			});

			for(var name in json.profile) {
			   if (json.profile.hasOwnProperty(name)) {
			       var val = json.profile[name];
				   if (val instanceof Array){
					   for (var i = 0; i < val.length; ++i) {
						   $(':input[name="seogen['+name+'][]"][value="'+val[i]+'"]').prop('checked', true);
					   }
				   } else {
				   		$(':input[name="seogen['+name+']"]').val(val);
				   }
			   }
			}
			for (var instanceName in CKEDITOR.instances)
				CKEDITOR.instances[instanceName].setData($('textarea[name="seogen['+instanceName+']"]').val());

			$('a[href="'+$('#seogen_tab').val()+'"]').click();
		}

   }, 'json');
}

function htmlEscape(str) {
	return String(str)
			.replace(/&/g, '&amp;')
			.replace(/"/g, '&quot;')
			.replace(/'/g, '&#39;')
			.replace(/</g, '&lt;')
			.replace(/>/g, '&gt;');
}
</script>
		</div>
	</div>
copyright &copy; <a href="mailto:ruslan.shv@gmail.com">Ruslan Shvarev</a>
<?php echo $footer; ?>