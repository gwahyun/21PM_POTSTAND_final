package com.kh.potstand.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.admin.model.dao.AdminDao;
import com.kh.potstand.admin.model.vo.Address;
import com.kh.potstand.admin.model.vo.Event;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Review;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Member> memberSelect() {
		return dao.memberSelect(session);
	}

	@Override
	public int memberSelectCount() {
		return dao.memeberSelectCount(session);
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(session,memberId);
	}

	@Override
	public List<Notice> noticeSelect() {
		return dao.noticeSelect(session);
	}

	@Override
	public int noticeInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.noticeInsert(session,param);
	}

	@Override
	public Notice noticeUpdate(int no) {
		return dao.noticeUpdate(session,no);
	}

	@Override
	public int noticeUpdateEnd(Map param) {
		return dao.noticeUpdateEnd(session, param);
	}

	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(session,no);
	}

	@Override
	public List<Faq> faqSelect() {
		// TODO Auto-generated method stub
		return dao.faqSelect(session);
	}

	@Override
	public int faqInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.faqInsert(session,param);
	}

	@Override
	public Faq faqUpdate(int no) {
		// TODO Auto-generated method stub
		return dao.faqUpdate(session,no);
	}

	@Override
	public int faqUpdateEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.faqUpdateEnd(session,param);
	}

	@Override
	public int faqDelete(int no) {
		// TODO Auto-generated method stub
		return dao.faqDelete(session,no);
	}

	@Override
	public List<Qna> qnaSelectList() {
		// TODO Auto-generated method stub
		return dao.qnaSelectList(session);
	}

	@Override
	public int qnaInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.qnaInsert(session,param);
	}

	@Override
	public Qna qnaSelectOne(int no) {
		// TODO Auto-generated method stub
		return dao.qnaSelectOne(session,no);
	}

	@Override
	public int qnaAnswer(Map param) {
		// TODO Auto-generated method stub
		return dao.qnaAnswer(session,param);
	}

	@Override
	public int qnaDelete(int no) {
		// TODO Auto-generated method stub
		return dao.qnaDelete(session,no);
	}

	@Override
	public List<Review> reviewManager() {
		// TODO Auto-generated method stub
		return dao.reviewManager(session);
	}

	@Override
	public int reviewDelete(int no) {
		// TODO Auto-generated method stub
		return dao.reviewDelete(session,no);
	}

	@Override
	public List<Address> memberAddressList() {
		// TODO Auto-generated method stub
		return dao.memberAddressList(session);
	}

	@Override
	public List<Qna> qnaSelectListNo() {
		// TODO Auto-generated method stub
		return dao.qnaSelectListNo(session);
	}

	@Override
	public int newReview() {
		// TODO Auto-generated method stub
		return dao.newReview(session);
	}

	@Override
	public int answerNo() {
		// TODO Auto-generated method stub
		return dao.answerNo(session);
	}

	@Override
	public int eventInsertEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.eventInsertEnd(session,param);
	}

	@Override
	public List<Event> eventSelect() {
		// TODO Auto-generated method stub
		return dao.eventSelect(session);
	}

	@Override
	public Event eventSelectOne(int no) {
		// TODO Auto-generated method stub
		return dao.eventSelectOne(session,no);
	}

	/*
	 * @Override public int eventEnd(int no) { // TODO Auto-generated method stub
	 * return dao.eventEnd(session,no); }
	 */

	@Override
	public int eventEndUpdate() {
		// TODO Auto-generated method stub
		return dao.eventEndUpdate(session);
	}

	@Override
	public int eventUpdateEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.eventUpdateEnd(session,param);
	}

	@Override
	public int eventDelete(int no) {
		// TODO Auto-generated method stub
		return dao.eventDelete(session,no);
	}


}
