package com.tody.user.service;

import java.util.List;
import java.util.Map;

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
		userDAO.registerAuth(commandMap);
	}

	@Override
	public boolean selectById(String id) {
		return userDAO.selectById(id);
	}
	
	@Override
	public boolean selectByEmail(String email) {
		return userDAO.selectByEmail(email);
	}

	@Override
	public List<Map<Object, String>> selectAllUser() {
		return userDAO.selectAllUser();
	}

	@Override
	public int countUserlistTotal() {
		return userDAO.countUserlistTotal();
	}

	@Override
	public void countFailure(String username) {
		userDAO.updateCountFailure(username);
	}

	@Override
	public int checkFailureCount(String username) {
		return userDAO.checkFailureCount(username);
	}

	@Override
	public void disabledUser(String username) {
		userDAO.updateDisabledUsername(username);
	}
	
}
