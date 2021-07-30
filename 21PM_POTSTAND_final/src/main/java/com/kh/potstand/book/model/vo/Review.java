package com.kh.potstand.book.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {

	private int reviewNo;
	private int bookCode;
	private String memberId;
	private int point;
	private String reviewContent;
	private Date reviewDate;
	private Book book;
}
