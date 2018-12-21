package com.tody.user.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tody.user.domain.RegisterRequest;
import com.tody.user.exception.AlreadyExistingEmailException;
import com.tody.user.exception.AlreadyExistingIdException;
import com.tody.user.service.UserService;

@Controller
@RequestMapping(value="/join")
public class JoinController {
	
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
	public ModelAndView joinSignupGET() throws Exception {
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

		try {
			userSer.register(regReq);
		} catch (AlreadyExistingIdException e ) {
			errors.rejectValue("ID", "duplicate.id");
			return "/join/signup";
		} catch (AlreadyExistingEmailException e ) {
			errors.rejectValue("EMAIL", "duplicate.email");
			return "/join/signup";
		}

		return "redirect:/";
	}

}
