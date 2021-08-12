package com.kh.potstand.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.service.AdminService;
import com.kh.potstand.common.AES256Util;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.service.OrderService;
import com.kh.potstand.order.model.vo.Cart;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService service;
	
	@Autowired
	private AdminService as;
	
	//양방향암호화
	@Autowired
	private AES256Util aes;
	
	
	//장바구니 리스트 호출 / 이동
	@RequestMapping("/member/cartList.do")
	public ModelAndView cartSelectList(ModelAndView mv, HttpSession session){
		try {
			String memberId =((Member)(session.getAttribute("loginMember"))).getMemberId();
			List<Cart> cartList = service.cartSelectList(memberId);
			mv.addObject("cartList", cartList);
			mv.setViewName("cart/cartList");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	
	
	
	@RequestMapping("/ajax/cartObjDelete.do/{cartNo}")
	public @ResponseBody int cartObjDelete(ModelAndView mv,@PathVariable int cartNo){
		int result=0;
		try {
			Map param = new HashMap();
			param.put("cartNo", cartNo);
			result = service.cartObjDelete(param);
			mv.setViewName("cart/cartList");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	@RequestMapping("/ajax/cartObjAllDelete.do")
	public @ResponseBody int cartObjDelete(HttpSession session){
		String memberId = ((Member)(session.getAttribute("loginMember"))).getMemberId();
		int result=0;
		try {
			Map param = new HashMap();
			param.put("memberId", memberId);
			result = service.cartObjDelete(param);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	@RequestMapping("/ajax/cartObjCheckedDelete.do")
	@ResponseBody
	public int cartObjCheckedDelete(@RequestParam (value="arr[]") List<String> param){
		int result=0;
		try {
			result = service.cartObjDelete(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
//	카트 책 수량 업데이트
	@RequestMapping("/ajax/cartBookAmountUpdate.do")
	@ResponseBody
	public int cartBookAmountUpdate(@RequestParam (value="cartNo") int cartNo,
									@RequestParam (value="bookAmount") int bookAmount
									){
		Map param = new HashMap();
		param.put("cartNo", cartNo);
		param.put("bookAmount", bookAmount);
		int result=0;
		try {
			result = service.cartBookAmountUpdate(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
	//	카트 used coupon 업데이트
	@RequestMapping("/ajax/updateCartCoupon.do")
	@ResponseBody
	public int cartCouponUpdate(@RequestParam (value="cartNo") int cartNo,
								@RequestParam (value="couponNo") int couponNo
									){
		Map param = new HashMap();
		int result=0;
		//1. 원래있던 usedCouponNo 조회  - 원래있던 쿠폰 원래 쿠폰개수 조회 - 원래있던 쿠폰 원래 사용개수 조회
		//   원래 안썼으면 패스
			int oriUsedCouponNo=service.cartSelectOne(cartNo).getUsedCouponNo();
			//기존 쿠폰이랑 같은거면 return
			if(couponNo==oriUsedCouponNo) {
				return result;
			}
			
			int oriUsedCouponAmount_before=0;
			if(oriUsedCouponNo!=0) {		
				oriUsedCouponAmount_before = service.couponSelect(oriUsedCouponNo).getCouponAmount();
			}
			
			
		//2. 바꿀 쿠폰이 있으면 amount 조회
			int amount=0;
			if(couponNo!=0) {
				amount = service.couponSelect(couponNo).getCouponAmount();
			}
			

				
		//아니면 진행.. 사용쿠폰 개수-1
		param.put("cartNo", cartNo);
		param.put("couponAmount", amount-1);
		if(couponNo!=0) {
			param.put("usedCouponNo", couponNo);
		}
		
		//update해주고 원래 쿠폰+1 or 원래 안썼으면 패스
		try {
			result += service.cartCouponUpdate(param);
			//원래 쿠폰이 있었으면..
			if(oriUsedCouponNo!=0) {
				param.put("beforeCouponNo", oriUsedCouponNo);
				param.put("beforeCouponAmount", oriUsedCouponAmount_before+1);
				result += service.cartCouponUpdate(param);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
			return result;
	}
	
	
	
	//결제페이지 이동
	@RequestMapping("/order/orderItems.do")
	@ResponseBody
	public ModelAndView orderItems(ModelAndView mv, HttpSession session,
									@RequestParam (value="cartNo") String param){
		try {
			param = param.replace("\"", "");
			param = param.replace("[", "");
			param = param.replace("]", "");
			String[] strArr = param.split(",");
			List<Integer> cartNo = new ArrayList();
			for(String i : strArr) {
				cartNo.add(Integer.parseInt(i));
			}
			Member memberInfo = (Member)(session.getAttribute("loginMember")); 
			List<Cart> cartList = service.cartSelectList(cartNo);
			List<Coupon> couponList = service.paymentCouponSelectList(memberInfo.getMemberId());
			List<Map> addressList = service.addressListSelect(memberInfo.getMemberId());
			int useablePoint = service.selectPointSum(memberInfo.getMemberId());
			for(Map m : addressList) {
				m.put("PHONE",aes.decrypt((String)m.get("PHONE")));
				m.put("POST_NO",aes.decrypt((String)m.get("POST_NO")));
				m.put("ROAD_ADDR",aes.decrypt((String)m.get("ROAD_ADDR")));
				m.put("OLD_ADDR",aes.decrypt((String)m.get("OLD_ADDR")));
				m.put("DETAIL_ADDR",aes.decrypt((String)m.get("DETAIL_ADDR")));
			}
			mv.addObject("cartList", cartList);
			mv.addObject("couponList", couponList);
			mv.addObject("memberInfo", memberInfo);
			mv.addObject("addressList", addressList);
			mv.addObject("useablePoint", useablePoint);
			mv.setViewName("order/order");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	//바로구매 -결제페이지 이동
	@RequestMapping("/order/directPayment.do")
	public ModelAndView directPayment(ModelAndView mv, HttpSession session, 
										@RequestParam int bookCode, @RequestParam int bookAmount){
		try {
			String memberId =((Member)(session.getAttribute("loginMember"))).getMemberId();
			Map param = new HashMap();
			param.put("memberId", memberId);
			param.put("bookCode", bookCode);
			param.put("bookAmount", bookAmount);
			List<Cart> cartList = service.directPayment(param);
			List<Coupon> couponList = service.paymentCouponSelectList(memberId);
			List<Map> addressList = service.addressListSelect(memberId);
			int useablePoint = service.selectPointSum(memberId);
			for(Map m : addressList) {
				m.put("PHONE",aes.decrypt((String)m.get("PHONE")));
				m.put("POST_NO",aes.decrypt((String)m.get("POST_NO")));
				m.put("ROAD_ADDR",aes.decrypt((String)m.get("ROAD_ADDR")));
				m.put("OLD_ADDR",aes.decrypt((String)m.get("OLD_ADDR")));
				m.put("DETAIL_ADDR",aes.decrypt((String)m.get("DETAIL_ADDR")));
			}
			mv.addObject("cartList", cartList);
			mv.addObject("couponList", couponList);
			mv.addObject("memberInfo", (Member)(session.getAttribute("loginMember")));
			mv.addObject("addressList", addressList);
			mv.addObject("useablePoint", useablePoint);
			mv.setViewName("order/order");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	
	
	
	
	@RequestMapping("/cartInsert.do")
	@ResponseBody
	public boolean cartInsert(@RequestParam Map param, HttpSession session, String bookCode	) {
		int result = 0;
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		Cart c = as.cartSelectDistinct(param);
		if(c==null) {
			result = as.cartInsert(param);
		}else {
			result = as.cartSelectOnePlus(param);
		}
		return result>0?true:false;
	}
	
	
	//기본주소
	@RequestMapping("/ajax/defaultAddr.do")
	@ResponseBody
	public Map selectDefaultAddr(@RequestParam String memberId) throws Exception{
		Map data = new HashMap();
		Address addr = service.selectDefaultAddr(memberId);
		data.put("postNo", aes.decrypt(addr.getPostNo()));
		data.put("roadAddrPart1", aes.decrypt(addr.getRoadAddr()));
		data.put("roadAddrPart2", aes.decrypt(addr.getDetailAddr()));
		data.put("addrDetail", aes.decrypt(addr.getOldAddr()));
		return data;
			
	}
	
	
	//최근주소
	@RequestMapping("/ajax/recentAddr.do")
	@ResponseBody
	public Map selectRecentAddr(@RequestParam String memberId){
		Map data = new HashMap();
		String[] addr = service.selectRecentAddr(memberId).split(":");
		data.put("postNo", addr[0]);
		data.put("roadAddrPart1", addr[1]);
		data.put("addrDetail", addr[2]);
		data.put("roadAddrPart2", addr[3]);
		return data;
			
	}
	
	//새 주소 등록
	@RequestMapping("/ajax/insertAddress.do")
	@ResponseBody
	public Boolean insertAddress(@RequestBody Map param) throws Exception{
		Boolean result=false;
		param.put("receiver",(String)param.get("receiver"));
		param.put("phone",aes.encrypt((String)param.get("phone")));
		param.put("postNo",aes.encrypt((String)param.get("postNo")));
		param.put("roadAddr",aes.encrypt((String)param.get("roadAddr")));
		param.put("oldAddr",aes.encrypt((String)param.get("oldAddr")));
		param.put("detailAddr",aes.encrypt((String)param.get("detailAddr")));
		int re = service.insertAddress(param);
		if(re>0) {
			result=true;
		}
		return result;
				
	}
	
	//주소 선택
	@RequestMapping("/ajax/selectAddrList.do")
	@ResponseBody
	public Map selectAddrList(@RequestParam int addrNo) throws Exception{
		Map addr = service.selectAddrList(addrNo);
		addr.put("PHONE",aes.decrypt((String)addr.get("PHONE")));
		addr.put("POST_NO",aes.decrypt((String)addr.get("POST_NO")));
		addr.put("ROAD_ADDR",aes.decrypt((String)addr.get("ROAD_ADDR")));
		addr.put("OLD_ADDR",aes.decrypt((String)addr.get("OLD_ADDR")));
		addr.put("DETAIL_ADDR",aes.decrypt((String)addr.get("DETAIL_ADDR")));
		return addr;			
	}
	//주소 삭제
	@RequestMapping("/ajax/deleteAddrList.do")
	@ResponseBody
	public boolean deleteAddrList(@RequestParam int addrNo) throws Exception{
		int check = service.deleteAddrList(addrNo);
		boolean result = check>0?true:false;
		return result;			
	}
}
