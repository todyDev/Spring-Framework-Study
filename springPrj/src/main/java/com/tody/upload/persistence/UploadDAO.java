package com.tody.upload.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tody.common.common.CommandMap;
import com.tody.common.dao.AbstractDAO;
import com.tody.common.domain.Criteria;

@Repository("uploadDAO")
public class UploadDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return (List<Map<String,Object>>)selectList("upload.selectBoardList", cri);
	}

	public void insertBoard(CommandMap commandMap) {
		insert("upload.insertBoard", commandMap.getMap());
	}

	public void updateHitBoard(Map<String, Object> map) {
		update("upload.updateHitBoard", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("upload.detailBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("upload.updateBoard",map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("upload.deleteBoard", map);
	}
	
	public int countBoardList(){
		return (Integer) selectOne("upload.countBoardList");
	}

	public void insertFile(Map<String, Object> map) {
		insert("upload.insertFile", map);
	}

}
