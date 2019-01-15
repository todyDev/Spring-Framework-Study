package com.tody.search.service;

import java.util.List;
import java.util.Map;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;

public interface SearchService {
	
	List<Map<String, Object>> selectBoardList(Criteria cri);

	void insertBoard(CommandMap commandMap);

	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	Map<String, Object> selectBoardDetail(Map<String, Object> map);

	void updateBoard(Map<String, Object> map);

	void deleteBoard(Map<String, Object> map);

	int countBoardListTotal();

}
