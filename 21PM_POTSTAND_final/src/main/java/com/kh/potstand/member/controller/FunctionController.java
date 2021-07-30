package com.kh.potstand.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.vo.Cart;

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
		int totalData = service.noticeSelectCount();
		mv.addObject("noticeList", service.noticeSelectList(cPage, numPerPage));
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, 5, "noticeSelectList.do"));
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
		int totalData = service.qnaSelectCount(m.getMemberId());
		if(m!=null) {
			mv.addObject("myQnaList", service.qnaSelectList(m.getMemberId(), cPage, numPerPage));
			mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, 5, "myQnaList.do"));
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
			mv.addObject("loc","/member/memberLogin.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}

	//1:1문의 작성
	@RequestMapping("/qna/qnaWriteEnd.do")
	public ModelAndView qnaInsert(Qna q, Map param, ModelAndView mv){
		//되긴 했는데 내용 공유 핋요 (server 설정 다 수정해야됨 + 용량 커지면 속도 개느림)
		int result=service.qnaInsert(q);
		mv.addObject("msg",result>0?"1:1문의 접수 완료":"작성 실패");
		mv.addObject("loc","/qna/myQnaList.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//장바구니 리스트 호출 / 이동
	@RequestMapping("/member/cartList.do")
	public ModelAndView cartSelectList(ModelAndView mv, HttpSession session){
		try {
			String memberId =((Member)(session.getAttribute("loginMember"))).getMemberId();
			List<Cart> cartList = service.cartSelectList(memberId);
			mv.addObject("cartList", cartList);
			mv.setViewName("cart/cartList");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	@RequestMapping("/ajax/cartObjDelete.do/{cartNo}")
	public @ResponseBody int cartObjDelete(ModelAndView mv,@PathVariable int cartNo){
		int result=0;
		try {
			Map param = new HashMap();
			param.put("cartNo", cartNo);
			result = service.cartObjDelete(param);
			mv.setViewName("cart/cartList");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	@RequestMapping("/ajax/cartObjAllDelete.do")
	public @ResponseBody int cartObjDelete(HttpSession session){
		String memberId = ((Member)(session.getAttribute("loginMember"))).getMemberId();
		int result=0;
		try {
			Map param = new HashMap();
			param.put("memberId", memberId);
			result = service.cartObjDelete(param);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	@RequestMapping("/ajax/cartObjCheckedDelete.do")
	@ResponseBody
	public int cartObjCheckedDelete(@RequestParam (value="arr[]") List<String> param){
		int result=0;
		try {
			result = service.cartObjDelete(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
//	카트 책 수량 업데이트
	@RequestMapping("/ajax/cartBookAmountUpdate.do")
	@ResponseBody
	public int cartBookAmountUpdate(@RequestParam (value="cartNo") int cartNo,
									@RequestParam (value="bookAmount") int bookAmount
									){
		Map param = new HashMap();
		param.put("cartNo", cartNo);
		param.put("bookAmount", bookAmount);
		int result=0;
		try {
			result = service.cartBookAmountUpdate(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
//	카트 used coupon 업데이트
	@RequestMapping("/ajax/updateCartCoupon.do")
	@ResponseBody
	public int cartCouponUpdate(@RequestParam (value="cartNo") int cartNo,
								@RequestParam (value="couponNo") int couponNo
									){
		Map param = new HashMap();
		param.put("cartNo", cartNo);
		if(couponNo!=0) {
			param.put("usedCouponNo", couponNo);
		}
		int result=0;
		try {
			result = service.cartCouponUpdate(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
}
