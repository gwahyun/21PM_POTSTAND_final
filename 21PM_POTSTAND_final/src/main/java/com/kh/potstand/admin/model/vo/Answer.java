package com.kh.potstand.admin.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Answer {
	private int answerNo;
	private int qnaNo;
	private String adminId;
	private String answerContent;
	private Date answerDate;
}
