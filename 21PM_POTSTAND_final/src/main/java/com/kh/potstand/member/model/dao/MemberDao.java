package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.vo.Cart;

public interface MemberDao {

	//로그인
	Member memberSelect(SqlSession session,@RequestParam Map param);
	
	//회원가입 -> 개인정보
	int memberInsert(SqlSession session,Member m);
	
	//회원가입 -> 주소
	int addressInsert(SqlSession session,Address a);
	
	//이메일로 아이디찾기
	Member memberSearchIdSelect(SqlSession session,String memberEmail);
	
	//비밀번호 재설정
	int memberResetPwd(SqlSession session, Member m);
	
	//회원 주소삭제
	int memberAddrDelete(SqlSession session, @RequestParam Map param);
	
	//회원탈퇴
	int memberDelete(SqlSession session, @RequestParam Map param);
	
	//비밀번호 변경
	int memberUpdatePwd(SqlSession session, @RequestParam Map param);
	
	//notice List 호출 (공지사항 페이지)
	List<Notice> noticeSelectList(SqlSession session, int cPage, int numPerPage);
	
	//notice Content 호출
	Notice noticeSelectOne(SqlSession session, int noticeNo);
	
	//notice Count (totalData용)
	int noticeSelectCount(SqlSession session);
	
	
	//내 Qna 내역 확인
	List<Qna> qnaSelectList(SqlSession session, String memberId, int cPage, int numPerPage);
		
	//qna Content 호출
	Qna qnaSelectOne(SqlSession session, int qnaNo);
	
	//1:1 문의 작성
	int qnaInsert(SqlSession session, Qna q);

	
	//qna Count (totalData용)
	int qnaSelectCount(SqlSession session, String memberId);
	
	//Cart 조회
	List<Cart> cartSelectList(SqlSession session, String memberId);
	
	//Cart 항목삭제
	int cartObjDelete(SqlSession session, Map param);
}
