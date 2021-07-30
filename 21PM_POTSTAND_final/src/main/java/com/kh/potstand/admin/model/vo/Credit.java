package com.kh.potstand.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Credit {

	private int creditNo;
	private String memberId;
	private int productNo;
	private int stock;
	private String status;
	private Date creditDate;
	private String recipient;
	private String shopAddress;
	private String phone;
	private int price;
}
