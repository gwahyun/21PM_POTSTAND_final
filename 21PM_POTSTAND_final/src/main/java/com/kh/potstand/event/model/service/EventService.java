package com.kh.potstand.event.model.service;

import java.util.List;
import java.util.Map;

import com.kh.potstand.event.model.vo.Event;

public interface EventService {

	public List<Event> selectEventList();
	public Event selectEventPost(int no);
	public int insertCoupon(Map<String,String> map);
}
