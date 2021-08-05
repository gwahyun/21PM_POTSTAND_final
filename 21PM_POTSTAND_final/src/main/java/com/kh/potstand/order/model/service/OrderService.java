package com.kh.potstand.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.vo.Cart;

public interface OrderService {
	
	//Cart 조회
	List<Cart> cartSelectList(String memberId);
	List<Cart> cartSelectList(List<Integer> cartNo);
	
	
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
}
