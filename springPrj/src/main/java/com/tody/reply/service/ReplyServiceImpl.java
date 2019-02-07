package com.tody.reply.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.SearchCriteria;
import com.tody.reply.persistence.ReplyDAO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Resource(name="replyDAO")
	private ReplyDAO replyDAO;
	
    @Override
    public List<Map<String, Object>> selectBoardList(SearchCriteria cri) {
        return replyDAO.selectBoardList(cri);
    }

	@Override
	public void insertBoard(CommandMap commandMap) {
		replyDAO.insertBoard(commandMap);
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
		replyDAO.updateHitBoard(map);
        Map<String, Object> detail = replyDAO.detailBoard(map);
		return detail;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return replyDAO.detailBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		replyDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		replyDAO.deleteBoard(map);
	}

	@Override
	public int countBoardListTotal(SearchCriteria cri) {
		return replyDAO.countBoardList(cri);
	}

}
