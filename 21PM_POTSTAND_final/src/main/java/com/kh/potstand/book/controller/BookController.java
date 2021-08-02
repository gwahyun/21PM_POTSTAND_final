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
	
	@RequestMapping("/book/booklist.do")
	public ModelAndView selectBookList(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="20") int numPerpage
			,ModelAndView mv){
		mv.addObject("bookList", service.selectBookList(cPage, numPerpage));
		mv.addObject("pageBar", PageFactory.getPageBar(service.selectBookCount(), cPage, numPerpage, 5, "booklist.do"));
		mv.setViewName("book/bookList");
		return mv;
	}
	
	@RequestMapping("/book/bookinfo.do")
	public ModelAndView selectBookInfo(
			@RequestParam(value="no") int no, ModelAndView mv) {
		mv.addObject("bookInfo", service.selectBookInfo(no));
		mv.setViewName("book/bookInfo");
		
		return mv;
	}
}
