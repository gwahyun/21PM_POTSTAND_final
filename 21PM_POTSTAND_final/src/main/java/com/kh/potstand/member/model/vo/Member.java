package com.kh.potstand.member.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Member {

	private String memberId;
	private String memberPwd;
	private String memberName;
	private Date memberBirth;
	private String memberGender;
	private String memberEmail;
	private String memberPhone;
	private Date enrollDate;
	private String memberSort;
	private List<Address> address;
}
