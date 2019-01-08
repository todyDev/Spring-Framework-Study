package com.tody.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.common.dao.CommonDAO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	@Override
	public Map<String, Object> selectFile(Map<String, Object> map) {
		return commonDAO.selectFileInfo(map);
	}

}
