//package com.kh.potstand.book.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.kh.potstand.book.model.service.BookService;
//import com.kh.potstand.book.model.vo.Book;
//
//@Controller
//public class BookController {
//	
//	@Autowired
//	private BookService service;
	
//	@RequestMapping("/book/booklist.do")
//	public ModelAndView selectBookList(ModelAndView mv){
//		mv.addObject(service.selectBookList());
//		mv.setViewName("book/bookList");
//	}
//}
