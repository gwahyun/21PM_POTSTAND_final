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

	
	
	

	
	
	


	
}
