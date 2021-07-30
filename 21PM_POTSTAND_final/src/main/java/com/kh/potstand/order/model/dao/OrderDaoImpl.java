package com.kh.potstand.order.model.dao;

import java.util.HashMap;
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

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class OrderDaoImpl implements OrderDao{

	//cart 조회
	@Override
	public List<Cart> cartSelectList(SqlSession session, String memberId) {
		return session.selectList("cart.cartSelectListJoinEventList", memberId);  
	}

	@Override
	public int cartObjDelete(SqlSession session, Map param) {
		return session.delete("cart.cartObjDelete", param);
	}

	@Override
	public int cartObjDelete(SqlSession session, List<String> param) {
		int result=0;
		for(String no : param) {
			Map map=new HashMap();
			map.put("cartNo", no);
			result+=session.delete("cart.cartObjDelete", map);
		}
		return result;
	}
	
	//카트 bookAmount update
	@Override
	public int cartBookAmountUpdate(SqlSession session, Map param) {
		return session.update("cart.cartBookAmountUpdate",param);
	}

	@Override
	public int cartCouponUpdate(SqlSession session, Map param) {
		System.out.println(param);
		return session.update("cart.cartCouponUpdate",param);
	}

	

	
	
	
	

	
	

	

	
}
