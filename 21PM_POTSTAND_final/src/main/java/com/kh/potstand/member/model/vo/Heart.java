package com.kh.potstand.member.model.vo;

import com.kh.potstand.book.model.vo.Book;

import lombok.Data;

@Data
public class Heart {

	private int heartNo;
	private int bookCode;
	private String memberId;
	private Book book;
}
