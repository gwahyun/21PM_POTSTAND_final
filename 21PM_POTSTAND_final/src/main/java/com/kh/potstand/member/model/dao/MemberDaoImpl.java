package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(SqlSession session, Map param) {
		// TODO Auto-generated method stub	
		return session.selectOne("member.memberSelect", param);
	}

	//회원가입
	@Override
	public int memberInsert(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.memberInsert", m);
	}
	@Override
	public int addressInsert(SqlSession session, Address a) {
		// TODO Auto-generated method stub
		return session.insert("member.addressInsert", a);
	}
	

	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(SqlSession session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("function.noticeSelectList",null, row);
	}


	//notice Content 호출
	@Override
	public Notice noticeSelectOne(SqlSession session, int noticeNo) {
		return session.selectOne("function.noticeSelectOne",noticeNo);
	}


	//내 문의내역 호출
	@Override
	public List<Qna> qnaSelectList(SqlSession session, String memberId, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("function.qnaSelectList",memberId, row);
	}


	//내 문의내역 내용 조회
	@Override
	public Qna qnaSelectOne(SqlSession session, int qnaNo) {
		return session.selectOne("function.qnaSelectOne",qnaNo);
	}


	//1:1문의 작성
	@Override
	public int qnaInsert(SqlSession session, Qna q) {
		return session.insert("function.qnaInsert", q);
	}

	
}
