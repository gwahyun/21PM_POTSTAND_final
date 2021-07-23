package com.kh.potstand.event.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.event.model.vo.Event;

public interface EventService {

	public List<Event> selectEventList();
}
