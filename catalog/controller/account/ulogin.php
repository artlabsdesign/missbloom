<?php

class ControllerAccountUlogin extends Controller {

    public function index() {
        $s = file_get_contents('http://ulogin.ru/token.php?token=' . $_POST['token'] . '&host=' . $_SERVER['HTTP_HOST']);
        $user = json_decode($s, true);
        //$user['network'] - соц. сеть, через которую авторизовался пользователь
        //$user['identity'] - уникальная строка определяющая конкретного пользователя соц. сети
        //$user['first_name'] - имя пользователя
        //$user['last_name'] - фамилия пользователя
        // получаем данные о пользователе с сервера uLogin
        if (!isset($user['identity'])) {
            die('Ошибка: ' . $uloginUserInfo->error_message);
        }

        if (isset($user['first_name']) && $user['first_name']) {
            $firstname = $user['first_name'];
        } else {
            $firstname = '';
        }

        if (isset($user['last_name']) && $user['last_name']) {
            $lastname = $user['last_name'];
        } else {
            $lastname = '';
        }

        if (isset($user['email']) && $user['email']) {
            $email = $user['email'];
        } else {
            $email = '';
        }


        $this->load->model('tool/ulogin');
        $check_id = $this->model_tool_ulogin->check_identity($user['identity']);
        If (!$check_id) {
            $data = array(
                'identity' => $user['identity'],
                'firstname' => $firstname,
                'lastname' => $lastname,
                'email' => $email,
                'customer_group_id' => $this->config->get('config_customer_group_id'),
                'password' => $this->generate_password(10)
            );
            $customer_id = $this->model_tool_ulogin->add_customer($data);
            $this->model_tool_ulogin->login($customer_id);
            $this->model_tool_ulogin->addAddress($data, $customer_id);
        } else {
            // входим
            $this->model_tool_ulogin->login($check_id);
        }
        if (isset($this->session->data['ulogin_redirect'])) {
            $this->redirect($this->session->data['ulogin_redirect']);
        } else {
            $this->redirect(HTTPS_SERVER);
        }
    }

    private function generate_password($number) {
        $arr = array('a', 'b', 'c', 'd', 'e', 'f',
            'g', 'h', 'i', 'j', 'k', 'l',
            'm', 'n', 'o', 'p', 'r', 's',
            't', 'u', 'v', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L',
            'M', 'N', 'O', 'P', 'R', 'S',
            'T', 'U', 'V', 'X', 'Y', 'Z',
            '1', '2', '3', '4', '5', '6',
            '7', '8', '9', '0');
        // Генерируем пароль
        $pass = "";
        for ($i = 0; $i < $number; $i++) {
            // Вычисляем случайный индекс массива
            $index = rand(0, count($arr) - 1);
            $pass .= $arr[$index];
        }

        return $pass;
    }

}

?>
