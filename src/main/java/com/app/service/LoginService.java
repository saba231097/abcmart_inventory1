package com.app.service;

import com.app.dao.UserDAO;

public class LoginService {
	public boolean authenticateUser(String email,String secrets) {
		UserDAO user=new UserDAO();
		return user.authenticateUser(email, secrets);
	}

}
