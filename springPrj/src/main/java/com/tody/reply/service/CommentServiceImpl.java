package com.tody.reply.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.reply.persistence.CommentDAO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;

	@Override
	public List<Map<String,Object>> list(int articleNo) {
		return (List<Map<String, Object>>) commentDAO.selectByArticleno(articleNo);
	}

}
