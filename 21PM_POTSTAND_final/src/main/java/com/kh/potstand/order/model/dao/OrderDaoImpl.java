package com.kh.potstand.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
	//쿠폰 사용여부 업데이트
	@Override
	public int cartCouponUpdate(SqlSession session, Map param) {
		return session.update("cart.cartCouponUpdate",param);
	}
	
	
	//구매내역 넘어갈때 카트에서 선택된거만 넘겨줌
	@Override
	public List<Cart> cartSelectList(SqlSession session, List<Integer> cartNo) {
		List<Cart> cartList = new ArrayList();
		for(int no : cartNo) {
			cartList.add(session.selectOne("cart.selectCartNo",no));
		}
		return cartList;
	}

	
	

	
	
	
	

	
	

	

	
}
