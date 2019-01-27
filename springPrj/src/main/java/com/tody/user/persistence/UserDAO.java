package com.tody.user.persistence;

import java.util.List;
import java.util.Map;

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

	@SuppressWarnings("unchecked")
	public List<Map<Object, String>> selectAllUser() {
		return selectList("user.selectAll");
	}

	public int countUserlistTotal() {
		return (Integer) selectOne("user.countUserlist");
	}

	public void updateCountFailure(String username) {
		update("user.updateFailureCount", username);
	}

	public int checkFailureCount(String username) {
		return (Integer) selectOne("user.countFailure", username);
	}

	public void updateDisabledUsername(String username) {
		update("user.updateDisabled", username);
	}

	public void updateResetFailureCount(String username) {
		update("user.updateResetFailureCount", username);
	}

	public void updateLoginCount(String username) {
		update("user.updateLoginCount", username);
	}

	public void updateAccDate(String username) {
		update("user.updateAccDate", username);
	}

}
