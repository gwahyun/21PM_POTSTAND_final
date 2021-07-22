package com.kh.potstand.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FunctionController {
	
	@Autowired
	private MemberService service;
	
	//공지사항 페이지로 이동 (notice List 호출 및 페이지이동)
	@RequestMapping("/notice/noticeSelectList.do")
	public ModelAndView noticeSelectList(ModelAndView mv, 
			@RequestParam(value="cPage", defaultValue="1")int cPage, 
			@RequestParam(value="numPerPage", defaultValue="10")int numPerPage){
		
		mv.addObject("noticeList", service.noticeSelectList(cPage, numPerPage));
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	@RequestMapping("/notice/noticeContent.do/{noticeNo}")
	public ModelAndView noticeSelectOne(ModelAndView mv, @PathVariable int noticeNo){
		mv.addObject("noticeContent", service.noticeSelectOne(noticeNo));
		mv.setViewName("notice/noticeContent");
		return mv;
	}
	
}
