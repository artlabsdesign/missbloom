<?php

// Heading
$_['heading_title'] = 'SMS_sending';
$_['text_module'] = 'Modules';

// Tabs
$_['oc_sms_sending_tab_connection'] = 'Connection';
$_['oc_sms_sending_tab_member'] = 'Administrator';
$_['oc_sms_sending_tab_customer'] = 'Customer';

// Text
$_['oc_sms_sending_text_login'] = 'Login';
$_['oc_sms_sending_text_password'] = 'Password';
$_['oc_sms_sending_text_signature'] = 'Sender ID';
$_['oc_sms_sending_text_debug']= 'Debug';
$_['oc_sms_sending_text_admin_new_customer'] = 'The new customer is registered';
$_['oc_sms_sending_text_admin_new_order'] = 'A new order is implemented';
$_['oc_sms_sending_text_admin_new_email'] = 'Received new email with store contact form';
$_['oc_sms_sending_text_telephone'] = 'Phone number';
$_['oc_sms_sending_text_customer_new_order'] = 'A new order is implemented';
$_['oc_sms_sending_text_customer_new_order_status'] = 'Change the order status';
$_['oc_sms_sending_text_customer_new_register'] = 'The registration is completed successfully';
$_['oc_sms_sending_text_notify_by_sms'] = 'Notify me via SMS';
$_['oc_sms_sending_text_notify'] = 'Texts of the notifications';
$_['oc_sms_sending_label_admin_new_order'] = 'for new order';
$_['oc_sms_sending_label_customer_new_order'] = 'for new order';
$_['oc_sms_sending_label_customer_new_status'] = 'for change the order status';

// Messages
$_['oc_sms_sending_message_customer_new_order_status'] = 'The order status is changed';

// Other
$_['oc_sms_sending_text_connection_tab_description'] =
'Specify the username and password to connect to the gateway SMS_sending and sender\'s name.<br />
Note that the sender\'s name should be pre-registered in your account page. To add a<br />
new name to the settings page on the right of the sender\' name choice click "names".';

$_['oc_sms_sending_text_macros_description'] =
'The text of the SMS-notification may specify special macros that will be replaced<br />
with the appropriate values when sending messages.<br /><br />
For notifications, you can use the following macros:
<ul>
<li>{ORDER_NUM} - order number
<li>{ORDER_SUM} - the total cost of the order (all)
<li>{ORDER_STATUS} - order status
<li>{FIRST_NAME} - customer firstname
<li>{LAST_NAME} - customer lastname
<li>{CR_PHONE} - phone buyer
<li>{CR_ADDR} - customer delivery address
<li>{GOODS_LIST} - list of goods in format "Product:Model:Quantity:Total"
</ul>';