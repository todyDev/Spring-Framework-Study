package com.tody.reply.service;

import java.util.List;
import java.util.Map;

public interface CommentService {

	List<Map<String, Object>> list(int articleNo);

	void register(Map<String, Object> map);

}
