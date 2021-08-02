package com.kh.potstand.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDaoImpl implements AdminDao {

	
	@Override
	public Map<String, String> dateOne(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.dateOne");
	}

	@Override
	public List<Member> memberSelect(SqlSessionTemplate session,int cPage,int numPerpage,Map param) {
		return session.selectList("admin.memberSelect",param,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int memeberSelectCount(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.memberSelectCount",param);
	}

	@Override
	public int memberDelete(SqlSessionTemplate session, String memberId) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberDelete", memberId);
	}

	@Override
	public List<Notice> noticeSelect(SqlSessionTemplate session,int cPage,int numPerpage) {
		return session.selectList("admin.noticeSelect",null,new RowBounds((cPage-1)*numPerpage, numPerpage)
);
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
	public List<Faq> faqSelect(SqlSessionTemplate session,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.faqSelect",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
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
	public List<Qna> qnaSelectList(SqlSessionTemplate session,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.qnaSelectList",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
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

	@Override
	public List<Review> reviewManager(SqlSessionTemplate session,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.reviewManager",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int reviewDelete(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("admin.reviewDelete", no);
	}

	@Override
	public List<Address> memberAddressList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.memberAddressList");
	}

	@Override
	public List<Qna> qnaSelectListNo(SqlSessionTemplate session,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.qnaSelectListNo",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int newReview(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.newReview");
	}

	@Override
	public int answerNo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.answerNo");
	}
	
	@Override
	public Answer answerSelectOne(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.answerSelectOne",no);
	}
	

	@Override
	public int qnaReplyUpdateEnd(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.qnaReplyUpdateEnd", param);
	}

	@Override
	public int eventInsertEnd(SqlSessionTemplate session, Event e) {
		// TODO Auto-generated method stub
		return session.insert("admin.eventInsertEnd", e);
	}

	@Override
	public List<Event> eventSelect(SqlSessionTemplate session,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.eventSelect",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public Event eventSelectOne(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.eventSelectOne",no);
	}

	/*
	 * @Override public int eventEnd(SqlSessionTemplate session, int no) { // TODO
	 * Auto-generated method stub return session.update("admin.eventEnd", no); }
	 */

	@Override
	public int eventEndUpdate(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.eventEndUpdate");
	}

	@Override
	public int eventUpdateEnd(SqlSessionTemplate session, Event e) {
		// TODO Auto-generated method stub
		return session.update("admin.eventUpdateEnd", e);
	}

	@Override
	public int eventDelete(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("admin.eventDelete", no);
	}

	@Override
	public int eventSelectCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.eventSelectCount");
	}

	@Override
	public int faqSelectCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.faqSelectCount");
	}

	@Override
	public int noticeSelectCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.noticeSelectCount");
	}

	@Override
	public int reviewManagerCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.reviewManagerCount");
	}


	@Override
	public int qnaManagerCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.qnaManagerCount");
	}


	@Override
	public int qnaManagerNoCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.qnaManagerNoCount");
	}

	@Override
	public List<Book> productSelectList(SqlSessionTemplate session, Map param,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productSelectList", param, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int productSelectListCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.productSelectListCount",param);
	}

	@Override
	public int requestSelectListCount(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.requestSelectListCount",param);
	}

	@Override
	public List<Request> requestSelectList(SqlSessionTemplate session,int cPage, int numPerpage,Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.requestSelectList", param, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int requestUpdate(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		int result = session.update("admin.stockUpdate", param);
		return result>0?session.update("admin.requestUpdate", param):0;
	}
	
	@Override
	public int stockManagerCount(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.stockManagerListCount",param);
	}

	@Override
	public List<Book> stockManagerList(SqlSessionTemplate session, int cPage, int numPerpage,Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.stockManagerList", param, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int stockUpdate(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		session.update("admin.requestUpdate", param);
		return session.update("admin.stockUpdate", param);
	}

	@Override
	public void eventBookInsert(SqlSessionTemplate session, String string) {
		// TODO Auto-generated method stub
		session.insert("admin.eventBookInsert", string);
	}

	@Override
	public List<String> eventBookList(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("admin.eventBookList", no);
	}

	@Override
	public void eventBookUpdate(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
	
		session.insert("admin.eventBookUpdate", param);
	}

	@Override
	public List<Book> productSelectList(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productSelectListNopage",param);
	}

	@Override
	public int requestSelectNoCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.requestSelectNoCount", param);
	}

	@Override
	public List<Request> requestSelectNo(SqlSessionTemplate session, int cPage, int numPerpage, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.requestSelectNo", param, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public Sort bookGenreSelectOne(SqlSessionTemplate session, String bookGenre) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.bookGenreSelectOne", bookGenre);
	}

	@Override
	public int productInsertEnd(SqlSessionTemplate session, Book b) {
		// TODO Auto-generated method stub
		return session.insert("admin.productInsertEnd", b);
	}

	@Override
	public List<String> startDate(SqlSessionTemplate session, String startDate) {
		// TODO Auto-generated method stub
		
		Map<String,String> map = new HashMap();
		if(startDate.equals("")) {
			startDate ="sysdate-6";
			map.put("startDate", startDate);
		}else {
			map.put("startDateStr", startDate);
		}
		return session.selectList("admin.startDate", map);
	}

	@Override
	public int priceDateList(SqlSessionTemplate session, String str) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.priceDateList", str);
	}

	@Override
	public int amountDateList(SqlSessionTemplate session, String str) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.amountDateList",str);
	}

	@Override
	public int sumPrice(SqlSessionTemplate session, String startDate) {
		Map<String,String> map = new HashMap();
		if(startDate.equals("")) {
			startDate ="sysdate-6";
			map.put("startDate", startDate);
		}else {
			map.put("startDateStr", startDate);
		}
		return session.selectOne("admin.sumPrice", map);
	}

	@Override
	public List<Credit> creditDateList(SqlSessionTemplate session, String startDate) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap();
		if(startDate.equals("")) {
			startDate ="sysdate-6";
			map.put("startDate", startDate);
		}else {
			map.put("startDateStr", startDate);
		}
		return session.selectList("admin.creditDateList", map);
	}
	
	
	
	

	

}
