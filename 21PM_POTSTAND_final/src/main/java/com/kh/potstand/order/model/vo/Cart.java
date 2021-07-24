package com.kh.potstand.order.model.vo;

import org.apache.ibatis.type.Alias;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.event.model.vo.Coupon;
import com.kh.potstand.event.model.vo.Event;

import lombok.Data;

@Alias("cart")
@Data
public class Cart {
	private int cartNo;
	private String memberId;
	private int bookAmount;
	private Book book;
	private Coupon coupon;
	private Event event;
}
