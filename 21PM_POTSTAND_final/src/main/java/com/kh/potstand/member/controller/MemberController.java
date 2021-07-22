package com.kh.potstand.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인페이지 불러오는 매소드
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	//로그인 계정확인 매소드
	@RequestMapping("/member/memberLoginEnd.do")
	@ResponseBody
	public Member memberLoginEnd(@RequestParam Map param, HttpSession session) {
		Member m=service.selectMember(param);
		log.debug("{}",m);
		if(m!=null) {
			//해당 계정이 잇으면 session생성
			session.setAttribute("loginMember", m);
		}
		
		return m;
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

	@RequestMapping("/member/jusoPopup.do")
	public String addressPopupTest() {
		return "member/jusoPopup";
	}
	
	//회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(Member m, Address a, ModelAndView mv) {	
		m.setMemberPwd(pwEncoder.encode(m.getMemberPwd())); //비밀번호 암호화처리하여 넣어줌
		
		//m.setAddress();
		log.debug("{}",m);
		log.debug("{}",a);
//		int result=service.insertMember(m);
//		
//		mv.addObject("msg", result>0?"회원가입에 성공하였습니다!":"회원가입에 실패하였습니다.");
//		mv.addObject("loc", "/");
//		mv.setViewName("common/msg");
		
		
		return mv;
	}
}
