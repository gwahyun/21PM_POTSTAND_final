package com.kh.potstand.admin.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.kh.potstand.admin.model.vo.Address;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
	private List<Address> address = new ArrayList();
	//private List<Heart> heart = new ArrayList();
	//private List<Point> point = new ArrayList();
}
