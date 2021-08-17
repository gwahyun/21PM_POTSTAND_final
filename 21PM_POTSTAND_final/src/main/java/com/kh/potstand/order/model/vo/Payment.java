package com.kh.potstand.order.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.potstand.event.model.vo.Coupon;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Payment {
	private int paymentNo;
	private String memberId;
	private String receiverName;
	private String receiverAddr;
	private String message;
	private String postMessage;
	private String name;
	private String payMethod;
	private String merchantUid;
	private int amount;
	private Date payDate; 
	private String orderState;
	private Coupon coupon;
	private String impUid;
	private List<PaymentObj> paymentObj = new ArrayList<PaymentObj>();
}
