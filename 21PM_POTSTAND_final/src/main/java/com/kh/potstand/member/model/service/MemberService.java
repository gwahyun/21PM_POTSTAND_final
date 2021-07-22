package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.member.model.vo.Member;

public interface MemberService {

	Member selectMember(@RequestParam Map param);
	
	//notice List 호출 (공지사항 페이지)
	List<Notice> noticeSelectList(int cPage, int numPerPage);
	
	//notice Content 호출
	Notice noticeSelectOne(int noticeNo);
}
