package com.tody.user.handler;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

import com.tody.user.service.UserService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="userService")
	private UserService userService;
	
	private String defaultUrl;
	private String usernamename;
	private String redirectUrl;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String username = request.getParameter(usernamename);
		
		userService.resetFailureCount(username);
		userService.updateLoginRecord(username);
		
		clearAuthenticationException(request);
		
		sendRedirectStrategy(request, response);

	}
	
	protected void clearAuthenticationException(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	protected void sendRedirectStrategy(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest!=null) {
			
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
			
		} else {
			
			String loginRedirectUrl = request.getParameter(redirectUrl);
			
			if(StringUtils.hasText(loginRedirectUrl)) {
				redirectStrategy.sendRedirect(request, response, loginRedirectUrl);
				
			} else {
				redirectStrategy.sendRedirect(request, response, defaultUrl);
				
			}
		}
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public String getUsernamename() {
		return usernamename;
	}

	public void setUsernamename(String usernamename) {
		this.usernamename = usernamename;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

}
