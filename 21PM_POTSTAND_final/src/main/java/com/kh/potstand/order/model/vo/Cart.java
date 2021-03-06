package com.kh.potstand.order.model.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.event.model.vo.Coupon;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int cartNo;
	private String memberId;
	private int bookAmount;
	private Book book;
	private List<Coupon> coupon;
	private int usedCouponNo;
}
