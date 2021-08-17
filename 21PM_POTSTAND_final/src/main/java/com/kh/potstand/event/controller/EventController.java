package com.kh.potstand.event.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.event.model.service.EventServiceimpl;
import com.kh.potstand.member.model.vo.Member;

@Controller
public class EventController {

	@Autowired
	private EventServiceimpl service;
	
	//이벤트 리스트 페이지 전환용 메소드 
	@RequestMapping("event/eventlist.do")
	public String eventList(Model m) {
		m.addAttribute("eventList", service.selectEventList());
		
		return "event/eventList";
	}
	
	//이벤트 상세페이지 조회 메소드
	@RequestMapping("event/eventpost.do")
	public String eventPost(@RequestParam(value="no") int no, Model m) {
		m.addAttribute("event", service.selectEventPost(no));
		return "event/eventPost";
	}
	
	//회원에게 쿠폰 발급하는 메소드
	@RequestMapping("event/getcoupon.do")
	public String getCoupon(@RequestParam(value="no") int no, 
							@RequestParam(value="start") String start,
							@RequestParam (value="end") String end, 
							Model m, 
							HttpSession session) {
		
		//로그인 확인
		if(session.getAttribute("loginMember")==null) {
			m.addAttribute("msg","로그인 한 회원만 이용가능한 기능입니다");
			m.addAttribute("loc","/");
			return "common/msg";
		}
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		Map map = new HashMap<String, String>();
		start.replace("-","/");
		end.replace("-", "/");
		map.put("memberId", memberId);
		map.put("no", no);
		map.put("start", start);
		map.put("end", end);
		
		int result = service.insertCoupon(map);
		
		if(result>0) m.addAttribute("msg","쿠폰이 발급되었습니다");
		else m.addAttribute("msg", "이미 발급받으신 쿠폰입니다");
		
		m.addAttribute("loc","/event/eventpost.do?no="+no);
		return "common/msg";
	}
}
