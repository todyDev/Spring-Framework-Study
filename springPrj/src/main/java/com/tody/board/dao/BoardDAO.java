package com.tody.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.common.CommandMap;
import com.tody.common.dao.AbstractDAO;
import com.tody.common.domain.Criteria;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return (List<Map<String,Object>>)selectList("board.selectBoardList", cri);
	}

	public void insertBoard(CommandMap commandMap) {
		insert("board.insertBoard", commandMap.getMap());
	}

	public void updateHitBoard(Map<String, Object> map) {
		update("board.updateHitBoard", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.detailBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("board.updateBoard",map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("board.deleteBoard", map);
	}
	
	public int countBoardList(){
		return (Integer) selectOne("board.countBoardList");
	}

}
