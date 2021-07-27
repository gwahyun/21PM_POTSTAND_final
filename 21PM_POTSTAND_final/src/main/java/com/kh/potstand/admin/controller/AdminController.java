package com.kh.potstand.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.service.AdminService;
import com.kh.potstand.admin.model.vo.Answer;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Request;
import com.kh.potstand.admin.model.vo.Review;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.common.AES256Util;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.event.model.vo.Event;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	
	//단방향암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//양방향암호화
	@Autowired
	private AES256Util aes;
	
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/adminMain")
	public ModelAndView adminMain(ModelAndView mv) {
		mv.addObject("answerNo", service.answerNo());
		mv.addObject("newReview", service.newReview());
		mv.setViewName("admin/adminMain");
		return mv;
	}
	
	@RequestMapping("/admin/productInsert")
	public ModelAndView productInsert(ModelAndView mv) {
		
		mv.setViewName("admin/productInsert");
		return mv;
	}
	
	@RequestMapping("/admin/productSelectList")
	public ModelAndView productSelectList(ModelAndView mv,@RequestParam Map param) {
		mv.addObject("count", service.productSelectListCount(param));
		List<Book> list = service.productSelectList(param);
		mv.addObject("list", list);
		mv.setViewName("admin/productSelect");
		return mv;
	}
	
	@RequestMapping("/admin/orderCheck")
	public ModelAndView orderCheck(ModelAndView mv) {
		
		mv.setViewName("admin/orderCheck");
		return mv;
	}
	

	
	@RequestMapping("/admin/orderSelectList")
	public ModelAndView orderSelectList(ModelAndView mv,@RequestParam Map param) {
		
		mv.setViewName("admin/orderCheck");
		return mv;
	}

	@RequestMapping("/admin/qnaManager")
	public ModelAndView qnaManager(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.qnaManagerCount();
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"qnaManager"));
		List<Qna> list = service.qnaSelectList(cPage,numPerpage);
		mv.addObject("list", list);
		mv.setViewName("admin/qnaManager");
		return mv;
	}
	
	@RequestMapping("/admin/qnaManagerNo")
	public ModelAndView qnaManagerNo(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.qnaManagerNoCount();
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"qnaManagerNo"));
		List<Qna> list = service.qnaSelectListNo(cPage,numPerpage);
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
	
	@RequestMapping("/admin/qnaReplyUpdate")
	public ModelAndView qnaReplyUpdate(ModelAndView mv,int no) {
		Qna q = service.qnaSelectOne(no);
		Answer a = service.answerSelectOne(no);
		mv.addObject("q", q);
		mv.addObject("a", a);
		mv.setViewName("admin/qnaReplyUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/qnaReplyUpdateEnd")
	public String qnaReplyUpdate(ModelAndView mv,@RequestParam Map param) {
		int result = service.qnaReplyUpdateEnd(param);
		return result>0?"true":"false";
	}
	
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswer(@RequestParam Map param) {
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
	public ModelAndView reviewManager(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.reviewManagerCount();
		List<Review> list = service.reviewManager(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"reviewManager"));
		mv.addObject("list", list);
		mv.setViewName("admin/reviewManager");
		return mv;
	}
	
	@RequestMapping("/admin/reviewDelete")
	public ModelAndView reviewDelete(ModelAndView mv,int no) {
		int result = service.reviewDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/reviewManager");
		mv.setViewName("common/msg");
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
	public ModelAndView noticeSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.noticeSelectCount();
		List<Notice> list = service.noticeSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"noticeSelect"));
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
	public ModelAndView faqSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.faqSelectCount();
		List<Faq> list = service.faqSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"faqSelect"));
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
	
	@RequestMapping("/admin/eventInsertEnd")
