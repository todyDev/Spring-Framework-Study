package com.tody.user.persistence;

import org.springframework.stereotype.Repository;

import com.tody.common.dao.AbstractDAO;
import com.tody.user.domain.RegisterRequest;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{

	public boolean selectByEmail(String email) {
		return (Boolean) selectOne("user.selectByEmail", email);
	}

	public boolean selectById(String id) {
		return (Boolean) selectOne("user.selectById", id);
	}

	public void registerUser(RegisterRequest regReq) {
		insert("user.register", regReq);
	}

}
