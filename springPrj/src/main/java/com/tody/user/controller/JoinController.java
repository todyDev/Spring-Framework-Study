package com.tody.user.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tody.common.common.CommandMap;
import com.tody.user.service.UserService;

@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="userService")
	private UserService userSer;
	
	@RequestMapping(value="/terms")
	public String joinTerms() throws Exception {
		return "/join/terms";
	}
	
	@RequestMapping(value="/terms", method=RequestMethod.POST)
	public String joinTermsPOST() throws Exception {
		return "redirect:/join/signup";
	}
	
	@RequestMapping(value="/signup")
	public String joinSignupGET() throws Exception {
		return "/join/signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String joinSignupPOST(CommandMap commandMap) throws Exception {

		log.debug(commandMap.getMap());
		
		return "redirect:/";
	}

}
