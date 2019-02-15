package com.tody.reply.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tody.common.common.CommandMap;
import com.tody.common.domain.Criteria;
import com.tody.common.domain.PageMaker;
import com.tody.common.domain.SearchCriteria;
import com.tody.reply.service.ReplyService;

@Controller
@RequestMapping(value="/reply")
public class ReplyController {
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
    @RequestMapping(value="/boardList")
    public ModelAndView openBoardList(SearchCriteria cri) throws Exception {
        
        ModelAndView mav = new ModelAndView("/reply/boardList");
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(replyService.countBoardListTotal(cri));
        
        List<Map<String,Object>> list = replyService.selectBoardList(cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
        
        return mav;
        
    }
    
    @RequestMapping(value="/boardWrite")
    public String boardWrite() throws Exception {
        return "/reply/boardWrite";
    }
    
    @RequestMapping(value="/boardWrite", method=RequestMethod.POST)
    public String boardWritePOST(CommandMap commandMap) throws Exception {
    	replyService.insertBoard(commandMap);
        return "redirect:/reply/boardList";
    }
    
    @RequestMapping(value="/boardDetail")
    public ModelAndView boardDetail(CommandMap commandMap, Criteria cri) throws Exception {
        
        ModelAndView mv = new ModelAndView("/reply/boardDetail");
        Map<String, Object> detail = replyService.viewBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        
        return mv;
    }
    
    @RequestMapping(value="/boardModify")
    public ModelAndView boardModify(CommandMap commandMap, Criteria cri) throws Exception {
        ModelAndView mv = new ModelAndView("/reply/boardModify");
        Map<String, Object> detail = replyService.selectBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        return mv;
    }
    
    @RequestMapping(value="/boardModify", method=RequestMethod.POST)
    public ModelAndView boardModifyPOST(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reply/boardDetail");
        mv.addObject("IDX", commandMap.get("IDX"));
        replyService.updateBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }
    
    @RequestMapping(value="/boardDelete")
    public ModelAndView boardDelete(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reply/boardList");
        replyService.deleteBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }

}
