package com.tody.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tody.user.domain.RegisterRequest;

@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	@RequestMapping(value="/terms")
	public String joinTerms() throws Exception {
		return "/join/terms";
	}
	
	@RequestMapping(value="/terms", method=RequestMethod.POST)
	public ModelAndView joinTermsPOST() throws Exception {
		ModelAndView mv = new ModelAndView("/join/signup");
		mv.addObject("registerRequest", new RegisterRequest());
		return mv;
	}

}
