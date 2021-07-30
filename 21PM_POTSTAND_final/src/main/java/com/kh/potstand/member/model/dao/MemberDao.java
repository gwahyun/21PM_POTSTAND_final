package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
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
	
	//회원정보 수정
	int memberUpdate(SqlSession session, Member m);

	//회원주소 수정
	int addressUpdate(SqlSession session, Address a);
	
	//포인트 기록 조회
	List<Point> memberPointSelect(SqlSession session, String memberId);
	
	//포인트 기록 조회(페이징 처리)
	List<Point> memberPointSelect(SqlSession session, String memberId, int cPage, int numPerpage);
	
	//포인트 기록 총 개수
	int memberPointSelectCount(SqlSession session, String memberId);
	
	//찜목록 개수
	int memberHeartListCount(SqlSession session, String memberId);
	
	//찜목록 리스트
	List<Heart> memberHeartListSelect(SqlSession session, String memberId, int cPage, int numPerpage);
	
	//찜목록 등록전 장바구니에 등록되어 있는 책인지 조회
	Cart memberCartSelect(SqlSession session, Map param);
	
	//찜목록 장바구니에 있으면 amount +1
	int memberOverlapCartUpdate(SqlSession session,Map param);
	
	//찜목록 - 선택 장바구니에담기
	int memberChoiceCartInsert(SqlSession session,Map param);
	
	//찜목록 지우기
	int memberHeartDelete(SqlSession session,Map param);
	
	//내 리뷰 관리 - 리뷰리스트 총 개수
	int memberReviewListCount(SqlSession session,Map param);
		
	//내 리뷰 관리 - 리뷰리스트
	List<Review> memberReviewListSelect(SqlSession session,Map param,int cPage,int numPerpage);
	
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
	
	//Cart 항목삭제/전체삭제/선택삭제
	int cartObjDelete(SqlSession session, Map param);
	int cartObjDelete(SqlSession session, List<String> param);
	
	//cart bookAmount update
	int cartBookAmountUpdate(SqlSession session, Map param);
	
	//cart usedCoupon update
	int cartCouponUpdate(SqlSession session, Map param);
}
