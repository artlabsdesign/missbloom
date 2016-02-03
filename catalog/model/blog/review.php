<?php
class ModelBlogReview extends Model {		
	public function addReview($post_id, $data) {
		$sql = "INSERT INTO " . DB_PREFIX . "blog_review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', post_id = '" . (int)$post_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()";
		
		if (!$this->config->get('blog_comment_require_approve')) {
			$sql .= ", status = 1";
		}
		
		$this->db->query($sql);
	}
		
	public function getReviewsByPostId($post_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.post_id, pd.name, p.image, r.date_added FROM " . DB_PREFIX . "blog_review r LEFT JOIN " . DB_PREFIX . "blog_post p ON (r.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) WHERE p.post_id = '" . (int)$post_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}
	
	public function getAverageRating($post_id) {
		$query = $this->db->query("SELECT AVG(rating) AS total FROM " . DB_PREFIX . "blog_review WHERE status = '1' AND post_id = '" . (int)$post_id . "' GROUP BY post_id");
		
		if (isset($query->row['total'])) {
			return (int)$query->row['total'];
		} else {
			return 0;
		}
	}	
	
	public function getTotalReviews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_review r LEFT JOIN " . DB_PREFIX . "blog_post p ON (r.post_id = p.post_id) WHERE p.date_available <= NOW() AND p.status = '1' AND r.status = '1'");
		
		return $query->row['total'];
	}

	public function getTotalReviewsByPostId($post_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_review r LEFT JOIN " . DB_PREFIX . "blog_post p ON (r.post_id = p.post_id) LEFT JOIN " . DB_PREFIX . "blog_post_description pd ON (p.post_id = pd.post_id) WHERE p.post_id = '" . (int)$post_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}
}
?>