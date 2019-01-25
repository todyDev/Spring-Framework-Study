package com.tody.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tody.common.domain.Criteria;
import com.tody.common.domain.PageMaker;
import com.tody.user.service.UserService;

@Controller
@RequestMapping(value="/admin")
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/userlist")
	public String list(Model model, Criteria cri) throws Exception {
		
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(userService.countUserlistTotal());
		
		List<Map<Object, String>> list = userService.selectAllUser();
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/admin/userlist";
	}

}
