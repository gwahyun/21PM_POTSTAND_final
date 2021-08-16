package com.kh.potstand.order.model.service;

import java.util.List;
import java.util.Map;

import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.order.model.vo.Cart;

public interface OrderService {
	
	//Cart 조회
	List<Cart> cartSelectList(String memberId);
	List<Cart> cartSelectList(List<Integer> cartNo);
	Cart cartSelectOne(int cartNo);
	
	//Cart 항목 삭제 / 전체삭제 / 선택삭제
	int cartObjDelete(Map param);
	int cartObjDelete(List<String> param);
	
	//cart bookAmount update
	int cartBookAmountUpdate(Map param);
	
	//cart usedCoupon update
	int cartCouponUpdate(Map param);
	
	Map beforOrderPayment(Map param);
	
	int paymentSuccess(Map param);
	int paymentFail(Map param);
	
	List<Cart> directPayment(Map param);
	
	List<Coupon> paymentCouponSelectList(String memberId);
	
	//couponNo로 조회
	Coupon couponSelect(int couponNo);
	//쿠폰 사용한 개수 조회
	int usedCouponCount(int couponNo);
	
	//주소선택
	String selectRecentAddr(String memberId);
	Address selectDefaultAddr(String memberId);
	int insertAddress(Map param);
	List<Map> addressListSelect(String memberId);
	Map selectAddrList(int addrNo);
	
	//주소 삭제
	int deleteAddrList(int addrNo);
	
	//누적포인트 조회
	int selectPointSum(String memberId);

	//마이페이지 - 주문목록/배송조회 결제취소
	boolean memberOrderListDelete(int paymentNo);
}
