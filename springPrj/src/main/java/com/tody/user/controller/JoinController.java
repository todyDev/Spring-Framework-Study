package com.tody.user.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tody.common.common.CommandMap;
import com.tody.user.service.UserService;

@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="userService")
	private UserService userSer;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
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
		
		commandMap.put("pw", passwordEncoder.encode((String)commandMap.getMap().get("pw")));
		
		userSer.register(commandMap);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/chkidinfo", method=RequestMethod.POST)
	@ResponseBody
	public boolean chkidinfo(@RequestBody String id) throws Exception {
		return userSer.selectById(id);
	}
	
	@RequestMapping(value="/chkemailinfo", method=RequestMethod.POST)
	@ResponseBody
	public boolean chkemailinfo(@RequestBody String email) throws Exception {
		return userSer.selectByEmail(email);
	}
	
}
