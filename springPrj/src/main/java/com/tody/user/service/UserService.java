package com.tody.user.service;

import com.tody.common.common.CommandMap;

public interface UserService {

	void register(CommandMap commandMap) throws Exception;

	boolean selectById(String id);

	boolean selectByEmail(String email);
	
}
