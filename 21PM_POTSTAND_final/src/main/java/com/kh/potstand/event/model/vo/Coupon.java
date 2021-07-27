package com.kh.potstand.event.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
public class Coupon {
	private int couponNo;
	private String memberId;
	private String type;
	private double discount;
	private Date startDate;
	private Date valDate;
	private Date usedDate;
	private String endCheck;
	private Event event;
}
