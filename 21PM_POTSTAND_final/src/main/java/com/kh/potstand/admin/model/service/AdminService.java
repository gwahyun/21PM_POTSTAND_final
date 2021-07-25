package com.kh.potstand.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.potstand.admin.model.vo.Address;
import com.kh.potstand.admin.model.vo.Event;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Review;

public interface AdminService {

	List<Member> memberSelect();

	int memberSelectCount();

	int memberDelete(String memberId);

	List<Notice> noticeSelect();

	int noticeInsert(Map param);

	Notice noticeUpdate(int no);

	int noticeUpdateEnd(Map param);

	int noticeDelete(int no);

	List<Faq> faqSelect();

	int faqInsert(Map param);

	Faq faqUpdate(int no);

	int faqUpdateEnd(Map param);

	int faqDelete(int no);

	List<Qna> qnaSelectList();

	List<Qna> qnaSelectListNo();
	
	int qnaInsert(Map param);

	Qna qnaSelectOne(int no);

	int qnaAnswer(Map param);

	int qnaDelete(int no);

	List<Review> reviewManager();

	int reviewDelete(int no);

	List<Address> memberAddressList();

	int newReview();

	int answerNo();

	int eventInsertEnd(Map param);

	List<Event> eventSelect();

	Event eventSelectOne(int no);

	//int eventEnd(int no);
    //날짜 지났는지 확인하고 지났으면 종료하는 메소드임
	int eventEndUpdate();

	int eventUpdateEnd(Map param);

	int eventDelete(int no);



}
