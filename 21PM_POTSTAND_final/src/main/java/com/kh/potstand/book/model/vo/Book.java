package com.kh.potstand.book.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import com.kh.potstand.event.model.vo.Event;

import lombok.Data;

@Data
public class Book {
	private int bookCode;
	private Sort sort;
	private String bookTitle;
	private String bookWriter;
	private String bookPub;
	private int bookCost;
	private String bookShort;
	private String bookContent;
	private String bookCover;
	private Date bookDate;
	private int bookStock;
}
