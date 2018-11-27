package com.tody.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tody.board.service.BoardService;
import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;

@Controller
public class BoardController {
	
	Logger log = Logger.getLogger(getClass());
	
    @Resource(name="boardService")
    private BoardService boardServcie;
    
    @RequestMapping(value="/board/boardList")
    public ModelAndView openBoardList(Criteria cri) throws Exception {
        
        ModelAndView mav = new ModelAndView("/board/boardList");
        
        List<Map<String,Object>> list = boardServcie.selectBoardList(cri);
        mav.addObject("list", list);
        
        return mav;
        
    }
    
    @RequestMapping(value="/board/boardWrite")
    public String boardWrite() throws Exception {
        return "/board/boardWrite";
    }
    
    @RequestMapping(value="/board/boardWrite", method=RequestMethod.POST)
    public String boardWritePOST(CommandMap commandMap) throws Exception {
    	boardServcie.insertBoard(commandMap);
        return "redirect:/board/boardList";
    }
    
    @RequestMapping(value="/board/boardDetail")
    public ModelAndView boardDetail(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        Map<String, Object> detail = boardServcie.viewBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        
        return mv;
    }
    
    @RequestMapping(value="/board/boardModify")
    public ModelAndView boardModify(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/board/boardModify");
        Map<String, Object> detail = boardServcie.selectBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        return mv;
    }
    
    @RequestMapping(value="/board/boardModify", method=RequestMethod.POST)
    public ModelAndView boardModifyPOST(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/board/boardDetail");
        mv.addObject("IDX", commandMap.get("IDX"));
        boardServcie.updateBoard(commandMap.getMap());
        return mv;
    }
    
    @RequestMapping(value="/board/boardDelete")
    public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/board/boardList");
        boardServcie.deleteBoard(commandMap.getMap());
        return mv;
    }
	
}
