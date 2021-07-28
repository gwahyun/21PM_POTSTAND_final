package com.kh.potstand.event.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.event.model.dao.EventDaoimpl;
import com.kh.potstand.event.model.vo.Event;

@Service
public class EventServiceimpl implements EventService {

	@Autowired
	private EventDaoimpl dao;
	@Autowired
	private SqlSession session;
	
	public List<Event> selectEventList() {
		return dao.selectEventList(session);
	}

	@Override
	public Event selectEventPost(int no) {
		// TODO Auto-generated method stub
		return dao.selectEventPost(session, no);
	}

	@Override
	public int insertCoupon(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertCoupon(session, map);
	}

}
