package com.kh.potstand.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Book {

	private int bookCode;
	private int sortNo;
	private String bookTitle;
	private String bookWriter;
	private String bookPub;
	private int bookCost;
	private String bookShort;
	private String bookContent;
	private String bookCover;
	private Date bookDate;
	private int bookStock;
	private int eventNo;
}
