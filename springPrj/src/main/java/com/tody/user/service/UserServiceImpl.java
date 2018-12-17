package com.tody.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tody.user.domain.RegisterRequest;
import com.tody.user.persistence.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	@Override
	public void register(RegisterRequest regReq) throws Exception{
		
		boolean chkEmail = userDAO.selectByEmail(regReq.getEMAIL());
		
		boolean chkId = userDAO.selectById(regReq.getID());
		
	}

}
