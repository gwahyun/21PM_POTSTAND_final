package com.kh.potstand.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Member;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Review;

public interface AdminDao {

	List<Member> memberSelect(SqlSessionTemplate session);

	int memeberSelectCount(SqlSessionTemplate session);

	int memberDelete(SqlSessionTemplate session, String memberId);

	List<Notice> noticeSelect(SqlSessionTemplate session);

	int noticeInsert(SqlSessionTemplate session, Map param);

	Notice noticeUpdate(SqlSessionTemplate session, int no);

	int noticeUpdateEnd(SqlSessionTemplate session, Map param);

	int noticeDelete(SqlSessionTemplate session, int no);

	List<Faq> faqSelect(SqlSessionTemplate session);

	int faqInsert(SqlSessionTemplate session, Map param);

	Faq faqUpdate(SqlSessionTemplate session, int no);

	int faqUpdateEnd(SqlSessionTemplate session, Map param);

	int faqDelete(SqlSessionTemplate session, int no);

	List<Qna> qnaSelectList(SqlSessionTemplate session);

	int qnaInsert(SqlSessionTemplate session, Map param);

	Qna qnaSelectOne(SqlSessionTemplate session, int no);

	int qnaAnswer(SqlSessionTemplate session, Map param);

	int qnaDelete(SqlSessionTemplate session, int no);

	List<Review> reviewManager(SqlSessionTemplate session);

	int reviewDelete(SqlSessionTemplate session, int no);
}
