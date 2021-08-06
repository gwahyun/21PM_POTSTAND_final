package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao{

	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(SqlSession session, Map param) {
		// TODO Auto-generated method stub	
		return session.selectOne("member.memberSelect", param);
	}

	//회원가입
	@Override
	public int memberInsert(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.memberInsert", m);
	}
	@Override
	public int addressInsert(SqlSession session, Address a) {
		// TODO Auto-generated method stub
		return session.insert("member.addressInsert", a);
	}
	
	//아이디찾기
	@Override
	public Member memberSearchIdSelect(SqlSession session, String memberEmail) {
		// TODO Auto-generated method stub
		return session.selectOne("member.memberSearchIdSelect", memberEmail);
	}
	
	//비밀번호재설정
	@Override
	public int memberResetPwd(SqlSession session, Member m) {
		return session.update("member.memberResetPwd", m);
	}
	
	//회원주소 삭제
	@Override
	public int memberAddrDelete(SqlSession session, Map param) {
		return session.delete("member.memberAddrDelete", param);
	}

	//회원탈퇴
	@Override
	public int memberDelete(SqlSession session, Map param) {
		return session.delete("member.memberDelete", param);
	}
	
	//비밀번호 변경
	@Override
	public int memberUpdatePwd(SqlSession session, Map param) {
		return session.update("member.memberUpdatePwd", param);
	}
	
	//회원정보 수정
	@Override
	public int memberUpdate(SqlSession session, Member m) {
		return session.update("member.memberUpdate", m);
	}

	//회원주소 수정
	@Override
	public int addressUpdate(SqlSession session, Address a) {
		return session.update("member.addressUpdate", a);
	}
	
	//포인트 기록 조회
	@Override
	public List<Point> memberPointSelect(SqlSession session, String memberId) {
		return session.selectList("member.memberPointSelect", memberId);
	}
	
	//포인트 기록 조회(페이징 처리)
	@Override
	public List<Point> memberPointSelect(SqlSession session, String memberId, int cPage, int numPerpage) {
		return session.selectList("member.memberPointSelect", memberId,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	//포인트 기록 총 개수
	@Override
	public int memberPointSelectCount(SqlSession session, String memberId) {
		return session.selectOne("member.memberPointSelectCount", memberId);
	}

	//찜목록 개수
	@Override
	public int memberHeartListCount(SqlSession session, String memberId) {
		return session.selectOne("member.memberHeartListCount", memberId);
	}

	//찜목록 리스트
	@Override
	public List<Heart> memberHeartListSelect(SqlSession session, String memberId, int cPage, int numPerpage) {
		return session.selectList("member.memberHeartListSelect",memberId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	//찜목록 등록전 장바구니에 등록되어 있는 책인지 조회
	@Override
	public Cart memberCartSelect(SqlSession session, Map param) {
		return session.selectOne("member.memberCartSelect",param);
	}
	
	//찜목록 장바구니에 있으면 amount +1
	@Override
	public int memberOverlapCartUpdate(SqlSession session, Map param) {
		return session.update("member.memberOverlapCartUpdate", param);
	}
	
	//찜목록 - 선택 장바구니에담기
	@Override
	public int memberChoiceCartInsert(SqlSession session, Map param) {
		return session.insert("member.memberChoiceCartInsert", param);
	}
	
	//찜목록 지우기
	@Override
	public int memberHeartDelete(SqlSession session, Map param) {
		return session.delete("member.memberHeartDelete", param);
	}
	
	//내 리뷰 관리 - 리뷰리스트 총 개수
	@Override
	public int memberReviewListCount(SqlSession session, Map param) {
		return session.selectOne("member.memberReviewListCount", param);
	}
	
	//내 리뷰 관리 - 리뷰리스트
	@Override
	public List<Review> memberReviewListSelect(SqlSession session, Map param, int cPage, int numPerpage) {
		return session.selectList("member.memberReviewListSelect", param, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	//내 리뷰 삭제
	@Override
	public int memberReviewDelete(SqlSession session, Map param) {
		return session.delete("member.memberReviewDelete", param);
	}
	
	//내 리뷰 수정
	@Override
	public int memberReviewUpdate(SqlSession session, Map param) {
		return session.update("member.memberReviewUpdate", param);
	}
	
	//마이페이지 사용가능 쿠폰리스트 총 개수
	@Override
	public int memberCouponListCount(SqlSession session, String memberId) {
		return session.selectOne("member.memberCouponListCount", memberId);
	}

	//마이페이지 사용가능 쿠폰 리스트
	@Override
	public List<Coupon> memberCouponListSelect(SqlSession session, String memberId,int cPage,int numPerpage) {
		return session.selectList("member.memberCouponListSelect",memberId,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	//마이페이지 기간만료 쿠폰리스트 총 개수
	@Override
	public int memberEndCouponListCount(SqlSession session, String memberId) {
		return session.selectOne("member.memberEndCouponListCount", memberId);
	}

	//마이페이지 기간만료 쿠폰 리스트
	@Override
	public List<Coupon> memberEndCouponListSelect(SqlSession session, String memberId,int cPage,int numPerpage) {
		return session.selectList("member.memberEndCouponListSelect",memberId,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	//마이페이지 - 주문확인리스트
	@Override
	public List<Payment> memberOrderListSelect(SqlSession session, String memberId, int cPage, int numPerpage) {
		return session.selectList("member.memberOrderListSelect", memberId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	//마이페이지 - 주문확인리스트 총개수
	@Override
	public int memberOrderListCount(SqlSession session, String memberId) {
		return session.selectOne("member.memberOrderListCount", memberId);
	}
	
	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(SqlSession session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("function.noticeSelectList",null, row);
	}


	//notice Content 호출
	@Override
	public Notice noticeSelectOne(SqlSession session, int noticeNo) {
		return session.selectOne("function.noticeSelectOne",noticeNo);
	}


	//내 문의내역 호출
	@Override
	public List<Qna> qnaSelectList(SqlSession session, String memberId, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("function.qnaSelectList",memberId, row);
	}


	//내 문의내역 내용 조회
	@Override
	public Qna qnaSelectOne(SqlSession session, int qnaNo) {
		return session.selectOne("function.qnaSelectOne",qnaNo);
	}

	//1:1문의 작성
	@Override
	public int qnaInsert(SqlSession session, Qna q) {
		log.debug(q.toString());
		return session.insert("function.qnaInsert", q);
	}
	
	//notice count : totalData용
	@Override
	public int noticeSelectCount(SqlSession session) {
		return session.selectOne("function.noticeSelectCount");
	}

	//qna count : totalData용
	@Override
	public int qnaSelectCount(SqlSession session, String memberId) {
		return session.selectOne("function.qnaSelectCount", memberId);
	}

	

	
	

	
	

	
	

	

	
}
