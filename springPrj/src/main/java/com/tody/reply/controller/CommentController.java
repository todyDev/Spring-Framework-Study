package com.tody.reply.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.MoreMaker;
import com.tody.reply.service.CommentService;

@RestController
@RequestMapping(value="/comment")
public class CommentController {
	
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(MoreMaker moreMaker) {
		
        moreMaker.setPageTotal(commentService.countCommentTotal(moreMaker.getArticleNo()));
		
		List<Map<String,Object>> list = commentService.list(moreMaker);
		
		ModelAndView mv = new ModelAndView("reply/replyList");
		mv.addObject("list", list);
		mv.addObject("moreMaker", moreMaker);
		
		return mv;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void register(CommandMap commandMap) {
		
		commentService.register(commandMap.getMap());
		
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public void edit(CommandMap commandMap) {
		commentService.edit(commandMap.getMap());
	}	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(CommandMap commandMap) {
		commentService.delete(commandMap.getMap());
	}

}
