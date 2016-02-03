<?php

class ControllerProductCategory extends Controller {

    public function index() {
        $this->load->model('setting/setting');

        //Get SEO data           
        $this->load->model('catalog/seo_data');
        $seo_data = $this->model_catalog_seo_data->getSeoDataByUrl($_SERVER['REQUEST_URI']);
        //Get SEO data 

        $plus_minus_quantity = $this->model_setting_setting->getSetting('plus_minus_quantity', $this->request->post);

        if (!empty($plus_minus_quantity)) {
            $this->data['plus_minus_quantity'] = $plus_minus_quantity['plus_minus_quantity_module']['1']['enable_on_views']['category'];

            $this->document->addScript('catalog/view/javascript/plus_minus_quantity.js');
        }

        $this->language->load('product/category');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        # OCFilter start
        $this->load->model('catalog/ocfilter');

        if (isset($this->request->get[$this->ocfilter['index']])) {
            $filter_ocfilter = $this->request->get[$this->ocfilter['index']];
        } else {
            $filter_ocfilter = null;
        }
        # OCFilter end

        $this->load->model('tool/image');

        $this->data['no_cat_pic'] = 'catalog/view/theme/ULTIMATUM/image/blog_no_image.jpg';

        if (isset($this->request->get['filter'])) {
            $filter = $this->request->get['filter'];
        } else {
            $filter = '';
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
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

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_catalog_limit');
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        if (isset($this->request->get['path'])) {
            $path = '';

            $parts = explode('_', (string) $this->request->get['path']);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = (int) $path_id;
                } else {
                    $path .= '_' . (int) $path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    $this->data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path),
                        'separator' => $this->language->get('text_separator')
                    );
                }
            }

            $category_id = (int) array_pop($parts);
        } else {
            $category_id = 0;

            // krumax add seo_url for filter
            if (isset($seo_data['seo_url']) && !empty($seo_data['seo_url'])) {
                $url == $seo_data['seo_url'];
            }
            // krumax add seo_url for filter END
        }

        $category_info = $this->model_catalog_category->getCategory($category_id);

        if ($category_info) {
			
			$appendH1 = (isset($this->request->get['page']) && $this->request->get['page'] > 1) ? ' - страница '.$this->request->get['page'] : '';
			$appendTitle = (isset($this->request->get['page']) && $this->request->get['page'] > 1) ? ' | Страница '.$this->request->get['page'] : '';
			$appendDescription = (isset($this->request->get['page']) && $this->request->get['page'] > 1) ? ' ➪ Страница '.$this->request->get['page'] : '';
			
            if (isset($seo_data['title']) && !empty($seo_data['title'])) {

                $this->document->setTitle($seo_data['title'].$appendTitle);

            } elseif ($category_info['seo_title'] && $page > 1) {

            $this->document->setTitle($category_info['seo_title'].' ➪ Страница: ' .$page );           

            } elseif ($category_info['seo_title']) {
                $this->document->setTitle($category_info['seo_title']);
                } else {
            $this->document->setTitle($category_info['name']);
            }

            
            if (isset($seo_data['description']) && !empty($seo_data['description'])) {
                $this->document->setDescription($seo_data['description'].$appendDescription);
            }else{
                $this->document->setDescription($category_info['meta_description']);
            }
            
            if(!isset($this->request->get['page'])) $this->document->setKeywords($category_info['meta_keyword']);

            if (isset($seo_data['h1']) && !empty($seo_data['h1'])) {
                $this->data['heading_title'] = $seo_data['h1'].$appendH1;
            }elseif ($category_info['seo_h1']) {
           
                $this->data['heading_title'] = $category_info['seo_h1'];
            } else {
                $this->data['heading_title'] = $category_info['name'];
            }
          
           
            if (isset($seo_data['seo_text']) && !empty($seo_data['seo_text'])) {
                $this->data['seo_text'] = html_entity_decode($seo_data['seo_text']);
            }
					
			$this->document->setKeywords($category_info['meta_keyword']);
			

            $this->data['text_refine'] = $this->language->get('text_refine');
            $this->data['text_empty'] = $this->language->get('text_empty');
            $this->data['text_quantity'] = $this->language->get('text_quantity');
            $this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $this->data['text_model'] = $this->language->get('text_model');
            $this->data['text_price'] = $this->language->get('text_price');
            $this->data['text_tax'] = $this->language->get('text_tax');
            $this->data['text_points'] = $this->language->get('text_points');
            $this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
            $this->data['text_display'] = $this->language->get('text_display');
            $this->data['text_list'] = $this->language->get('text_list');
            $this->data['text_grid'] = $this->language->get('text_grid');
            $this->data['text_sort'] = $this->language->get('text_sort');
            $this->data['text_limit'] = $this->language->get('text_limit');

            $this->data['button_cart'] = $this->language->get('button_cart');
            $this->data['button_wishlist'] = $this->language->get('button_wishlist');
            $this->data['button_compare'] = $this->language->get('button_compare');
            $this->data['button_continue'] = $this->language->get('button_continue');

            if ($category_info['image']) {
                $this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
            } else {
                $this->data['thumb'] = '';
            }

            $this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
            $this->data['compare'] = $this->url->link('product/compare');

            $url = '';

            # OCFilter start
            if (isset($this->request->get[$this->ocfilter['index']])) {
                $url .= '&' . $this->ocfilter['index'] . '=' . $this->request->get[$this->ocfilter['index']];
            }
            # OCFilter end

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $this->data['categories'] = array();

            $results = $this->model_catalog_category->getCategories($category_id);

            foreach ($results as $result) {
                $data = array(
                    'filter_category_id' => $result['category_id'],
                    'filter_sub_category' => true
                );

                $product_total = $this->model_catalog_product->getTotalProducts($data);

                $this->data['categories'][] = array(
                    'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
                    'pic' => $this->model_tool_image->resize($result['image'], $this->config->get('ULTIMATUMControl_cat_refine_image_size_w'), $this->config->get('ULTIMATUMControl_cat_refine_image_size_h'))
                );
            }

            $this->data['products'] = array();

            $data = array(
                'filter_category_id' => $category_id,
                # OCFilter start
                'filter_ocfilter' => $filter_ocfilter,
                # OCFilter end
                'filter_filter' => $filter,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit
            );

            $product_total = $this->model_catalog_product->getTotalProducts($data);

            $results = $this->model_catalog_product->getProducts($data);

            # OCFilter start
            $ocfilter_products_options = $this->model_catalog_ocfilter->getOCFilterProductsOptions($results);
            # OCFilter end

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    $image_big = $this->model_tool_image->resize($result['image'], ($this->config->get('config_image_product_width') * 2), ($this->config->get('config_image_product_height') * 2));
                } else {
                    $image = false;
                }

                $hoverimages = $this->model_catalog_product->getProductImages($result['product_id']);
                if ($hoverimages) {
                    $hoverimage = $this->model_tool_image->resize($hoverimages[0]['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                } else {
                    $hoverimage = false;
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float) $result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int) $result['rating'];
                } else {
                    $rating = false;
                }

                /* ------------------------------------------------------------------------
                  Countdown by Dimitar Koev
                  ------------------------------------------------------------------------- */
                $this->load->model('catalog/ULTIMATUMGraboCount');



                $specials_date = $this->model_catalog_ULTIMATUMGraboCount->getProductDiscountDates($result['product_id']);
                $specials_purchased = $this->model_catalog_ULTIMATUMGraboCount->getVouchersBought($result['product_id']);

                $this->data['quantity_start'] = $result['quantity'];
                $this->data['quantity_left'] = $result['quantity'] - $specials_purchased['quantity_purchased'];

                if ($specials_date['date_end']) {
                    list($year, $month, $day) = explode('-', $specials_date['date_end']);
                    $stringDate = $year . ', ' . $month . ' - 1, ' . $day;
                } else {
                    $stringDate = 0;
                }

                /* ------------------------------------------------------------------------

                  ------------------------------------------------------------------------- */

                $this->data['products'][] = array(
                    'product_id' => $result['product_id'],
                    # OCFilter start
                    'ocfilter_products_options' => $ocfilter_products_options[$result['product_id']],
                    # OCFilter end
                    'thumb' => $image,
                    'thumb_2' => $hoverimage,
                    'big_feature' => $image_big,
                    'startdate' => $result['date_added'],
                    'name' => $result['name'],
                    'date_end' => $stringDate,
                    'quantity' => $result['quantity'],
                    'minimum' => $result['minimum'],
                    'quantity_start' => $specials_purchased['quantity_purchased'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'rating' => $result['rating'],
                    'reviews' => sprintf($this->language->get('text_reviews'), (int) $result['reviews']),
                    'href' => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'])
                );
            }

            $url = '';

            # OCFilter start
            if (isset($this->request->get[$this->ocfilter['index']])) {
                $url .= '&' . $this->ocfilter['index'] . '=' . $this->request->get[$this->ocfilter['index']];
            }
            # OCFilter end

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $this->data['sorts'] = array();

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
                );

                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            # OCFilter start
            if (isset($this->request->get[$this->ocfilter['index']])) {
                $url .= '&' . $this->ocfilter['index'] . '=' . $this->request->get[$this->ocfilter['index']];
            }
            # OCFilter end

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $this->data['limits'] = array();

            $this->data['limits'][] = array(
                'text' => $this->config->get('config_catalog_limit'),
                'value' => $this->config->get('config_catalog_limit'),
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
            );

            $this->data['limits'][] = array(
                'text' => 25,
                'value' => 25,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=25')
            );

            $this->data['limits'][] = array(
                'text' => 50,
                'value' => 50,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=50')
            );

            $this->data['limits'][] = array(
                'text' => 75,
                'value' => 75,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=75')
            );

            $this->data['limits'][] = array(
                'text' => 100,
                'value' => 100,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=100')
            );

            $url = '';

            # OCFilter start
            if (isset($this->request->get[$this->ocfilter['index']])) {
                $url .= '&' . $this->ocfilter['index'] . '=' . $this->request->get[$this->ocfilter['index']];
            }
            # OCFilter end

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->text = $this->language->get('text_pagination');
            $pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $this->data['pagination'] = $pagination->render();

            $this->data['sort'] = $sort;
            $this->data['order'] = $order;
            $this->data['limit'] = $limit;

            $this->data['continue'] = $this->url->link('common/home');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/product/category.tpl';
            } else {
                $this->template = 'default/template/product/category.tpl';
            }

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        } else {
            $url = '';

            # OCFilter start
            if (isset($this->request->get[$this->ocfilter['index']])) {
                $url .= '&' . $this->ocfilter['index'] . '=' . $this->request->get[$this->ocfilter['index']];
            }
            # OCFilter end

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/category', $url),
                'separator' => $this->language->get('text_separator')
            );

            $this->document->setTitle($this->language->get('text_error'));

            $this->data['heading_title'] = $this->language->get('text_error');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['continue'] = $this->url->link('common/home');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
            } else {
                $this->template = 'default/template/error/not_found.tpl';
            }

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        }
    }

}

?>