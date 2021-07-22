package com.kh.potstand.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

	@RequestMapping("event/eventList.do")
	public String eventList() {
		return "event/eventList";
	}
}
