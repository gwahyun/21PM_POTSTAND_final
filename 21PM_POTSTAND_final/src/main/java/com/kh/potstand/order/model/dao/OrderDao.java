package com.kh.potstand.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;
import com.kh.potstand.order.model.vo.PaymentObj;

public interface OrderDao {

	//Cart 조회
	List<Cart> cartSelectList(SqlSession session, String memberId);
	List<Cart> cartSelectList(SqlSession session, List<Integer> cartNo);
	Cart cartSelectOne(SqlSession session, int cartNo);
	
	
	//Cart 항목삭제/전체삭제/선택삭제
	int cartObjDelete(SqlSession session, Map param);
	int cartObjDelete(SqlSession session, List<String> param);
	
	//cart bookAmount update
	int cartBookAmountUpdate(SqlSession session, Map param);
	
	//cart usedCoupon update
	int cartCouponUpdate(SqlSession session, Map param);
	
	//결제전 선 insert
	Map beforOrderPayment(SqlSession session, Map param);
	
	int paymentSuccess(SqlSession session, Map param);
	int paymentFail(SqlSession session, Map param);
	
	List<Cart> directPayment(SqlSession session, Map param);
	
	List<Coupon> paymentCouponSelectList(SqlSession session, String memberId);
	
	Coupon couponSelect(SqlSession session, int couponNo);
	
	int usedCouponCount(SqlSession session, int couponNo);
	
	//주소선택
	String selectRecentAddr(SqlSession session, String memberId);
	Address selectDefaultAddr(SqlSession session, String memberId);
	int insertAddress(SqlSession session, Map param);
	List<Map> addressListSelect(SqlSession session, String memberId);
	Map selectAddrList(SqlSession session, int addrNo);
	
	//주소 삭제
	int deleteAddrList(SqlSession session, int addrNo);
	
	//누적포인트 조회
	int selectPointSum(SqlSession session, String memberId);
	
	
	//결제취소할 payment있는지 확인
	Payment memberOrderSelect(SqlSession session,int paymentNo);
	
	//결제취소 - payment적용된 coupon 되돌리기
	int paymentCouponUpdate(SqlSession session,int couponNo);
	
	//결제취소 - 포인트 적립내역 삭제
	int pointDelete(SqlSession session,int paymentNo);
	
	//결제취소 - 책재고 원상태로 복귀
	int bookStockUpdate(SqlSession session,PaymentObj po);

	//결제취소 - payment state '결제취소'로 변경
	int orderStateUpdate(SqlSession session,int paymentNo);
	
	Payment paymentSelect(SqlSession session, int paymentNo);
	
	int getPaymentNo(SqlSession session, Map param);
	
}
