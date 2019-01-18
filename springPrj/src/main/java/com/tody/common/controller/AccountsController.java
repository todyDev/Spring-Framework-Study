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

}
