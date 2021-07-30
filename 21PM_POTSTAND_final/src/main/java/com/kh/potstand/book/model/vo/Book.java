package com.kh.potstand.book.model.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.kh.potstand.event.model.vo.Event;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.NoArgsConstructor;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Book {
	private int bookCode;
	private Sort sort;
	private String bookTitle;
	private String bookWriter;
	private String bookPub;
	private int bookCost;
	private String bookShort;
	private String bookCover;
	private Date bookDate;
	private int bookStock;
	private String bookLink;
	private String bookIntro;
	private String writerIntro;
	private String bookIndex;
	private String pubReview;
	private String bookExtract;
	private String recommand;
	private String introMv;
}
