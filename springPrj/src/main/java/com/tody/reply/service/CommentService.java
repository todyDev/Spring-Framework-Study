package com.tody.reply.service;

import java.util.List;
import java.util.Map;

import com.tody.common.domain.MoreMaker;

public interface CommentService {

	List<Map<String, Object>> list(MoreMaker moreMaker);

	void register(Map<String, Object> map);

	void registerRe(Map<String, Object> map);

	void edit(Map<String, Object> map);

	void delete(Map<String, Object> map);

	int countCommentTotal(int articleNo);

}
