package com.kh.potstand.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.event.model.service.EventServiceimpl;

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
}
