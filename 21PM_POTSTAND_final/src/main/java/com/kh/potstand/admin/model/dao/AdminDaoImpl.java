package com.kh.potstand.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> memberSelect(SqlSessionTemplate session) {
		return session.selectList("admin.memberSelect");
	}

	@Override
	public int memeberSelectCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.memberSelectCount");
	}

	@Override
	public int memberDelete(SqlSessionTemplate session, String memberId) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberDelete", memberId);
	}

	@Override
	public List<Notice> noticeSelect(SqlSessionTemplate session) {
		return session.selectList("admin.noticeSelect");
	}

	@Override
	public int noticeInsert(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.noticeInsert", param);
	}

	@Override
	public Notice noticeUpdate(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.noticeUpdate",no);
	}

	@Override
	public int noticeUpdateEnd(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.noticeUpdateEnd", param);
	}

	@Override
	public int noticeDelete(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("admin.noticeDelte", no);
	}

	@Override
	public List<Faq> faqSelect(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.faqSelect");
	}

	@Override
	public int faqInsert(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.faqInsert", param);
	}

	@Override
	public Faq faqUpdate(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.faqUpdate", no);
	}

	@Override
	public int faqUpdateEnd(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.faqUpdateEnd", param);
	}

	@Override
	public int faqDelete(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("admin.faqDelete", no);
	}

	@Override
	public List<Qna> qnaSelectList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.qnaSelectList");
	}

	@Override
	public int qnaInsert(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.qnaInsert", param);
	}

	@Override
	public Qna qnaSelectOne(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.qnaSelectOne", no);
	}

	@Override
	public int qnaAnswer(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int result = session.insert("admin.qnaAnswer", param);
		return result>0?session.update("admin.qnaStatusUpdate", param):0;
	}

	@Override
	public int qnaDelete(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("admin.qnaDelete", no);
	}

}
