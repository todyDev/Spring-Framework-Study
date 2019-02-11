package com.tody.reply.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tody.common.common.CommandMap;
import com.tody.reply.service.CommentService;

@RestController
@RequestMapping(value="/comment")
public class CommentController {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public List<Map<String,Object>> list(@RequestParam int articleNo) {
		
		List<Map<String,Object>> list = commentService.list(articleNo);
		
		return list;
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void register(CommandMap commandMap) {
		
		commentService.register(commandMap.getMap());
		
	}

}
