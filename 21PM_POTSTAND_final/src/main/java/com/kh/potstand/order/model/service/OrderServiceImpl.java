package com.kh.potstand.order.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.dao.OrderDao;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;
import com.kh.potstand.order.model.vo.PaymentObj;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao dao;
	
	@Autowired
	private SqlSession session;
	

	//카트 조회
	@Override
	public List<Cart> cartSelectList(String memberId) {
		return dao.cartSelectList(session, memberId);
	}

	//카트 항목 삭제 / 전체삭제
	@Override
	public int cartObjDelete(Map param) {
		return dao.cartObjDelete(session, param);
	}
	
	//카트 선택삭제
	@Override
	public int cartObjDelete(List<String> param) {
		return dao.cartObjDelete(session, param);
	}
	
	//카트 bookAmount update
	@Override
	public int cartBookAmountUpdate(Map param) {
		return dao.cartBookAmountUpdate(session, param);
	}

	//쿠폰사용 업데이트
	@Override
	public int cartCouponUpdate(Map param) {
		return dao.cartCouponUpdate(session, param);
	}
	
	
	//카트에서 선택된거만 조회해서 리스트 넘겨줌
	@Override
	public List<Cart> cartSelectList(List<Integer> cartNo) {
		return dao.cartSelectList(session, cartNo);
	}

	@Override
	public Map beforOrderPayment(Map param) {
		return dao.beforOrderPayment(session, param);
	}

	@Override
	public int paymentSuccess(Map param) {
		return dao.paymentSuccess(session, param);
	}

	@Override
	public int paymentFail(Map param) {
		return dao.paymentFail(session, param);
	}

	@Override
	public List<Cart> directPayment(Map param) {
		return dao.directPayment(session, param);
	}

	@Override
	public List<Coupon> paymentCouponSelectList(String memberId) {
		return dao.paymentCouponSelectList(session, memberId);
	}

	@Override
	public Coupon couponSelect(int couponNo) {
		return dao.couponSelect(session, couponNo);
	}

	@Override
	public int usedCouponCount(int couponNo) {
		return dao.usedCouponCount(session, couponNo);
	}

	@Override
	public Cart cartSelectOne(int cartNo) {
		return dao.cartSelectOne(session, cartNo);
	}

	@Override
	public String selectRecentAddr(String memberId) {
		return dao.selectRecentAddr(session, memberId);
	}

	@Override
	public Address selectDefaultAddr(String memberId) {
		return dao.selectDefaultAddr(session, memberId);
	}

	@Override
	public int insertAddress(Map param) {
		return dao.insertAddress(session, param);
	}

	@Override
	public List<Map> addressListSelect(String memberId) {
		return dao.addressListSelect(session, memberId);

	}

	@Override
	public Map selectAddrList(int addrNo) {
		return dao.selectAddrList(session, addrNo);
	}

	@Override
	public int deleteAddrList(int addrNo) {
		return dao.deleteAddrList(session, addrNo);
	}

	@Override
	public int selectPointSum(String memberId) {
		return dao.selectPointSum(session, memberId);
	}

	
	//마이페이지 -주문목록/배송조회 결제취소
	@Override
	@Transactional
	public boolean memberOrderListDelete(int paymentNo) {
		try {
			int result=1;
			Payment p=dao.memberOrderSelect(session,paymentNo);
			if(p!=null) {
				//payment지우기, paymentObj들 지우기, payment/paymentObj coupon개수늘리기, bookCode로 book재고 다시 bookAmount만큼 늘리기
				if(p.getCoupon()!=null) { //payment에 쿠폰을 사용햇을경우
					//payment에적용된 쿠폰 사용일 지우기, 쿠폰 개수 +1, coupon_end N
					result=dao.paymentCouponUpdate(session,p.getCoupon().getCouponNo());
				}
				if(result>0) {
					for(PaymentObj po : p.getPaymentObj()) {
						if(po.getCoupon()!=null) { //paymentObj에 쿠폰을 사용했을경우
							//paymentObj에적용된 쿠폰 사용일 지우기, 쿠폰 개수 +1, coupon_end N
							result=dao.paymentCouponUpdate(session,po.getCoupon().getCouponNo());
						}
						if(result>0) {
							//bookCode로 책 재고 늘려주는 로직 자리
							result=dao.bookStockUpdate(session,po);
						}else return false;
					}
					if(result>0) {
						//payment state '결제취소'로 변경
						if(dao.orderStateUpdate(session,p.getPaymentNo())>0) return true;
						else return false;
					}else return false;
				}else return false;
			}else return false;
		}catch(RuntimeException e) {
			return false;
		}
	}

	@Override
	public Payment paymentSelect(int paymentNo) {
		return dao.paymentSelect(session, paymentNo);
	}

	@Override
	public int getPaymentNo(Map param) {
		return dao.getPaymentNo(session, param);
	}
	

	
	
	


	
}
