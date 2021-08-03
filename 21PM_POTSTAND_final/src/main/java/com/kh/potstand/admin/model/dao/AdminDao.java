package com.kh.potstand.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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
import com.kh.potstand.order.model.vo.Cart;

public interface AdminDao {

	List<Member> memberSelect(SqlSessionTemplate session, int cPage, int numPerpage, Map param);

	int memeberSelectCount(SqlSessionTemplate session, Map param);

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

	List<Book> productSelectList(SqlSessionTemplate session, Map param, int cPage, int numPerpage);

	int productSelectListCount(SqlSessionTemplate session, Map param);

	int requestSelectListCount(SqlSessionTemplate session, Map param);

	List<Request> requestSelectList(SqlSessionTemplate session,int cPage, int numPerpage, Map param);

	int stockManagerCount(SqlSessionTemplate session, Map param);

	List<Book> stockManagerList(SqlSessionTemplate session, int cPage, int numPerpage, Map param);

	int stockUpdate(SqlSessionTemplate session, Map param);

	int requestUpdate(SqlSessionTemplate session, Map param);

	Answer answerSelectOne(SqlSessionTemplate session, int no);

	int qnaReplyUpdateEnd(SqlSessionTemplate session, Map param);

	void eventBookInsert(SqlSessionTemplate session, String string);

	List<String> eventBookList(SqlSessionTemplate session, int no);

	void eventBookUpdate(SqlSessionTemplate session, Map param);

	List<Book> productSelectList(SqlSessionTemplate session, Map param);

	int requestSelectNoCount(SqlSessionTemplate session, Map param);

	List<Request> requestSelectNo(SqlSessionTemplate session, int cPage, int numPerpage, Map param);

	Sort bookGenreSelectOne(SqlSessionTemplate session, String bookGenre);

	int productInsertEnd(SqlSessionTemplate session, Book b);

	Map<String, String> dateOne(SqlSessionTemplate session);

	List<String> startDate(SqlSessionTemplate session, String startDate);

	int priceDateList(SqlSessionTemplate session, String str);

	int amountDateList(SqlSessionTemplate session, String str);

	int sumPrice(SqlSessionTemplate session, String startDate);

	List<Credit> creditDateList(SqlSessionTemplate session, String startDate);

	int eventSelectCount(SqlSessionTemplate session, Map param);

	List<Book> eventBookSelectList(SqlSessionTemplate session, Map param, int cPage, int numPerpage);

	int cartInsert(SqlSessionTemplate session, Map param);

	Cart cartSelectDistinct(SqlSessionTemplate session, Map param);

	int cartSelectOnePlus(SqlSessionTemplate session, Map param);
}
