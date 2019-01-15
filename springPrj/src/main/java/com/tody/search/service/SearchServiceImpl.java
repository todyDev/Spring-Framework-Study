package com.tody.search.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.SearchCriteria;
import com.tody.search.persistence.SearchDAO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Resource(name="searchDAO")
	private SearchDAO searchDAO;
	
    @Override
    public List<Map<String, Object>> selectBoardList(SearchCriteria cri) {
        return searchDAO.selectBoardList(cri);
    }

	@Override
	public void insertBoard(CommandMap commandMap) {
		searchDAO.insertBoard(commandMap);
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
		searchDAO.updateHitBoard(map);
        Map<String, Object> detail = searchDAO.detailBoard(map);
		return detail;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return searchDAO.detailBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		searchDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		searchDAO.deleteBoard(map);
	}

	@Override
	public int countBoardListTotal() {
		return searchDAO.countBoardList();
	}

}