public ModelAndView eventInsertEnd(ModelAndView mv,@RequestParam Map param) {
		log.debug(param.toString());
		int result = service.eventInsertEnd(param);
		mv.addObject("msg", result>0?"등록성공":"등록실패");
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	

	@RequestMapping("/admin/eventUpdate")
	public ModelAndView eventUpdate(ModelAndView mv,int no) {
		Event e = service.eventSelectOne(no);
		mv.addObject("e", e);
		mv.setViewName("admin/eventUpdate");
		return mv;
	}
	@RequestMapping("/admin/eventSelect")
	public ModelAndView eventSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.eventSelectCount();
		int result = service.eventEndUpdate();
		List<Event> list = service.eventSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"eventSelect"));
		mv.addObject("list", list);
		mv.setViewName("admin/eventSelect");
		return mv;
	}
	
	/*
	 * @RequestMapping("/admin/eventEnd")
	 * 
	 * @ResponseBody public int eventEnd(int no) { int result =
	 * service.eventEnd(no); return result; }
	 */
	
	@RequestMapping("/admin/eventUpdateEnd")
	public ModelAndView eventUpdateEnd(ModelAndView mv,@RequestParam Map param) {
		int result = service.eventUpdateEnd(param);
		mv.addObject("msg", result>0?"수정성공":"수정실패");
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/eventDelete")
	public ModelAndView eventDelete(ModelAndView mv,int no) {
		int result = service.eventDelete(no);
		mv.addObject("msg", result>0?"삭제성공":"삭제실패");
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/calSelect")
	public ModelAndView calSelect(ModelAndView mv) {
		
		mv.setViewName("admin/calSelect");
		return mv;
	}
	
	@RequestMapping("/admin/memberSelect")
	public ModelAndView memberSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.memberSelectCount();
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberSelect"));
		List<Member> list = service.memberSelect(cPage,numPerpage);
		
		for(Member m : list) {
			try {
	               List<Address> ad=new ArrayList<Address>();
		               for(Address a : m.getAddresses()) {
		                  a.setPostNo(aes.decrypt(a.getPostNo()));
		                  a.setRoadAddr(aes.decrypt(a.getRoadAddr()));
		                  a.setOldAddr(aes.decrypt(a.getOldAddr()));
		                  a.setDetailAddr(aes.decrypt(a.getDetailAddr()));
		                  ad.add(a);
		               }
		               m.setAddresses(ad);
				m.setMemberEmail(aes.decrypt(m.getMemberEmail()));
				m.setMemberPhone(aes.decrypt(m.getMemberPhone()));
			}catch(Exception e) {
			}
		}
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
	public ModelAndView stockManager(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv
			) {
		int totalData = service.stockManagerCount();
		mv.addObject("count", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"stockManager"));
		List<Book> list = service.stockManagerList(cPage,numPerpage);
		mv.addObject("list", list);
		mv.setViewName("admin/stockManager");
		return mv;
	}
	
	@RequestMapping("/admin/stockUpdate")
	public ModelAndView stockUpdate(ModelAndView mv,@RequestParam Map param) {
		
		int result = service.stockUpdate(param);
		mv.addObject("msg", result>0?"재고충전 완료!":"재고충전 실패!");
		mv.addObject("loc", "/admin/stockManager");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/requestSelect")
	public ModelAndView requestSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv,
			@RequestParam(value="type",defaultValue="") String type) {
		int totalData = service.requestSelectCount(type);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"requestSelect","type="+type));
		//mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"requestSelect?type="+type));
		List<Request> list = service.requestSelect(cPage,numPerpage,type);
		mv.addObject("count", totalData);
		mv.addObject("list", list);
		mv.setViewName("admin/requestSelect");
		return mv;
	}
	
	@RequestMapping("/admin/requestUpdate")
	public ModelAndView requestUpdate(ModelAndView mv,@RequestParam Map param) {
		
		int result = service.requestUpdate(param);
		mv.addObject("msg", result>0?"요청 완료!":"요청 실패!");
		mv.addObject("loc", "/admin/requestSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
}
