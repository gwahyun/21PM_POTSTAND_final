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


	@Override
	public int cartCouponUpdate(Map param) {
		return dao.cartCouponUpdate(session, param);
	}

	

	
	
	


	
}