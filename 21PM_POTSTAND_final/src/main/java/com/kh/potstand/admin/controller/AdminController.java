package com.kh.potstand.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.service.AdminService;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/adminMain")
	public ModelAndView adminMain(ModelAndView mv) {
		
		mv.setViewName("admin/adminMain");
		return mv;
	}
	
	@RequestMapping("/admin/productInsert")
	public ModelAndView productInsert(ModelAndView mv) {
		
		mv.setViewName("admin/productInsert");
		return mv;
	}
	
	@RequestMapping("/admin/productSelect")
	public ModelAndView productSelect(ModelAndView mv) {
		
		mv.setViewName("admin/productSelect");
		return mv;
	}
	
	@RequestMapping("/admin/orderCheck")
	public ModelAndView orderCheck(ModelAndView mv) {
		
		mv.setViewName("admin/orderCheck");
		return mv;
	}
	
	@RequestMapping("/admin/qnaManager")
	public ModelAndView qnaManager(ModelAndView mv) {
		List<Qna> list = service.qnaSelectList();
		mv.addObject("list", list);
		mv.setViewName("admin/qnaManager");
		return mv;
	}
	
	@RequestMapping("/admin/qnaReply")
	public ModelAndView qnaReply(ModelAndView mv,int no) {
		Qna q = service.qnaSelectOne(no);
		mv.addObject("q", q);
		mv.setViewName("admin/qnaReply");
		return mv;
	}
	
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswer(ModelAndView mv,@RequestParam Map param,int qnaNo) {
		param.put("memberId", "admin");
		int result = service.qnaAnswer(param);
		return result>0?"true":"false";
	}
	
	
	
	@RequestMapping("/admin/qnaInsert")
	public ModelAndView qnaInsert(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		/* Member m = (Member)session.getAttribute("loginMember");
		param.put("memberId", m.getMemberId()); */
		param.put("memberId", "admin");
		int result = service.qnaInsert(param);
		mv.addObject("msg", result>0?"등록 성공":"등록 실패");
		mv.addObject("loc", "/admin/qnaManager");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/qnaDelete")
	public ModelAndView qnaDelete(ModelAndView mv,int no) {
		int result = service.qnaDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/qnaManager");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/reviewManager")
	public ModelAndView reviewManager(ModelAndView mv) {
		
		mv.setViewName("admin/reviewManager");
		return mv;
	}

	@RequestMapping("/admin/noticeInsert")
	public ModelAndView noticeInsert(ModelAndView mv) {
		
		mv.setViewName("admin/noticeInsert");
		return mv;
	}
	
	@RequestMapping("/admin/noticeInsertEnd")
	public ModelAndView noticeInsertEnd(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		/* Member m = (Member)session.getAttribute("loginMember");
		param.put("memberId", m.getMemberId()); */
		param.put("memberId", "admin");
		int result = service.noticeInsert(param);
		mv.addObject("msg", result>0?"등록 되었습니다!":"등록 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/noticeUpdate")
	public ModelAndView noticeUpdate(ModelAndView mv,int no) {
		Notice n = service.noticeUpdate(no);
		mv.addObject("n", n);
		mv.setViewName("admin/noticeUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/noticeUpdateEnd")
	public ModelAndView noticeUpdateEnd(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		/* Member m = (Member)session.getAttribute("loginMember");
		param.put("memberId", m.getMemberId()); */
		param.put("memberId", "admin");
		int result = service.noticeUpdateEnd(param);
		mv.addObject("msg", result>0?"수정 되었습니다!":"수정 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/noticeSelect")
	public ModelAndView noticeSelect(ModelAndView mv) {
		List<Notice> list = service.noticeSelect();
		mv.addObject("list", list);
		mv.setViewName("admin/noticeSelect");
		return mv;
	}
	
	@RequestMapping("/admin/noticeDelete")
	public ModelAndView noticeDelete(ModelAndView mv,int no) {
		int result = service.noticeDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/admin/faqInsert")
	public ModelAndView faqInsert(ModelAndView mv) {
		
		mv.setViewName("admin/faqInsert");
		return mv;
	}
	
	@RequestMapping("/admin/faqInsertEnd")
	public ModelAndView faqInsertEnd(ModelAndView mv,@RequestParam Map param) {
		int result = service.faqInsert(param);
		mv.addObject("msg", result>0?"등록 되었습니다!":"등록 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/faqSelect")
	public ModelAndView faqSelect(ModelAndView mv) {
		List<Faq> list = service.faqSelect();
		mv.addObject("list", list);
		mv.setViewName("admin/faqSelect");
		return mv;
	}
	
	@RequestMapping("/admin/faqUpdate")
	public ModelAndView faqUpdate(ModelAndView mv,int no) {
		Faq f = service.faqUpdate(no);
		mv.addObject("f", f);
		mv.setViewName("admin/faqUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/faqUpdateEnd")
	public ModelAndView faqUpdateEnd(ModelAndView mv,@RequestParam Map param) {
		int result = service.faqUpdateEnd(param);
		mv.addObject("msg", result>0?"수정 되었습니다!":"수정 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/faqDelete")
	public ModelAndView faqDelete(ModelAndView mv,int no) {
		int result = service.faqDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/eventInsert")
	public ModelAndView eventInsert(ModelAndView mv) {
		
		mv.setViewName("admin/eventInsert");
		return mv;
	}
	
	@RequestMapping("/admin/eventSelect")
	public ModelAndView eventSelect(ModelAndView mv) {
		
		mv.setViewName("admin/eventSelect");
		return mv;
	}
	
	@RequestMapping("/admin/calSelect")
	public ModelAndView calSelect(ModelAndView mv) {
		
		mv.setViewName("admin/calSelect");
		return mv;
	}
	
	@RequestMapping("/admin/memberSelect")
	public ModelAndView memberSelect(ModelAndView mv) {
		
		List<Member> list = service.memberSelect();
		mv.addObject("count", service.memberSelectCount()); 
		mv.addObject("list", list);
		mv.setViewName("admin/memberSelect");
		return mv;
	}
	
	@RequestMapping("/admin/memberDelete")
	public ModelAndView memberDelete(ModelAndView mv,String memberId) {
		int result = service.memberDelete(memberId);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/memberSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/admin/stockManager")
	public ModelAndView stockManager(ModelAndView mv) {
		mv.setViewName("admin/stockManager");
		return mv;
	}
	
	
}
