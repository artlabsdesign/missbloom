<?php define("SMS_CONTROLER_URL", DIR_APPLICATION . 'model/sms/'); require_once (defined("SMS_CONTROLER_URL")?SMS_CONTROLER_URL:"") .'smsController.php'; class ControllerSmsAdmin extends SmsController { public $res_hooks = null; public $res_groups = null; public $res_hooks_info = null; public $res_hooks_template = null; public $res_hooks_notice = null; public $res_hooks_background = null; public $res_hooks_icon = null; public $js = ""; public $res_hooks_admin = null; public $res_hooks_admin_ids = null; public $use_unicode = 0; public $pole_profil = null; public $store_arr = null; public function index() { parent::index(); } public function display() { $ie7ba91fafe7c53be0878165bdb30c214e66b70bf = $this->fdf61aeab4592f07180ad07f2cb5f0c1a950a4c74(); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 = parent::display(); $this->store_arr = $this->getStore(false); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= " <script language=\"javascript\"> var minus = '" . self::$minusImg . "'; var plus = '" . self::$plusImg . "'; var chartext = '" . v_adminsms_jschars . "'; var v_adminsms_preview = '" . v_adminsms_preview . "'; var v_adminsms_jstotalsms = '" . v_adminsms_jstotalsms . "'; function getTemplateValues(text) { " . $this->loadvariables() . " return text; } </script> "; $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= '<script type="text/javascript" src="'.DIR_SMS_JS.'sms.js"></script>'; $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= '<script type="text/javascript" src="'.DIR_SMS_JS.'jquery.at.caret.min.js"></script>'; if(count($ie7ba91fafe7c53be0878165bdb30c214e66b70bf) > 0) { $this->loadhooks(); $this->loadHooksForOrdersAdmin(); $this->loadHooksForReturnsAdmin(); $this->loadadminhooks(); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <h2>' . v_adminsms_adminsms . '</h2> <p>' . v_adminsms_description . '</p> '; $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("SELECT * FROM " . DB_PREFIX . "sp_hooks_unicode where area='default' and type='admin'"); if($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->num_rows) { $this->use_unicode = 1; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <script language="javascript"> var unicode = ' . $this->use_unicode . '; </script> <fieldset> <legend><img src="' . self::$setingsImg . '" alt="' . v_adminsms_unicodesms . '" /> ' . v_adminsms_unicodesms . '</legend> <form action="" method="post"> <p>' . v_adminsms_unicodetext . '</p> ' . self::getInput(array("type" => "checkbox", "name" => "unicode", "value" => 1), $this->use_unicode) . ' ' . v_adminsms_unicode . ' ' . self::getInput(array("type" => "submit", "name" => "submitAdminUnicode", "value" => v_adminsms_unicodesave, "class" => "button")) . ' </form> </fieldset> '; $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= $this->f272209a3143829a75b04748251af15ce810cbb18(); } else { $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <h2>' . v_adminsms_adminsmsnotactive . '</h2> <p>' . v_adminsms_addadmin . '</p> '; } return $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8; } public function postProcess($icddcd508600972f2dab78cd14f7612aa4dc19a18 = NULL, $i6b496fee24729ce6f7683ba88d5a87d6130049b5 = NULL, $ifab26c5df1e4ac29b64e0a4796b1f9165fe614a8 = NULL) { if($icddcd508600972f2dab78cd14f7612aa4dc19a18 == NULL && $i6b496fee24729ce6f7683ba88d5a87d6130049b5 == NULL) { return self::POST_ERROR; } if(isset($icddcd508600972f2dab78cd14f7612aa4dc19a18['submitAdminSMS'])) { $this->store_arr = $this->getStore(false); $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['status'], ENT_COMPAT, 'UTF-8'); $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['name'], ENT_COMPAT, 'UTF-8'); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ccc7124c4929a783f68681205060c9cffb230624 = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['text'], ENT_COMPAT, 'UTF-8'); $i05355412b857f5174e9a2f71b1e936a86ad60cd2e015f84b843b000aaf488f2f6b9fb835d264daf4 = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['ids'], ENT_COMPAT, 'UTF-8'); $i05355412b857f5174e9a2f71b1e936a86ad60cd2e547bd883cfe3221de46d930d637d9a948b0e9ab = explode(";", $i05355412b857f5174e9a2f71b1e936a86ad60cd2e015f84b843b000aaf488f2f6b9fb835d264daf4); if(!strlen($i05355412b857f5174e9a2f71b1e936a86ad60cd2ccc7124c4929a783f68681205060c9cffb230624)) { $this->_errors[] = v_adminsms_invalidtext; return self::POST_ERROR; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2c83eade49442cca763c4762475dc511b9f1099ed = array(); $i05355412b857f5174e9a2f71b1e936a86ad60cd28908f507995559916faacfd5e7ffd37d299a8101 = $this->store_arr; foreach($this->store_arr as $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 => $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe) { for($i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3 = 0; $i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3 < count($i05355412b857f5174e9a2f71b1e936a86ad60cd2e547bd883cfe3221de46d930d637d9a948b0e9ab); $i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3++) { $i05355412b857f5174e9a2f71b1e936a86ad60cd24aaffaf5cb80e89a3a7ebcfdc41c8d3a1b6f0ffc = 0; if(isset($icddcd508600972f2dab78cd14f7612aa4dc19a18['adminID' . $i05355412b857f5174e9a2f71b1e936a86ad60cd2e547bd883cfe3221de46d930d637d9a948b0e9ab[$i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3] . "_" . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4])) { $i05355412b857f5174e9a2f71b1e936a86ad60cd24aaffaf5cb80e89a3a7ebcfdc41c8d3a1b6f0ffc = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['adminID' . $i05355412b857f5174e9a2f71b1e936a86ad60cd2e547bd883cfe3221de46d930d637d9a948b0e9ab[$i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3] . "_" . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4], ENT_COMPAT, 'UTF-8'); } if($i05355412b857f5174e9a2f71b1e936a86ad60cd24aaffaf5cb80e89a3a7ebcfdc41c8d3a1b6f0ffc > 0) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2c83eade49442cca763c4762475dc511b9f1099ed[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4][] = $i05355412b857f5174e9a2f71b1e936a86ad60cd2e547bd883cfe3221de46d930d637d9a948b0e9ab[$i05355412b857f5174e9a2f71b1e936a86ad60cd2d07d3931748bf1dccb8b9a5bdd865840a543baa3]; } } } $this->Execute("DELETE FROM " . DB_PREFIX . "sp_hooks_admins_multi WHERE name='" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . "' AND status='" . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . "'"); foreach($i05355412b857f5174e9a2f71b1e936a86ad60cd28908f507995559916faacfd5e7ffd37d299a8101 as $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 => $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe) { if(isset($i05355412b857f5174e9a2f71b1e936a86ad60cd2c83eade49442cca763c4762475dc511b9f1099ed[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) && count($i05355412b857f5174e9a2f71b1e936a86ad60cd2c83eade49442cca763c4762475dc511b9f1099ed[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) > 0) { $this->Execute("INSERT INTO " . DB_PREFIX . "sp_hooks_admins_multi VALUES ('" . $this->escape($i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03) . "'," . $this->escape($i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09) . ",'" . $this->escape($i05355412b857f5174e9a2f71b1e936a86ad60cd2ccc7124c4929a783f68681205060c9cffb230624) . "','" . implode(";", $i05355412b857f5174e9a2f71b1e936a86ad60cd2c83eade49442cca763c4762475dc511b9f1099ed[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) . "','" . $this->escape($i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4) . "')"); } } $this->displayConfirmation(v_adminsms_smssaved); return self::POST_OK; } elseif(isset($icddcd508600972f2dab78cd14f7612aa4dc19a18['submitAdminUnicode'])) { if(isset($icddcd508600972f2dab78cd14f7612aa4dc19a18['unicode'])) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2a16b8bee9a5a69d4ec369fae234a70efdd002c24 = htmlentities($icddcd508600972f2dab78cd14f7612aa4dc19a18['unicode'], ENT_COMPAT, 'UTF-8'); } else { $i05355412b857f5174e9a2f71b1e936a86ad60cd2a16b8bee9a5a69d4ec369fae234a70efdd002c24 = 0; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("DELETE FROM " . DB_PREFIX . "sp_hooks_unicode WHERE area='default' AND type='admin' "); if($i05355412b857f5174e9a2f71b1e936a86ad60cd2a16b8bee9a5a69d4ec369fae234a70efdd002c24) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("INSERT INTO " . DB_PREFIX . "sp_hooks_unicode VALUES ('default'," . $this->escape($i05355412b857f5174e9a2f71b1e936a86ad60cd2a16b8bee9a5a69d4ec369fae234a70efdd002c24) . ",'admin') "); } $this->displayConfirmation(v_adminsms_unicodesaved); return self::POST_OK; } return self::POST_ERROR; } public function loadhooks() { foreach(SmsVariables::$hooks as $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952) { if($i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952["owner"] != 2 && $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952["owner"] != 0) { $this->res_groups[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['group']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']][] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']; $this->res_hooks_info[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['info']; $this->res_hooks_template[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['template']; $this->res_hooks_notice[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['notice']; $this->res_hooks_background[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['background']; $this->res_hooks_icon[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['icon']; } } return true; } public function loadadminhooks() { $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("SELECT * FROM " . DB_PREFIX . "sp_hooks_admins_multi"); if($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->num_rows) { foreach($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->rows as $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952) { $this->res_hooks_admin[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']] = stripslashes($i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['smstext']); if(strlen($i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['adminIDs']) > 0) { if(strlen($i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['adminIDs']) > 0) { $this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['status']][$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['storeID']] = explode(";", $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['adminIDs']); } } } } return true; } private function fa6fd3ca6a20e0800b03f4b2a4ee3187a601193de($i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03, $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09, $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe, $i53916164c83f49b00a5620d43794a44d42a8ea70, $i05355412b857f5174e9a2f71b1e936a86ad60cd28a1c4f7b7114b92a37dc6b62516e7378c1abb7c4) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 = ' <form name="form' . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . '" action="" method="post" class="ajax"> <table class="formTable"> <tr> <td class="bottom padv0">' . self::getLabel(v_adminsms_smstext) . '</td> <td class="bottom padv0">' . self::getLabel(v_adminsms_preview, 'id="label' . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . '"') . '</td> <td colspan="3">' . self::getLabel(v_adminsms_admins) . '</td> </tr> <tr> <td rowspan="2" class="hookTextArea top">' . self::getTextArea(array("name" => "text", "id" => "textArea" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09, "onchange" => "countHook('" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . "')", "onkeyup" => "countHook('" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . "')", "style" => "width:290px;height:100px;"), $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe) . '</td> <td rowspan="2" class="hookTextArea top">' . self::getTextArea(array("id" => "textfake" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09, "name" => "textfake", "disabled" => "disabled", "style" => "width:290px;height:100px;")) . '</td> <td colspan="3">' . $this->fdf61aeab4592f07180ad07f2cb5f0c1a950a4c743($i53916164c83f49b00a5620d43794a44d42a8ea70) . '</td> </tr> <tr> <td class="top w50">' . self::getInput(array("type" => "submit", "value" => v_adminsms_save, "name" => "submitAdminSMS", "class" => "button")) . '</td> <td class="top w50">' . self::getInput(array("type" => "button", "value" => v_adminsms_cancel, "title" => v_adminsms_restoreunsaved, "class" => "button", "onClick" => "this.form.reset();countHook('" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . "')")) . '</td> <td></td> </tr> <tr> <td colspan="5">' . v_smsprestashop_notice . '<br /><br />' . $this->noticeEval($i05355412b857f5174e9a2f71b1e936a86ad60cd28a1c4f7b7114b92a37dc6b62516e7378c1abb7c4, $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09) . '</td> </tr> </table> ' . self::getInput(array("type" => "hidden", "name" => "status", "value" => "$i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09")) . ' ' . self::getInput(array("type" => "hidden", "name" => "name", "value" => "$i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03")) . ' ' . self::getInput(array("type" => "hidden", "name" => "ajax-id", "value" => "" . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . "")) . ' </form> <script language="javascript"> countHook(\'' . $i05355412b857f5174e9a2f71b1e936a86ad60cd26b378f203f89073d2d6f4239eef67bf1db322d03 . $i05355412b857f5174e9a2f71b1e936a86ad60cd247f22955fae729a8a5c6dc19913d0cdcb6b27e09 . '\'); </script> '; return $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8; } private function fdf61aeab4592f07180ad07f2cb5f0c1a950a4c74() { $iced8cbcfca3c880f0f157e119d1cc6f8691e7e89 = array(); $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("SELECT * FROM " . DB_PREFIX . "sp_admins"); if($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->num_rows) { foreach($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->rows as $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952) { $iced8cbcfca3c880f0f157e119d1cc6f8691e7e89[$i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['ID']] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name']; } } return $iced8cbcfca3c880f0f157e119d1cc6f8691e7e89; } private function fdf61aeab4592f07180ad07f2cb5f0c1a950a4c743($i53916164c83f49b00a5620d43794a44d42a8ea70 = array()) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2e015f84b843b000aaf488f2f6b9fb835d264daf4 = array(); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 = ' <table class="resultTable"> <tbody> '; $i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de = $this->Execute("SELECT * FROM " . DB_PREFIX . "sp_admins"); if($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->num_rows) { foreach($i05355412b857f5174e9a2f71b1e936a86ad60cd2c6e936002fe51b97bc1b95f337c09606ceb011de->rows AS $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952) { $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <tr> <td class="w100">' . $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['name'] . '</td> <td> '; foreach($this->store_arr as $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 => $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe) { $i05355412b857f5174e9a2f71b1e936a86ad60cd20b528d1be9ee802a3400dc2dc8e66f5f242b1790 = false; if(isset($i53916164c83f49b00a5620d43794a44d42a8ea70[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) && is_array($i53916164c83f49b00a5620d43794a44d42a8ea70[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4])) { if(in_array($i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['ID'], $i53916164c83f49b00a5620d43794a44d42a8ea70[$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4])) { $i05355412b857f5174e9a2f71b1e936a86ad60cd20b528d1be9ee802a3400dc2dc8e66f5f242b1790 = true; } } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= self::getInput(array("type" => "checkbox", "name" => "adminID" . $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['ID'] . "_" . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4, "value" => 1), $i05355412b857f5174e9a2f71b1e936a86ad60cd20b528d1be9ee802a3400dc2dc8e66f5f242b1790) . " " . $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= "</td> </tr>"; $i05355412b857f5174e9a2f71b1e936a86ad60cd2e015f84b843b000aaf488f2f6b9fb835d264daf4[] = $i05355412b857f5174e9a2f71b1e936a86ad60cd243ef5aef4168652439ef5de195405ced9f0f7952['ID']; } } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= self::getInput(array("type" => "hidden", "name" => "ids", "value" => implode(";", $i05355412b857f5174e9a2f71b1e936a86ad60cd2e015f84b843b000aaf488f2f6b9fb835d264daf4))); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' </tbody> </table>'; return $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8; } public function ajaxSubmitAdminSMS($i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af) { $this->store_arr = $this->getStore(false); $this->setAction($i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["ajax-id"]); $this->disableScrollUp(); $this->loadadminhooks(); if(isset($this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["name"]][$i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["status"]]) && $this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["name"]][$i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["status"]] > 0) { $this->sendSnippet("active" . $i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["name"] . $i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["status"], '<span style="cursor:help;" title="' . v_adminsms_smsactive . '"><img src="' . self::$acceptImg . '" alt="' . v_adminsms_smsactive . '" /></span>'); } else { $this->sendSnippet("active" . $i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["name"] . $i05355412b857f5174e9a2f71b1e936a86ad60cd2155692153d303819c686ffc9239bf6b5e4dac9af["status"], '<span style="cursor:help;" title="' . v_adminsms_smsnotactive . '"><img src="' . self::$denyImg . '" alt="' . v_adminsms_smsnotactive . '" /></span>'); } } private function f272209a3143829a75b04748251af15ce810cbb18() { $i0f4e2508684ab2ad389d218aaf13edfc84ad4936 = array(0 => v_adminsms_orderstatus, 1 => v_adminsms_order, 2 => v_adminsms_account, 3 => v_adminsms_product, 4 => v_contact_form, 5 => v_hook_return); $i05355412b857f5174e9a2f71b1e936a86ad60cd2805c055e5cbce86c3778eadfff1612d7db8f1978 = array(0 => self::$orderImg, 1 => self::$orderImg, 2 => self::$adminCustomerImg, 3 => self::$catalogImg, 4 => self::$catalogImg, 5 => self::$sendImg); $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 = ""; for($i05355412b857f5174e9a2f71b1e936a86ad60cd2 = 0; $i05355412b857f5174e9a2f71b1e936a86ad60cd2 < 6; $i05355412b857f5174e9a2f71b1e936a86ad60cd2++) { if(!isset($this->res_groups[$i05355412b857f5174e9a2f71b1e936a86ad60cd2])) { continue; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <fieldset> <legend><img src="' . $i05355412b857f5174e9a2f71b1e936a86ad60cd2805c055e5cbce86c3778eadfff1612d7db8f1978[$i05355412b857f5174e9a2f71b1e936a86ad60cd2] . '" alt="" /> ' . $i0f4e2508684ab2ad389d218aaf13edfc84ad4936[$i05355412b857f5174e9a2f71b1e936a86ad60cd2] . '</legend> <table class="resultTable"> <tbody> '; foreach($this->res_groups[$i05355412b857f5174e9a2f71b1e936a86ad60cd2] as $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 => $i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe) { foreach($i05355412b857f5174e9a2f71b1e936a86ad60cd20e4db502c191d65f4204e889a1aff420bded9efe as $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db) { if(isset($this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) && count($this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) > 0) { $i4f493e441cc60b6a3540d5647c6fbcf3f2d966fc = '<span id="snippet-active' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '"><span style="cursor:help;" title="' . v_adminsms_smsactive . '"><img src="' . self::$acceptImg . '" alt="' . v_adminsms_smsactive . '" /></span></span>'; } else { $i4f493e441cc60b6a3540d5647c6fbcf3f2d966fc = '<span id="snippet-active' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '"><span style="cursor:help;" title="' . v_adminsms_smsnotactive . '"><img src="' . self::$denyImg . '" alt="' . v_adminsms_smsnotactive . '" /></span></span>'; } if(isset($this->res_hooks_admin[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) && strlen($this->res_hooks_admin[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) > 0) { $i2565c1ff36c1fabfc4e5940cddc433992e971682 = $this->res_hooks_admin[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]; } else { $i2565c1ff36c1fabfc4e5940cddc433992e971682 = $this->res_hooks_template[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]; } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' <tr ' . self::isEven($i05355412b857f5174e9a2f71b1e936a86ad60cd2f3b517d335a2b4ef26a37d2656c41c234b2a734a, "even") . '> <td> <a id="displayText' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '" href="javascript:" class="noUnderline" onclick="toggleInfo(\'' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '\');"> <img src="' . self::$plusImg . '" id="toggleButton' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '"/> ' . (($i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db == "actionOrderStatusPostUpdate") ? (v_adminsms_statusupdate) : ($i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db)) . ' - <span class="orderStatusHighlight" '.(defined("SMS_ENABLE_COLOR")?('style="border: 2px solid '.$this->res_hooks_background[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4].';"'):"").'>' . $this->res_hooks_info[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4] . '</span> </a> </td> <td class="right middle">' . self::getAjaxLoader($i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4) . ' ' . $i4f493e441cc60b6a3540d5647c6fbcf3f2d966fc . '</td> </tr> <tr class="hidden" id="toggleText' . $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db . $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4 . '"> <td colspan="2">' . $this->fa6fd3ca6a20e0800b03f4b2a4ee3187a601193de( $i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db, $i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4, $i2565c1ff36c1fabfc4e5940cddc433992e971682, ((isset($this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4])) ? ($this->res_hooks_admin_ids[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) : (array())), ((isset($this->res_hooks_notice[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4])) ? ($this->res_hooks_notice[$i05355412b857f5174e9a2f71b1e936a86ad60cd285c6076c1c6fb2e7d2b610684d517127febaf6db][$i05355412b857f5174e9a2f71b1e936a86ad60cd27baa31be52215025da340cfec29600d8d2b327c4]) : (array())) ) . ' </td> </tr> '; } } $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8 .= ' </tbody> </table> </fieldset> '; } return $i05355412b857f5174e9a2f71b1e936a86ad60cd2ae8c74e5273dec25096dbae362493a9f609ecfc8; } } ?>