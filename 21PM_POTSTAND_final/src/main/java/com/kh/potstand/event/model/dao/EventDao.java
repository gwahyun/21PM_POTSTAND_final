package com.kh.potstand.event.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.event.model.vo.Event;

public interface EventDao {

	public List<Event> selectEventList(SqlSession session);
}
