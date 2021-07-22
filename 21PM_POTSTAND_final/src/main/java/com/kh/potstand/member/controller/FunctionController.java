package com.kh.potstand.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Member;

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
	
	//공지사항 내용 확인
	@RequestMapping("/notice/noticeContent.do/{noticeNo}")
	public ModelAndView noticeSelectOne(ModelAndView mv, @PathVariable int noticeNo){
		mv.addObject("notice", service.noticeSelectOne(noticeNo));
		//조회수 올라가는거 처리해줘야됨(cookie 쓰면 될듯)
		mv.setViewName("notice/noticeContent");
		return mv;
	}
	
	//내 qna List  확인
	@RequestMapping("/qna/myQnaList.do")
	public ModelAndView qnaSelectList(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage", defaultValue="1")int cPage, 
			@RequestParam(value="numPerPage", defaultValue="10")int numPerPage){
		Member m = (Member)session.getAttribute("loginMember");
		if(m!=null) {
			mv.addObject("myQnaList", service.qnaSelectList(m.getMemberId(), cPage, numPerPage));
			mv.setViewName("qna/myqnaList");
		}else {
			mv.addObject("msg","로그인이 필요한 서비스입니다.");
			mv.addObject("loc","/notice/noticeSelectList.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	//qna 내용 확인
	@RequestMapping("/qna/qnaContent.do/{qnaNo}")
	public ModelAndView qnaSelectOne(ModelAndView mv, @PathVariable int qnaNo){
		Qna q = service.qnaSelectOne(qnaNo);
		//Status N이면 답변없는데 가져온거니까 그냥 null 넣어줌
		if(q.getQnaStatus().equals("N")) {
			q.setAnswer(null);
		}
		mv.addObject("qna", q);
		mv.setViewName("qna/qnaContent");
		return mv;
	}
	
	//1:1문의 작성페이지 이동
	@RequestMapping("/qna/qnaWrite.do")
	public ModelAndView qnaWrite(ModelAndView mv, HttpSession session){
		Member m = (Member)session.getAttribute("loginMember");
		if(m!=null) {
			mv.setViewName("qna/qnaWrite");
		}else {
			mv.addObject("msg","로그인이 필요한 서비스입니다.");
			mv.addObject("loc","/notice/noticeSelectList.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}

	//1:1문의 작성
	@RequestMapping("/qna/qnaWriteEnd.do")
	public ModelAndView qnaInsert(Qna q, ModelAndView mv){
		int result=service.qnaInsert(q);
		mv.addObject("msg",result>0?"1:1문의 접수 완료":"작성 실패");
		mv.addObject("loc","/qna/myQnaList.do");
		mv.setViewName("common/msg");
		return mv;
	}
}
