package com.tody.upload.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;
import com.tody.common.util.FileUtils;
import com.tody.upload.persistence.UploadDAO;

@Service("uploadService")
public class UploadServiceImpl implements UploadService {
	
	@Resource(name="uploadDAO")
	public UploadDAO uploadDAO;
	
	@Resource(name="fileUtils")
	public FileUtils fileUtils;
	
    @Override
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return uploadDAO.selectBoardList(cri);
    }

	@Override
	public void insertBoard(CommandMap commandMap, MultipartFile[] file) throws Exception {
		uploadDAO.insertBoard(commandMap);
		
		List<Map<String, Object>> list = fileUtils.parseFileInfo(commandMap.getMap(), file);
		for(int i=0; i<list.size(); i++) {
			uploadDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
		uploadDAO.updateHitBoard(map);
        Map<String, Object> detail = uploadDAO.detailBoard(map);
        List<Map<String, Object>> list = uploadDAO.detailFile(map);
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("detail", detail);
        resultMap.put("list", list);
        
		return resultMap;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		
        Map<String, Object> detail = uploadDAO.detailBoard(map);
        List<Map<String, Object>> list = uploadDAO.detailFile(map);
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("detail", detail);
        resultMap.put("list", list);
        
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, MultipartFile[] file) throws Exception {
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
