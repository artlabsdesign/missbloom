<?php

class ModelCatalogSeodata extends Model {

    public function getSeoDataByUrl($url) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "seo_data WHERE url = '".$this->db->escape($url)."'");

        return $query->row;
    }

}
