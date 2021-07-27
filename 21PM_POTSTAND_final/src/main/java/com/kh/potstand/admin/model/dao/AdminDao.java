package com.kh.potstand.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.potstand.admin.model.vo.Answer;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Request;
import com.kh.potstand.admin.model.vo.Review;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.event.model.vo.Event;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

public interface AdminDao {

	List<Member> memberSelect(SqlSessionTemplate session, int cPage, int numPerpage);

	int memeberSelectCount(SqlSessionTemplate session);

	int memberDelete(SqlSessionTemplate session, String memberId);

	List<Notice> noticeSelect(SqlSessionTemplate session, int cPage, int numPerpage);

	int noticeInsert(SqlSessionTemplate session, Map param);

	Notice noticeUpdate(SqlSessionTemplate session, int no);

	int noticeUpdateEnd(SqlSessionTemplate session, Map param);

	int noticeDelete(SqlSessionTemplate session, int no);

	List<Faq> faqSelect(SqlSessionTemplate session, int cPage, int numPerpage);

	int faqInsert(SqlSessionTemplate session, Map param);

	Faq faqUpdate(SqlSessionTemplate session, int no);

	int faqUpdateEnd(SqlSessionTemplate session, Map param);

	int faqDelete(SqlSessionTemplate session, int no);

	List<Qna> qnaSelectList(SqlSessionTemplate session,int cPage,int numPerpage);

	int qnaInsert(SqlSessionTemplate session, Map param);

	Qna qnaSelectOne(SqlSessionTemplate session, int no);

	int qnaAnswer(SqlSessionTemplate session, Map param);

	int qnaDelete(SqlSessionTemplate session, int no);

	List<Review> reviewManager(SqlSessionTemplate session, int cPage, int numPerpage);

	int reviewDelete(SqlSessionTemplate session, int no);

	List<Address> memberAddressList(SqlSessionTemplate session);

	List<Qna> qnaSelectListNo(SqlSessionTemplate session, int cPage, int numPerpage);

	int newReview(SqlSessionTemplate session);

	int answerNo(SqlSessionTemplate session);

	int eventInsertEnd(SqlSessionTemplate session, Event e);

	List<Event> eventSelect(SqlSessionTemplate session, int cPage, int numPerpage);

	Event eventSelectOne(SqlSessionTemplate session, int no);

	//int eventEnd(SqlSessionTemplate session, int no);

	int eventEndUpdate(SqlSessionTemplate session);

	int eventUpdateEnd(SqlSessionTemplate session, Event e);

	int eventDelete(SqlSessionTemplate session, int no);

	int eventSelectCount(SqlSessionTemplate session);

	int faqSelectCount(SqlSessionTemplate session);

	int noticeSelectCount(SqlSessionTemplate session);

	int reviewManagerCount(SqlSessionTemplate session);

	int qnaManagerCount(SqlSessionTemplate session);

	int qnaManagerNoCount(SqlSessionTemplate session);

	List<Book> productSelectList(SqlSessionTemplate session, Map param);

	int productSelectListCount(SqlSessionTemplate session, Map param);

	int requestSelectListCount(SqlSessionTemplate session, String type);

	List<Request> requestSelectList(SqlSessionTemplate session,int cPage, int numPerpage, String type);

	int stockManagerCount(SqlSessionTemplate session);

	List<Book> stockManagerList(SqlSessionTemplate session, int cPage, int numPerpage);

	int stockUpdate(SqlSessionTemplate session, Map param);

	int requestUpdate(SqlSessionTemplate session, Map param);

	Answer answerSelectOne(SqlSessionTemplate session, int no);

	int qnaReplyUpdateEnd(SqlSessionTemplate session, Map param);
}
