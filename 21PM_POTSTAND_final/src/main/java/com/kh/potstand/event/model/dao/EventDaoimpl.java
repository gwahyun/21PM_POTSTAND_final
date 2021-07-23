package com.kh.potstand.event.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.event.model.vo.Event;

@Repository
public class EventDaoimpl implements EventDao {

	@Override
	public List<Event> selectEventList(SqlSession session) {
		return session.selectList("selectEventList");
	}

	@Override
	public Event selectEventPost(SqlSession session, int no) {
		return session.selectOne("selectEventPost",no);
	}



}
