package com.kh.potstand.order.model.vo;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.event.model.vo.Coupon;

import lombok.Data;

@Data
public class PaymentObj {
	private int objNo;
	private Book book;
	private int bookAmount;
	private int paymentNo;
	private Coupon coupon; //used_coupon_no하고 연결
}
