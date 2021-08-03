package com.kh.potstand.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.vo.Cart;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class OrderDaoImpl implements OrderDao{

	//cart 조회
	@Override
	public List<Cart> cartSelectList(SqlSession session, String memberId) {
		return session.selectList("order.cartSelectListJoinEventList", memberId);  
	}

	@Override
	public int cartObjDelete(SqlSession session, Map param) {
		return session.delete("order.cartObjDelete", param);
	}

	@Override
	public int cartObjDelete(SqlSession session, List<String> param) {
		int result=0;
		for(String no : param) {
			Map map=new HashMap();
			map.put("cartNo", no);
			result+=session.delete("order.cartObjDelete", map);
		}
		return result;
	}
	
	//카트 bookAmount update
	@Override
	public int cartBookAmountUpdate(SqlSession session, Map param) {
		return session.update("order.cartBookAmountUpdate",param);
	}
	
	//쿠폰 사용여부 업데이트
	@Override
	public int cartCouponUpdate(SqlSession session, Map param) {
		return session.update("order.cartCouponUpdate",param);
	}
	
	
	//구매내역 넘어갈때 카트에서 선택된거만 넘겨줌
	@Override
	public List<Cart> cartSelectList(SqlSession session, List<Integer> cartNo) {
		List<Cart> cartList = new ArrayList();
		for(int no : cartNo) {
			cartList.add(session.selectOne("order.selectCartNo",no));
		}
		return cartList;
	}

	@Override
	public Map beforOrderPayment(SqlSession session, Map param) {
		/*{pg=html5_inicis, pay_method=card, merchant_uid=인서트 실행하고 리턴받아야됨, 
		 * name=프랑켄슈타인 (현대판 프로메테우스)외 3건, amount=58340, buyer_email=000000@000000.com, 
		 * buyer_name=회원3, 
		 * buyer_tel=01031302309, 
		 * buyer_addr=서울특별시 구로구 가마산로 77, buyer_postcode=08327, 
		 * receiverName=회원3, receiverAddress=08327:서울특별시 구로구 가마산로 77:집:(구로동), 
		 * message=, postMessage=, billPrice=Y, digital=false, 
		 * cartNo=[27, 22, 29]}
		 */
		int paymentNo = session.insert("order.insertPaymentByParam", param);
		
		int[] cartNo = (int[])param.get("cartNo");
		List<Cart> cartList = new ArrayList();
		for(int no : cartNo) {
			cartList.add(session.selectOne("cart.selectCartNo",no));
		}
		
		return param;
	}

	

	
	

	
	
	
	

	
	

	

	
}
