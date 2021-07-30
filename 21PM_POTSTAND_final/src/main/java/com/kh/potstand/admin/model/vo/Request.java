package com.kh.potstand.admin.model.vo;

import java.util.Date;

import com.kh.potstand.book.model.vo.Book;

import lombok.Data;

@Data
public class Request {

	private int requestNo;
	private String memberId;
	private String status;
	private Date requestDate;
	private Date responseDate;
	private Book book;
}
