package com.tody.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.common.common.CommandMap;
import com.tody.user.persistence.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	@Override
	public void register(CommandMap commandMap) throws Exception{

		userDAO.registerUser(commandMap);
		
	}

	@Override
	public boolean selectById(String id) {
		return userDAO.selectById(id);
	}
	
}
