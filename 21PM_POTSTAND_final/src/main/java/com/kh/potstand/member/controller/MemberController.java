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

import com.kh.potstand.admin.model.vo.Request;
import com.kh.potstand.common.AES256Util;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;

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
	public ModelAndView memberMypage(ModelAndView mv, String memberId) {
		List<Point> pointList=service.memberPointSelect(memberId);
		int totalPoint=0; //잔여 포인트
		for(Point p : pointList) {
			if(p.getUseLog().contains("구입")) {
				totalPoint+=p.getPoint();
			}else if(p.getUseLog().contains("사용")) {
				totalPoint-=p.getPoint();
			}
		}
		mv.addObject("mypageTotalPoint", totalPoint);
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
	public ModelAndView memberPoint(ModelAndView mv, String memberId, @RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage) {
		//잔여포인트
		List<Point> pointList=service.memberPointSelect(memberId);
		int totalPoint=0;
		for(Point p : pointList) {
			if(p.getUseLog().contains("구입")) {
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
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberPoint.do",
				"memberId="+memberId));
		mv.addObject("list", list);
		mv.setViewName("member/memberPoint");
		return mv;
	}
	
	//찜 목록 페이지 전환
	@RequestMapping("/member/memberHeartList.do")
	public ModelAndView memberHeartList(ModelAndView mv, String memberId) {
		return mv;
	}
}
