package com.kh.potstand.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Address {

	private int addrNo;
	private String memberId;
	private String postNo;
	private String roadAddr;
	private String oldAddr;
	private String detailAddr;
	private String defaultAddr;
	
}
