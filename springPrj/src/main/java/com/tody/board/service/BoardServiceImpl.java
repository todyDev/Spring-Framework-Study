package com.tody.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.board.dao.BoardDAO;
import com.tody.common.common.CommandMap;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
 
    @Override
    public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
        return boardDAO.selectBoardList(commandMap);
    }

	@Override
	public void insertBoard(CommandMap commandMap) {
		boardDAO.insertBoard(commandMap);
	}

}
