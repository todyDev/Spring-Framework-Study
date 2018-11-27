package com.tody.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.board.dao.BoardDAO;
import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
 
    @Override
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return boardDAO.selectBoardList(cri);
    }

	@Override
	public void insertBoard(CommandMap commandMap) {
		boardDAO.insertBoard(commandMap);
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
        boardDAO.updateHitBoard(map);
        Map<String, Object> detail = boardDAO.detailBoard(map);
		return detail;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return boardDAO.detailBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		boardDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		boardDAO.deleteBoard(map);
	}

}
