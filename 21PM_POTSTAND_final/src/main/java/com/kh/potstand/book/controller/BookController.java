package com.kh.potstand.book.controller;

import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.book.model.service.BookService;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.common.PageFactory;

@Controller
public class BookController {
	
	@Autowired
	private BookService service;
	
	//책 전체 조회 페이지
	@RequestMapping("/book/booklist.do")
	public ModelAndView selectBookList(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="20") int numPerpage
			,ModelAndView mv){
		mv.addObject("lv1", service.selectSortLv1List());
		mv.addObject("lv2", service.selectSortLv2List());
		mv.addObject("lv3", service.selectSortLv3List());
		mv.addObject("lv4", service.selectSortLv4List());
		mv.addObject("bookList", service.selectBookList(cPage, numPerpage));
		mv.addObject("pageBar", PageFactory.getPageBar(service.selectBookCount(), cPage, numPerpage, 5, "booklist.do"));
		mv.setViewName("book/bookList");
		return mv;
	}
	
	//책 상세조회 페이지
	@RequestMapping("/book/bookinfo.do")
	public ModelAndView selectBookInfo(
			@RequestParam(value="no") int no, ModelAndView mv) {
		mv.addObject("bookInfo", service.selectBookInfo(no));
		mv.addObject("reviewList", service.selectBookReview(no));
		mv.setViewName("book/bookInfo");
		
		return mv;
	}
	
	//책 카테고리별 조회 페이지
	@RequestMapping("/book/sortBookList.do")
	public ModelAndView selectSortBookList(String sortNo,
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="20") int numPerpage
			,ModelAndView mv){
		mv.addObject("lv1", service.selectSortLv1List());
		mv.addObject("lv2", service.selectSortLv2List());
		mv.addObject("lv3", service.selectSortLv3List());
		mv.addObject("lv4", service.selectSortLv4List());
		mv.addObject("bookList", service.selectSortBookList(sortNo, cPage, numPerpage));
		mv.addObject("pageBar", 
				PageFactory.getPageBar(service.selectSortBookCount(sortNo),cPage,numPerpage,5,"sortBookList.do","sortNo="+sortNo));
		mv.setViewName("book/sortBookList");
		return mv;
	}

}
