package com.tody.user.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.tody.user.domain.CustomUserDetails;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	
	Logger log = Logger.getLogger(getClass());
	
	private String errorpage;
	private String usernamename;
	private String authorizename;
	private String errorcodename;
	private String errormsgname;
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		log.debug("referer :: "+request.getHeader("REFERER"));
		
		if(request.getHeader("REFERER")!=null) {
			if(auth!=null && accessDeniedException instanceof AccessDeniedException) {
				Object principal = auth.getPrincipal();
				
				if(principal instanceof CustomUserDetails) {
					String username = ((CustomUserDetails) principal).getUsername();
					Collection<? extends GrantedAuthority> authorize = ((CustomUserDetails) principal).getAuthorities();
					
					request.setAttribute(usernamename, username);
					request.setAttribute(authorizename, authorize);
				}
				request.setAttribute(errorcodename, 403);
				
			} else {
				
				request.setAttribute(errormsgname, accessDeniedException.getMessage());
				request.setAttribute(errorcodename, 500);
			}

			request.getRequestDispatcher(errorpage).forward(request, response);
		} else {
			response.sendRedirect("redirect:/");
		}
		
	}

	public String getErrorpage() {
		return errorpage;
	}

	public void setErrorpage(String errorpage) {
		this.errorpage = errorpage;
	}

	public String getUsernamename() {
		return usernamename;
	}

	public void setUsernamename(String usernamename) {
		this.usernamename = usernamename;
	}

	public String getAuthorizename() {
		return authorizename;
	}

	public void setAuthorizename(String authorizename) {
		this.authorizename = authorizename;
	}

	public String getErrorcodename() {
		return errorcodename;
	}

	public void setErrorcodename(String errorcodename) {
		this.errorcodename = errorcodename;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

}
