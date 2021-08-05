package com.kh.potstand.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.book.model.service.BookService;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BookController {
	
	@Autowired
	private BookService service;
	
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
	
	@RequestMapping("/book/bookinfo.do")
	public ModelAndView selectBookInfo(
			@RequestParam(value="no") int no, ModelAndView mv, HttpSession session) {
		int reviewCount=service.selectBookReviewCount(no); //리뷰 총 개수
		List<Review> reviewList=service.selectBookReview(no); //리뷰 리스트
		int reviewSum=0; //리뷰 별점 합
		int reviewAvg=0;
		if(reviewList!=null) {
			for(Review r : reviewList) {
				reviewSum+=r.getPoint();
				reviewAvg=Math.round(reviewSum/reviewCount); //리뷰 별점 평균
			}
		}
		//로그인되어있는 아이디가 이책을 찜했는지 확인
		Member m=(Member)session.getAttribute("loginMember");
		if(m!=null) { 
			Map param=new HashMap();
			param.put("memberId", m.getMemberId());
			param.put("bookCode", no);
			Heart h=service.bookHeartCheckSelect(param);
			mv.addObject("heartCheck", h);
		}
		mv.addObject("bookInfo", service.selectBookInfo(no));
		mv.addObject("reviewCount", reviewCount);
		mv.addObject("reviewAvg", reviewAvg);
		mv.addObject("review", reviewList);
		mv.setViewName("book/bookInfo");
		
		return mv;
	}
	
	
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
	
	//책 찜등록
	@RequestMapping("/book/bookHeartInsert.do")
	@ResponseBody
	public int bookHeartInsert(@RequestParam Map param) {
		return service.bookHeartInsert(param);
		
	}
	
	//책 찜삭제
	@RequestMapping("/book/bookHeartDelete.do")
	@ResponseBody
	public int bookHeartDelete(@RequestParam Map param) {
			return service.bookHeartDelete(param);
	}
	
	@RequestMapping("/search/bookinfo.do")
	public ModelAndView searchBookInfo(@RequestParam(value="search") String search, @RequestParam(value="all") String all, ModelAndView mv) {
		Map<String, String> param = new HashMap();
		param.put("search", search);
		param.put("all", all);
		
		Map<String, List> answer = service.searchBookInfo(param);
		mv.addObject("search",search);
		mv.addObject("answer", answer);
		mv.setViewName("/book/bookSearchAll");
		return mv;
	}
	
	@RequestMapping("/search/bookinfomore.do")
	public ModelAndView searchBookInfoMore(
			@RequestParam(value="search") String search,
			@RequestParam(value="cate") String cate, 
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="20") int numPerpage,
			ModelAndView mv) {
		
		Map param = new HashMap();
		param.put("search", search);
		param.put("cate", cate);
		
		int count = service.searchBookCount(param);
	
		mv.addObject("list", service.searchMoreInfo(param, cPage, numPerpage));
		mv.addObject("pageBar", PageFactory.getPageBar(count,cPage,numPerpage,5,"bookinfomore.do","search="+search+"&cate="+cate));
		mv.addObject("count", count);
		mv.setViewName("book/bookSearchMore");
		return mv;
	}
}
