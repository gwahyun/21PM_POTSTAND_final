package com.kh.potstand.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;

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

	int qnaInsert(Map param);
}
