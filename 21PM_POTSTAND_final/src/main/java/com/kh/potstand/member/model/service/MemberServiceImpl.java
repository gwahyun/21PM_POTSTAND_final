package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.member.model.dao.MemberDao;
import com.kh.potstand.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Member selectMember(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,param);
	}
	

	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(int cPage, int numPerPage) {
		return dao.noticeSelectList(session, cPage, numPerPage);
	}

	//notice Content 호출
	@Override
	public Notice noticeSelectOne(int noticeNo) {
		return dao.noticeSelectOne(session, noticeNo);
	}
	
	
	

}
