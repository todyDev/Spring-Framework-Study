package com.tody.user.handler;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

import com.tody.common.util.MessageUtils;
import com.tody.user.service.UserService;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	@Resource(name="userService")
	private UserService userService;
	
	private String usernamename;
	private String passwordname;
	private String errormsgname;
	private String defaultFailureUrl;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String username = request.getParameter(usernamename);
		String password = request.getParameter(passwordname);
		String errormsg = null;
		
		if(exception instanceof BadCredentialsException) {
			countLoginFailure(username);
			errormsg = MessageUtils.getMessage("loginError.BadCredentials");
		} else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = MessageUtils.getMessage("loginError.BadCredentials");
		} else if(exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("loginError.Disaled");
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("loginError.CredentialsExpired");
		} else if(exception instanceof SessionAuthenticationException) {
			errormsg = MessageUtils.getMessage("loginError.SessionAuthentication");
		}
		
		request.setAttribute(usernamename, username);
		request.setAttribute(passwordname, password);
		request.setAttribute(errormsgname, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);

	}

	protected void countLoginFailure(String username) {
		userService.countFailure(username);
		int cnt = userService.checkFailureCount(username);
		if(cnt==3) {
			userService.disabledUser(username);
		}
	}

	public String getUsernamename() {
		return usernamename;
	}

	public void setUsernamename(String usernamename) {
		this.usernamename = usernamename;
	}

	public String getPasswordname() {
		return passwordname;
	}

	public void setPasswordname(String passwordname) {
		this.passwordname = passwordname;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
