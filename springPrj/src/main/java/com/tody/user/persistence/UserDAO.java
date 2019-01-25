package com.tody.user.persistence;

import org.springframework.stereotype.Repository;

import com.tody.common.common.CommandMap;
import com.tody.common.dao.AbstractDAO;
import com.tody.user.domain.CustomUserDetails;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{

	public boolean selectByEmail(String email) {
		return (Boolean) selectOne("user.selectByEmail", email);
	}

	public boolean selectById(String id) {
		return (Boolean) selectOne("user.selectById", id);
	}

	public void registerUser(CommandMap commandMap) {
		insert("user.registerUser", commandMap.getMap());
	}

	public CustomUserDetails getUserById(String username) {
		return (CustomUserDetails) selectOne("secu.selectUserById", username);
	}

	public void registerAuth(CommandMap commandMap) {
		insert("user.registerAuth", commandMap.getMap());
	}

}
