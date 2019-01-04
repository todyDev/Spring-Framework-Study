package com.tody.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileUtils")
public class FileUtils {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="uploadPath")
	String uploadPath;

	public List<Map<String, Object>> parseFileInfo(Map<String, Object> map, MultipartFile file) throws Exception {
		
		log.debug("================== file start ==================");
		log.debug("파일 이름: "+file.getName());
		log.debug("파일 실제 이름: "+file.getOriginalFilename());
		log.debug("파일 크기: "+file.getSize());
		log.debug("content type: "+file.getContentType());
		log.debug("파일 존재 유무: "+file.isEmpty());
		log.debug("파일 데이터: file.getBytes()");
		log.debug("inputStream: file.getInputStream()");
		log.debug("transferTO: 업로드한 파일 데이터를 지정한 폴더에 저장");
		log.debug("================== file   END ==================");
		
		String orgFileName = file.getOriginalFilename();
		String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
		String saveFileName = CommonUtils.getRandomString() + orgFileExtension;
		
		String boardIDX = (String) map.get("IDX");
		String creaID = (String) map.get("CREA_ID");

		File target = new File(uploadPath);
		if(!target.exists()) target.mkdirs();
		
		target = new File(uploadPath, saveFileName);
		file.transferTo(target);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		listMap.put("BOARD_IDX", boardIDX);
		listMap.put("ORG_FILE_NAME", orgFileName);
		listMap.put("STORED_FILE_NAME", saveFileName);
		listMap.put("FILE_SIZE", file.getSize());
		listMap.put("CREA_ID", creaID);
		list.add(listMap);

		return list;
		
	}

}
