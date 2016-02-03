<?php
class ModelModuleBlog extends Model {
	
	public function getPosts() {

		$post_data = array();
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog b,  " . DB_PREFIX . "user u WHERE b.author_id = u.user_id AND b.status = 'published' ORDER BY date_posted DESC");
	
		foreach ($query->rows as $result) {
			$post_data[] = array(
				'post_id' => $result['post_id'],
				'subject' => $result['subject'],
				'content' => htmlspecialchars_decode($result['content']),
				'status' => $result['status'],
				'date_posted' => date('F j, Y, g:i a', strtotime($result['date_posted'])),
				'author' => $result['firstname']
			);
		}	
		
		return $post_data;
	}
}
?>