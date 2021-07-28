package com.kh.potstand.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Point {
	private int pointNo;
	private String memberId;
	private int Point;
	private String useLog;
	private Date useDate; 
}
