package com.tody.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/accounts")
public class AccountsController {
	
	@RequestMapping(value="/loginform")
	public String loginform() throws Exception {
		return "/accounts/loginform";
	}
	
	@RequestMapping(value="/access_denied")
	public String accessDenied() throws Exception {
		return "/accounts/access_denied";
	}

}
