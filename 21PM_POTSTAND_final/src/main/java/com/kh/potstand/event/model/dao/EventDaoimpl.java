package com.kh.potstand.event.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.event.model.vo.Event;

@Repository
public class EventDaoimpl implements EventDao {

	//이벤트 목록 가져오기
	@Override
	public List<Event> selectEventList(SqlSession session) {
		return session.selectList("selectEventList");
	}
	//이벤트 상세페이지 가져오기
	@Override
	public Event selectEventPost(SqlSession session, int no) {
		return session.selectOne("selectEventPost",no);
	}
	//쿠폰 발급하기
	@Override
	public int insertCoupon(SqlSession session, Map<String, String> map) {
		return session.insert("insertCoupon", map);
	}



}
