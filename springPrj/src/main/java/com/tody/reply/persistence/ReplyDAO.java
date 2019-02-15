package com.tody.reply.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.common.CommandMap;
import com.tody.common.dao.AbstractDAO;
import com.tody.common.domain.SearchCriteria;

@Repository("replyDAO")
public class ReplyDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(SearchCriteria cri) {
		return (List<Map<String,Object>>)selectList("reply.selectBoardList", cri);
	}

	public void insertBoard(CommandMap commandMap) {
		insert("reply.insertBoard", commandMap.getMap());
	}

	public void updateHitBoard(Map<String, Object> map) {
		update("reply.updateHitBoard", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("reply.detailBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("reply.updateBoard",map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("reply.deleteBoard", map);
	}
	
	public int countBoardList(SearchCriteria cri){
		return (Integer) selectOne("reply.countBoardList", cri);
	}

}
