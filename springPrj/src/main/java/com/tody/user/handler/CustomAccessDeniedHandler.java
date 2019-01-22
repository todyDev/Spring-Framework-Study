package com.tody.user.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.tody.user.domain.CustomUserDetails;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	
	private String errorpage;
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		
		if(principal instanceof CustomUserDetails) {
			String username = ((CustomUserDetails) principal).getUsername();
			Collection<? extends GrantedAuthority> authenti = ((CustomUserDetails) principal).getAuthorities();
			
			request.setAttribute("username", username);
			request.setAttribute("auth", authenti);
		}
		
		request.getRequestDispatcher(errorpage).forward(request, response);
		
	}

	public String getErrorpage() {
		return errorpage;
	}

	public void setErrorpage(String errorpage) {
		this.errorpage = errorpage;
	}

}
