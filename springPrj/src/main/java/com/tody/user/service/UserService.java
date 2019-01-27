package com.tody.user.service;

import java.util.List;
import java.util.Map;

import com.tody.common.common.CommandMap;

public interface UserService {

	void register(CommandMap commandMap) throws Exception;

	boolean selectById(String id);

	boolean selectByEmail(String email);

	List<Map<Object, String>> selectAllUser();

	int countUserlistTotal();

	void countFailure(String username);

	int checkFailureCount(String username);

	void disabledUser(String username);

	void resetFailureCount(String username);

	void updateLoginRecord(String username);
	
}
