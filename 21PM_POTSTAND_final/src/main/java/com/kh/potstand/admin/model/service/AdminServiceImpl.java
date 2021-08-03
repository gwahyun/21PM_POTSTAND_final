package com.kh.potstand.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.admin.model.dao.AdminDao;
import com.kh.potstand.admin.model.vo.Answer;
import com.kh.potstand.admin.model.vo.Credit;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Request;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;
import com.kh.potstand.event.model.vo.Event;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {



	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public Map<String, String> dateOne() {
		// TODO Auto-generated method stub
		return dao.dateOne(session);
	}

	@Override
	public List<Member> memberSelect(int cPage,int numPerpage,Map param) {
		return dao.memberSelect(session,cPage,numPerpage,param);
	}

	@Override
	public int memberSelectCount(Map param) {
		return dao.memeberSelectCount(session,param);
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(session,memberId);
	}

	@Override
	public List<Notice> noticeSelect(int cPage,int numPerpage) {
		return dao.noticeSelect(session,cPage,numPerpage);
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
	public List<Faq> faqSelect(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.faqSelect(session,cPage,numPerpage);
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
	public List<Qna> qnaSelectList(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.qnaSelectList(session,cPage,numPerpage);
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
	public List<Review> reviewManager(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.reviewManager(session,cPage,numPerpage);
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
	public List<Qna> qnaSelectListNo(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.qnaSelectListNo(session,cPage,numPerpage);
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
	public Answer answerSelectOne(int no) {
		// TODO Auto-generated method stub
		return dao.answerSelectOne(session,no);
	}
	
	@Override
	public int qnaReplyUpdateEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.qnaReplyUpdateEnd(session,param);
	}

	@Override
	public int eventInsertEnd(Event e) {
		// TODO Auto-generated method stub
		return dao.eventInsertEnd(session,e);
	}

	@Override
	public List<Event> eventSelect(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.eventSelect(session,cPage,numPerpage);
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
	public int eventUpdateEnd(Event e) {
		// TODO Auto-generated method stub
		return dao.eventUpdateEnd(session,e);
	}

	@Override
	public int eventDelete(int no) {
		// TODO Auto-generated method stub
		return dao.eventDelete(session,no);
	}

	@Override
	public int eventSelectCount() {
		// TODO Auto-generated method stub
		return dao.eventSelectCount(session);
	}

	@Override
	public int faqSelectCount() {
		// TODO Auto-generated method stub
		return dao.faqSelectCount(session);
	}

	@Override
	public int noticeSelectCount() {
		// TODO Auto-generated method stub
		return dao.noticeSelectCount(session);
	}

	@Override
	public int reviewManagerCount() {
		// TODO Auto-generated method stub
		return dao.reviewManagerCount(session);
	}

	@Override
	public int qnaManagerCount() {
		// TODO Auto-generated method stub
		return dao.qnaManagerCount(session);
	}

	@Override
	public int qnaManagerNoCount() {
		// TODO Auto-generated method stub
		return dao.qnaManagerNoCount(session);
	}

	@Override
	public List<Book> productSelectList(Map param,int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.productSelectList(session,param,cPage,numPerpage);
	}

	@Override
	public int productSelectListCount(Map param) {
		// TODO Auto-generated method stub
		return dao.productSelectListCount(session,param);
	}

	@Override
	public int requestSelectCount(Map param) {
		// TODO Auto-generated method stub
		return dao.requestSelectListCount(session,param);
	}

	@Override
	public List<Request> requestSelect(int cPage, int numPerpage,Map param) {
		// TODO Auto-generated method stub
		return dao.requestSelectList(session,cPage,numPerpage,param);
	}

	@Override
	public int stockManagerCount(Map param) {
		// TODO Auto-generated method stub
		return dao.stockManagerCount(session,param);
	}

	@Override
	public List<Book> stockManagerList(int cPage, int numPerpage,Map param) {
		// TODO Auto-generated method stub
		return dao.stockManagerList(session,cPage,numPerpage,param);
	}

	@Override
	public int stockUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.stockUpdate(session,param);
	}

	@Override
	public int requestUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.requestUpdate(session,param);
	}

	@Override
	public void eventBookInsert(String string) {
		// TODO Auto-generated method stub
		dao.eventBookInsert(session,string);
		
	}

	@Override
	public List<String> eventBookList(int no) {
		// TODO Auto-generated method stub
		return dao.eventBookList(session,no);
	}

	@Override
	public void eventBookUpdate(Map param) {
		dao.eventBookUpdate(session,param);
		
	}

	@Override
	public List<Book> productSelectList(Map param) {
		// TODO Auto-generated method stub
		return dao.productSelectList(session,param);
	}

	@Override
	public int requestSelectNoCount(Map param) {
		// TODO Auto-generated method stub
		return dao.requestSelectNoCount(session,param);
	}

	@Override
	public List<Request> requestSelectNo(int cPage, int numPerpage, Map param) {
		// TODO Auto-generated method stub
		return dao.requestSelectNo(session,cPage,numPerpage,param);
	}

	@Override
	public Sort bookGenreSelectOne(String bookGenre) {
		// TODO Auto-generated method stub
		return dao.bookGenreSelectOne(session,bookGenre);
	}

	@Override
	public int productInsertEnd(Book b) {
		// TODO Auto-generated method stub
		return dao.productInsertEnd(session,b);
	}

	@Override
	public List<String> dateList(String startDate) {
		// TODO Auto-generated method stub
		return dao.startDate(session,startDate);
	}

	@Override
	public int priceDateList(String str) {
		// TODO Auto-generated method stub
		return dao.priceDateList(session,str);
	}

	@Override
	public int amountDateList(String str) {
		// TODO Auto-generated method stub
		return dao.amountDateList(session,str);
	}

	@Override
	public int sumPrice(String startDate) {
		// TODO Auto-generated method stub
		return dao.sumPrice(session, startDate);
	}

	@Override
	public List<Credit> creditDateList(String startDate) {
		// TODO Auto-generated method stub
		return dao.creditDateList(session,startDate);
	}

	@Override
	public int eventSelectCount(Map param) {
		// TODO Auto-generated method stub
		return dao.eventSelectCount(session,param);
	}

	@Override
	public List<Book> eventBookSelectList(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.eventBookSelectList(session,param,cPage,numPerpage);
	}

	@Override
	public int cartInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.cartInsert(session,param);
	}
	
	
	
	
	

}
