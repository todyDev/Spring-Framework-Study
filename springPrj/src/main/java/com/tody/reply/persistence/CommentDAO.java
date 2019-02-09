package com.tody.reply.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.dao.AbstractDAO;

@Repository(value="commentDAO")
public class CommentDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectByArticleno(int articleNo) {
		return selectList("comment.replyList", articleNo);
	}

}
