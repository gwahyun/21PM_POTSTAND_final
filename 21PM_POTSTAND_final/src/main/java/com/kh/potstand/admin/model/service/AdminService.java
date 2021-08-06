package com.kh.potstand.admin.model.service;

import java.util.List;
import java.util.Map;

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

public interface AdminService {

	List<Member> memberSelect(int cPage, int numPerpage, Map param);

	int memberSelectCount(Map param);

	int memberDelete(String memberId);

	List<Notice> noticeSelect(int cPage, int numPerpage);

	int noticeInsert(Map param);

	Notice noticeUpdate(int no);

	int noticeUpdateEnd(Map param);

	int noticeDelete(int no);

	List<Faq> faqSelect(int cPage, int numPerpage);

	int faqInsert(Map param);

	Faq faqUpdate(int no);

	int faqUpdateEnd(Map param);

	int faqDelete(int no);

	List<Qna> qnaSelectList(int cPage, int numPerpage);

	List<Qna> qnaSelectListNo(int cPage, int numPerpage);
	
	int qnaInsert(Map param);

	Qna qnaSelectOne(int no);

	int qnaAnswer(Map param);

	int qnaDelete(int no);

	List<Review> reviewManager(int cPage, int numPerpage);

	int reviewDelete(int no);

	List<Address> memberAddressList();

	int newReview();

	int answerNo();

	int eventInsertEnd(Event e);

	List<Event> eventSelect(int cPage, int numPerpage);

	Event eventSelectOne(int no);

	//int eventEnd(int no);
    //날짜 지났는지 확인하고 지났으면 종료하는 메소드임
	int eventEndUpdate();

	int eventUpdateEnd(Event e);

	int eventDelete(int no);

	int eventSelectCount();

	int faqSelectCount();

	int noticeSelectCount();

	int reviewManagerCount();

	int qnaManagerCount();

	int qnaManagerNoCount();

	List<Book> productSelectList(Map param, int cPage, int numPerpage);

	int productSelectListCount(Map param);

	int requestSelectCount(Map param);

	List<Request> requestSelect(int cPage, int numPerpage, Map param);

	int stockManagerCount(Map param);

	List<Book> stockManagerList(int cPage, int numPerpage, Map param);

	int stockUpdate(Map param);

	int requestUpdate(Map param);

	Answer answerSelectOne(int no);

	int qnaReplyUpdateEnd(Map param);

	void eventBookInsert(String string);

	List<String> eventBookList(int no);

	void eventBookUpdate(Map param);

	List<Book> productSelectList(Map param);

	int requestSelectNoCount(Map param);

	List<Request> requestSelectNo(int cPage, int numPerpage, Map param);

	Sort bookGenreSelectOne(String bookGenre);

	int productInsertEnd(Book b);

	Map<String, String> dateOne();

	List<String> dateList(String startDate);

	int priceDateList(String str);

	int amountDateList(String str);

	int sumPrice(String startDate);

	List<Credit> creditDateList(String startDate);

	int eventSelectCount(Map param);

	List<Book> eventBookSelectList(Map param, int cPage, int numPerpage);

	int cartInsert(Map param);

	Cart cartSelectDistinct(Map param);

	int cartSelectOnePlus(Map param);

	int statusUpdate(Map param);

	Book bookSelectOne(int no);

	int productUpdate(Book b);

	int productDelete(int no);

	Map<String, Object> orderCountMap();

	Request bookRequestMemberCheck(Map param);

	int bookRequest(Map param);

	int requestCount();




}
