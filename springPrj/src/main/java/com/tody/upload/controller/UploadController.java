package com.tody.upload.controller;

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
import com.tody.upload.service.UploadService;

@Controller
@RequestMapping(value="/upload")
public class UploadController {
	
	@Resource(name="uploadService")
	public UploadService uploadService;
	
    @RequestMapping(value="/boardList")
    public ModelAndView openBoardList(Criteria cri) throws Exception {
        
        ModelAndView mav = new ModelAndView("/upload/boardList");
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(uploadService.countBoardListTotal());
        
        List<Map<String,Object>> list = uploadService.selectBoardList(cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
        
        return mav;
        
    }
    
    @RequestMapping(value="/boardWrite")
    public String boardWrite() throws Exception {
        return "/upload/boardWrite";
    }
    
    @RequestMapping(value="/boardWrite", method=RequestMethod.POST)
    public String boardWritePOST(CommandMap commandMap) throws Exception {
    	uploadService.insertBoard(commandMap);
        return "redirect:/upload/boardList";
    }
    
    @RequestMapping(value="/boardDetail")
    public ModelAndView boardDetail(CommandMap commandMap, Criteria cri) throws Exception {
        
        ModelAndView mv = new ModelAndView("/upload/boardDetail");
        Map<String, Object> detail = uploadService.viewBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        
        return mv;
    }
    
    @RequestMapping(value="/boardModify")
    public ModelAndView boardModify(CommandMap commandMap, Criteria cri) throws Exception {
        ModelAndView mv = new ModelAndView("/upload/boardModify");
        Map<String, Object> detail = uploadService.selectBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        mv.addObject("cri", cri);
        return mv;
    }
    
    @RequestMapping(value="/boardModify", method=RequestMethod.POST)
    public ModelAndView boardModifyPOST(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/upload/boardDetail");
        mv.addObject("IDX", commandMap.get("IDX"));
        uploadService.updateBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }
    
    @RequestMapping(value="/boardDelete")
    public ModelAndView boardDelete(CommandMap commandMap, Criteria cri, RedirectAttributes redAttr) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/upload/boardList");
        uploadService.deleteBoard(commandMap.getMap());
        redAttr.addAttribute("page", cri.getPage());
        redAttr.addAttribute("perPagNum", cri.getPerPageNum());
        return mv;
    }

}
