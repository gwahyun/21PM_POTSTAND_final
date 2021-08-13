package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;
import com.kh.potstand.order.model.vo.PaymentObj;

public interface MemberDao {

	//로그인
	Member memberSelect(SqlSession session,@RequestParam Map param);
	
	//회원가입 -> 개인정보
	int memberInsert(SqlSession session,Member m);
	
	//회원가입 -> 주소
	int addressInsert(SqlSession session,Address a);
	
	//이메일로 아이디찾기
	Member memberSearchIdSelect(SqlSession session,String memberEmail);
	
	//아이디,이메일로 아이디찾기
	Member memberSearchIdEmailSelect(SqlSession session,Member m);
	
	//비밀번호 재설정
	int memberResetPwd(SqlSession session, Member m);
	
	//비밀번호 복구
	int memberRestorePwd(SqlSession session, Member m);
	
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
	
	//내 리뷰 삭제
	int memberReviewDelete(SqlSession session,Map param);
	
	//내 리뷰 수정
	int memberReviewUpdate(SqlSession session,Map param);
	
	//마이페이지 사용가능 쿠폰 리스트 총 개수
	int memberCouponListCount(SqlSession session,String memberId);
	
	//마이페이지 사용가능 쿠폰 리스트
	List<Coupon> memberCouponListSelect(SqlSession session,String memberId,int cPage,int numPerpage);
	
	//마이페이지 기간만료 쿠폰리스트 총 개수
	int memberEndCouponListCount(SqlSession session,String memberId);
		
	//마이페이지 기간만료 쿠폰리스트
	List<Coupon> memberEndCouponListSelect(SqlSession session,String memberId,int cPage,int numPerpage);
	
	//마이페이지 - 주문확인리스트
	List<Payment> memberOrderListSelect(SqlSession session,String memberId,int cPage,int numPerpage);
		
	//마이페이지 - 주문확인리스트 총개수
	int memberOrderListCount(SqlSession session,String memberId);
	
	//결제취소할 payment있는지 확인
	Payment memberOrderSelect(SqlSession session,int paymentNo);
	
	//결제취소 - payment적용된 coupon 되돌리기
	int paymentCouponUpdate(SqlSession session,int couponNo);
	
	//결제취소 - 책재고 원상태로 복귀
	int bookStockUpdate(SqlSession session,PaymentObj po);

	//결제취소 - payment state '결제취소'로 변경
	int orderStateUpdate(SqlSession session,int paymentNo);
	
	//마이페이지 - 모든 결제리스트 조회
	List<Payment> memberOrderListAllSelect(SqlSession session,String memberId);
	
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
	
	//공지사항 조회수
	int noticeReadCount(SqlSession session, Notice n);
	
}
