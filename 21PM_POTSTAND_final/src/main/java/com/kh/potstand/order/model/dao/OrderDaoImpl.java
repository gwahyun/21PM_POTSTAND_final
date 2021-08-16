package com.kh.potstand.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.order.model.vo.Cart;
import com.kh.potstand.order.model.vo.Payment;
import com.kh.potstand.order.model.vo.PaymentObj;

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
	public Cart cartSelectOne(SqlSession session, int cartNo) {
		return session.selectOne("selectCartNo",cartNo);
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
	
	//쿠폰 조회
	@Override
	public Coupon couponSelect(SqlSession session, int couponNo) {
		return session.selectOne("order.selectCouponByPK", couponNo);
	}
	
	//쿠폰 사용개수 조회
	@Override
	public int usedCouponCount(SqlSession session, int couponNo) {
		return session.selectOne("order.usedCouponCount",couponNo);
	}

	//쿠폰 사용여부 업데이트
	@Override
	public int cartCouponUpdate(SqlSession session, Map param) {
		int result=0;
		if(param.get("beforeCouponNo")==null) {
			result+=session.update("order.cartCouponUpdate",param);
			result+=session.update("order.couponAmountUpdate",param);
		}else {
			result+=session.update("order.couponAmountUpdate2",param);
		}
		return result; 
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
		List<Integer> cartNo = (List<Integer>)param.get("cartNo");
		for(int no : cartNo) {
			Cart c = session.selectOne("order.selectCartNo",no);
			Map cParam = new HashMap();
			cParam.put("bookCode", c.getBook().getBookCode());
			cParam.put("bookAmount",c.getBookAmount());
			cParam.put("paymentNo",param.get("merchant_uid"));
			
			if(c.getUsedCouponNo()!=0) {
				cParam.put("usedCouponNo",c.getUsedCouponNo());
			}else {
				cParam.put("usedCouponNo",null);
			}
			
			session.insert("order.insertPaymentObjByParam",cParam);
		}
		
		return param;
	}

	@Override
	public int paymentSuccess(SqlSession session, Map param) {
		int result=0;
		//결제 완료된 카트정보 삭제
		List<Integer> cartNoList = (List<Integer>)param.get("cartNo"); 
		for(int no : cartNoList) {
			result += session.delete("order.deleteCartByPK",no);
		}
		//payment uid + payMethod update
		result+=session.update("order.updatePayment",param);
		
		//사용한 쿠폰 업데이트
		if(param.get("used_coupon_no")!=null) {
			int usedCoupon = Integer.parseInt((String)param.get("used_coupon_no"));
			Coupon uc = session.selectOne("order.selectCouponByPK", usedCoupon);
			int amount = uc.getCouponAmount();
			Map updateCoupon = new HashMap();
			updateCoupon.put("usedCouponNo", usedCoupon);
			updateCoupon.put("couponAmount", amount-1);
			session.update("order.couponAmountUpdate",updateCoupon);
		}
		//포인트 추가
		session.insert("order.insertPoint",param);
		//사용포인트 추가
		if(param.get("point_using")!=null) {
			session.insert("order.insertUsingPoint",param);
		}
		//book 수량 빼줌
		List<PaymentObj> stackCount = session.selectList("order.selectPaymentObjForBook",param);
		for(PaymentObj p : stackCount) {
			int bookAmount = p.getBook().getBookStock();
			int minus = p.getBookAmount();
			if(bookAmount-minus<0) {
				throw new NullPointerException();
			}else {
				int newAmount = bookAmount-minus;
				Map updateBook = new HashMap();
				updateBook.put("bookStock",newAmount);
				updateBook.put("bookCode",p.getBook().getBookCode());
				session.update("order.updateBookAmount",updateBook);
			}
		}
		return result;
	}

	@Override
	public int paymentFail(SqlSession session, Map param) {
		return session.delete("order.deletePaymentByPK",param);
	}

	@Override
	public List<Cart> directPayment(SqlSession session, Map param) {
		List<Cart> cartList=new ArrayList();
		session.insert("order.insertCart",param); //카트에 우선 넣어줌 selectKey로 cartNo 받아옴
		cartList.add(session.selectOne("order.selectCartNo",param)); //넣은거 다시 꺼내옴
		return cartList;
	}

	@Override
	public List<Coupon> paymentCouponSelectList(SqlSession session, String memberId) {
		return session.selectList("order.paymentCouponSelectList", memberId);
	}

	@Override
	public String selectRecentAddr(SqlSession session, String memberId) {
		List<String> list = session.selectList("order.selectRecentAddr", memberId);
		return list.get(0);
	}

	@Override
	public Address selectDefaultAddr(SqlSession session, String memberId) {
		return session.selectOne("order.selectDefaultAddr", memberId);
	}

	@Override
	public int insertAddress(SqlSession session, Map param) {
		return session.insert("order.insertAddress", param);
	}

	@Override
	public List<Map> addressListSelect(SqlSession session, String memberId) {
		return session.selectList("order.selectAddressList", memberId);
	}

	@Override
	public Map selectAddrList(SqlSession session, int addrNo) {
		return session.selectOne("order.selectAddrListByPK",addrNo);
	}

	@Override
	public int deleteAddrList(SqlSession session, int addrNo) {
		return session.delete("order.deleteAddrListByPK",addrNo);
	}

	@Override
	public int selectPointSum(SqlSession session, String memberId) {
		return session.selectOne("order.selectPointSum",memberId);
	}
	
	
	
	//결제취소할 payment있는지 확인
	@Override
	public Payment memberOrderSelect(SqlSession session, int paymentNo) {
		return session.selectOne("member.memberOrderSelect", paymentNo);
	}
	
	//결제취소 - payment적용된 coupon 되돌리기
	@Override
	public int paymentCouponUpdate(SqlSession session, int couponNo) {
		return session.update("member.paymentCouponUpdate",couponNo);
	}
	
	//결제취소 - 책재고 원상태로 복귀
	@Override
	public int bookStockUpdate(SqlSession session, PaymentObj po) {
		return session.update("member.bookStockUpdate", po);
	}
	
	//결제취소 - payment state '결제취소'로 변경
	@Override
	public int orderStateUpdate(SqlSession session, int paymentNo) {
		return session.update("member.orderStateUpdate", paymentNo);
	}

	
	
	
	

	
	

	

	
}
