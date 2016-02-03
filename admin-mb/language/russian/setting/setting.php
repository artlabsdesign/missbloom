<?php
//Tabs
			$_['tab_ips']                  = 'Increase Page Speed 4.3';
			
			//Heading
			$_['heading_minify_javascript']  = 'Javascript Handling';
			$_['heading_minify_css']         = 'CSS Handling';
			$_['heading_minify_settings']    = 'Minify Settings';
			$_['heading_html_images']        = 'HTML &amp; Image Handling';
			$_['heading_data_caching']       = 'Data Caching Configuration';
			$_['heading_content_delivery']   = 'Content Delivery';
			$_['heading_speed_analyzer']     = 'Speed Analysis';
			
			//Entry
			$_['entry_minify_javascript']            = 'Minify JavaScript:<br /><span class="help">The combination, minification, compression, and caching for JavaScript files.</span>';
			$_['entry_javascript_jquery']            = 'jQuery Google:<br /><span class="help">Serve JQuery library seperately over Google C.D.N. (requires minifier)</span>';
			$_['entry_javascript_jquery_version']    = 'jQuery Version:<span class="help">If using Google C.D.N, the optimizer will attempt to automatically detect the and use the version on page, ultimately you may specify an override here.</span>';
			$_['entry_javascript_jqueryui']          = 'jQuery UI Google:<br /><span class="help">Serve JQuery UI library seperately over Google C.D.N. (requires minifier)</span>';
			$_['entry_javascript_jqueryui_version']  = 'jQuery UI Version:<span class="help">If using Google C.D.N, the optimizer will attempt to automatically detect the and use the version on page, ultimately you may specify an override here.</span>';
			$_['entry_javascript_defer']             = 'Defer Javascript:<br /><span class="help">Defer Parsing of all JavaScript until document has completed loading. (BETA FEATURE - DO NOT ACTIVATE)</span>';

			$_['entry_minify_css']           = 'Minify CSS:<br /><span class="help">The combination, minification, compression, and caching for CSS.</span>';
			$_['entry_minify_cache']         = 'Minify Cache Enabled:<br /><span class="help">The combination, minification, compression, and caching for CSS & Javascript (global on/off).</span>';
			$_['entry_minify_encode_images'] = 'Encode Small Images:<br /><span class="help">Encode Small images to be inline in CSS files to save additional server requests.</span>'; 
			$_['entry_minify_image_size']    = 'Maximum Image Size:<br /><span class="help">The largest size of image which should be encoded in CSS files.</span>'; 
			$_['entry_minify_image_occurs']  = 'Image Occurance:<br /><span class="help">The largest number of times an image can occur and be encoded in CSS.</span>'; 
			$_['entry_minify_encode_url']    = 'Encode URL(s):<br /><span class="help">Encodes the combined urls used for CSS & JavaScript so that they do not contain dynamic parameters (must be off to use debugging).</span>'; 
			$_['entry_minify_storage']       = 'Storage Location:<br /><span class="help">Controls the storage location of the combined files (memory being faster).</span>'; 
			$_['entry_minify_advanced']      = 'Advanced Settings:<br /><span class="help">Unless you are attempting to resolve a problem, leave these settings at default values.</span>';
			$_['entry_minify_logging']       = 'Error Logging:<br /><span class="help">Error logging for Minification libraries.</span>';
			$_['entry_minify_debug_mode']    = 'Debug Mode:<br /><span class="help">Loads URLS in debugging mode (produces a detailed, non-functional output for visual debugging).</span>';
			$_['entry_minify_max_age']       = 'Maximum Age:<br /><span class="help">The cache lifetime specified to client browsers when serving combined CSS/JS files.</span>';
			$_['entry_minify_file_path']     = 'File Path:<br /><span class="help">Full file path to the \'min\' folder within OpenCart (blank = autodetect).</span>';
			$_['entry_minify_file_locking']  = 'File Locking:<br /><span class="help">The mode in which files should be accessed.</span>';

			$_['entry_firebug_analyzer']     = 'Speed Analyzer:<br /><span class="help">Enables page generation stats and database query time statistics to FireFox. (firebug and firephp browser plug-ins required)</span>';
			$_['entry_firebug_queries']      = 'Slow Query Output:<br /><span class="help">Displays slow queries into firebug console to assist in determining what database queries (3rd party modules) are slowing down your site. (DO NO LEAVE ENABLED, ONLY USE FOR DEBUGGING)</span>';
			$_['entry_ipsjs_excludes']       = 'Javascript Exclude:<br /><span class="help">Javascript to exclude from I.P.S combination. Seperated by comma.</span>';
			$_['entry_ipscss_excludes']      = 'CSS Exclude:<br /><span class="help">CSS to exclude from I.P.S combination. Seperated by comma.</span>';

			$_['entry_minify_html']          = 'Minify HTML Enabled:<br /><span class="help">If HTML content should be minified prior to compression.</span>';
			$_['entry_jpeg_compression']     = 'JPEG Compression:<br /><span class="help">Compression quality settings for JPEG images (value between 0-100).</span>';
			$_['entry_logo_dimensions']      = 'Logo Dimensions:<br /><span class="help">Adds dimension specifiers to logo. (0\'s = disabled)</span>';
			$_['entry_image_dimensions']     = 'Image Dimension Specifiers:<br /><span class="help">Adds dimensions to various areas of OpenCart modules.</span>';

			$_['entry_memory_cache']         = 'Memory Data Caching:<br /><span class="help">If enabled on your server, you may choose a memory caching mechanism.</span>';
			$_['entry_ipscron_status']       = 'Category Counts DB Cache:';
			$_['entry_category_counts']      = 'Category Counts:';
			$_['entry_seo_cache']            = 'SEO URL Cache:';
			
			$_['entry_minify_cache']       = 'Minify Cache Enabled:<br /><span class="help">The combination, minification, compression, and caching for CSS & Javascript.</span>';
			$_['entry_minify_html']        = 'Minify HTML Enabled:<br /><span class="help">If HTML content should be minified prior to compression.</span>';
			$_['entry_advanced_imaging']   = 'Advanced Image Processing:<br /><span class="help">Make use of Yahoo\'s Smush.It imaging service to compress images. (not recommended for OC 1.5.4+)</span>';
			$_['entry_memory_cache']       = 'Memory Data Caching:<br /><span class="help">If enabled on your server, you may choose a memory caching mechanism.</span>';
			$_['entry_ipsjs_excludes']     = 'Javascript Exclude:<br /><span class="help">Javascript to exclude from I.P.S combination. Seperated by comma.</span>';
			$_['entry_ipscss_excludes']    = 'CSS Exclude:<br /><span class="help">CSS to exclude from I.P.S combination. Seperated by comma.</span>';
			
			$_['entry_cdn_status']         = 'CDN Status:<br /><span class="help">Globally enable/disable content serving via our CDN/sub-domain.</span>';
			$_['entry_cdn_http']           = 'CDN HTTP URL:<br /><span class="help">If you are using a CDN (or a sub-domain for cookieless delivery), you may specify the HTTP base url here.</span>';
			$_['entry_cdn_https']          = 'CDN HTTPS URL:<br /><span class="help">If you are using a CDN (or a sub-domain for cookieless delivery), you may specify the HTTPS base url here.</span>';
			$_['entry_cdn_images']         = 'Serve Images:<br /><span class="help">Serve Images via the CDN.</span>';
			$_['entry_cdn_css']            = 'Serve CSS:<br /><span class="help">Serve CSS via the CDN.</span>';
			$_['entry_cdn_js']             = 'Serve JavaScript:<br /><span class="help">Serve JavaScript via the CDN.</span>';
			
			// Texts
			$_['text_enabled']             = 'Enabled';
			$_['text_disabled']            = 'Disabled';
			$_['text_on']                  = 'On';
			$_['text_off']                 = 'Off';
			$_['text_default']             = '(default)';
			$_['text_file_system']         = 'File System';
			$_['text_in_memory_apc']       = 'In-Memory (APC)'; 
			$_['text_memory_file']         = 'File Caching';
			$_['text_memory_apc']          = 'APC Caching';
			$_['text_memory_xcache']       = 'Xcache Caching';
			$_['text_memory_none']         = 'No supported in-memory caching has been detected with your web hosting.';
			$_['text_image_dimensions']    = '<span class="help">Carousel: <strong>On</strong><br />Banners: <strong>On</strong><br />Slideshow: <strong>On</strong><br />Featured: <strong>On</strong><br /></span>';
			$_['text_show_advanced']       = 'show advanced settings';
			$_['text_hide_advanced']       = 'hide advanced settings';
			$_['text_day']                 = 'Day';
			$_['text_days']                = 'Days';
			$_['text_time']                = 'Time';
			$_['text_times']               = 'Times';



