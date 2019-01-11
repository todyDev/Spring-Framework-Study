package com.tody.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tody.common.common.CommandMap;
import com.tody.common.service.CommonService;

@Controller
@RequestMapping(value="/common")
public class CommonController {
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception {

		Map<String, Object> file = commonService.selectFile(commandMap.getMap());
		
		String saveFileName = (String) file.get("SAVE_FILE_NAME");
		String orgFileName = (String) file.get("ORG_FILE_NAME");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(uploadPath+saveFileName));
		
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orgFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
		
	}

}
