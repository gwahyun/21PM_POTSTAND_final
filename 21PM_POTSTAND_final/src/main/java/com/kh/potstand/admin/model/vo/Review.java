package com.kh.potstand.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	
	private int reviewNo;
	private int bookCode;
	private String memberId;
	private int point;
	private String reviewContent;
	private Date reviewDate;
}

