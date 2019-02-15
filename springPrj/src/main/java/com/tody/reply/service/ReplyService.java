package com.tody.reply.service;

import java.util.List;
import java.util.Map;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.SearchCriteria;

public interface ReplyService {
	
	List<Map<String, Object>> selectBoardList(SearchCriteria cri);

	void insertBoard(CommandMap commandMap);

	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	Map<String, Object> selectBoardDetail(Map<String, Object> map);

	void updateBoard(Map<String, Object> map);

	void deleteBoard(Map<String, Object> map);

	int countBoardListTotal(SearchCriteria cri);

}
