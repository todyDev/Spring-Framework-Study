package com.tody.upload.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;
import com.tody.upload.persistence.UploadDAO;

@Service("uploadService")
public class UploadServiceImpl implements UploadService {
	
	@Resource(name="uploadDAO")
	public UploadDAO uploadDAO;
	
    @Override
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return uploadDAO.selectBoardList(cri);
    }

	@Override
	public void insertBoard(CommandMap commandMap) {
		uploadDAO.insertBoard(commandMap);
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
		uploadDAO.updateHitBoard(map);
        Map<String, Object> detail = uploadDAO.detailBoard(map);
		return detail;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return uploadDAO.detailBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		uploadDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		uploadDAO.deleteBoard(map);
	}

	@Override
	public int countBoardListTotal() {
		return uploadDAO.countBoardList();
	}

}
