package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;

public interface MemberService {

	//로그인
	Member memberSelect(@RequestParam Map param);
	
	//회원가입
	int memberInsert(Member m) throws Exception;
	
	//이메일로 아이디찾기
	Member memberSearchIdSelect(String memberEmail);
	
	//아이디,이메일로 아이디찾기
	Member memberSearchIdEmailSelect(Member m);
	
	//비밀번호 재설정
	int memberResetPwd(Member m);
	
	//비밀번호 복구
	int memberRestorePwd(Member m);
	
	//회원탈퇴
	int memberDelete(@RequestParam Map param) throws Exception;
	
	//비밀번호 수정
	int memberUpdatePwd(@RequestParam Map param);
	
	//회원정보 수정
	int memberUpdate(Member m) throws Exception;
	
	//포인트 기록 조회
	List<Point> memberPointSelect(String memberId);
	
	//포인트 기록 조회(페이징 처리)
	List<Point> memberPointSelect(String memberId, int cPage, int numPerpage);
	
	//포인트 기록 총 개수
	int memberPointSelectCount(String memberId);
	
	//찜목록 총 개수
	int memberHeartListCount(String memberId);
	
	//찜목록 리스트
	List<Heart> memberHeartListSelect(String memberId, int cPage, int numPerpage);
	
	//찜목록 장바구니에 등록되어 있는 책인지 조회
	Cart memberCartSelect(Map param);
	
	//찜목록 장바구니에 있으면 amount +1
	int memberOverlapCartUpdate(Map param);
	
	//찜목록 선택 찜 장바구니로 이동
	int memberChoiceCartInsert(Map param);
	
	//찜목록 지우기
	int memberHeartDelete(Map param);
	
	//내 리뷰 관리 - 리뷰리스트 총 개수
	int memberReviewListCount(Map param);
	
	//내 리뷰 관리 - 리뷰리스트
	List<Review> memberReviewListSelect(Map param, int cPage, int numPerPage);
	
	//내 리뷰 삭제
	int memberReviewDelete(Map param);
	
	//내 리뷰 수정
	int memberReviewUpdate(Map param);
	
	//마이페이지 사용가능 쿠폰리스트 총 개수
	int memberCouponListCount(String memberId);
	
	//마이페이지 사용가능 쿠폰리스트
	List<Coupon> memberCouponListSelect(String memberId, int cPage, int numPerpage);
	
	//마이페이지 기간만료 쿠폰리스트 총 개수
	int memberEndCouponListCount(String memberId);
		
	//마이페이지 기간만료 쿠폰리스트
	List<Coupon> memberEndCouponListSelect(String memberId, int cPage, int numPerpage);
	
	//마이페이지 - 주문확인리스트
	List<Payment> memberOrderListSelect(String memberId, int cPage, int numPerpage);
	
	//마이페이지 - 주문확인리스트 총개수
	int memberOrderListCount(String memberId);
	
	//마이페이지 - 모든 결제리스트 조회
	List<Payment> memberOrderListAllSelect(String memberId);
	
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
	
	//공지사항 조회수처리
	int noticeReadCount(Notice n);
	
	
}
