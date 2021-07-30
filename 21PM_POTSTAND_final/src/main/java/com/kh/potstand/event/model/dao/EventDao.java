package com.kh.potstand.event.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.event.model.vo.Event;

public interface EventDao {

	public List<Event> selectEventList(SqlSession session);
	public Event selectEventPost(SqlSession session, int no);
	public int countCoupon(SqlSession session, Map<String,String> map);
	public int insertCoupon(SqlSession session, Map<String,String>map);
}
