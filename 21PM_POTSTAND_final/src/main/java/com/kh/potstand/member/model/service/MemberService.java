package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.vo.Cart;

public interface MemberService {

	//로그인
	Member memberSelect(@RequestParam Map param);
	
	//회원가입
	int insertMember(Member m) throws Exception;

	//notice List 호출 (공지사항 페이지)
	List<Notice> noticeSelectList(int cPage, int numPerPage);
	
	//notice Content 호출
	Notice noticeSelectOne(int noticeNo);
	
	//notice Count (totalData용)
	int noticeSelectCount();
	
	//내 문의 리스트 호출
	List<Qna> qnaSelectList(String memberId, int cPage, int numPerPage);
	
	//문의내역 조회
	Qna qnaSelectOne(int qnaNo);
	
	//1:1문의 작성
	int qnaInsert(Qna q);
	
	//qna Count (totalData용)
	int qnaSelectCount(String memberId);
	
	//Cart 조회
	List<Cart> cartSelectList(String memberId);
	
}
