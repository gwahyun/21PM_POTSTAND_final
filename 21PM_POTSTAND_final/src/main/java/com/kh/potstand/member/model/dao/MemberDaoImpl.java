package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public Member selectMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		
		return session.selectOne("member.selectMember", param);
	}

	

	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(SqlSession session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("notice.noticeSelectList",null, row);
	}


	//notice Content 호출
	@Override
	public Notice noticeSelectOne(SqlSession session, int noticeNo) {
		return session.selectOne("notice.noticeSelectOne",noticeNo);
	}
	
	
}
