<?php

class ModelCatalogSeodata extends Model {

    public function addSeodata($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "seo_data SET url = '" . $this->db->escape($data['url']) . "', h1 = '" . $this->db->escape($data['h1']) . "', title = '" . $this->db->escape($data['title']) . "', description = '" . $this->db->escape($data['description']) . "', seo_text = '" . $this->db->escape($data['seo_text']) . "'");

        $this->cache->delete('seo_data');
    }

    public function editSeodata($seo_data_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "seo_data SET url = '" . $this->db->escape($data['url']) . "', h1 = '" . $this->db->escape($data['h1']) . "', title = '" . $this->db->escape($data['title']) . "', description = '" . $this->db->escape($data['description']) . "', seo_text = '" . $this->db->escape($data['seo_text']) . "' WHERE seo_data_id = '" . (int) $seo_data_id . "'");

        $this->cache->delete('seo_data');
    }

    public function deleteSeodata($seo_data_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "seo_data WHERE seo_data_id = '" . (int) $seo_data_id . "'");

        $this->cache->delete('seo_data');
    }

    public function getSeodata($seo_data_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "seo_data WHERE seo_data_id = '" . (int) $seo_data_id . "'");

        return $query->row;
    }

    public function getSeodatas($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "seo_data s ";

            $sort_data = array(
                's.h1',
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY s.h1";
            }

            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC";
            } else {
                $sql .= " ASC";
            }

            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }

                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }

                $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
            }

            $query = $this->db->query($sql);

            return $query->rows;
        } else {
            $seo_data_data = $this->cache->get('seo_data');

            if (!$seo_data_data) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_data s ORDER BY s.h1");

                $seo_data_data = $query->rows;

                $this->cache->set('seo_data', $seo_data_data);
            }

            return $seo_data_data;
        }
    }

    public function getTotalSeodatas() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "seo_data");

        return $query->row['total'];
    }

}
