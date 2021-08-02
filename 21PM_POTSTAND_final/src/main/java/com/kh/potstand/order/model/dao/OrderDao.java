package com.kh.potstand.order.model.dao;

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

public interface OrderDao {

	//Cart 조회
	List<Cart> cartSelectList(SqlSession session, String memberId);
	List<Cart> cartSelectList(SqlSession session, List<Integer> cartNo);
	
	//Cart 항목삭제/전체삭제/선택삭제
	int cartObjDelete(SqlSession session, Map param);
	int cartObjDelete(SqlSession session, List<String> param);
	
	//cart bookAmount update
	int cartBookAmountUpdate(SqlSession session, Map param);
	
	//cart usedCoupon update
	int cartCouponUpdate(SqlSession session, Map param);
	
}
