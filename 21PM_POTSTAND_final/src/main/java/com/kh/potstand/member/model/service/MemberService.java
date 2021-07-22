package com.kh.potstand.member.model.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

public interface MemberService {

	Member memberSelect(@RequestParam Map param);
	
	int insertMember(Member m) throws Exception;
}
