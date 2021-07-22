package com.kh.potstand.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {

	private int noticeNo;
	private String memberId;
	private String noticeContent;
	private Date noticeDate;
	private String noticeTitle;
	private int noticeView;
	
}
