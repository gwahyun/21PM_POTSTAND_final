package com.kh.potstand.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
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
	@ResponseBody
	public Member memberLoginEnd(@RequestParam Map param, HttpSession session, HttpServletResponse response) throws NoSuchAlgorithmException,
	UnsupportedEncodingException, GeneralSecurityException {
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
				//암호화한정보 다시 복호화
				m.setMemberEmail(aes.decrypt(m.getMemberEmail()));
				m.setMemberPhone(aes.decrypt(m.getMemberPhone()));
				log.debug("{}",m.getAddresses());
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
			service.memberInsert(m);
		}catch(Exception e) {
			msg=e.getMessage();
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/");
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
				messageHelper.setTo(memberEmail); // 받는사람 이메일
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
	public String memberMypage() {
		return "member/memberMypage";
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
}
