<?php

class ControllerCatalogSeodata extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('catalog/seo_data');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/seo_data');

        $this->getList();
    }

    public function insert() {
        $this->load->language('catalog/seo_data');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/seo_data');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_seo_data->addSeodata($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->load->language('catalog/seo_data');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/seo_data');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_seo_data->editSeodata($this->request->get['seo_data_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('catalog/seo_data');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/seo_data');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $seo_data_id) {
                $this->model_catalog_seo_data->deleteSeodata($seo_data_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    private function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 's.h1';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['insert'] = $this->url->link('catalog/seo_data/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('catalog/seo_data/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['seo_datas'] = array();

        $data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $seo_data_total = $this->model_catalog_seo_data->getTotalSeodatas();

        $results = $this->model_catalog_seo_data->getSeodatas($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('catalog/seo_data/update', 'token=' . $this->session->data['token'] . '&seo_data_id=' . $result['seo_data_id'] . $url, 'SSL')
            );

            $this->data['seo_datas'][] = array(
                'seo_data_id' => $result['seo_data_id'],
                'url' => $result['url'],
                'h1' => $result['h1'],
                'selected' => isset($this->request->post['selected']) && in_array($result['seo_data_id'], $this->request->post['selected']),
                'action' => $action
            );
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_url'] = $this->language->get('column_url');
        $this->data['column_h1'] = $this->language->get('column_h1');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['sort_h1'] = $this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . '&sort=s.h1' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $seo_data_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->template = 'catalog/seo_data_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function getForm() {
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['entry_url'] = $this->language->get('entry_url');
        $this->data['entry_h1'] = $this->language->get('entry_h1');
        $this->data['entry_title'] = $this->language->get('entry_title');
        $this->data['entry_description'] = $this->language->get('entry_description');
        $this->data['entry_seo_text'] = $this->language->get('entry_seo_text');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['seo_data_id'])) {
            $this->data['action'] = $this->url->link('catalog/seo_data/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('catalog/seo_data/update', 'token=' . $this->session->data['token'] . '&seo_data_id=' . $this->request->get['seo_data_id'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('catalog/seo_data', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['seo_data_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $seo_data_info = $this->model_catalog_seo_data->getSeodata($this->request->get['seo_data_id']);
        }

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->post['url'])) {
            $this->data['url'] = $this->request->post['url'];
        } elseif (!empty($seo_data_info)) {
            $this->data['url'] = $seo_data_info['url'];
        } else {
            $this->data['url'] = '';
        }

        if (isset($this->request->post['h1'])) {
            $this->data['h1'] = $this->request->post['h1'];
        } elseif (!empty($seo_data_info)) {
            $this->data['h1'] = $seo_data_info['h1'];
        } else {
            $this->data['h1'] = '';
        }

        if (isset($this->request->post['title'])) {
            $this->data['title'] = $this->request->post['title'];
        } elseif (!empty($seo_data_info)) {
            $this->data['title'] = $seo_data_info['title'];
        } else {
            $this->data['title'] = '';
        }

        if (isset($this->request->post['description'])) {
            $this->data['description'] = $this->request->post['description'];
        } elseif (!empty($seo_data_info)) {
            $this->data['description'] = $seo_data_info['description'];
        } else {
            $this->data['description'] = '';
        }

        if (isset($this->request->post['seo_text'])) {
            $this->data['seo_text'] = $this->request->post['seo_text'];
        } elseif (!empty($seo_data_info)) {
            $this->data['seo_text'] = $seo_data_info['seo_text'];
        } else {
            $this->data['seo_text'] = '';
        }

        $this->template = 'catalog/seo_data_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/seo_data')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    private function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/seo_data')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>