package com.kh.potstand.order.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.potstand.admin.model.service.AdminService;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.service.OrderService;
import com.kh.potstand.order.model.vo.Payments;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Transactional
@Controller
public class OrderTransactionController {
	@Autowired
	private OrderService service;
	
	
	@Autowired
	private AdminService as;
	
	//아임포트 객체
	private IamportClient api = new IamportClient("8116855594363834", "effe9bdd35fafb13df8ab1920c04852352412f937fcfe5bef763620f5980471146a5019f23622baf");
	
	@RequestMapping("/ajax/beforePayment.do")
	@ResponseBody
	public Map beforOrderPayment(HttpSession session, @RequestBody Map param){
		try {
			String memberId = ((Member)(session.getAttribute("loginMember"))).getMemberId();
			param.put("receiverAddress", ((String)param.get("receiverAddress")));
			param.put("memberId", memberId);
			param=service.beforOrderPayment(param);
			//log.debug(param.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return param;
	}
	
	
	@RequestMapping("/ajax/paymentCheck.do")
	@ResponseBody
	public IamportResponse<Payment> paymentCheck(HttpSession session, @RequestBody Map param) throws IamportResponseException, IOException{
		String imp_uid = (String)param.get("imp_uid"); 
		return api.paymentByImpUid(imp_uid);
	}
	
	
	@RequestMapping("/ajax/paymentComplete.do")
	@ResponseBody
	public Boolean paymentComplete(HttpSession session, @RequestBody Map param){
		//성공/실패 확인
		if((Boolean)param.get("check")) {
			//cart 삭제 + uid / payMethod update
			service.paymentSuccess(param);
			log.debug("success "+param.toString());
			
		}else {
			//uid로 조회해서 payment 삭제
			service.paymentFail(param);
			log.debug("fail "+param.toString());
		}
		
		return true;
			
	}
	
	//마이페이지 -주문목록/배송조회 결제취소
	@RequestMapping("/member/memberOrderListDelete.do")
	@ResponseBody
	public boolean memberOrderListDelete(int paymentNo) {
		return service.memberOrderListDelete(paymentNo);
	}
	
	@RequestMapping("/ajax/paymentCancle.do")
	@ResponseBody
	public IamportResponse<Payment> paymentCancle(HttpSession session, @RequestBody Payments param) throws IamportResponseException, IOException{
		CancelData cancel_data = new CancelData(param.getImpUid(), true);
		cancel_data.setChecksum(BigDecimal.valueOf(param.getAmount()));
		IamportResponse<Payment> payment_response=null;
		try {
			payment_response = api.cancelPaymentByImpUid(cancel_data);
		} catch (IamportResponseException e) {
			switch(e.getHttpStatusCode()) {
				case 401 :
					//TODO
					break;
				case 500 :
					//TODO
					break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			return payment_response;
		}
		
	}
}
