package com.tody.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping(value="/board/boardList")
	public String boardList() throws Exception {
		return "/board/boardList";
	}
	
	@RequestMapping(value="/board/boardWrite")
	public String boardWrite() throws Exception {
		return "/board/boardWrite";
	}
	
	@RequestMapping(value="/board/boardDetail")
	public String boardDetail() throws Exception {
		return "/board/boardDetail";
	}
	
	@RequestMapping(value="/board/boardModify")
	public String boardModify() throws Exception {
		return "/board/boardModify";
	}
	
}
