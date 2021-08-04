package com.kh.potstand.order.model.vo;

import java.sql.Date;
import java.util.List;

import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.member.model.vo.Member;

import lombok.Data;

@Data
public class Payment {
	private int orderNo;
	private String memberId;
	private String receiverName;
	private String receiverAddr;
	private String message;
	private String postMessage;
	private String name;
	private String payMethod;
	private int merchantUid;
	private int amount;
	private Date payDate; 
	private String orderState;
	private Coupon coupon;
}
