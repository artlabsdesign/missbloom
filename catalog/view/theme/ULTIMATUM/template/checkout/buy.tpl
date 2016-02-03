<?php echo $header; ?>
                        

<div class="title-holder">
<div class="inner">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<h1 class="heading_title"><span><?php echo $heading_title; ?><?php if ($weight) { ?>
    &nbsp;(<?php echo $weight; ?>)
    <?php } ?></span></h1>  
</div>
</div>
<?php echo $content_top; ?>
<div class="inner main_inner">
<?php if ($attention) { ?>
    <div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
    <div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
    <script type="text/javascript">
        <!--
    $(document).ready(function() {
            $('.cart-module select[name=\'zone_id\']').load('index.php?route=checkout/buy/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
        });
        //--></script>
    <div id="confirm-content" style="display: none;"></div>
    <div id="cart-content">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="cart-info">
                <table>
                    <thead>
                        <tr>
                            <td class="image"><?php echo $column_image; ?></td>
                            <td class="name"><?php echo $column_name; ?></td>
                            <td class="model"><?php echo $column_model; ?></td>
                            <td class="quantity"><?php echo $column_quantity; ?></td>
                            <td class="price"><?php echo $column_price; ?></td>
                            <td class="total"><?php echo $column_total; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="image"><?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                    <?php } ?></td>
                                <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    <?php if (!$product['stock']) { ?>
                                        <span class="stock">***</span>
                                    <?php } ?>
                                    <div>
                                        <?php foreach ($product['option'] as $option) { ?>
                                            - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                                        <?php } ?>
                                    </div>
                                    <?php if ($product['reward']) { ?>
                                        <small><?php echo $product['reward']; ?></small>
                                    <?php } ?></td>
                                <td class="model"><?php echo $product['model']; ?></td>
                                <td class="quantity"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                                    &nbsp;
                                    <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
                                    &nbsp;<a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
                                <td class="price"><?php echo $product['price']; ?></td>
                                <td class="total"><?php echo $product['total']; ?></td>
                            </tr>
                        <?php } ?>
                        <?php foreach ($vouchers as $vouchers) { ?>
                            <tr>
                                <td class="image"></td>
                                <td class="name"><?php echo $vouchers['description']; ?></td>
                                <td class="model"></td>
                                <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
                                    &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
                                <td class="price"><?php echo $vouchers['amount']; ?></td>
                                <td class="total"><?php echo $vouchers['amount']; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </form>
        <?php if (($coupon_status || $voucher_status || $reward_status || $shipping_status) && $settings['cart_modules']) { ?>
            <h3><?php echo $text_next; ?></h3>
            <div class="content">
                <p><?php echo $text_next_choice; ?></p>
                <table class="radio">
                    <?php if ($coupon_status) { ?>
                        <tr class="highlight">
                            <td><input type="radio" name="next" value="coupon" id="use_coupon" /></td>
                            <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
                        </tr>
                    <?php } ?>
                    <?php if ($voucher_status) { ?>
                        <tr class="highlight">
                            <td><input type="radio" name="next" value="voucher" id="use_voucher" /></td>
                            <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
                        </tr>
                    <?php } ?>
                    <?php if ($reward_status) { ?>
                        <tr class="highlight">
                            <td><input type="radio" name="next" value="reward" id="use_reward" /></td>
                            <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
                        </tr>
                    <?php } ?>
                    <?php if ($shipping_status) { ?>
                        <tr class="highlight">
                            <td><input type="radio" name="next" value="shipping" id="shipping_estimate" /></td>
                            <td><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>
                        </tr>
                    <?php } ?>
                </table>
            </div>
            <div class="cart-module">
                <div id="coupon" class="content">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <?php echo $entry_coupon; ?>&nbsp;
                        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
                        <input type="hidden" name="next" value="coupon" />
                        &nbsp;
                        <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />
                    </form>
                </div>
                <div id="voucher" class="content">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <?php echo $entry_voucher; ?>&nbsp;
                        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
                        <input type="hidden" name="next" value="voucher" />
                        &nbsp;
                        <input type="submit" value="<?php echo $button_voucher; ?>" class="button" />
                    </form>
                </div>
                <div id="reward" class="content">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <?php echo $entry_reward; ?>&nbsp;
                        <input type="text" name="reward" value="<?php echo $reward; ?>" />
                        <input type="hidden" name="next" value="reward" />
                        &nbsp;
                        <input type="submit" value="<?php echo $button_reward; ?>" class="button" />
                    </form>
                </div>
                <div id="shipping" class="content">
                    <p><?php echo $text_shipping_detail; ?></p>
                    <table>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_country; ?></td>
                            <td><select name="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=checkout/buy/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select></td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
                            <td><select name="zone_id">
                                </select></td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
                            <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>
                        </tr>
                    </table>
                    <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button" />
                </div>
        </div>
        <?php } ?>
        <div class="cart-total">
            <table id="total">
                <?php 
                



                foreach ($totals as $total) { ?>
                    <tr>
                        <td colspan="5" class="right"><b><?php echo $total['title']; ?>:</b></td>
                        <td class="right"><?php echo $total['text']; ?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
        
        <!-- Checkout form  -->
        <!-- Checkout form  -->
        <!-- Checkout form  -->
        
        <div id="checkout-form" class="clearfix">
            <div class="order-options fixed">
                <div class="one_half" style="margin-right:10px; margin-bottom:0px;">
                    <label><input type="checkbox" name="photo_free" value="1"<?php if($photo_free){ ?> checked="checked"<?php } ?> /> <?php echo $entry_photo_free;?> <img src="/catalog/view/theme/ULTIMATUM/image/question-mark.png" data-title="<?php echo $entry_photo_free_descr;?>" class="tip" /></label>
                    <label><input type="checkbox" name="photo_site" value="1"<?php if($photo_site){ ?> checked="checked"<?php } ?> /> <?php echo $entry_photo_site;?></label>
                </div>
                <div class="one_half" style="margin-right:10px;">
                    <label><input type="checkbox" name="postcard_on" value="1"<?php if($postcard_on){ ?> checked="checked"<?php } ?> /> <?php echo $entry_postcard;?> <img src="/catalog/view/theme/ULTIMATUM/image/question-mark.png" data-title="<?php echo $entry_postcard_descr;?>" class="tip" /></label>
                    <div class="postcard"<?php if($postcard || $signature){ ?> style="display:block;"<?php } ?>>
                        <textarea name="postcard"><?php echo $postcard; ?></textarea><br />
                        <?php echo $entry_signature;?> <input type="text" name="signature" value="<?php echo $signature; ?>" placeholder="Например: с любовью, Денис" />
                    </div>
					
					<label><input type="checkbox" name="discount_card_on" value="1"<?php if($coupon){ ?> checked="checked"<?php } ?> /> <?php echo $entry_discount_card;?></label>
                    <div id="discount_card"<?php if($coupon){ ?> style="display: block"<?php } ?>>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
                            <input type="hidden" name="next" value="coupon" />
                            &nbsp;
                            <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />
                        </form>
                    </div>
                </div>
                <!-- <div class="last one_third">
                    
                </div> -->
            </div>
            <style type="text/css">
                #checkout-form {padding-top: 10px;}
                #checkout-form .left {float: left;width: 48%;}
                #checkout-form .left.centered {float: none;margin: 0 auto;width: 48%;}
                #checkout-form .right {float: right;width: 48%;}
                #checkout-form h2 {font-size: 28px;font-weight: 100;margin-bottom: 10px;}
                #checkout-form h3 {font-size: 12px;font-weight: 600;margin: 0 0 5px;}
                .warning-inf {padding:5px 0px;margin:-10px 0 10px;background:#F9F6E7;border:1px solid #D4BC4C;font-size:11px;font-family:Verdana, Geneva, sans-serif;text-align:center;}
                #checkout-form table.form tr td:first-child {width: auto;}
                .checkout-confirm h1 {margin-bottom:3px;}
                .checkout-confirm p {margin-bottom:10px}
                .checkout-confirm p a {font-size:14px;}
                .payment span.wait img, #payment_form span.wait img {display: inline;}
                #payment_form2, .payment_form2 {display:none;}
                .payment_form {text-align:center;padding: 0;}
                .payment_form2 {border:none;}
                #checkout-form .buttons .right {float:none;text-align:center;width:100%;}
                #checkout-form .fields-centered {width: 310px;margin: 0 auto;}
                .clearfix:before,.clearfix:after{display:table;content:" "}.clearfix:after{clear:both}
                .checkout-register, .email-required {display: none;}
                .order-options label {display: block;vertical-align: top; margin-bottom:8px;}
                .order-options label input {vertical-align: top;}
                .postcard textarea {width: 340px; height: 75px;}
                .postcard input {width: 273px;}
                #discount_card, .postcard, #rt_info, #recipient_address {display: none;}
                #discount_card input {vertical-align: top;}
                #discount_card .button {padding: 4px 10px;}
                .s_addresses input {width: 62px;}
                #checkout-form .controls-row {margin-bottom: 15px;}
                .s-addr label {display: block; text-align: center;font-size: 12px;}
                #checkout-form select.large-field {width: 310px;}
                #checkout-form span.error {font-size: 12px;padding-top: 2px;}
                #checkout-form .clarify {display: block; margin-top: 3px;font-size: 13px;}
                #checkout-form .clarify input {margin: 3px 0;}
                #rt_address textarea {width: 300px;}
                h2 .step {
                    display: inline-block;
                    width: 40px;
                    height: 40px;
                    cursor: pointer;
                    background-color: #bc83b2;
                    -webkit-border-radius: 50%;
                    -moz-border-radius: 50%;
                    -khtml-border-radius: 50%;
                    border-radius: 50%;
                    -ms-border-radius: 50%;
                    transition: all 0.5s ease 0s;
                    -webkit-transition: all 0.5s ease 0s;
                    -ms-transition: all 0.5s ease 0s;
                    -moz-transition: all 0.5s ease 0s;
                    -o-transition: all 0.5s ease 0s;
                    text-align: center;
                    line-height: 38px;
                    color: #fff;
					margin-right:10px;
                }
                .agreement {display: block;margin-bottom: 10px;}
                #button-checkout {background-color: #9bcf29}
                a.forgotten {display: inline-block;margin: 5px 0 0 70px;font-size: 12px;}
            </style>
            <br />
            <div class="fixed" >
            <div class="left one_half customer-type" id="customer-register">
                <?php if(!$customer_logged){?>
                <h2><span class="step">1</span> Заказываете впервые? <a class="ysn">Нет</a></h2>
				<script type="text/javascript">
					$(function()
					{

						$('.ysn').click(function(){
							
						    $('html, body').animate({
						        scrollTop: $("#uzhe").offset().top
						    }, 2000);
							
						})
					})
				</script>
                
                <?php }else{ ?>
                <h2><span class="step">1</span> Ваши контакты</h2>
                <?php } ?>
                <?php if ($firstname_status) { ?>
                <div class="fixed controls-row">
                    <div class="one_fourth" id="my_tab1"><?php echo $entry_firstname; ?></div>
                    <div class="last three_fourth" id="my_tab2"><input type="text" name="firstname" value="<?php echo $firstname; ?>" id="my_input" class="large-field" /></div>
                </div>
                <?php } ?>
                <?php if ($email_status) { ?>
                <div class="fixed controls-row">
                    <div class="one_fourth" id="my_tab1"><?php echo $entry_email; ?></div>
                    <div class="last three_fourth" id="my_tab2"><input type="text" name="email" value="<?php echo $email; ?>" id="my_input" class="large-field" /></div>
                </div>
                <?php } ?>
                <?php if ($telephone_status) { ?>
                <div class="fixed controls-row">
                    <div class="one_fourth" id="my_tab1"><?php echo $entry_telephone; ?></div>
                    <div class="last three_fourth" id="my_tab2"><input type="text" name="telephone" value="<?php echo $telephone; ?>" id="my_input" class="large-field" id="telephone" /></div>
                </div>  
                <?php } ?>
                <?php if ($postcode_status) { ?>
                    <?php if ($postcode_required) { ?><span class="required">*</span> <?php } ?><?php echo $entry_postcode; ?><br />
                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" />
                    <br />
                    <br />
                <?php } ?>
                <?php if ($company_status) { ?>
                    <?php if ($company_required) { ?><span class="required">*</span> <?php } ?><?php echo $entry_company; ?><br />
                    <input type="text" name="company" value="<?php echo $company; ?>" class="large-field" />
                    <br />
                    <br />
                <?php } ?>
                <?php if ($address_1_status) { ?>
                    <?php if ($address_1_required) { ?><span class="required">*</span> <?php } ?><?php echo $entry_address_1; ?><br />
                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field" />
                    <br />
                    <br />
                <?php } ?>
                <?php if ($address_2_status) { ?>
                    <?php if ($address_2_required) { ?><span class="required">*</span> <?php } ?><?php echo $entry_address_2; ?><br />
                    <input type="text" name="address_2" value="<?php echo $address_2; ?>" class="large-field" />
                    <br />
                    <br />
                <?php } ?>
                <div class="fixed controls-row">
                    <div class="one_fourth">&nbsp;</div>
                    <div class="three_fourth last">
                    <label><input type="checkbox" name="order_status_sms" value="1" checked="checked" /> Получать смс о статусах заказа</label><br />
                    <label><input type="checkbox" name="order_status_email" value="1" checked="checked" /> Получать e-mail о статусах заказа</label><br />
                    <label><input type="checkbox" name="newsletter" value="1" checked="checked" /> Получать спецпредложения</label>
                    </div>
                </div>
                <?php if(!$customer_logged){?>
                <div class="fixed controls-row">
                    <div class="one_fourth">&nbsp;</div>
                    <div class="three_fourth last">
                        <a class="button" id="button-register">Продолжить</a>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="one_half last customer-type" id="customer-registered">
                <?php if(true || !$customer_logged){?>
                <h2 id="uzhe">Уже заказывали?</h2>
                <div class="login">
                    <form method="post" action="<?php echo $login; ?>">
                        <fieldset class="fixed">
                            <fieldset class="one_half last">
                                <label><?php echo $entry_telephone; ?></label>&nbsp;
                                <input type="text" name="telephone" />
                            </fieldset>
                            <fieldset class="one_half last">
                                <label>или e-mail:</label>&nbsp;
                                <input type="text" name="email" />
                            </fieldset>
                        </fieldset>
                        <br />
                        <div>
                            <div class="fixed">
                                <div class="one_half last">
                                    <label>Пароль:</label>&nbsp;&nbsp;&nbsp;
                                    <input type="password" name="password" />
                                    <a href="<?php echo $forgotten; ?>" class="forgotten">Забыли пароль?</a>
                                </div>
                                <div class="one_half last">
                                    
                                </div>
                            </div>
                            <div class="login-btn">
                                <input class="button" type="submit" value="Войти" />
                            </div>
                        </div>
                        <div>
                            <br />
                            <h6>Войти с помощью</h6>
                            <div id="uLogin2" data-ulogin="display=panel;fields=first_name,last_name;providers=vkontakte,facebook,twitter,instagram,odnoklassniki;hidden=livejournal,openid,lastfm,linkedin,liveid,soundcloud,steam,flickr,uid,youtube,webmoney,foursquare,tumblr,googleplus,dudu,vimeo,wargaming,google;redirect_uri=<?php echo urlencode($checkout); ?>"><img src="/image/loading.gif" alt="Загрузка..." /></div>
                        </div>
                        <input type="hidden" name="redirect" value="<?php echo $checkout; ?>" />
                    </form>
                </div>
                <?php } ?>
                &nbsp;
            </div>
            </div>
            <br />
            <div id="my_reg" class="fixed steps23"<?php if(!$customer_logged){?> style="display: none;"<?php } ?>>
                <div class="left" id="my_step2">
                    <h2><span class="step">2</span> Данные получателя</h2>
                    <div class="fixed controls-row">
					<?php $rt==1; ?>
                        <div class="one_fourth"><?php echo $entry_rt;?></div>
                        <div class="last three_fourth">
						
						<select name="rt" class="large-field">
                        <!--<option value="1">-- Выберите получателя --</option>-->
                        <option value="1"<?php if($rt==1){ ?> selected="selected"<?php } ?>>Получаю сам(а)</option>
                        <option value="2"<?php if($rt==2){ ?> selected="selected"<?php } ?>>Получает другой человек</option>
                        </select></div>
                    </div>
                    <div id="rt_info">
                        <div class="fixed controls-row">
                            <div class="one_fourth"><label><?php echo $entry_rt_name;?></label></div>
                            <div class="last three_fourth"><input type="text" name="rt_name" value="<?php echo $rt_name; ?>" class="large-field" /></div>
                        </div>
                        <div class="fixed controls-row">
                            <div class="one_fourth"><label><?php echo $entry_rt_telephone;?></label></div>
                            <div class="last three_fourth">
                                <input type="text" name="rt_telephone" value="<?php echo $rt_telephone; ?>" class="large-field" /><br />
                                <label class="clarify"><input type="checkbox" name="rt_clarify" value="1" id="clarify"<?php if($rt_clarify){ ?> checked="checked"<?php } ?> /> <?php echo $entry_rt_clarify;?></label>
                            </div>
                        </div>
                    </div>
                    <div id="recipient_address">
                        <div class="fixed controls-row" id="rt_address">
                            <div class="fixed controls-row">
                                <div class="one_fourth"><label><?php echo $entry_address_type;?>:</label></div>
                                <div class="last three_fourth"><select name="address_type" class="large-field">
                                    <option value="1"<?php if($address_type==1){ ?> selected="selected"<?php } ?>>Офис</option>
                                    <option value="2"<?php if($address_type==2){ ?> selected="selected"<?php } ?>>Квартира</option>
                                    <option value="3"<?php if($address_type==3){ ?> selected="selected"<?php } ?>>Частный дом</option>
                                    <option value="4"<?php if($address_type==4){ ?> selected="selected"<?php } ?>>Гостиница</option>
                                    <option value="5"<?php if($address_type==5){ ?> selected="selected"<?php } ?>>Больница</option>
                                    </select></div>
                            </div>
                            <div class="fixed controls-row">
                                <div class="one_fourth"><label><?php echo $entry_city;?></label></div>
                                <div class="last three_fourth">
                                    <select name="city" class="cityId">
                                        <?php foreach($cities as $city){ ?>
                                        <option value="<?php echo $city['city_name']; ?>"><?php echo $city['city_name']; ?></option>
                                        <?php } ?>
                                        <option value="0">Другой город...</option>
                                    </select>
                                    <input type="text" value="" name="cities" id="cities" style="display: none;width: 145px;" />
                                </div>
                            </div>
                            <div class="fixed controls-row">
                                <div class="one_fourth"><label><?php echo $entry_street;?></label></div>
                                <div class="last three_fourth"><input type="text" name="street" value="<?php echo $street; ?>" class="large-field" /></div>
                            </div>
                            <div class="fixed controls-row s_addresses">
                                <div class="one_fourth">&nbsp;</div>
                                <div class="s-addr one_sixth" id="a_house">
                                    <label><?php echo $entry_house;?></label>
                                    <input type="text" name="house" value="<?php echo $house; ?>" />
                                </div>
                                <div class="s-addr one_sixth" id="a_building">
                                    <label><?php echo $entry_building;?></label>
                                    <input type="text" name="building" value="<?php echo $building; ?>" />
                                </div>
                                <div class="s-addr one_sixth" id="a_office">
                                    <label><?php echo $entry_office;?></label>
                                    <input type="text" name="office" value="<?php echo $office; ?>" />
                                </div>
                                <div class="s-addr one_sixth" id="a_flat">
                                    <label><?php echo $entry_flat;?></label>
                                    <input type="text" name="flat" value="<?php echo $flat; ?>" />
                                </div>
                                <div class="s-addr one_sixth" id="a_room">
                                    <label><?php echo $entry_room;?></label>
                                    <input type="text" name="room" value="<?php echo $room; ?>" />
                                </div>
                                <div class="s-addr one_sixth last" id="a_ward">
                                    <label><?php echo $entry_ward;?></label>
                                    <input type="text" name="ward" value="<?php echo $ward; ?>" />
                                </div>
                            </div>
                            <?php if($settings['comment_status']){ ?>
                            <div class="fixed controls-row">
                                <div class="one_fourth"><lable><?php echo $text_comments; ?></label></div>
                                <div class="last three_fourth"><textarea name="comment" rows="6"><?php echo $comment; ?></textarea></div>
                            </div>
                            <?php }else{ ?>
                            <textarea name="comment" style="display: none;"></textarea>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            <div class="right right-checkout" id="my_step3">
                <h2><span class="step">3</span> Доставка</h2>
                <div class="shipping-methods">
                    <div class="shipping_and_payment">
                        <?php if ($settings['zone_status']) { ?>
                            <div>
                                <?php if ($zone_required) { ?><span class="required">*</span> <?php } ?><?php echo $entry_zone; ?><br />
                                <select name="zone_id" onchange="updateShM(this.value);" class="large-field">
                                </select>
                                <br />
                                <br />
                            </div>
                        <?php } else { ?>
                            <select name="zone_id" style="display: none; visibility: hidden;">
                                <option value="<?php echo $config_zone_id; ?>" checked="checked"></option>
                            </select>
                        <?php } ?>
                        <?php if($settings['shipping_select']){?>
                        <h3><?php echo $text_shipping_method; ?><span id="shm_loading"></span></h3>
						

                        
                        <table class="form" id="shipping_methods">
                        

                        
                            <?php if ($shipping_methods) { ?>
                                <?php foreach ($shipping_methods as $shipping_method) { ?>
                                    <?php if (!$shipping_method['error']) { ?>
                                        <?php foreach ($shipping_method['quote'] as $quote) { ?>
                                            <tr <?php if($quote['code'] == 'flat3.flat3'){ ?>data-title="Перед оплатой обязательно уточните возможность срочной доставки и наличие цветов у наших менеджеров по телефону. +7(495)726-76-83" class="tip222" original-title=""<?php } ?> id="method_<?php echo $quote['code'];?>">
                                                <td style="width: 1px;"><?php if ($quote['code'] == $code || !$code) { ?>
                                                        <?php $code = $quote['code']; ?>
                                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                                                    <?php } else { ?>
                                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                                                    <?php } ?></td>
                                                <td>
                                                
                                                <?php if ( $quote['code'] == 'flat3.flat3' ){ ?>
                                                <div style="position:relative;">

													<div class="flt3" style="background-color:#FFF; z-index:99999; display:none; border:1px solid gray;padding:10px;position:absolute; top:-80px;">Перед оплатой обязательно уточните возможность срочной доставки и наличие цветов у наших менеджеров по телефону. +7(495)726-76-83 <div align="center" style="margin-top:5px;"><a class="okok" style="font-size: 14px; color: #FFF; cursor:pointer; background-color:#bc83b2; display:block; width:50px; padding:5px;">OK</a></div></div>
													

												</div>
												<?php } ?>
                                                <label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?>
												
												</label></td>
                                                <td data-real-price="<?php echo (int) $quote['text']; ?>" class="rubleIcon" style="text-align: right; font-weight: bold; min-width: 100px;"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
                                                

                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <tr>
                                            <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
                                        </tr>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        </table>
                        <?php }else{ ?>
                        <input type="radio" name="shipping_method" value="flat.flat" id="flat.flat" checked="checked" style="display: none;">
                        <?php } ?>
                    </div>
                    <div class="fixed">
                        <div id ="DateBlock" class="one_half">
                            <label><?php echo $entry_shipping_date;?></label><br />
                            <input id="entData" class="shData" type="text" name="shipping_date" value="<?php echo $shipping_date; ?>" onchange="dateValidat()" />
							<span></span>
                        </div>
                        <div id ="TimeBlock" class="one_half last">
                            <label><?php echo $entry_shipping_time;?></label><br />
                            <select name="shipping_time">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div id ="remindBlock" class="controls-row" style="margin-top:10px;">
                        <label><input type="checkbox" name="remind" value="1"<?php if($remind){ ?> checked="checked"<?php } ?> /> <?php echo $entry_remind;?></label>
                    </div>
                </div>
                
            </div>
			
			
				
        <div class="clearfix"></div>
		
		<h2><span class="step">4</span> Оплата</h2>
			<div class="payment-methods right-checkout">
				<div class="shipping_and_payment">
					<?php if($settings['payment_select']){?>
					<h3><?php echo $text_payment_method; ?><span id="pay_loading"></span></h3>
					
					<ul class="payment_ul">
					<?php if ($payment_methods) { ?>
						<?php foreach ($payment_methods as $payment_method) { ?>
							<?php if ($payment_method['code'] == $p_code || !$p_code) { ?>
							<?php $p_code = $payment_method['code']; ?>
								<li id="emitate_<?php echo $payment_method['code']; ?>" class="active"><input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" /></li>
							<?php } else { ?>
								<li id="emitate_<?php echo $payment_method['code']; ?>"><input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" /></li>
							<?php } ?>
									
						<?php } ?>
					<?php } ?>
					</ul>
					<script>
						$(function(){
							$('.payment_ul li input').change(function(){
								$('.payment_ul li').removeClass('active');
								$(this).parent().addClass('active');
							});
						});
					</script>
					
					<? /*
					<table class="form" id="payment_methods">
						<?php if ($payment_methods) { ?>
							<?php foreach ($payment_methods as $payment_method) { ?>
								<tr>
									<td style="width: 1px;"><?php if ($payment_method['code'] == $p_code || !$p_code) { ?>
											<?php $p_code = $payment_method['code']; ?>
											<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
										<?php } ?></td>
									<td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
								</tr>
							<?php } ?>
						<?php } ?>
					</table>
					*/ ?>
					
					<?php }else{?>
					<input type="radio" name="payment_method" value="cod" id="cod" checked="checked" style="display: none;">
					<?php }?>
					

					
				</div>
				<?php if ($text_agree) { ?>
					<div class="buttons payment_form">
						<label class="agreement"><input type="checkbox" name="agree" value="1" checked="checked" /> <?php echo $text_agree; ?></label>
						<div id="payment_form">
							<a id="button-checkout" class="button"><span><?php echo $button_continue; ?></span></a>
						</div>
					</div>
				<?php } else { ?>
					<div class="buttons payment_form">
						<div id="payment_form">
							<a id="button-checkout" class="button"><span><?php echo $button_continue; ?></span></a>
						</div>
					</div>
				<?php } ?>
				<div class="buttons payment_form2">
					<div id="payment_form2">
					</div>
				</div>
			</div>
		</div>
        </div>
    </div>
    </div>
    </div>
    <!-- Checkout form END -->
    <!-- Checkout form END -->
    <!-- Checkout form END -->
    </div>
<?php echo $content_bottom; ?>
<script type="text/javascript" src="/catalog/view/javascript/jquery/ui/i18n/jquery.ui.datepicker-ru.js"></script>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
        $('.cart-module > div').hide();

        $('#' + this.value).show("slow");
    });

<?php if ($next == 'coupon') { ?>
        $('#use_coupon').trigger('click');
<?php } ?>
<?php if ($next == 'voucher') { ?>
        $('#use_voucher').trigger('click');
<?php } ?>
<?php if ($next == 'reward') { ?>
        $('#use_reward').trigger('click');
<?php } ?>
<?php if ($next == 'shipping') { ?>
        $('#shipping_estimate').trigger('click');
<?php } ?>
//--></script>
<script type="text/javascript"><!--
    //var valid = true;
    $('#button-checkout').live('click', function() {
	var verifDate = $("#entData").val();
	
		if (valid == true && verifDate == '') {	
		$('#entData').after('<span class="error">Обязательно выберите дату доставки!</span>');		
		var scrollError = $('#entData').offset().top;		
		scrollError = scrollError - 140;		
		$(document).scrollTop(scrollError);
		return false;
		}	
	
        $.ajax({
            url: 'index.php?route=checkout/buy',
            type: 'post',
            data: $('#checkout-form .left input[type=\'text\'], #checkout-form .left input[type=\'checkbox\']:checked, #checkout-form .left select, #checkout-form .left input[type=\'radio\']:checked, #checkout-form .left textarea, #checkout-form .left input[type=\'hidden\'], #checkout-form .right-checkout input[type=\'text\'], #checkout-form .right-checkout input[type=\'checkbox\']:checked, #checkout-form .right-checkout select, #checkout-form .right-checkout input[type=\'radio\']:checked, #checkout-form .right-checkout textarea, #checkout-form .right-checkout input[type=\'hidden\'], #checkout-form .order-options input[type=\'checkbox\']:checked, #checkout-form .order-options input[name=\'signature\'], #checkout-form .order-options textarea, .login-or-register input[type=\'radio\']:checked'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-checkout').attr('disabled', true);
                $('#button-checkout').after('<span class="wait">&nbsp;<img src="image/loading.gif" alt="" /></span>');
            },
            complete: function() {
                $('#button-checkout').attr('disabled', false);
            },
            success: function(json) {
                $('.error').remove();
                $('.warning').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['error']) {
				
<?php if ($firstname_required) { ?>
                        if (json['error']['firstname']) {
                            $('#checkout-form input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
                        }
<?php } ?>
/*
<?php if ($lastname_required) { ?>
                        if (json['error']['lastname']) {
                            $('#checkout-form input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
                        }
<?php } ?>*/
<?php if ($email_required) { ?>
                        if (json['error']['email']) {
                            $('#checkout-form .left input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
                        }
<?php } ?>
<?php if ($telephone_required) { ?>
                        if (json['error']['telephone']) {
                            $('#checkout-form .left input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
                                                
        var scrollError = $('#my_input').offset().top;       
        scrollError = scrollError - 140;        
        $(document).scrollTop(scrollError);

                        }
<?php } ?>
/*
<?php if ($fax_required) { ?>
                        if (json['error']['fax']) {
                            $('#checkout-form select[name=\'fax\']').after('<span class="error">' + json['error']['fax'] + '</span>');
                        }
<?php } ?>
<?php if ($postcode_required) { ?>
                        if (json['error']['postcode']) {
                            $('#checkout-form input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
                        }
<?php } ?>
<?php if ($company_required) { ?>
                        if (json['error']['company']) {
                            $('#checkout-form input[name=\'company\']').after('<span class="error">' + json['error']['company'] + '</span>');
                        }
<?php } ?>
<?php if ($address_1_required) { ?>
                        if (json['error']['address_1']) {
                            $('#checkout-form input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
                        }
<?php } ?>
<?php if ($address_2_required) { ?>
                        if (json['error']['address_2']) {
                            $('#checkout-form input[name=\'address_2\']').after('<span class="error">' + json['error']['address_2'] + '</span>');
                        }
<?php } ?>
<?php if ($city_required) { ?>
                        if (json['error']['city']) {
                            $('#checkout-form select[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
                        }
<?php } ?>
<?php if ($country_required) { ?>
                        if (json['error']['country']) {
                            $('#checkout-form select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
                        }
<?php } ?>
<?php if ($fax_required) { ?>
                        if (json['error']['fax']) {
                            $('#checkout-form input[name=\'fax\']').after('<span class="error">' + json['error']['fax'] + '</span>');
                        }
<?php } ?>
                    if (json['error']['zone']) {
                        $('#checkout-form select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
                    }
                    if (json['error']['comment']) {
                        $('#checkout-form textarea[name=\'comment\']').after('<span class="error">' + json['error']['comment'] + '</span>');
                    }
                    if (json['error']['rt']) {
                        $('#checkout-form select[name=\'rt\']').after('<span class="error">' + json['error']['rt'] + '</span>');
                    }
                    if (json['error']['rt_name']) {
                        $('#checkout-form input[name=\'rt_name\']').after('<span class="error">' + json['error']['rt_name'] + '</span>');
                    }
                    if (json['error']['rt_telephone']) {
                        $('#checkout-form input[name=\'rt_telephone\']').after('<span class="error">' + json['error']['rt_telephone'] + '</span>');
                    }*/
                    if (json['error']['warning']) {
                        $('.warning').remove();
                        $('.order-options').after('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
                        $('html, body').animate({
                            scrollTop: $(".order-options").offset().top
                        }, 400);
                        $('.warning').fadeIn('slow');
                    }
                    $('.wait').remove();
					
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/buy_confirm',
                        dataType: 'json',
                        success: function(json) {
                            var code = $('#checkout-form input[name=\'payment_method\']:checked').val();
                            getPaymentForm(code, function() {

                                if ($('p,h1,h2,h3,input[type=text],input[type=radio],input[type=checkbox],input[type=password],select', $('#payment_form2')).length > 0) {
                                    $('#payment_form,.payment_form').css('display', 'none');
                                    $('#payment_form2,.payment_form2').css('display', 'block');
                                    $('#checkout-form .left input, #checkout-form .left select, #shipping_methods input, #payment_methods input').attr('disabled', 'disabled');
                                    $('#checkout-form .left, #checkout-form .shipping_and_payment').css('opacity', '0.3');
                                } else {
                                    var payment_form2 = $('#payment_form2 form#payment');

                                    if (payment_form2.length) {
                                        payment_form2.submit();
                                    } else {
                                        var href = $('#payment_form2 div.buttons a').attr('href');
                                        if (typeof href != 'undefined' && href != '' && href != '#') {
                                            location = href;

                                        } else {
                                            $('#payment_form2 div.buttons a,#payment_form2 div.buttons input[type=button],#payment_form2 div.buttons input[type=submit]').click();
                                        }
                                    }
                                }
                            });
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError);
                        }
                    });
                }
            }
        });
    });
$(document).ready(function(){
	
	$('.okok').click(function(){
		$('.flt3').hide();
	})
	
	$('.rubleIcon').each(function(){
		var $this = $(this);
		var rubleStr = $this.text();
		
		rubleStr = rubleStr.replace("Р.", "<img src='/catalog/view/theme/ULTIMATUM/image/ruble.png' />");
		$this.html(rubleStr);
	});
	
	
	
    $('input[name="auth"]').on('change',function(){
        if($('input[name="auth"]:checked').val() == '0'){
            
        }else if($('input[name="auth"]:checked').val() == '1'){
            
        }
    });
    $('#checkout-form select[name=\'zone_id\']').load('index.php?route=checkout/guest/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
    $('.colorbox').colorbox({
        overlayClose: true,
        opacity: 0.5,
        width: '600px',
        height: '400px',
        href: this.href
    });
    $('input[name="shipping_date"]').datepicker({
        dateFormat: "dd.mm.yy"
    }, $.datepicker.regional["ru"]);
    
    
    checkClarify();
    checkAddressType();
    checkShipping();
    checkRecipient();
});
$('.tip').tipsy({title: 'data-title', gravity: 's'});
$('.tip2').tipsy({title: 'data-title', gravity: 'sw', trigger: 'focus'});

function updateShM(zone_id) {
    $('#shm_loading, #pay_loading').html(' <img src="image/loading.gif" width="43" height="11" style="margin-top:-3px;vertical-align:middle;">');
<?php if ($settings['shipping_select']) { ?>
        $('#shipping_methods').load('index.php?route=checkout/buy/getShippingMethods&zone_id=' + zone_id, function() {
            $('#shm_loading').empty();
        });
<?php } ?>
    $('#payment_methods').load('index.php?route=checkout/buy/getPaymentMethods&zone_id=' + zone_id, function() {
        $('#pay_loading').empty();
    });
}
function getPaymentForm(code, callback) {
    $.ajax({
        async: false,
        cache: false,
        url: 'index.php?route=checkout/buy/getPaymentForm',
        type: 'post',
        data: 'code=' + code.split('.')[0] + '&payment_method=' + code,
        dataType: 'json',
        success: function(json) {
            $('#payment_form2').html(json['output']);
            callback();
        }
    });
}
$('input[name=\'postcard_on\']').change(function(){
    if($('input[name=\'postcard_on\']:checked').length){
        $('.postcard').show("slow");
    }else{
        $('.postcard').hide();
    }
});
$('input[name=\'discount_card_on\']').change(function(){
    if($('input[name=\'discount_card_on\']:checked').length){
        $('#discount_card').show("slow");
    }else{
        $('#discount_card').hide();
    }
});
$('select[name="rt"]').change(function(){
    checkRecipient();
    checkClarify();
    checkAddressType();
});
$('#clarify').change(function(){
    checkRecipient();
    checkClarify();
    checkAddressType();
});
$('select[name="shipping_time"]').change(function(){
	shippingTime();
});

$('select[name="address_type"]').change(function(){
    checkAddressType();
});
$('input[name="shipping_method"]').change(function(){
    checkShipping();
});
$('select[name="city"]').change(function(){
    if($('select[name="city"] option:selected').val() == 0){
        $('#cities').show("slow");
    }else{
        $('#cities').hide();
    }
	checkShipping();
});
function checkRecipient(){
    $('#recipient_address,#rt_info').hide();
    var rt = $('select[name="rt"] option:selected').val();
    if(rt == 1){
        $('#recipient_address').show("slow");
    }else if(rt == 2){
        $('#recipient_address,#rt_info').show("slow");
    }
}
function checkClarify(){
    if($('#clarify:checked').length){
        $('#recipient_address').hide();
    }else{
        $('#recipient_address').show("slow");
    }
}
function checkAddressType(){
    $('.s_addresses .s-addr').hide();
    var at = $('select[name="address_type"] option:selected').val();
    switch(at){
        case '1':
            $('#a_house, #a_building, #a_office').show("slow");
        break
        case '2':
            $('#a_house, #a_building, #a_flat').show("slow");
        break
        case '4':
            $('#a_house, #a_building, #a_room').show("slow");
        break
        case '5':
            $('#a_house, #a_building, #a_ward').show("slow");
        break
        default:
            $('#a_house').show("slow");
    }
}
function shippingTime(){
	$('select[name="shipping_time"] option').each(function(e){
		$(this).removeAttr("disabled");
	});
		
	var dateVal = $('input[name="shipping_date"]').val();
	
	
	var shiptime = parseInt($('select[name="shipping_time"]').val());
	if(shiptime >= 18) {
		$.datepicker.setDefaults({
			defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
			minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
		});
		
		$('select[name="shipping_time"] option').each(function(e){
			if(e <= 7) $(this).attr('disabled', true);
		});
		
		if(dateVal != ''){
			var minDate = new Date();
			minDate.setDate(minDate.getDate()+2);
	
			var userDate = dateVal.split('.');
			var date = new Date(userDate[2], userDate[1] - 1, userDate[0]);
			date.setDate(date.getDate()+1);
			
			if(minDate > date) {
				$('input[name="shipping_date"]').val('');
			}
		}
	}
	else {
		$.datepicker.setDefaults({
			defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
			minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
		});
		
		if(dateVal != ''){
			var minDate = new Date();
			minDate.setDate(minDate.getDate()+2);
	
			var userDate = dateVal.split('.');
			var date = new Date(userDate[2], userDate[1] - 1, userDate[0]);
			date.setDate(date.getDate()+1);
			
			if(minDate > date) {
				$('input[name="shipping_date"]').val('');
			}
		}
	}
}

function checkShipping(){;
	$('#shipping_methods .rubleIcon').each(function(){
		$(this).html($(this).data('real-price')+" <img src='/catalog/view/theme/ULTIMATUM/image/ruble.png' />");
	});
	
	console.log('checkShipping init');
    var shm = $('input[name="shipping_method"]:checked').val();
		
	var town = $('select[name="city"]').val();
	var price = parseInt(<?=$totals[count($totals)-1]['value'];?>);
	
    var interval4h = '<option value="09:00 - 13:00">09:00 - 13:00</option><option value="09:30 - 13:30">09:30 - 13:30</option><option value="10:00 - 14:00">10:00 - 14:00</option><option value="10:30 - 14:30">10:30 - 14:30</option><option value="11:00 - 15:00">11:00 - 15:00</option><option value="11:30 - 15:30">11:30 - 15:30</option><option value="12:00 - 16:00">12:00 - 16:00</option><option value="12:30 - 16:30">12:30 - 16:30</option><option value="13:00 - 17:00">13:00 - 17:00</option><option value="13:30 - 17:30">13:30 - 17:30</option><option value="14:00 - 18:00">14:00 - 18:00</option><option value="14:30 - 18:30">14:30 - 18:30</option><option value="15:00 - 19:00">15:00 - 19:00</option><option value="15:30 - 19:30">15:30 - 19:30</option><option value="16:00 - 20:00">16:00 - 20:00</option><option value="16:30 - 20:30">16:30 - 20:30</option><option value="17:00 - 21:00">17:00 - 21:00</option><option value="17:30 - 21:30">17:30 - 21:30</option><option value="18:00 - 22:00">18:00 - 22:00</option><option value="18:30 - 22:30">18:30 - 22:30</option><option value="19:00 - 23:00">19:00 - 23:00</option><option value="19:30 - 23:30">19:30 - 23:30</option><option value="20:00 - 23:50">20:00 - 23:50</option><option value="20:30 - 23:50">20:30 - 23:50</option>';
    var interval4hmo = '<option value="11:00 - 15:00">11:00 - 15:00</option><option value="11:30 - 15:30">11:30 - 15:30</option><option value="12:00 - 16:00">12:00 - 16:00</option><option value="12:30 - 16:30">12:30 - 16:30</option><option value="13:00 - 17:00">13:00 - 17:00</option><option value="13:30 - 17:30">13:30 - 17:30</option><option value="14:00 - 18:00">14:00 - 18:00</option><option value="14:30 - 18:30">14:30 - 18:30</option><option value="15:00 - 19:00">15:00 - 19:00</option><option value="15:30 - 19:30">15:30 - 19:30</option><option value="16:00 - 20:00">16:00 - 20:00</option><option value="16:30 - 20:30">16:30 - 20:30</option><option value="17:00 - 21:00">17:00 - 21:00</option><option value="17:30 - 21:30">17:30 - 21:30</option><option value="18:00 - 22:00">18:00 - 22:00</option><option value="18:30 - 22:30">18:30 - 22:30</option><option value="19:00 - 23:00">19:00 - 23:00</option><option value="19:30 - 23:30">19:30 - 23:30</option>';
	var interval1h = '<option value="09:00 - 10:00">09:00 - 10:00</option><option value="09:30 - 10:30">09:30 - 10:30</option><option value="10:00 - 11:00">10:00 - 11:00</option><option value="10:30 - 11:30">10:30 - 11:30</option><option value="11:00 - 12:00">11:00 - 12:00</option><option value="11:30 - 12:30">11:30 - 12:30</option><option value="12:00 - 13:00">12:00 - 13:00</option><option value="12:30 - 13:30">12:30 - 13:30</option><option value="13:00 - 14:00">13:00 - 14:00</option><option value="13:30 - 14:30">13:30 - 14:30</option><option value="14:00 - 15:00">14:00 - 15:00</option><option value="14:30 - 15:30">14:30 - 15:30</option><option value="15:00 - 16:00">15:00 - 16:00</option><option value="15:30 - 16:30">15:30 - 16:30</option><option value="16:00 - 17:00">16:00 - 17:00</option><option value="16:30 - 17:30">16:30 - 17:30</option><option value="17:00 - 18:00">17:00 - 18:00</option><option value="17:30 - 18:30">17:30 - 18:30</option><option value="18:00 - 19:00">18:00 - 19:00</option><option value="18:30 - 19:30">18:30 - 19:30</option><option value="19:00 - 20:00">19:00 - 20:00</option><option value="19:30 - 20:30">19:30 - 20:30</option><option value="20:00 - 21:00">20:00 - 21:00</option><option value="20:30 - 21:30">20:30 - 21:30</option><option value="21:00 - 22:00">21:00 - 22:00</option><option value="21:30 - 22:30">21:30 - 22:30</option><option value="22:00 - 23:00">22:00 - 23:00</option><option value="22:30 - 23:30">22:30 - 23:30</option><option value="23:00 - 23:50">23:00 - 23:50</option><option value="23:30 - 23:50">23:30 - 23:50</option>';
    var intervalfixed = '';
	var hour = 9;
	
	var free_method_block = $('tr[id="method_free.free"]');
	var standart_method_block = $('tr[id="method_flat.flat"]');
	var standart_mo_method_block = $('tr[id="method_flat_region_courier_bc.flat_region_courier_bc"]');
	var fixed_method_block = $('tr[id="method_flat2.flat2"]');
	var quick_method_block = $('tr[id="method_flat3.flat3"]');
	
	
	
	if(town == 'Москва') {
		standart_method_block.show("slow");
		fixed_method_block.show("slow");
		quick_method_block.show("slow");
		
		standart_mo_method_block.hide();
		$('input[name="shipping_method"]', standart_mo_method_block).prop('checked', false);
		
		if(price > 3000) {
			standart_method_block.hide();
			$('input[name="shipping_method"]', standart_method_block).prop('checked', false);
			
			free_method_block.show("slow");
		}
		else {
			free_method_block.hide();
			standart_method_block.show("slow");
			$('input[name="shipping_method"]', free_method_block).prop('checked', false);
		}
		if(price > 9000) {
			$('#shipping_methods .rubleIcon').html("0 <img src='/catalog/view/theme/ULTIMATUM/image/ruble.png' />");
		}
	}
	else {
		standart_mo_method_block.show("slow");
	
		standart_method_block.hide();
		$('input[name="shipping_method"]', standart_method_block).prop('checked', false);
		fixed_method_block.hide();
		$('input[name="shipping_method"]', fixed_method_block).prop('checked', false);
		quick_method_block.hide();
		$('input[name="shipping_method"]', quick_method_block).prop('checked', false);
		
		if(price > 12000) {
			free_method_block.show("slow");
			standart_mo_method_block.hide();
			$('input[name="shipping_method"]', standart_mo_method_block).prop('checked', false);
		}
		else {
			free_method_block.hide();
			standart_mo_method_block.show("slow");
			$('input[name="shipping_method"]', free_method_block).prop('checked', false);
		}
	}
	
	console.log($('input[name="shipping_method"]:checked').val());
	for (var i = 9; hour < 24; i++) {
		var $minutes = '00';
		if (i % 2 == 0) $minutes = '30';
		intervalfixed = intervalfixed+'<option value="'+hour+':'+$minutes+'">'+hour+':'+$minutes+'</option>';
		if (i % 2 == 0) hour = hour+1;
	}

	switch(shm){
        case 'flat.flat':
			$('input[name="shipping_date"]').attr('disabled', false);
			$('#DateBlock').show("slow");
			$('#TimeBlock').show("slow");
			$('#remindBlock').show("slow");
			valid = true;
            $.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
            $('select[name="shipping_time"]').attr('disabled', false).html(interval4h);
        break
        case 'flat2.flat2':
			$('input[name="shipping_date"]').attr('disabled', false);
			$('#DateBlock').show("slow");
			$('#TimeBlock').show("slow");
			$('#remindBlock').show("slow");
			valid = true;
			
            $.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
            //$('select[name="shipping_time"]').attr('disabled', false).html(interval1h);
			$('select[name="shipping_time"]').attr('disabled', false).html(intervalfixed)
        break
        case 'flat3.flat3':
        	
        	$('.flt3').show("slow");
        	
			$('#DateBlock').hide("slow");
			$('#TimeBlock').hide("slow");
			$('#remindBlock').hide("slow");			
			valid = false;
			
            $.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
			$('input[name="shipping_date"]').attr('disabled', true);
            $('select[name="shipping_time"]').attr('disabled', 'disabled').html('<option value="">-</option>');	
        break
        case 'pickup.pickup':
			$('#DateBlock').show("slow");
			$('#TimeBlock').show("slow");
			$('#remindBlock').show("slow");
			valid = true;
			
			$('input[name="shipping_date"]').attr('disabled', false);
            $.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
            $('select[name="shipping_time"]').attr('disabled', false).html(interval4h);
        break
		case 'free.free':
			$('#DateBlock').show("slow");
			$('#TimeBlock').show("slow");
			$('#remindBlock').show("slow");
			valid = true;
			 
			$('input[name="shipping_date"]').attr('disabled', false);
            $.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
            $('select[name="shipping_time"]').attr('disabled', false).html(interval4h);
        break
		case 'flat_region_courier_bc.flat_region_courier_bc':
			$('input[name="shipping_date"]').attr('disabled', false);
			$.datepicker.setDefaults({
                defaultDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
                minDate: new Date(<?php echo str_replace('-', ', ', date("Y-m-d", strtotime(date("Y-m-d").'- 1 month'))); ?>),
            });
            $('select[name="shipping_time"]').attr('disabled', false).html(interval4hmo);
		break 
        default:
                   
    }
}



<?php if($customer_logged){ ?>
	$('.customer-type').css({opacity: 1});
	$('.customer-type#customer-registered').css({opacity: .5});
	$('.customer-type').mouseenter(function () {
		$('.customer-type').stop(true, true).animate({opacity: .25}, 0);
		$(this).stop(true, true).animate({opacity: 1}, 0);
	});
<? } ?>

<?php if(!$customer_logged){ ?>

$('.customer-type').css({opacity: 1});
	$('.customer-type#customer-registered').css({opacity: .5});
	$('.customer-type').mouseenter(function () {
		$('.customer-type').stop(true, true).animate({opacity: .25}, 0);
		$(this).stop(true, true).animate({opacity: 1}, 0);
		/*
		if($(this).attr('id') == 'customer-registered'){
			$('.steps23').stop(true, true).animate({opacity: .25}, 0);
		}else{
			$('.steps23').stop(true, true).animate({opacity: 1}, 0);
		}
		*/
	});
	
$('#button-register').live('click', function() {
    $.ajax({
        url: 'index.php?route=account/register/fast',
        type: 'post',
        data: $('#customer-register input[type=\'text\'], #customer-register input[type=\'checkbox\']:checked'),
        dataType: 'json',
        beforeSend: function() {
            $('#button-register').attr('disabled', true);
            $('#button-register').after('<span class="wait">&nbsp;<img src="image/loading.gif" alt="" /></span>');
        },
        complete: function() {
            $('#button-register').attr('disabled', false);
        },
        success: function(json) {
            $('#customer-register span.error, #customer-register span.wait').remove();
            if(json['errors']){
                if(json['errors']['error_firstname']){
                    $('#customer-register input[name="firstname"]').after('<span class="error">'+json['errors']['error_firstname']+'</span>');
                }
                if(json['errors']['error_email']){
                    $('#customer-register input[name="email"]').after('<span class="error">'+json['errors']['error_email']+'</span>');
                }
                if(json['errors']['error_telephone']){
                    $('#customer-register input[name="telephone"]').after('<span class="error">'+json['errors']['error_telephone']+'</span>');
                }
                if(json['errors']['error_warning']){
                    $('#customer-register input[name="email"]').after('<span class="error">'+json['errors']['error_warning']+'</span>');
                }
            }else{
                $('.steps23').show("slow");
                //$('#customer-registered').hide();
                $('#button-register').remove();
            }
        }
    });
});
<?php } ?>
//--></script>



<script type="text/javascript"><!--
function dateValidat(){
var inputDate = $(".shData").val();
repInput = inputDate.split('.');  

var date = new Date(),
day = date.getDate(),
month = date.getMonth(),
year = date.getFullYear();
month = month + 1;

if (String(month).length == 1) {
month = String('0' + month);
}

var correction = (day + 1) + '.' + month + '.' + year;

if (Number(repInput[1]) > 12) {
alert ('В году 12 месяцев');
$("#entData").val(''); 
}

if (Number(repInput[0]) > 31) {
alert ('В месяце не может быть больше 31 дня');
$("#entData").val(''); 
}


if (Number(repInput[2]) < Number(year)) {
alert ('Введите правильно год');
$("#entData").val(''); 
}

if (Number(repInput[1]) < Number(month)) {
alert ('Пока ещё нельзя вернуться в прошлое! P.S. А жаль...');
$("#entData").val(''); 
} 

//alert ('Вписали месяц:'+Number(repInput[1]));
//alert ('Дата:'+repInput[0]);

if (Number(repInput[1]) > Number(month)) {

} else {
if (Number(repInput[1]) == Number(month) && Number(repInput[0]) <= Number(day)) {

alert ('Дата должна быть не ранее завтрашнего дня!');
$("#entData").val('');
}
}
}
//--></script>

<?php echo $footer; ?>