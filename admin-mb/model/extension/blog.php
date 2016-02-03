<?php
class ModelExtensionBlog extends Model {
	public function addPost($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog SET subject = '" . $data['subject'] . "', 
		content = '" . $data['content'] . "', author_id = '" . $data['author_id'] . "', 
		status = '" . $data['status'] . "', date_modified = NOW(), date_posted = NOW()");
	}
	
	public function editPost($post_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog SET subject = '" . $data['subject'] . "', 
		content = '" . $data['content'] . "', status = '" . $data['status'] . "', 
		date_modified = NOW() WHERE post_id = '$post_id'");	
	}
	
	public function deleteCategories($selected) {
		$selected_str='';
		foreach ($selected as $post_id) {
			$selected_str .= "'$post_id',";
		}
		$selected_str = substr($selected_str, 0, -1);
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog WHERE post_id IN (" . $selected_str . ")");
	}

	public function getPost($post_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog WHERE post_id = '".$post_id."'");
		 
		return $query->row;
	} 
	
	public function getPosts() {

		$post_data = array();
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog ORDER BY date_posted DESC");
	
		foreach ($query->rows as $result) {
			$post_data[] = array(
				'post_id' => $result['post_id'],
				'subject' => $result['subject'],
				'status' => $result['status'],
				'date_posted' => $result['date_posted']
			);
		}	
		
		return $post_data;
	}
	public function getAuthor($user_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id  = '".$user_id."'");
		return $query->row['username'];
	} 


}
?>