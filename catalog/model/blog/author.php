<?php
class ModelBlogAuthor extends Model {
	
	public function getPostAuthor($author_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$author_id . "' LIMIT 0,1";
		$query = $this->db->query($sql);
		
		if ($query->num_rows){
			return $this->getAuthorNameRelatedToPostedBy($query->row);
		}
		
		return '';
	}
	
	public function getAuthorNameRelatedToPostedBy($user_info){
		
		$posted_by = $user_info['firstname'] . ' ' . $user_info['lastname'];
		
		if ($this->config->get('blog_posted_by') == 'firstname lastname'){
			$posted_by = $user_info['firstname'] . ' ' . $user_info['lastname'];
		} elseif ($this->config->get('blog_posted_by') == 'lastname firstname') {
			$posted_by = $user_info['lastname'] . ' ' . $user_info['firstname'];
		} elseif ($this->config->get('blog_posted_by') == 'username'){
			$posted_by = $user_info['username'];
		} 
		
		return $posted_by;
	}
	
	public function getTotalPostsByAuthorId($author_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_post WHERE author_id = '" . (int)$author_id . "' AND status=1");

		return $query->row['total'];
	}
}
?>