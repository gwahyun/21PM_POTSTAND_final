package com.kh.potstand.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.common.AES256Util;
import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

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
	
	//로그인페이지 불러오는 매소드
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	//로그인 계정확인 매소드
	@RequestMapping("/member/memberLoginEnd.do")
	@ResponseBody
	public Member memberLoginEnd(@RequestParam Map param, HttpSession session, HttpServletResponse response) {
		//아이디저장 체크후 쿠키 저장
		String idCheck=(String)param.get("saveId");	
		if(idCheck.equals("true")) {
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
				//해당 계정이 잇으면 session생성
				session.setAttribute("loginMember", m);
				return m;
			}		
		}		
		return null;
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
		//기본배송지인지 확인
		a.setDefaultAddr(a.getDefaultAddr()!=null?"Y":"N");
		
		m.getAddresses().add(Address.builder().memberId(a.getMemberId()).postNo(a.getPostNo()).roadAddr(a.getRoadAddr())
				.oldAddr(a.getOldAddr()).detailAddr(a.getDetailAddr()).defaultAddr(a.getDefaultAddr()).build());
		
		String msg="회원가입에 성공하였습니다!";
		try {
			service.insertMember(m);
		}catch(Exception e) {
			msg=e.getMessage();
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//아이디찾기
	@RequestMapping("memberSerachId.do")
	public ModelAndView memberSearchId(String searchId, ModelAndView mv) {
		
		return mv;
	}
}
