package com.kh.potstand.event.model.vo;

import java.sql.Date;

import com.kh.potstand.book.model.vo.Book;

import lombok.Data;


@Data
public class Coupon {
	private int couponNo;
	private String memberId;
	private Date startDate;
	private Date valDate;
	private Date usedDate;
	private String couponEnd;
	private Event event;
	private int couponAmount;
	private int usedCouponNo;
}
