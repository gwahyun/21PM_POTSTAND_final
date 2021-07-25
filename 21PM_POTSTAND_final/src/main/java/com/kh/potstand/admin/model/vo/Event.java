package com.kh.potstand.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Event {

	private int eventNo;
	private String eventTitle;
	private String eventInfo;
	private Date eventStart;
	private Date eventEnd;
	private String endCheck;
}
