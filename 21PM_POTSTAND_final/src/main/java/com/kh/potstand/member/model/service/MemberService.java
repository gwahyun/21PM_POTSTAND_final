package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.vo.Member;

public interface MemberService {

	//로그인
	Member memberSelect(@RequestParam Map param);
	
	//회원가입
	int memberInsert(Member m) throws Exception;
	
	//이메일로 아이디찾기
	Member memberSearchIdSelect(String memberEmail);
	
	//비밀번호 재설정
	Member memberResetPwd(Member m) throws Exception;
	
	//회원탈퇴
	int memberDelete(@RequestParam Map param) throws Exception;
	
	//비밀번호 수정
	int memberUpdatePwd(@RequestParam Map param);

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
}
