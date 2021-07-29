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
	
	//이벤트 리스트를 가져오는 메소드
	public List<Event> selectEventList() {
		return dao.selectEventList(session);
	}
	//이벤트 상세를 가져오는 메소드
	@Override
	public Event selectEventPost(int no) {
		// TODO Auto-generated method stub
		return dao.selectEventPost(session, no);
	}

	//쿠폰을 보유하고 있는지 확인하고 발급해주는 메소드
	@Override
	public int insertCoupon(Map<String, String> map) {
		int result = dao.countCoupon(session, map);
		if(result>0) {
			return 0;
		}else {
			return dao.insertCoupon(session, map);
		}
	}

}
