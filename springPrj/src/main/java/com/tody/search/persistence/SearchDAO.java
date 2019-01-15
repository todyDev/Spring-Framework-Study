package com.tody.search.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.common.CommandMap;
import com.tody.common.dao.AbstractDAO;
import com.tody.common.domain.Criteria;

@Repository("searchDAO")
public class SearchDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return (List<Map<String,Object>>)selectList("search.selectBoardList", cri);
	}

	public void insertBoard(CommandMap commandMap) {
		insert("search.insertBoard", commandMap.getMap());
	}

	public void updateHitBoard(Map<String, Object> map) {
		update("search.updateHitBoard", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("search.detailBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("search.updateBoard",map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("search.deleteBoard", map);
	}
	
	public int countBoardList(){
		return (Integer) selectOne("search.countBoardList");
	}

}
