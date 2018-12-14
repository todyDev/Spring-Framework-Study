package com.tody.user.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
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
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String joinSignupPOST(@Valid RegisterRequest regReq, Errors errors) throws Exception {
		
		if(errors.hasErrors()) {
			
			//비밀번호 확인
			boolean chk = regReq.isPwEqualToCheckPw();
			if(chk) {
				errors.reject("checkPassword.notMatch");
			}
			
			return "/join/signup";
		}

		return "redirect:/";
	}

}
