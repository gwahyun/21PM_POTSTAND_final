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
	
	@RequestMapping("event/eventlist.do")
	public String eventList(Model m) {
		m.addAttribute("eventList", service.selectEventList());
		
		return "event/eventList";
	}
	
	@RequestMapping("event/eventpost.do")
	public String eventPost(@RequestParam(value="no") int no, Model m) {
		m.addAttribute("event", service.selectEventPost(no));
		return "event/eventPost";
	}
}
