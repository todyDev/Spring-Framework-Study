package com.tody.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	@RequestMapping(value="/terms")
	public String joinTerms() throws Exception {
		return "/join/terms";
	}
	
	@RequestMapping(value="/terms", method=RequestMethod.POST)
	public String joinTermsPOST() throws Exception {
		return "/join/signup";
	}

}
