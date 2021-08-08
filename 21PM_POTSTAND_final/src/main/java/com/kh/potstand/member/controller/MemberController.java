package com.kh.potstand.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.common.AES256Util;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//단방향암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//양방향암호화
	@Autowired
	private AES256Util aes;
	
	//메일보내기
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인페이지 불러오는 매소드
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	//로그인 계정확인 매소드
	@RequestMapping("/member/memberLoginEnd.do")
	public ModelAndView memberLoginEnd(@RequestParam Map param, ModelAndView mv, HttpSession session, HttpServletResponse response) 
			throws NoSuchAlgorithmException,
	UnsupportedEncodingException, GeneralSecurityException {
		//아이디저장 체크후 쿠키 저장
		if(param.get("remember_me")!=null && param.get("remember_me").equals("true")) {		
			Cookie c=new Cookie("saveId",(String)param.get("memberId"));
			c.setMaxAge(60*60*24*7);
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		Member m=service.memberSelect(param);
		if(m!=null) {
			if(pwEncoder.matches((String)param.get("memberPwd"), m.getMemberPwd())) {
				//암호화한정보 다시 복호화
				m.setMemberEmail(aes.decrypt(m.getMemberEmail()));
				m.setMemberPhone(aes.decrypt(m.getMemberPhone()));
				//log.debug("{}",m.getAddresses());
				if(m.getAddresses()!=null) {
					List<Address> list=new ArrayList<Address>();
					for(Address a : m.getAddresses()) {
						a.setPostNo(aes.decrypt(a.getPostNo()));
						a.setRoadAddr(aes.decrypt(a.getRoadAddr()));
						a.setOldAddr(aes.decrypt(a.getOldAddr()));
						a.setDetailAddr(aes.decrypt(a.getDetailAddr()));
						list.add(a);
					}
					m.setAddresses(list);
				}

				//해당 계정이 잇으면 session생성
				session.setAttribute("loginMember", m);
				mv.addObject("msg", "로그인에 성공하였습니다.");
				mv.addObject("loc", "/");
			}else {
				mv.addObject("msg", "로그인에 실패하였습니다 아이디 또는 비밀번호를 확인하세요.");
				mv.addObject("loc", "/member/memberLogin.do");
			}
		}else {
			mv.addObject("msg", "로그인에 실패하였습니다 아이디 또는 비밀번호를 확인하세요.");
			mv.addObject("loc", "/member/memberLogin.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	//회원가입 페이지전환
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	//도로명주소 팝업띄우기
	@RequestMapping("/member/jusoPopup.do")
	public String addressPopupTest() {
		return "member/jusoPopup";
	}
	
	//회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(Member m, Address a, ModelAndView mv) throws NoSuchAlgorithmException, 
	UnsupportedEncodingException, GeneralSecurityException{	
		//단방향 암호화처리
		m.setMemberPwd(pwEncoder.encode(m.getMemberPwd())); 
		//양방향 암호화처리
		m.setMemberEmail(aes.encrypt(m.getMemberEmail()));
		m.setMemberPhone(aes.encrypt(m.getMemberPhone()));
		a.setPostNo(aes.encrypt(a.getPostNo()));
		a.setRoadAddr(aes.encrypt(a.getRoadAddr()));
		a.setOldAddr(aes.encrypt(a.getOldAddr()));
		a.setDetailAddr(aes.encrypt(a.getDetailAddr()));
		
		m.getAddresses().add(Address.builder().memberId(a.getMemberId()).postNo(a.getPostNo()).roadAddr(a.getRoadAddr())
				.oldAddr(a.getOldAddr()).detailAddr(a.getDetailAddr()).defaultAddr("Y").build());
		
		String msg="회원가입에 성공하였습니다!";
		try {
			service.memberInsert(m);
			mv.addObject("loc","/");	
		}catch(Exception e) {
			msg=e.getMessage();
			mv.addObject("loc","/member/memberEnroll.do");
		}
		
		mv.addObject("msg",msg);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//아이디찾기
	@RequestMapping("/member/memberSearchId.do")
	public ModelAndView memberSearchId(String memberEmail, ModelAndView  mv) throws NoSuchAlgorithmException, 
	UnsupportedEncodingException, GeneralSecurityException {
		memberEmail=aes.encrypt(memberEmail);
		Member m=service.memberSearchIdSelect(memberEmail);
		String msg="";
		if(m!=null) { //찾은 아이디가있으면
			String content="고객님의 아이디는 "+m.getMemberId()+"입니다."; //진짜 ID
			
			//ID를 *로 가리기
			String memberId=m.getMemberId().substring(0,2);
			for(int i=0; i<m.getMemberId().length()-2; i++) {
				memberId+="*";
			}

			//아이디 메일로 보내기
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

				messageHelper.setFrom("audrhkd1220@naver.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(aes.decrypt(memberEmail)); // 받는사람 이메일
				messageHelper.setSubject("PotStand 아이디찾기 결과"); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				log.debug("{}",e);
			}
			
			msg="회원님의 아이디는 다음과 같습니다. \\n"+memberId+"\\n 전체아이디는 입력하신 메일 주소로 보내드렸습니다.";		
		}else {
			msg="해당 이메일로 가입된 아이디가 존재하지 않습니다.";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc","/member/memberLogin.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//비밀번호 재설정
	@RequestMapping("/member/memberResetPwd.do")
	public ModelAndView memberResetPwd(Member m, ModelAndView mv) throws NoSuchAlgorithmException, 
	UnsupportedEncodingException, GeneralSecurityException {
		m.setMemberEmail(aes.encrypt(m.getMemberEmail()));	
		String msg="";
		Member resetM=null;
		try {
			resetM=service.memberResetPwd(m);
		}catch(Exception e) {
			msg=e.getMessage();
		}		
		if(resetM!=null) { //해당아이디가있고 임시비밀번호로 변경했을경우		
			//임시비밀번호 메일로 보내기
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

				messageHelper.setFrom("audrhkd1220@naver.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(aes.decrypt(resetM.getMemberEmail())); // 받는사람 이메일
				messageHelper.setSubject("PotStand 비밀번호 재설정"); // 메일제목은 생략이 가능하다
				messageHelper.setText("임시비밀번호입니다. 로그인 후 변경해주세요. \n"+resetM.getMemberPwd()); // 메일 내용
				mailSender.send(message);
			} catch (Exception e) {
				log.debug("{}",e);
			}	
			msg="가입하신 이메일로 임시비밀번호가 발급되었습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc","/member/memberLogin.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//중복아이디 체크
	@RequestMapping("/member/memberCheckId.do")
	@ResponseBody
	public Member memberCheckId(@RequestParam Map param) {
		return service.memberSelect(param);
	}
		
	//증복이메일 체크
	@RequestMapping("/member/memberCheckEmail.do")
	@ResponseBody
	public Member memberCheckEmail(String memberEmail) throws NoSuchAlgorithmException, UnsupportedEncodingException, 
	GeneralSecurityException {
		return service.memberSearchIdSelect(aes.encrypt(memberEmail));
	}

	//마이페이지 전환
	@RequestMapping("/member/memberMypage.do")
	public ModelAndView memberMypage(ModelAndView mv, HttpSession session) {
		String memberId=((Member)(session.getAttribute("loginMember"))).getMemberId();
		List<Point> pointList=service.memberPointSelect(memberId);
		int totalPoint=0; //잔여 포인트
		int totalCoupon=service.memberCouponListCount(memberId);
		for(Point p : pointList) {
			if(p.getUseLog().contains("적립")) {
				totalPoint+=p.getPoint();
			}else if(p.getUseLog().contains("사용")) {
				totalPoint-=p.getPoint();
			}
		}
		List<Payment> paymentList=service.memberOrderListAllSelect(memberId);
		int state1Count=0; //결제완료된 주문 총 개수
		int state2Count=0; //배송중인 주문 총 개수
		int state3Count=0; //배송완료된 주문 총 개수
		if(paymentList!=null) {
			for(Payment p : paymentList) {
				if(p.getOrderState().equals("결제완료")) {
					state1Count+=1;
				} else if(p.getOrderState().equals("배송중")) {
					state2Count+=1;
				} else if(p.getOrderState().equals("배송완료")) {
					state3Count+=1;
				}
			}
		}
		mv.addObject("state1Count", state1Count);
		mv.addObject("state2Count", state2Count);
		mv.addObject("state3Count", state3Count);
		mv.addObject("mypageTotalPoint", totalPoint);
		mv.addObject("mypageTotalCoupon", totalCoupon);
		mv.setViewName("member/memberMypage");
		return mv;
	}
	
	//회원정보수정 비밀번호확인페이지 전환
	@RequestMapping("/member/memberCheckPwd.do")
	public String memberCheckPwd() {
		return "member/memberCheckPwd";
	}
	
	//회원정보수정 페이지전환
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(@RequestParam Map param, Model model) {
		Member m=service.memberSelect(param);
		if(pwEncoder.matches((String)param.get("memberPwd"),m.getMemberPwd())) {
			return "member/memberUpdate";
		}else {
			model.addAttribute("msg", "비밀번호를 틀렸습니다. 다시 시도해주세요");
			model.addAttribute("loc", "/member/memberMypage.do");
			return "common/msg";
		}	
	}
	
	//회원탈퇴 페이지전환
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	//회원탈퇴
	@RequestMapping("/member/memberDeleteEnd.do")
	public String memberDeleteEnd(@RequestParam Map param, HttpSession session, Model model) {
		Member m=service.memberSelect(param);
		String msg="";
		String loc="";
		if(pwEncoder.matches((String)param.get("memberPwd"),m.getMemberPwd())) {
			int result=0;		
			try {
				result=service.memberDelete(param);
			}catch(Exception e) {
				msg=e.getMessage();
			}
			if(result>0) {
				session.invalidate();
				msg="회원탈퇴에 성공하였습니다. 이용해주셔서 감사합니다.";
				loc="/";	
			}else {
				loc="/member/memberMypage.do";
			}				
		}else {
			msg="비밀번호를 틀렸습니다. 다시 시도해주세요";
			loc="/member/memberMypage.do";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	//비밀번호확인
	@RequestMapping("/member/memberUpdateCheckPwd.do")
	@ResponseBody
	public Member memberUpdateCheckPwd(@RequestParam Map param) {
		Member m=service.memberSelect(param);
		if(pwEncoder.matches((String)param.get("memberPwd"),m.getMemberPwd())) {
			return m;
		}else {
			return null;
		}	
	}
	
	//비밀번호변경
	@RequestMapping("/member/memberUpdatePwd.do")
	public ModelAndView memberUpdatePwd(ModelAndView mv, @RequestParam Map param) {
		//프론트에서 현재비밀번호가 일치하는지 체킹하고 오기때문에 현재비밀번호로 수정하는 작업만 하면됨.
		param.put("memberPwd", pwEncoder.encode((String)param.get("newPw")));
		int result=service.memberUpdatePwd(param);
		mv.addObject("msg", result>0?"비밀번호 변경에 성공하였습니다.":"비밀번호 변경에 실패하였습니다. 관리자에게 문의하세요.");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//회원정보수정
	@RequestMapping("/member/memberUpdateEnd.do")
	public ModelAndView memberUpdateEnd(Member m, Address a, String newPw, ModelAndView mv, HttpSession session) 
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		//휴대전화 생년월일 성별 주소		
		//양방향 암호화처리
		m.setMemberEmail(aes.encrypt(m.getMemberEmail()));
		m.setMemberPhone(aes.encrypt(m.getMemberPhone()));
		a.setPostNo(aes.encrypt(a.getPostNo()));
		a.setRoadAddr(aes.encrypt(a.getRoadAddr()));
		a.setOldAddr(aes.encrypt(a.getOldAddr()));
		a.setDetailAddr(aes.encrypt(a.getDetailAddr()));
				
		m.getAddresses().add(Address.builder().memberId(a.getMemberId()).postNo(a.getPostNo()).roadAddr(a.getRoadAddr())
				.oldAddr(a.getOldAddr()).detailAddr(a.getDetailAddr()).defaultAddr("Y").build());
		
		String msg="회원정보 수정을 성공하였습니다.";
		String loc;
		try {
			int result=service.memberUpdate(m);
			if(result>0) {
				//loginMember 세션 다시만들어주기
				m.setMemberEmail(aes.decrypt(m.getMemberEmail()));
				m.setMemberPhone(aes.decrypt(m.getMemberPhone()));
				if(m.getAddresses()!=null) {
					List<Address> list=new ArrayList<Address>();
					for(Address addr : m.getAddresses()) {
						addr.setPostNo(aes.decrypt(addr.getPostNo()));
						addr.setRoadAddr(aes.decrypt(addr.getRoadAddr()));
						addr.setOldAddr(aes.decrypt(addr.getOldAddr()));
						addr.setDetailAddr(aes.decrypt(addr.getDetailAddr()));
						list.add(addr);
					}
					m.setAddresses(list);
				}
				session.setAttribute("loginMember", m);
			}
			loc="/member/memberMypage.do";	
		}catch(Exception e) {
			msg=e.getMessage();
			loc="/member/memberUpdate.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//적립금 페이지 전환
	@RequestMapping("/member/memberPoint.do")
	public ModelAndView memberPoint(ModelAndView mv, HttpSession session, 
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage) {
		String memberId=((Member)session.getAttribute("loginMember")).getMemberId();
		//잔여포인트
		List<Point> pointList=service.memberPointSelect(memberId);
		int totalPoint=0;
		for(Point p : pointList) {
			if(p.getUseLog().contains("적립")) {
				totalPoint+=p.getPoint();
			}else if(p.getUseLog().contains("사용")) {
				totalPoint-=p.getPoint();
			}
		}
		//해당 멤버의 총 포인트 개수
		int totalData=service.memberPointSelectCount(memberId);
		//페이징처리해서 리스트에 담기
		List<Point> list=service.memberPointSelect(memberId,cPage,numPerpage);
		mv.addObject("totalPoint", totalPoint);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberPoint.do"));
		mv.addObject("list", list);
		mv.setViewName("member/memberPoint");
		return mv;
	}
	
	//찜 목록 페이지 전환
	@RequestMapping("/member/memberHeartList.do")
	public ModelAndView memberHeartList(ModelAndView mv, HttpSession session, 
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5") int numPerpage) {
		String memberId=((Member)session.getAttribute("loginMember")).getMemberId();
		//찜목록에 담겨있는 책 개수
		int totalData=service.memberHeartListCount(memberId);
		//페이징처리해서 리스트에 담기
		List<Heart> list=service.memberHeartListSelect(memberId,cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberHeartList.do"));
		mv.addObject("list", list);
		mv.setViewName("member/memberHeartList");
		
		return mv;
	}
	
	//찜목록 - 선택 장바구니에담기
	@RequestMapping("/member/memberChoiceCartInsert.do")
	@ResponseBody
	public int memberChoiceCartInsert(@RequestParam(value="bookCodeList[]") List<String> bookCodeList, 
            @RequestParam(value="memberId") String memberId) {	
		Map param=new HashMap();
		try {
			for(String bc : bookCodeList) {	
				param.put("memberId", memberId);
				param.put("bookCode", bc);
				Cart checkC=service.memberCartSelect(param);
				//장바구니에 이미 담긴건지 확인
				if(checkC!=null) { //담겨있는책은 수량을 +1해줌
					service.memberOverlapCartUpdate(param);
				}else { //담겨있지 않은 책은 장바구니에 등록
					service.memberChoiceCartInsert(param);
				}		
				//장바구니로 이동한 찜목록 지우기
				service.memberHeartDelete(param);
			}
		}catch(RuntimeException e) {
			return 0;
		}
		
		
		return 1;
	}
	
	//찜목록 - 선택 삭제하기
	@RequestMapping("/member/memberChoiceHeartDelete.do")
	@ResponseBody
	public int memberChoiceHeartDelete(@RequestParam(value="bookCodeList[]") List<String> bookCodeList, 
            @RequestParam(value="memberId") String memberId) {
		Map param=new HashMap();
		try {
			for(String bc : bookCodeList) {	
				param.put("memberId", memberId);
				param.put("bookCode", bc);
				//찜목록 지우기
				service.memberHeartDelete(param);
			}
		}catch(RuntimeException e) {
			return 0;
		}
		
		return 1;
	}
	
	//찜목록 - 장바구니에 담기
	@RequestMapping("/member/memberCartInsert.do")
	@ResponseBody
	public int memberCartInsert(@RequestParam Map param) {
		try {
			Cart checkC=service.memberCartSelect(param);
			if(checkC!=null) { //담겨있는책은 수량을 +1해줌
				service.memberOverlapCartUpdate(param);
			}else { //담겨있지 않은 책은 장바구니에 등록
				service.memberChoiceCartInsert(param);
			}		
			//장바구니로 이동한 찜목록 지우기
			service.memberHeartDelete(param);
		}catch(RuntimeException e) {
			return 0;
		}
		return 1;
	}
	
	//찜목록 - 찜목록 삭제
	@RequestMapping("/member/memberHeartDelete.do")
	@ResponseBody
	public int memberHeartDelete(@RequestParam Map param) {
		try {
			service.memberHeartDelete(param);
		}catch(RuntimeException e) {
			return 0;
		}
		return 1;
	}
	
	//내 리뷰 관리 페이지전환
	@RequestMapping("/member/memberMyReview.do")
	public ModelAndView memberMyReview(ModelAndView mv, @RequestParam Map param, HttpSession session,
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5") int numPerpage) {
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		int totalData=service.memberReviewListCount(param);
		
		List<Review> list=service.memberReviewListSelect(param,cPage,numPerpage);
		mv.addObject("totalData", totalData);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberMyReview.do"));
		mv.setViewName("member/memberMyReview");
		return mv;
	}
	
	//내 리뷰 삭제
	@RequestMapping("/member/memberReviewDelete.do")
	public ModelAndView myReviewDelete(ModelAndView mv, @RequestParam Map param) {
		int result=service.memberReviewDelete(param);
		String msg="리뷰삭제에 실패하였습니다. 다시 시도해주세요.";
		if(result>0) {
			msg="리뷰를 삭제하였습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/member/memberMyReview.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//내 리뷰 수정
	@RequestMapping("/member/memberReviewUpdate.do")
	public ModelAndView memberReviewUpdate(ModelAndView mv, @RequestParam Map param) {
		int result=service.memberReviewUpdate(param);
		String msg="리뷰수정에 실패하였습니다. 다시 시도해주세요.";
		if(result>0) {
			msg="리뷰를 수정하였습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/member/memberMyReview.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//마이페이지 - 사용가능 쿠폰
	@RequestMapping("/member/memberCouponListSelect.do")
	public ModelAndView memberCouponListSelect(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage) {
		String memberId=((Member)session.getAttribute("loginMember")).getMemberId();
		int totalData=service.memberCouponListCount(memberId);
		List<Coupon> list=service.memberCouponListSelect(memberId,cPage,numPerpage);
		
		mv.addObject("totalData", totalData);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberCouponListSelect.do"));
		mv.setViewName("member/memberCouponList");
		return mv;
	}
		
	//마이페이지 - 기간만료 쿠폰
	@RequestMapping("/member/memberEndCouponListSelect.do")
	public ModelAndView memberEndCouponListSelect(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage) {
		String memberId=((Member)session.getAttribute("loginMember")).getMemberId();
		int EndtotalData=service.memberEndCouponListCount(memberId); //기간만료 쿠폰개수
		int totalData=service.memberCouponListCount(memberId); //사용가능 쿠폰개수
		List<Coupon> list=service.memberEndCouponListSelect(memberId,cPage,numPerpage);
			
		mv.addObject("totalData", totalData);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageFactory.getPageBar(EndtotalData, cPage, numPerpage,5,"memberEndCouponListSelect.do"));
		mv.setViewName("member/memberEndCouponList");
		return mv;
	}	
	
	//마이페이지 - 주문목록/배송조회
	@RequestMapping("/member/memberOrderListSelect.do")
	public ModelAndView memberOrderListSelect(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage) {
		String memberId=((Member)session.getAttribute("loginMember")).getMemberId();
		List<Payment> list=service.memberOrderListSelect(memberId,cPage,numPerpage);
		mv.addObject("list",list);
		mv.addObject("pageBar", PageFactory.getPageBar(service.memberOrderListCount(memberId), cPage, numPerpage,5,"memberOrderListSelect.do"));
		mv.setViewName("member/memberOrderList");
		return mv;
	}
	
	//마이페이지 -주문목록/배송조회 결제취소
	@RequestMapping("/member/memberOrderListDelete.do")
	@ResponseBody
	public boolean memberOrderListDelete(int paymentNo) {	
		return service.memberOrderListDelete(paymentNo);
	}
}