$_['entry_account']           = 'Подтверждение при регистрации:<br /><span class="help">Требовать подтверждение согласия с правилами при регистрации аккаунта.</span>';
$_['entry_account_mail']      = 'Оповещение о новом клиенте:<br /><span class="help">Оповестить владельца магазина о регистрации нового клиента.</span>';
$_['entry_address']           = 'Адрес магазина:';
$_['entry_admin_language']    = 'Язык администратора:';
$_['entry_admin_limit']       = 'Элементов на страницу (Админка):<span class="help">Количество отображаемых на странице элементов (товары, категории, заказы, покупатели и т.п.)</span>';
$_['entry_affiliate']           = 'Условия партнерства:<br /><span class="help">Требовать подтверждение согласия с правилами при оформлении партнерского аккаунта.</span>';
$_['entry_alert_emails']      = 'Дополнительные адреса для оповещений:<br /><span class="help">Список дополнительных адресов для получения сообщений от системы. (Разделяются запятыми)</span>';
$_['entry_alert_mail']        = 'Оповещение о заказе по E-mail:<br /><span class="help">Оповестить владельца магазина о новом заказе.</span>';
$_['entry_cart_weight']       = 'Показывать вес на странице корзины:<br /><span class="help">Показывает вес заказанных товаров на странице корзины</span>';
$_['entry_catalog_limit']     = 'Элементов на страницу (Витрина):<br /><span class="help">Количество отображаемых на странице элементов (товары, категории и т.п.)</span>';
$_['entry_checkout']          = 'Подтверждение при заказе:<br /><span class="help">Требовать подтверждение согласия с правилами при оформлении заказа.</span>';
$_['entry_commission']          = 'Партнерское вознаграждение (%):<br /><span class="help">Партнерское вознаграждение по умолчанию (%).</span>';
$_['entry_complete_status']     = 'Завершенный статус заказа:<br /><span class="help">После выставления данного статуса у заказа пользователю будет отправлено письмо для скачивания электронных товаров и подарочных сертификатов.</span>';
$_['entry_compression']       = 'Уровень сжатия:<br /><span class="help">Задайте значение от 0 до 9.</span>';
$_['entry_country']           = 'Страна:';
$_['entry_currency']          = 'Валюта:<br /><span class="help">Изменение валюты по умолчанию. Необходимо очистить кэш браузера для просмотра изменений и сбрасывания cookie.</span>';
$_['entry_currency_auto']     = 'Автоматическое обновление валют:<br /><span class="help">Задать ежедневное автоматическое обновление валют.</span>';
$_['entry_customer_group']         = 'Группа клиентов:<br /><span class="help">Группа покупателей по умолчанию.</span>';
$_['entry_customer_group_display'] = 'Группы клиентов:<br /><span class="help">Показывать группы покупателей, которые новые покупатели могут выбрать при регистрации, такие как "Оптовые покупатели" или "Бизнес-партнёры".</span>';
$_['entry_customer_online']        = 'Клиенты онлайн:<br /><span class="help">Отслеживать онлайн-покупателей через секцию отчетов о покупателях.</span>';
$_['entry_customer_price']         = 'Показывать цены только залогиненным:<br /><span class="help">Показывать цены только зарегистрированнным покупателям.</span>';
$_['entry_download']               = 'Разрешить скачивание файлов:';
$_['entry_email']                  = 'E-Mail:';
$_['entry_encryption']        = 'Ключ шифрования:<br /><span class="help">Ключ, который будет использоваться для шифрования конфиденциальной информации при обработке заказов.</span>';
$_['entry_error_display']     = 'Показывать ошибки:';
$_['entry_error_filename']    = 'Файл журнала ошибок:';
$_['entry_error_log']         = 'Записывать ошибки:';
$_['entry_fax']               = 'Факс:';
$_['entry_file_extension_allowed'] = 'Разрешенные типы файлов:<br /><span class="help">Добавьте типы файлов, разрешенные для загрузки. Каждый тип на новой строке.</span>';
$_['entry_file_mime_allowed']      = 'Разрешенные MIME типы:<br /><span class="help">Добавьте MIME типы файлов, разрешенные для загрузки. Каждый тип на новой строке.</span>';
$_['entry_fraud_detection']        = 'Использовать MaxMind систему обнаружения мошенников:<br /><span class="help">MaxMind сервис для обнаружения мошенников. Если у вас нет лицензионного ключа вы можете <a onclick="window.open(\'http://www.maxmind.com/?rId=opencart\');"><u>получить его здесь</u></a>. Как только вы его получите, скопируйте ключ в поле представленное ниже.</span>';
$_['entry_fraud_key']              = 'MaxMind лицензионный ключ:</span>';
$_['entry_fraud_score']            = 'MaxMind очки:<br /><span class="help">Высокие очки означают что заказ скорее всего мошеннический. Выставляйте очки между 0 и 100.</span>';
$_['entry_fraud_status']           = 'MaxMind статус ордера:<br /><span class="help">Заказы с высокими очками будут переведены в данный статус и автоматическая смена статуса будет отключена для данных заказов.</span>';
$_['entry_ftp_host']               = 'FTP Хост:';
$_['entry_ftp_password']           = 'FTP Пароль:';
$_['entry_ftp_port']               = 'FTP Порт:';
$_['entry_ftp_root']               = 'FTP Расположние:<span class="help">Каталог, в который установлен Opencart; обычно \'public_html/\'.</span>';
$_['entry_ftp_status']             = 'Включить FTP:';
$_['entry_ftp_username']           = 'FTP Имя пользователя:';
$_['entry_google_analytics']    = 'Код Google Analytics:<br /><span class="help">Войдите в Ваш <a onclick="window.open(\'http://www.google.com/analytics/\');"><u>Google Analytics аккаунт</u></a> и после настройки добавьте сюда код выданный Google Analytics.</span>';

