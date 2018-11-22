package com.tody.board.service;

import java.util.List;
import java.util.Map;

import com.tody.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(CommandMap commandMap);

	void insertBoard(CommandMap commandMap);

	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	Map<String, Object> selectBoardDetail(Map<String, Object> map);

	void updateBoard(Map<String, Object> map);

	void deleteBoard(Map<String, Object> map);

}
