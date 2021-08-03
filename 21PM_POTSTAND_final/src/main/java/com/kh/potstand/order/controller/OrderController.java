package com.kh.potstand.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.common.AES256Util;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.service.OrderService;
import com.kh.potstand.order.model.vo.Cart;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;
	
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
		param.put("cartNo", cartNo);
		if(couponNo!=0) {
			param.put("usedCouponNo", couponNo);
		}
		int result=0;
		try {
			result = service.cartCouponUpdate(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
			return result;
	}
	
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
	
			mv.addObject("cartList", cartList);
			mv.addObject("memberInfo", memberInfo);
			mv.setViewName("order/order");
		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	@RequestMapping("/ajax/beforePayment.do")
	@ResponseBody
	public ModelAndView beforOrderPayment(ModelAndView mv, HttpSession session, Map param){
		try {
			System.out.println(param.toString());

		}catch(Exception e) {
			e.printStackTrace();
		}
			return mv;
	}
	
	
}
