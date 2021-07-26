package com.kh.potstand.event.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

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
