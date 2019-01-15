package com.tody.search.controller;

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
import com.tody.search.service.SearchService;

@Controller
@RequestMapping(value="/search")
public class SearchController {
	
	@Resource(name="searchService")
	private SearchService searchService;
    
    @RequestMapping(value="/boardList")
    public ModelAndView openBoardList(Criteria cri) throws Exception {
        
        ModelAndView mav = new ModelAndView("/search/boardList");
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(searchService.countBoardListTotal());
        
        List<Map<String,Object>> list = searchService.selectBoardList(cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
        
        return mav;
        
    }
    
    @RequestMapping(value="//boardWrite")
    public String boardWrite() throws Exception {
        return "/search/boardWrite";
    }
    
    @RequestMapping(value="/boardWrite", method=RequestMethod.POST)
    public String boardWritePOST(CommandMap commandMap) throws Exception {
    	searchService.insertBoard(commandMap);
        return "redirect:/search/boardList";
    }
    
    @RequestMapping(value="/boardDetail")
    public ModelAndView boardDetail(CommandMap commandMap, Criteria cri) throws Exception {
        
        ModelAndView mv = new ModelAndView("/search/boardDetail");
        Map<String, Object> detail = searchService.viewBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        
        return mv;
    }
    
    @RequestMapping(value="/boardModify")
    public ModelAndView boardModify(CommandMap commandMap, Criteria cri) throws Exception {
        ModelAndView mv = new ModelAndView("/search/boardModify");
        Map<String, Object> detail = searchService.selectBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        return mv;
    }
    
    @RequestMapping(value="/boardModify", method=RequestMethod.POST)
    public ModelAndView boardModifyPOST(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/search/boardDetail");
        mv.addObject("IDX", commandMap.get("IDX"));
        searchService.updateBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }
    
    @RequestMapping(value="/boardDelete")
    public ModelAndView boardDelete(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/search/boardList");
        searchService.deleteBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }

}