// krumax edit
$_['entry_sms_gatename']       = 'Сервис отправки SMS:';
$_['entry_sms_to']             = 'Номер телефона получателя:<br/><span class="help">В международном формате, только цифры 7926xxxxxxx</span>';
$_['entry_sms_from']           = 'Псевдоним отправителя:<br/><span class="help">Не более 11 символов, либо номер телефона до 15 цифр</span>';
$_['entry_sms_message']        = 'Текст сообщения:<br/><span class="help">Можно использовать теги:<br/>{ID} - номер заказа<br/>{DATE} - дата заказа<br/>{TIME} - время заказа<br/>{SUM} - сумма заказа<br/>{PHONE} - телефон клиента</span>';
$_['entry_sms_gate_username']  = 'Логин на SMS шлюз:';
$_['entry_sms_gate_password']  = 'Пароль на SMS шлюз:';
$_['entry_sms_alert']          = 'Включить SMS уведомления:';
$_['entry_sms_copy']           = 'Дополнительные номера:<br/><span class="help">Указывать через запятую, в международном формате, без разделителей 7926xxxxxxx</span>';
// krumax edit

$_['entry_guest_checkout']         = 'Оформление заказа без регистрации:<br /><span class="help">Позволить клиентам оформлять заказы без регистрации Личного кабинета. Эта функция не будет доступна, если в корзине будут загружаемые в виде файла товары.</span>';
$_['entry_icon']              = 'Иконка:<br /><span class="help">Должна быть в PNG 16px на 16px.</span>';
$_['entry_image_additional']  = 'Размер дополнительных изображений товаров:';
$_['entry_image_cart']        = 'Размер изображений товаров в корзине:';
$_['entry_image_category']    = 'Размер изображения в списке категорий:';
$_['entry_image_compare']       = 'Размер изображения в списке сравнения:';
$_['entry_image_popup']       = 'Размер всплывающего изображения товара:';
$_['entry_image_product']     = 'Размер изображения в списке товаров:';
$_['entry_image_related']     = 'Размер изображения аналогичных товаров:';
$_['entry_image_thumb']       = 'Размер большого изображения товара:';
$_['entry_image_wishlist']      = 'Размер изображения в списке заметок:';
$_['entry_invoice']           = 'Начальный № счета-фактуры:<br /><span class="help">Установите стартовый номер счета-фактуры.</span>';
$_['entry_language']          = 'Язык:';
$_['entry_layout']              = 'Схема по умолчанию:';
$_['entry_length_class']      = 'Единица измерения:';
$_['entry_logo']              = 'Логотип:';
$_['entry_mail_parameter']    = 'Параметры функции mail:<br /><span class="help">ОСТОРОЖНО. Не заполняйте поле, если не знаете, для чего оно. Когда используется "Mail", здесь могут быть указаны дополнительные параметры для sendmail (напр. "-femail@storeaddress.com").';
$_['entry_mail_protocol']     = 'Почтовый протокол:<br /><span class="help">Выбирайте "Mail", и только в случае, когда этот способ не работает &mdash; SMTP.</span>';
$_['entry_maintenance']       = 'Режим обслуживания:<br /><span class="help">Отключает отображение магазина клиентам. Им будет отображаться сообщение об обслуживании. После авторизации админом, магазин будет нормально отображаться.</span>';
$_['entry_meta_description']  = 'Мета-тег "description":';
$_['entry_name']              = 'Название магазина:';
$_['entry_order_edit']             = 'Редактирование заказа:<br /><span class="help">Количество дней в течении которого заказа может быть отредактирован. Поле обязательное потому что цены и скидки могут измениться, и заказ может стать некорректниым после редактирования.</span>';
$_['entry_order_status']      = 'Статус заказа:<br /><span class="help">Статус заказа по умолчанию.</span>';
$_['entry_owner']             = 'Владелец магазина:';
$_['entry_password']               = 'Разрешить восстановление пароля:<br /><span class="help">Разрешает восстановление пароля для учетной записи администратора. Будет автоматически отключена, при попытке взлома.</span>';
$_['entry_product_count']          = 'Количество продуктов в категории:<br /><span class="help">Показывает количество продуктов в подкатегориях в пользовательской части в верхнем меню. Осторожно, увеличивает нагрузку на сервер при большом количестве подкатегорий!</span>';
$_['entry_return_status']       = 'Статус возврата:<br /><span class="help">Данный статус будет присвоен заказу после процедуры возврата товара.</span>';
$_['entry_return']                 = 'Условия возврата:<br /><span class="help">Требовать подтверждения согласия с правилами перед возвратом товара.</span>';
$_['entry_review']       			= 'Разрешить отзывы:';
$_['entry_robots']                 = 'Robots:<br /><span class="help">Список веб-роботов (их User Agents), для которых НЕ НАДО использовать метод Shared Sessions. Каждый User Agent указывается в новой строке.</span>';
$_['entry_secure']                 = 'Использовать SSL:<br /><span class="help">Для использования SSL убедитесь что Ваш хостинг поддерживает SSL сертификат и пропишите SSL адреса в файле конфигурации.</span>';
$_['entry_seo_url']           = 'Включить SEO URL:<span class="help">Необходимо настроить файл .htaccess в корневом каталоге магазина</span>';
$_['entry_shared']                 = 'Использовать Shared Sessions:<br /><span class="help">Помещает идентификатор сессии в URI, позволяя поддерживать одну сессию при переходах между разными доменами.</span>';
$_['entry_smtp_host']         = 'SMTP хост:';
$_['entry_smtp_password']     = 'SMTP пароль:';
$_['entry_smtp_port']         = 'SMTP порт:';
$_['entry_smtp_timeout']      = 'SMTP таймаут:';
$_['entry_smtp_username']     = 'SMTP логин:';
$_['entry_stock_checkout']    = 'Заказ при нехватке на складе:<br /><span class="help">Разрешить клиентам оформлять заказ, если заказываемых товаров на данный момент нет на складе.</span>';
$_['entry_stock_display']     = 'Показывать остаток на складе:<br /><span class="help">Показывать остаток товаров на складе на странице товара.</span>';
$_['entry_stock_status']      = 'Статус "Нет на складе":<br /><span class="help">Устанавливать по умолчанию статус "Нет на складе" при создании товара.</span>';
$_['entry_stock_warning']     = 'Предупреждать о нехватке на складе:<br /><span class="help">Предупреждать на странице корзины о нехватке товара на складе, если товар закончился, но помечен, как имеющийся в наличии на складе. (Предупреждение всегда показывается, если товара нет в наличии).</span>';
$_['entry_tax']               = 'Отображать цены с налогом:';
$_['entry_tax_customer']      = 'Использовать налоговый адрес покупателя:<br /><span class="help">Использовать дефолтный адрес покупателя, когда они залогинены, для подсчёта налогов. Вы можете выбрать использование выбранного по умолчанию адреса покупателя для адреса доставки или платежа покупателя.</span>';
$_['entry_tax_default']       = 'Использовать налоговый адрес магазина:<br /><span class="help">Использовать адрес магазина для вычисления налогов если пользователь не залогинен. Вы можете выбрать использование адреса магазина в качестве адреса доставки или платежа покупателя.</span>';
$_['entry_telephone']         = 'Телефон:';
$_['entry_template']          = 'Шаблон магазина:';
$_['entry_title']             = 'Заголовок:';
$_['entry_vat']                    = 'Проверка номера налога:<br /><span class="help">Проверяйте номер налога на http://ec.europa.eu service.</span>';
$_['entry_voucher_max']            = 'Максимальное количество ваучеров:<br /><span class="help">Максимальное количество ваучеров дла покупки.</span>';
$_['entry_voucher_min']            = 'Минимальная количество ваучеров:<br /><span class="help">Минимальное количество ваучеров для покупки.</span>';
$_['entry_weight_class']      = 'Вес:';
$_['entry_invoice_prefix']      = 'Префикс счета-фактуры:<br /><span class="help">Установите префикс счета-фактуры. Пример: INV-2012-00</span>';
$_['entry_zone']              = 'Регион / Область:';
$_['error_address']           = 'Адрес магазина должен быть от 10 до 256 символов!';
$_['error_customer_group_display'] = 'You must include the default customer group if you are going to use this feature!';
$_['error_email']             = 'E-Mail адрес введен неверно!';
$_['error_encryption']             = 'Encryption must be between 3 and 32 characters!';
$_['error_error_filename']         = 'Error Log Filename required!';
$_['error_ftp_host']               = 'FTP Host required!';
$_['error_ftp_password']           = 'FTP Password required!';
$_['error_ftp_port']               = 'FTP Port required!';
$_['error_ftp_username']           = 'FTP Username required!';
$_['error_image_additional']       = 'Additional Product Image Size dimensions required!';
$_['error_image_cart']             = 'Cart Image Size dimensions required!';
$_['error_image_category']         = 'Category List Size dimensions required!';
$_['error_image_compare']          = 'Compare Image Size dimensions required!';
$_['error_image_popup']            = 'Product Image Popup Size dimensions required!';
$_['error_image_product']          = 'Product List Size dimensions required!';
$_['error_image_related']          = 'Related Product Image Size dimensions required!';
$_['error_image_thumb']            = 'Product Image Thumb Size dimensions required!';
$_['error_image_wishlist']         = 'Wish List Image Size dimensions required!';
$_['error_limit']       			= 'asdasdad';
$_['error_name']              = 'Название магазина должно быть от 3 до 32 символов!';
$_['error_owner']             = 'Имя владельца магазина должно быть от 3 до 64 символов!';
$_['error_permission']        = 'У Вас нет прав для изменения настроек!';
$_['error_telephone']         = 'Телефон должен быть от 3 до 32 символов!';
$_['error_title']             = 'Заголовок магазина должен быть от 3 до 32 символов!';
$_['error_voucher_max']            = 'Необходима максимальная сумма подарочного сертификата!';
$_['error_voucher_min']            = 'Необходима минимальная сумма подарочного сертификата!';
$_['error_warning']             = 'asdasd';
$_['heading_title']           = 'Настройки';
$_['text_account']                 = 'Аккаунт';
$_['text_affiliate']               = 'Партнерство';
$_['text_browse']              = 'Просмотр файлов';
$_['text_checkout']                = 'Чекаут';
$_['text_clear']               = 'Очистить изображение';
$_['text_image_manager']      = 'Управление изображениями';
$_['text_items']                   = 'Показы';
$_['text_mail']                 = 'Mail';
$_['text_payment']             = 'Платёжный адрес';
$_['text_product']                 = 'Продукты';
$_['text_return']                  = 'Возвраты';
$_['text_shipping']                = 'Адрес доставки';
$_['text_smtp']                    = 'SMTP';
$_['text_stock']                   = 'Склад';
$_['text_success']                 = 'Настройки успешно изменены!';
$_['text_tax']                     = 'Налоги';
$_['text_voucher']                 = 'Ваучеры';
// Entry
// Error
// Heading
// Text


$_['text_seo_url']					= 'Default';
$_['text_seo_pro']					= 'SeoPro';
$_['entry_seo_url_type']			= 'Тип ЧПУ:';
$_['entry_seo_url_include_path']	= 'ЧПУ товаров с категориями:<span class="help">/category/subcategory/product<br />(только для SeoPro)</span>';
$_['entry_seo_url_postfix']			= 'Окончание ЧПУ:<span class="help">Например .html<br />(только для SeoPro)</span>';

?>