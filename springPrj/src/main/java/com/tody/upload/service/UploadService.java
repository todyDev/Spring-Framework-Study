package com.tody.upload.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;

public interface UploadService {

	int countBoardListTotal();

	List<Map<String, Object>> selectBoardList(Criteria cri);

	void insertBoard(CommandMap commandMap, MultipartFile[] file) throws Exception;

	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	Map<String, Object> selectBoardDetail(Map<String, Object> map);

	void updateBoard(Map<String, Object> map);

	void deleteBoard(Map<String, Object> map);

}
