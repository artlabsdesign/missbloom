<?php require_once("admin/model/sms/main.php"); require_once("admin/model/sms/sms.php"); class ControllerSmsApi extends Controller { public function index() { die("DISABLED"); $ic2a8d16c716c71461676251aeff0aac2338be0d6 = new ModelSmsMain($this->registry); $i9e4eb3f9a542095964ce8f37bfe08f401edb5355 = $this->fac1fff09625c750dddf65f147323cefe6f883c95("to"); $iccc7124c4929a783f68681205060c9cffb230624 = $this->fac1fff09625c750dddf65f147323cefe6f883c95("text"); $ia16b8bee9a5a69d4ec369fae234a70efdd002c24 = $this->fac1fff09625c750dddf65f147323cefe6f883c95("unicode"); $i7f261894a2f47535041bff3d2f42c3969e819d98 = $this->fac1fff09625c750dddf65f147323cefe6f883c95("type"); if(isset($i9e4eb3f9a542095964ce8f37bfe08f401edb5355) && strlen($i9e4eb3f9a542095964ce8f37bfe08f401edb5355) > 4 && strlen($iccc7124c4929a783f68681205060c9cffb230624) > 0) { $i4367816f1ae76ddc44b3953c9ce6460e181a0a3a = new SmsModel($ic2a8d16c716c71461676251aeff0aac2338be0d6->getDb(), SmsModel::TYPE_SIMPLE, $i7f261894a2f47535041bff3d2f42c3969e819d98, SmsModel::SMS_BULK); $i4367816f1ae76ddc44b3953c9ce6460e181a0a3a->number($i9e4eb3f9a542095964ce8f37bfe08f401edb5355)->text($iccc7124c4929a783f68681205060c9cffb230624)->unicode($ia16b8bee9a5a69d4ec369fae234a70efdd002c24)->send(); if(!$i4367816f1ae76ddc44b3953c9ce6460e181a0a3a->isError()) { echo "SMSSTATUS:OK"; } else { echo "SMSSTATUS:ERROR"; } } else { echo "SMSSTATUS:ERROR"; } } private function fac1fff09625c750dddf65f147323cefe6f883c95($i8eb4a4396d35945caca6d04c38a7144aaa51a5f5) { if(filter_input(INPUT_POST, $i8eb4a4396d35945caca6d04c38a7144aaa51a5f5)) { return filter_input(INPUT_POST, $i8eb4a4396d35945caca6d04c38a7144aaa51a5f5); } elseif(filter_input(INPUT_GET, $i8eb4a4396d35945caca6d04c38a7144aaa51a5f5)) { return filter_input(INPUT_GET, $i8eb4a4396d35945caca6d04c38a7144aaa51a5f5); } else { return null; } } } 