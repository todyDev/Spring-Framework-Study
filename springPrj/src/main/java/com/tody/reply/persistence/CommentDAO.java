package com.tody.reply.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.dao.AbstractDAO;
import com.tody.common.domain.MoreMaker;

@Repository(value="commentDAO")
public class CommentDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectByArticleno(MoreMaker cri) {
		return selectList("comment.replyList", cri);
	}

	public void insertByComments(Map<String, Object> map) {
		insert("comment.registerComment", map);
	}

	public void insertByReComments(Map<String, Object> map) {
		insert("comment.registerReComment", map);
	}

	public void updateByComments(Map<String, Object> map) {
		update("comment.editComment", map);
	}

	public void deleteByComments(Map<String, Object> map) {
		delete("comment.deleteComment", map);
	}

	public int countCommentTotal(int articleNo) {
		return (Integer) selectOne("comment.totalComment", articleNo);
	}

}
