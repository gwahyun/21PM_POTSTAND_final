package com.kh.potstand.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
