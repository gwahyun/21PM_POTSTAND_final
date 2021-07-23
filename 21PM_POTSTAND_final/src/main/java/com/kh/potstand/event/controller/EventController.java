package com.kh.potstand.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.potstand.event.model.service.EventServiceimpl;

@Controller
public class EventController {

	@Autowired
	private EventServiceimpl service;
	
	@RequestMapping("event/eventList.do")
	public String eventList(Model m) {
		m.addAttribute("list", service.selectEventList());
		
		return "event/eventList";
	}
}
